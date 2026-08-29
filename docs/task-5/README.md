# Task 5 - CloudFront Distribution with Secure S3 Integration

## Objective

Improve application performance and secure static content delivery using Amazon CloudFront integrated with a private Amazon S3 bucket.

The implementation includes:

- Amazon CloudFront Distribution
- Private Amazon S3 Bucket
- Origin Access Control (OAC)
- HTTPS Content Delivery
- Static Asset Caching
- Secure Object Access

---

# Architecture

![Architecture](../architecture/aws-architecture.png)

---

# AWS Services Used

| Service | Purpose |
|----------|----------|
| Amazon CloudFront | Global Content Delivery Network |
| Amazon S3 | Static Asset Storage |
| Origin Access Control (OAC) | Secure CloudFront Access |
| AWS Certificate Manager | HTTPS SSL Certificate |
| Amazon Route 53 | Domain Management |

---

# Implementation

## 1. Amazon CloudFront Distribution

Configured Amazon CloudFront to deliver static assets globally.

Features

- HTTPS Support
- Global Edge Locations
- Low Latency
- Static Asset Caching

CloudFront improves website performance by serving cached content from the nearest edge location.

---

## 2. Private Amazon S3 Bucket

Created a private Amazon S3 bucket to store static files.

Features

- Private Bucket
- Block Public Access
- Server Side Encryption
- Secure Object Storage

Objects cannot be accessed directly from the internet.

---

## 3. Origin Access Control (OAC)

Configured Origin Access Control between CloudFront and Amazon S3.

Benefits

- Private Bucket Access
- Secure CloudFront Integration
- No Public Bucket Policy
- Direct Access Prevention

Only CloudFront is allowed to retrieve objects from the bucket.

---

## 4. Static Content Delivery

Configured CloudFront to deliver

- Images
- CSS
- JavaScript
- Static Assets

Static resources are cached at CloudFront edge locations to reduce latency.

---

## 5. HTTPS Integration

Configured HTTPS using AWS Certificate Manager.

Features

- SSL/TLS Encryption
- Secure Browser Communication
- HTTPS Enabled

All static content is delivered securely over HTTPS.

---

## 6. Cache Optimization

Configured CloudFront caching behavior.

Features

- Browser Cache
- Edge Cache
- Reduced Origin Requests
- Improved Performance

Frequently accessed content is served directly from CloudFront.

---

# Request Flow

```
User
   │
   ▼
Amazon Route53
   │
   ▼
Amazon CloudFront
   │
   ▼
Origin Access Control (OAC)
   │
   ▼
Private Amazon S3 Bucket
   │
   ▼
Static Assets Returned
```

---

# Security Features

- Private S3 Bucket
- Origin Access Control (OAC)
- HTTPS
- TLS Encryption
- Secure Content Delivery
- Block Public Access

---

# Free Tier Considerations

The internship task mentions implementing Lambda@Edge, signed URLs, and AWS WAF.

Since this project was completed using the AWS Free Tier, the following enterprise features were **not implemented**:

- AWS Lambda@Edge
- AWS WAF
- Signed URLs
- Dynamic WebP Image Generation

Instead, secure content delivery was achieved using:

- Amazon CloudFront
- Origin Access Control (OAC)
- Private Amazon S3 Bucket
- HTTPS with ACM

---

# Outcome

Successfully implemented secure and optimized content delivery for the EverShop application.

The implementation now provides:

- Global Content Delivery
- Secure Private S3 Integration
- HTTPS Communication
- Improved Website Performance
- Reduced Latency
- Secure Static Asset Delivery