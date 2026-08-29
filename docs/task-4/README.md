# Task 4 - Immutable E-commerce Deployment with Amazon ECS & Amazon ECR

## Objective

Deploy the EverShop application using containerized workloads on Amazon ECS with EC2 launch type. Implement an immutable deployment strategy using Amazon ECR, AWS CodePipeline, AWS CodeBuild, and Blue/Green deployments for zero downtime.

The implementation includes:

- Docker Containerization
- Amazon Elastic Container Registry (ECR)
- Amazon ECS (EC2 Launch Type)
- Application Load Balancer
- AWS Systems Manager Parameter Store
- AWS CodePipeline
- AWS CodeBuild
- Blue/Green Deployment
- Zero Downtime Deployment

---

# Architecture

![Architecture](../architecture/aws-architecture.png)

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| Amazon ECS | Container Orchestration |
| Amazon ECR | Docker Image Repository |
| AWS CodePipeline | CI/CD Pipeline |
| AWS CodeBuild | Build & Test Docker Image |
| GitHub | Source Code Repository |
| AWS Systems Manager Parameter Store | Secure Configuration Management |
| Application Load Balancer | Traffic Distribution |
| Amazon EC2 | ECS Cluster Infrastructure |
| Docker | Application Containerization |

---

# Implementation

## 1. Docker Containerization

Containerized the EverShop application using Docker.

Features

- Multi-stage Docker Build
- Immutable Container Image
- Consistent Runtime Environment
- Production Ready Image

The application and all required dependencies are packaged into a single Docker image.

---

## 2. Amazon Elastic Container Registry (ECR)

Created a private Amazon ECR repository to store Docker images.

Features

- Secure Private Repository
- Versioned Images
- Image Tagging
- ECS Integration

Every successful build pushes a new Docker image into Amazon ECR.

---

## 3. Amazon ECS Deployment

Deployed the EverShop application using Amazon ECS with EC2 Launch Type.

Features

- ECS Cluster
- ECS Service
- ECS Tasks
- Task Definitions
- EC2 Container Instances

The ECS service continuously maintains the desired number of running tasks.

---

## 4. Application Load Balancer

Integrated the ECS service with an Application Load Balancer.

Features

- HTTPS Listener
- Health Checks
- Target Groups
- Automatic Traffic Distribution

Only healthy ECS tasks receive production traffic.

---

## 5. AWS Systems Manager Parameter Store

Stored application configuration securely using AWS Systems Manager Parameter Store.

Configuration Includes

- Database Endpoint
- Database Credentials
- Application Secrets
- Environment Variables

The application retrieves configuration dynamically during deployment.

---

## 6. Continuous Integration

Configured AWS CodePipeline to automate application deployment.

Pipeline Workflow

GitHub Repository

↓

AWS CodePipeline

↓

AWS CodeBuild

↓

Amazon ECR

↓

Amazon ECS

Every code commit automatically triggers the CI/CD pipeline.

---

## 7. AWS CodeBuild

Configured AWS CodeBuild to automate Docker image creation.

Build Process

- Source Code Download
- Docker Build
- Application Testing
- Docker Image Push
- Build Logs

After successful testing, the Docker image is pushed to Amazon ECR.

---

## 8. Blue/Green Deployment

Configured Blue/Green deployment strategy.

Deployment Process

Current Version (Blue)

↓

Deploy New Version (Green)

↓

Health Verification

↓

Traffic Shift

↓

Old Version Removed

This deployment strategy ensures zero downtime during application updates.

---

## 9. Immutable Deployment

Implemented immutable deployment principles.

Features

- New Docker Image for Every Release
- No Manual Server Changes
- Easy Rollback
- Consistent Deployments

Every deployment creates a completely new application version instead of modifying existing infrastructure.

---

# Deployment Workflow

```

Developer

│

▼

GitHub Repository

│

▼

AWS CodePipeline

│

▼

AWS CodeBuild

│

▼

Docker Build

│

▼

Amazon ECR

│

▼

Amazon ECS Service

│

▼

Blue/Green Deployment

│

▼

Application Load Balancer

│

▼

Users

```

---

# Deployment Features

- Docker Containerization
- Immutable Infrastructure
- Automated CI/CD
- Version Controlled Images
- Zero Downtime Deployment
- Blue/Green Deployment
- Automatic Rollback Support
- Load Balanced Architecture

---

# Outcome

Successfully implemented an immutable deployment architecture for the EverShop application.

The deployment now provides:

- Containerized Application Deployment
- Automated CI/CD Pipeline
- Secure Image Management
- Zero Downtime Releases
- Blue/Green Deployment Strategy
- Highly Available ECS Infrastructure
- Secure Configuration Management