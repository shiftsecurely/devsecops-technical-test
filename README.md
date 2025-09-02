# DevSecOps Technical Test

This project provisions a secure, modular AWS infrastructure using Terraform.  
It includes a VPC, Lambda function, API Gateway (HTTP API), and optionally a WAFv2 WebACL.

## Features

- **VPC**: Custom CIDR, public and private subnets.
- **Lambda**: Runs in private subnets, configurable memory and timeout.
- **API Gateway**: HTTP API integrated with Lambda.
- **WAFv2 (optional)**: Web ACL for REST APIs (not supported for HTTP APIs).
- **CloudWatch Logs**: API Gateway access logging.
- **Modular Design**: Each component is a reusable Terraform module.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0+
- AWS credentials with permissions to create VPC, Lambda, API Gateway, and WAF resources.

## Usage

1. **Clone the repository**
   ```sh
   git clone <your-repo-url>
   cd devsecops-technical-test
   ```

2. **Configure variables**
   - Edit `variables.tf` to set your desired values (CIDRs, Lambda settings, etc.).

3. **Initialize Terraform**
   ```sh
   terraform init
   ```

4. **Validate configuration**
   ```sh
   terraform validate
   ```

5. **Apply the infrastructure**
   ```sh
   terraform apply
   ```

## Outputs

- `vpc_id`: VPC ID
- `private_subnet_ids`: List of private subnet IDs
- `public_subnet_ids`: List of public subnet IDs
- `lambda_role_arn`: Lambda execution role ARN
- `api_invoke_url`: API Gateway invoke URL
- `waf_web_acl_arn`: WAF Web ACL ARN (only if WAF module is enabled and using REST API)

## Notes

- **WAFv2 WebACL cannot be associated with HTTP APIs.**  
  If you need WAF protection, use REST API instead.
- Store your AWS credentials securely.  
  Do not commit them to version control.

## Clean Up

To destroy all resources:
```sh
terraform destroy