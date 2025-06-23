
---

# 🌐 Terraform AWS S3 Static Website Hosting

## 📘 Project Description

This project showcases how to use **Terraform** to automate the provisioning of AWS resources for hosting a **static website** using **Amazon S3**. The goal is to demonstrate Infrastructure as Code (IaC) principles for deploying a cost-effective and scalable static site hosting solution.

---

## 🧭 Overview

> *(Insert S3 architecture diagram here)*

With a single Terraform configuration, this project provisions the necessary AWS resources and configures the S3 bucket for static website hosting. It also includes steps for uploading and managing your website content.

---

## 🔑 Key Components and Features

### ✅ Infrastructure as Code (IaC)

Used **Terraform** to define AWS resources in a declarative and version-controlled manner. This approach ensures consistent and repeatable deployments.

### 🪣 AWS S3 Bucket for Hosting

Provisioned and configured an **S3 bucket** with static website hosting enabled. The bucket is configured to serve `index.html` and handle 404 errors gracefully.

### 📤 Automated Content Upload

Included clear instructions and helper scripts to:

* Upload static content (HTML, CSS, JS)
* Set public read permissions
* Configure S3 bucket policies for secure access

---

## 🧪 Technologies Used

* Terraform
* AWS S3
* AWS IAM (for bucket access policies)
* Static Web Assets (HTML/CSS/JS)

---

## 📂 Project Structure

```
.
├── main.tf               # Main Terraform configuration
├── variables.tf          # Input variables
├── outputs.tf            # Output values (e.g., S3 website endpoint)
├── upload-site.sh        # Optional script to upload website files to S3
├── site/
│   └── index.html        # Sample static website files
└── README.md
```

---

## 🚦 How to Use

1. Clone this repository
2. Set up your AWS credentials
3. Initialize and apply the Terraform configuration:

   ```bash
   terraform init
   terraform apply
   ```
4. Upload your static website files to the S3 bucket (manually or using `upload-site.sh`)
5. Access your website via the S3 public endpoint provided in the Terraform output

---

