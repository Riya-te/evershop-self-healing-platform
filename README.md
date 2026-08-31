<div align="center">

# 🚀 ResilientOps – Evershop Self-Healing Platform

### AWS EKS • Kubernetes • Docker • Jenkins • ArgoCD • HPA • Prometheus • Grafana

<p>
  <img src="https://img.shields.io/badge/AWS-EKS-orange?logo=amazonaws&logoColor=white">
  <img src="https://img.shields.io/badge/Kubernetes-1.33-326CE5?logo=kubernetes&logoColor=white">
  <img src="https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker&logoColor=white">
  <img src="https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?logo=jenkins&logoColor=white">
  <img src="https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?logo=argo&logoColor=white">
  <img src="https://img.shields.io/badge/Prometheus-Monitoring-E6522C?logo=prometheus&logoColor=white">
  <img src="https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana&logoColor=white">
</p>

### A production-style cloud-native E-commerce platform
### with CI/CD, GitOps, self-healing, autoscaling and observability.

</div>

---

# 📌 Project Overview

**ResilientOps** is an end-to-end DevOps and Cloud Engineering project
that demonstrates how an E-commerce application can be deployed,
managed, monitored and automatically recovered using Kubernetes
on AWS.

The project uses **Evershop** as the application and integrates
modern DevOps and cloud-native practices including:

- ☁️ Amazon EKS
- 🐳 Docker
- 📦 Amazon ECR
- 🔄 Jenkins CI/CD
- 🚀 ArgoCD GitOps
- ❤️ Kubernetes Self-Healing
- 📈 Horizontal Pod Autoscaling
- 📊 Prometheus
- 📉 Grafana
- 🚨 Alertmanager
- 🐘 PostgreSQL
- 🌐 AWS Load Balancer
- 🔐 SonarQube

The primary objective is to demonstrate **automation, resilience,
scalability, continuous delivery and observability** in a
Kubernetes-based cloud environment.

---

# 🎥 Project Demo

<div align="center">

## 🚀 ResilientOps – Evershop Deployment & Self-Healing Demo

### ▶️ Click the link below to watch the project demo

<a href="screenshots/Demo-video.mp4">



</a>

### 🎬 [▶️ Watch Full Demo Video](screenshots/Demo-video.mp4)

</div>

### Demo Highlights

The short demonstration showcases:

- ☁️ AWS EKS cluster
- 🐳 Dockerized Evershop application
- 📦 Amazon ECR
- 🔄 Jenkins CI/CD
- 🚀 ArgoCD GitOps
- ☸️ Kubernetes deployment
- ❤️ Self-healing
- 📈 HPA autoscaling
- 📊 Prometheus and Grafana
- 🌐 AWS Load Balancer
- 🐘 PostgreSQL

---

# 🏗️ System Architecture

<div align="center">

<img src="architecture.png" width="1000">

</div>

### Architecture Flow

```text
                         ┌──────────────────┐
                         │    Developer     │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │     GitHub       │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │     Jenkins      │
                         │     CI / CD      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │   Docker Build   │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │    Amazon ECR    │
                         └────────┬─────────┘
                                  │
                                  ▼
                  ┌────────────────────────────────┐
                  │          Amazon EKS             │
                  │                                │
                  │       ┌──────────────┐         │
                  │       │    ArgoCD    │         │
                  │       │    GitOps    │         │
                  │       └──────┬───────┘         │
                  │              │                 │
                  │              ▼                 │
                  │     ┌──────────────────┐       │
                  │     │    Deployment    │       │
                  │     └────────┬─────────┘       │
                  │              │                 │
                  │       ┌──────┴──────┐          │
                  │       │             │          │
                  │       ▼             ▼          │
                  │   Evershop      PostgreSQL     │
                  │      Pods                       │
                  │       │                         │
                  │       ▼                         │
                  │      HPA                        │
                  │       │                         │
                  │       ▼                         │
                  │  Self-Healing                   │
                  │                                │
                  └──────────────┬─────────────────┘
                                 │
                                 ▼
                       ┌───────────────────┐
                       │  AWS LoadBalancer │
                       └─────────┬─────────┘
                                 │
                                 ▼
                              Users


             Monitoring Layer
             ────────────────

             Kubernetes
                  │
                  ▼
             Prometheus
                  │
                  ▼
               Grafana
                  │
                  ▼
            Visualization
