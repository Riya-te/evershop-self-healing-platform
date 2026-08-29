# Task 2 - Secure Amazon RDS Deployment with IAM Authentication & Secrets Rotation

## Objective

Deploy a secure and highly available Amazon RDS postgreSQL database for the EverShop application following AWS security best practices.

The implementation includes:

- Amazon RDS postgreSQL single-AZ Deployment
- Private Database Subnets
- No Public Database Access
- IAM Database Authentication
- TLS Encrypted Connections
- AWS Secrets Manager Integration
- Automatic Credential Rotation
- Point-in-Time Recovery (PITR)
- Secure Application Access

---

# Architecture

![Architecture](../architecture/aws-architecture.png)

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| Amazon RDS postgreSQL | Managed Relational Database |
| AWS Secrets Manager | Secure Credential Storage |
| IAM | Database Authentication |
| Amazon VPC | Network Isolation |
| Private Subnets | Secure Database Placement |
| Security Groups | Database Access Control |
| Amazon ECS | Application Access |
| Amazon CloudWatch | Database Monitoring |

---

# Implementation

## 1. Amazon RDS MySQL Deployment

Configured Amazon RDS postgrSQL with the following settings:

- Multi-AZ Deployment
- Private Subnets
- No Public Access
- Automated Backups
- Storage Encryption Enabled

The database is isolated within private subnets and cannot be accessed directly from the internet.

---

## 2. Private Network Configuration

Configured the database inside private subnets within the VPC.

Security Features

- Private DB Subnets
- No Public IP
- Security Group Restricted Access
- ECS Only Access

This ensures that only authorized application services can communicate with the database.

---

## 3. IAM Database Authentication

Enabled IAM Database Authentication.

Benefits

- Temporary Authentication Tokens
- No Hardcoded Passwords
- IAM-Based Access Control
- Improved Security

Application instances retrieve temporary authentication tokens dynamically before connecting to the database.

---

## 4. TLS Encrypted Database Connections

Configured encrypted communication between the application and Amazon RDS.

Security Features

- TLS Encryption
- Secure Client Authentication
- Encrypted Data in Transit

This protects sensitive application and customer data from interception.

---

## 5. AWS Secrets Manager Integration

Stored database credentials securely in AWS Secrets Manager.

Secrets include

- Database Username
- Database Password
- Connection Information

The application retrieves credentials securely without exposing secrets inside the source code.

---



## 6. Point-in-Time Recovery (PITR)

Enabled automated backups and Point-in-Time Recovery.

Recovery Features

- Automated Daily Backups
- Continuous Transaction Logs
- Restore to Any Point Within Backup Window
- Recovery Point Objective (RPO) within 5 Minutes

This improves disaster recovery capabilities and minimizes data loss.

---

# Database Request Flow

```

EverShop Application
│
▼
IAM Authentication
│
▼
AWS Secrets Manager
│
▼
Temporary Credentials
│
▼
TLS Encrypted Connection
│
▼
Amazon RDS postgreSQL (Private Subnet)

```

---

# Security Features

- Multi-AZ High Availability
- Private Subnets
- No Public Database Access
- IAM Database Authentication
- TLS Encryption
- Secrets Manager Integration
- Automatic Credential Rotation
- Security Group Restrictions
- Point-in-Time Recovery
- Automated Backups

---

# Outcome

Successfully deployed a secure production-ready Amazon RDS postgreSQL database for the EverShop application.

The database implementation now provides:

- High Availability using single-AZ Deployment
- Secure IAM Authentication
- Encrypted Database Connections
- Secure Credential Management
- Automatic Password Rotation
- Reliable Backup and Disaster Recovery
- Private Network Isolation