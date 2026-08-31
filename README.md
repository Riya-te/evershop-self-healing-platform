<div align="center">

# 🚀 ResilientOps – Evershop Self-Healing Platform

### Kubernetes • AWS EKS • Docker • Jenkins • ArgoCD • HPA • Prometheus • Grafana

<p>
  <img src="https://img.shields.io/badge/AWS-EKS-orange?logo=amazonaws&logoColor=white">
  <img src="https://img.shields.io/badge/Kubernetes-1.33-326CE5?logo=kubernetes&logoColor=white">
  <img src="https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white">
  <img src="https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?logo=jenkins&logoColor=white">
  <img src="https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?logo=argo&logoColor=white">
  <img src="https://img.shields.io/badge/Prometheus-Monitoring-E6522C?logo=prometheus&logoColor=white">
  <img src="https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana&logoColor=white">
</p>

### A production-style cloud-native E-commerce deployment
### with CI/CD, GitOps, self-healing, autoscaling and observability.

</div>

---

# 📌 Project Overview

**ResilientOps** is an end-to-end DevOps and Cloud Engineering project
that demonstrates how an E-commerce application can be deployed,
monitored and automatically recovered using Kubernetes on AWS.

The project uses **Evershop** as the application and implements a
complete cloud-native workflow using:

- 🐳 Docker
- ☁️ Amazon ECR
- ☸️ Amazon EKS
- 🔄 Jenkins CI/CD
- 🚀 ArgoCD GitOps
- ❤️ Kubernetes Self-Healing
- 📈 Horizontal Pod Autoscaling
- 📊 Prometheus
- 📉 Grafana
- 🐘 PostgreSQL
- 🌐 AWS Load Balancer

The primary goal is to demonstrate **resilience, automation,
scalability and observability** in a Kubernetes-based environment.

---

# 🎥 Project Demo

A short demonstration video showcases:

- Application deployment
- AWS EKS cluster
- Kubernetes workloads
- ArgoCD synchronization
- HPA configuration
- CPU-based autoscaling
- Kubernetes self-healing
- Prometheus/Grafana monitoring
- AWS Load Balancer access

> 🎬 Demo video available in the project showcase / LinkedIn post.

---

# 🏗️ Architecture

<p align="center">
  <img src="architecture.png" width="1000">
</p>

### Architecture Flow

```text
                         ┌──────────────────┐
                         │     Developer    │
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
                         │    Docker Build  │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │   Amazon ECR     │
                         └────────┬─────────┘
                                  │
                                  ▼
              ┌─────────────────────────────────────┐
              │             Amazon EKS              │
              │                                     │
              │   ┌─────────────────────────────┐   │
              │   │          ArgoCD             │   │
              │   │          GitOps             │   │
              │   └──────────────┬──────────────┘   │
              │                  │                  │
              │                  ▼                  │
              │       ┌──────────────────────┐      │
              │       │ Kubernetes Deployment│      │
              │       └──────────┬───────────┘      │
              │                  │                  │
              │        ┌─────────┴─────────┐        │
              │        │                   │        │
              │        ▼                   ▼        │
              │   Evershop Pods       PostgreSQL   │
              │        │                            │
              │        ▼                            │
              │      HPA                            │
              │   1 → 3 Pods                         │
              │                                     │
              │   Self-Healing + Health Probes      │
              └─────────────────────────────────────┘
                               │
                               ▼
                     ┌───────────────────┐
                     │   AWS LoadBalancer │
                     └─────────┬─────────┘
                               │
                               ▼
                           🌐 Users


        Monitoring Layer
        ─────────────────

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