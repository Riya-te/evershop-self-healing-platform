pipeline {
    agent any

    tools {
        nodejs 'Node20'
    }

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '579661925683'
        ECR_REPO = 'resilientops-evershop'
        IMAGE_TAG = "${BUILD_NUMBER}"
        ECR_IMAGE = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Tools') {
            steps {
                sh '''
                    echo "Node:"
                    node --version

                    echo "NPM:"
                    npm --version

                    echo "Docker:"
                    docker --version

                    echo "AWS:"
                    aws --version

                    echo "Kubectl:"
                    kubectl version --client

                    echo "Trivy:"
                    trivy --version
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Compile Database') {
            steps {
                sh 'npm run compile:db'
            }
        }

        stage('Compile') {
            steps {
                sh 'npm run compile'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    script {
                        def scannerHome = tool 'SonarScanner'

                        sh """
                            ${scannerHome}/bin/sonar-scanner \
                              -Dsonar.projectKey=Evershop \
                              -Dsonar.projectName=Evershop \
                              -Dsonar.sources=.
                        """
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build \
                      -t $ECR_IMAGE .
                '''
            }
        }

        stage('Trivy Scan') {
            steps {
                sh '''
                    trivy image \
                      --severity HIGH,CRITICAL \
                      --exit-code 0 \
                      $ECR_IMAGE
                '''
            }
        }

        stage('ECR Login') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-credentials']
                ]) {
                    sh '''
                        aws ecr get-login-password \
                          --region $AWS_REGION \
                        | docker login \
                          --username AWS \
                          --password-stdin \
                          $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                    '''
                }
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                    docker push $ECR_IMAGE
                '''
            }
        }

        stage('Deploy to EKS') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-credentials']
                ]) {
                    sh '''
                        aws eks update-kubeconfig \
                          --region $AWS_REGION \
                          --name resilientops-eks

                        kubectl set image \
                          deployment/evershop \
                          evershop=$ECR_IMAGE \
                          -n resilientops
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    kubectl rollout status \
                      deployment/evershop \
                      -n resilientops \
                      --timeout=180s

                    kubectl get pods \
                      -n resilientops \
                      -l app=evershop
                '''
            }
        }
    }

    post {
        success {
            echo '=========================================='
            echo 'Evershop CI/CD Pipeline SUCCESSFUL!'
            echo '=========================================='
        }

        failure {
            echo '=========================================='
            echo 'Pipeline FAILED - check the stage above'
            echo '=========================================='
        }
    }
}