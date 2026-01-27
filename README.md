# Terraform Infrastructure Repository

This repository contains **Terraform configurations** used to provision and manage cloud infrastructure using **Infrastructure as Code (IaC)**.

## 📌 Purpose

* Automate infrastructure creation
* Ensure consistent and repeatable deployments
* Manage infrastructure in a version‑controlled way

## 🛠️ Tools & Technologies

* **Terraform**
* **Cloud Provider:** (AWS – update as needed)
* **Git & GitHub**

## 📂 Repository Overview

This repository contains **multiple Terraform projects**, each focused on provisioning specific cloud resources such as **EC2 instances**, **VPCs**, and related infrastructure components.

Each project is organized in its own directory with the required Terraform configuration files.

## 🚀 Usage

1. Initialize Terraform:

   ```bash
   terraform init
   ```
2. Validate code:

   ```bash
   terraform validate
   ```

3. Preview changes:

   ```bash
   terraform plan
   ```

4. Apply configuration:

   ```bash
   terraform apply
   ```

5. Destroy infrastructure (if required):

   ```bash
   terraform destroy
   ```

## ⚠️ Notes

* Make sure cloud credentials are configured properly
* Do not commit sensitive values (use `.tfvars` or environment variables)

## 📄 License

This project is for learning and practice purposes.

---
