# Task 3 - Auto Scaling with Mixed Instances & Chaos Testing

## Objective

Implement a highly available and fault-tolerant compute infrastructure for the EverShop application using Amazon EC2 Auto Scaling with Mixed Instances Policy.

The implementation includes:

- Amazon EC2 Auto Scaling Group
- Mixed Instances Policy (On-Demand + Spot)
- Application Load Balancer Integration
- Lifecycle Hooks
- Warm-up Tasks
- Dynamic Scaling Policies
- Chaos Engineering
- High Availability
- Zero Downtime Deployment

---

# Architecture

![Architecture](../architecture/aws-architecture.png)

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| Amazon EC2 | Compute Instances |
| Auto Scaling Group | Automatic Scaling |
| Application Load Balancer | Traffic Distribution |
| Amazon ECS | Container Orchestration |
| CloudWatch | Metrics & Alarms |
| IAM | Secure Instance Access |
| Launch Template | Instance Configuration |
| VPC | Networking |

---

# Implementation

## 1. Auto Scaling Group

Created an Auto Scaling Group to automatically launch and terminate EC2 instances based on application demand.

Features

- Automatic Instance Provisioning
- High Availability
- Self Healing
- Desired Capacity Management

---

## 2. Mixed Instances Policy

Configured Auto Scaling Group with both On-Demand and Spot Instances.

Configuration

- On-Demand Instances
- Spot Instances
- Capacity Optimization
- Cost Optimization

Benefits

- Reduced Infrastructure Cost
- High Availability
- Flexible Capacity
- Improved Reliability

---

## 3. Launch Template

Configured Launch Template containing

- Amazon Linux AMI
- Instance Type
- IAM Role
- Security Groups
- User Data
- ECS Agent Configuration

All new EC2 instances are launched using this standardized template.

---

## 4. Lifecycle Hooks

Configured Lifecycle Hooks before new instances enter service.

Warm-up Tasks

- ECS Agent Registration
- Docker Initialization
- Application Startup
- Database Migration
- Health Verification

The instance joins the load balancer only after all initialization tasks complete successfully.

---

## 5. Application Load Balancer Integration

Integrated Auto Scaling Group with Application Load Balancer.

Features

- Health Checks
- Automatic Registration
- Automatic Deregistration
- Traffic Distribution

Only healthy instances receive production traffic.

---

## 6. Dynamic Scaling Policies

Configured automatic scaling based on CloudWatch metrics.

Scaling Metrics

- CPU Utilization
- ALB Request Count
- Target Tracking Policy

Scaling Actions

- Scale Out during High Traffic
- Scale In during Low Traffic

---

## 7. Chaos Testing

Performed chaos testing to validate infrastructure resilience.

Tests Performed

- Manual EC2 Instance Termination
- Auto Scaling Instance Replacement
- Load Balancer Health Verification
- Application Availability Validation

The Auto Scaling Group automatically launched replacement instances without affecting application availability.

---

## 8. High Availability

Configured infrastructure to ensure continuous application availability.

Features

- Multi-AZ Deployment
- Automatic Recovery
- Load Balancing
- Auto Healing
- Fault Tolerance

---

# Auto Scaling Workflow

```
User Request
      │
      ▼
Application Load Balancer
      │
      ▼
Amazon Auto Scaling Group
      │
 ┌────┴────┐
 │         │
 ▼         ▼
EC2      EC2
(On-Demand) (Spot)
      │
      ▼
EverShop Application
```

---

# Scaling Workflow

```
CloudWatch Alarm
        │
        ▼
Auto Scaling Policy
        │
        ▼
Launch New EC2 Instance
        │
        ▼
Lifecycle Hook
        │
        ▼
Application Warm-up
        │
        ▼
ALB Health Check
        │
        ▼
Instance Receives Traffic
```

---

# Security & Availability Features

- Auto Scaling
- Mixed Instances Policy
- Multi-AZ Deployment
- Lifecycle Hooks
- Health Checks
- Self Healing
- Automatic Recovery
- High Availability
- Cost Optimization
- Zero Downtime

---

# Outcome

Successfully implemented a production-ready Auto Scaling infrastructure for the EverShop application.

The infrastructure now provides:

- Automatic Horizontal Scaling
- Cost Optimization using Spot Instances
- High Availability
- Self Healing Infrastructure
- Dynamic Traffic Handling
- Zero Downtime Instance Replacement
- Improved Fault Tolerance