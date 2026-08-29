# Task 1 - Route 53 Domain Setup with ACM and AWS WAF

## Objective

Configure a secure and highly available domain architecture for the EverShop application using AWS networking and security services.

The implementation includes:

- Amazon Route 53 custom domain management
- AWS Certificate Manager (ACM) SSL certificates
- HTTPS enforcement
- HTTP Strict Transport Security (HSTS)
- AWS WAF protection
- CloudFront integration
- Failover routing policy
- Static maintenance website

---

# Architecture

![Architecture](../architecture/aws-architecture.png)

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| Route 53 | DNS Management |
| AWS Certificate Manager | SSL/TLS Certificates |
| CloudFront | Global CDN |
| Application Load Balancer | Traffic Distribution |
| AWS WAF | Web Application Firewall |
| Amazon S3 | Static Maintenance Website |
| CloudFront | Failover Maintenance Site |

---

# Implementation

## 1. Custom Domain Configuration

Configured a custom domain in Amazon Route 53.

Example

```
https://evershop.riyaa.xyz/
```

Route 53 resolves all DNS requests and forwards them to CloudFront.

---

## 2. SSL Certificate using ACM

Created two certificates.

### us-east-1

Used for

- CloudFront Distribution

### ap-south-1

Used for

- Application Load Balancer

Both certificates were successfully validated and issued.

---

## 3. HTTPS Enforcement

Configured

- HTTP → HTTPS Redirect
- HTTPS Listener (443)
- ACM Certificates
- Secure TLS Communication

All traffic is encrypted before reaching the application.

---

## 4. HSTS Security

Enabled HTTP Strict Transport Security.

Example Header

```
Strict-Transport-Security:
max-age=31536000;
includeSubDomains;
preload
```

Benefits

- Prevents protocol downgrade attacks
- Prevents SSL stripping
- Forces HTTPS

---

## 5. AWS WAF Protection

Attached AWS WAF to

- CloudFront
- Application Load Balancer

Enabled AWS Managed Rules

- Core Rule Set
- Known Bad Inputs
- SQL Injection Protection
- Cross Site Scripting Protection
- Amazon IP Reputation List

Provides protection against the OWASP Top 10 vulnerabilities.

---

## 6. CloudFront Distribution

Configured CloudFront

Features

- HTTPS
- Global Edge Network
- Static Content Caching
- Low Latency
- ACM Integration

---

## 7. Failover Routing Policy

Configured Route 53 Failover Routing.

### Primary

CloudFront → Application Load Balancer → ECS

### Secondary

CloudFront → Static Maintenance Website (Amazon S3)

If the primary endpoint becomes unhealthy, Route 53 automatically redirects users to the maintenance page.

---

# Request Flow

```
User
   │
   ▼
Route53
   │
   ▼
CloudFront
   │
   ▼
AWS WAF
   │
   ▼
Application Load Balancer
   │
   ▼
Amazon ECS
```

If ALB becomes unavailable

```
User
   │
Route53
   │
CloudFront
   │
Static Maintenance Website (Amazon S3)
```

---

# Security Features

- HTTPS Enforcement
- TLS Encryption
- ACM Certificates
- AWS WAF
- HSTS
- OWASP Protection
- Failover Routing
- Secure DNS

---

# Outcome

Successfully implemented a secure production-ready domain architecture for the EverShop application.

The application now supports:

- Secure HTTPS communication
- AWS WAF protection
- SSL/TLS encryption
- Automatic failover
- Global content delivery
- Highly available DNS routing.