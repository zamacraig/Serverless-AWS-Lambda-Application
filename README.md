# Serverless AWS Lambda Application

## Overview
This repository contains a serverless application designed using AWS Lambda and related AWS services. It provides a scalable and cost-efficient solution for building event-driven, cloud-based systems. The application is designed to make use of AWS services such as API Gateway, DynamoDB, S3, and more. It leverages Infrastructure as Code (IaC) to ensure repeatable, consistent, and automated deployments.

## Features
- Infrastructure as Code: Manage and provision infrastructure using Terraform.
- Serverless architecture
- Fully managed and scalable
- Integration with AWS Lambda functions
- Efficient handling of API requests through AWS API Gateway
- Persistent storage using DynamoDB
- Support for S3 bucket interactions (uploading, retrieving, etc.)
- Easy deployment and configuration
- Modular Design: Easily adapt configurations for various environments.

## Architecture
The application employs Terraform to provision and manage the following AWS resources:

- AWS Lambda: To execute serverless functions based on triggers.

- AWS API Gateway: For handling REST API requests.

- Amazon DynamoDB: For managing persistent, NoSQL data.

- Amazon S3: For object storage needs.
  
- IAM Roles and Policies (for secure resource access)

Refer to the provided architecture diagram below for more detailed insights into the flow and design of the application.

## Requirements
Before setting up the application, ensure you have the following:

- Terraform CLI installed.

- AWS account with programmatic access (via aws_access_key and aws_secret_access_key).

- Basic knowledge of Terraform and AWS services.

- Optionally, installed AWS CLI for troubleshooting.

## Setup Instructions
1. Clone the repository:

```bash
git clone https://github.com/zamacraig/Serverless-AWS-Lambda-Application.git
cd Serverless-AWS-Lambda-Application
```

2. Initialize Terraform:

```bash
terraform init
```

3. Review and customize variables.tf and terraform.tfvars for environment-specific configurations (e.g., AWS region, DynamoDB table names, S3 bucket names).

4. Plan the deployment:

```bash
terraform plan
```

5. Apply the configuration to deploy resources:

```bash
terraform apply
```

## Usage
- Endpoint Configuration: After deployment, the API Gateway will generate endpoint URLs. Use these for interacting with the system.

- Lambda Functions: Triggered via API Gateway or events defined in the configuration.

- API Gateway Endpoints: Use the outputs from the Terraform deployment for API interaction.

- Monitoring: Utilize AWS CloudWatch for logs and metrics.

## Contributing
We welcome contributions to enhance this project! Please feel free to fork the repository, make changes, and submit a pull request.
