<div align="center">

# 🚀 ResilientOps – Evershop Self-Healing Platform

### AWS EKS • Kubernetes • Jenkins • Docker • ArgoCD • HPA • Prometheus • Grafana

A resilient and automated cloud deployment platform for Evershop,
built using AWS EKS, Kubernetes, GitOps, CI/CD, autoscaling,
self-healing and observability.

</div>

---

## 📌 Project Overview

**ResilientOps** is an end-to-end DevOps and Cloud deployment project
designed to demonstrate how a production-style E-commerce application
can be deployed and operated on Kubernetes with automation,
self-healing, autoscaling and monitoring.

The Evershop application is containerized using Docker and deployed
on an **Amazon EKS cluster**.

The project integrates:

- Docker containerization
- Amazon ECR
- Jenkins CI/CD
- Amazon EKS
- Kubernetes
- ArgoCD GitOps
- Kubernetes self-healing
- Horizontal Pod Autoscaler (HPA)
- Prometheus
- Grafana
- PostgreSQL
- Kubernetes health probes
- AWS Load Balancer
- GitHub-based configuration management

---

# 🏗️ Architecture

<p align="center">
<img src="architecture.png" width="1000"/>
</p>

### High-Level Flow

```text
Developer
    │
    ▼
 GitHub
    │
    ▼
 Jenkins CI/CD
    │
    ├── Build
    ├── Test
    └── Docker Image
          │
          ▼
      Amazon ECR
          │
          ▼
      Amazon EKS
          │
          ├───────────────┐
          │               │
       ArgoCD          Kubernetes
          │               │
          │          ┌────┴─────┐
          │          │          │
          │       Evershop   PostgreSQL
          │          │
          │       HPA
          │          │
          │      1 → 3 Pods
          │
          ▼
     Self-Healing
          
Monitoring:
Prometheus → Grafana