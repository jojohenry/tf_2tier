 # Terraform: Creating Two-Tier Architecture with Modules
...
## A functional project written in Hashicorp showing how to create a Two-Tier Architecture using Terraform Modules and deploying it to the AWS console!

This project will show you how to do the following:

* Create a two-tier architecture using modules.
* Create two public subnets for the Web Server tier and two private subnets for the RDS tier.
* Configure routing and security groups for the Web Server and RDS Tier resources.
* Deploy EC2 instances running Apache with custom web pages in each Public Web Tier subnet.
* Create an Internet-facing Application Load Balancer targeting the web servers.
* Deploy an RDS MySQL instance and a Standby instance (Multi-AZ) in the Private RDS Tier Subnets.

## How to install this example project on Terraform

1. Fork this repository.
2. Change the inputs for the terraform.tfvars file as desired.
3. Enter `terraform init` to initialize the working directory.
4. Enter `terraform validate` to validate the configuration files in a directory.
5. Enter `terraform plan` to preview thr actions Terraform would take to modify your infrastructure.
6. Enter `terraform apply` to execute the actions in Terraform plan to create, update, or destroy infrastructure. 