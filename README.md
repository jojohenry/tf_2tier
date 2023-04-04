 # Terraform: Creating Two-Tier Architecture with modules

![hello](https://user-images.githubusercontent.com/109822667/229891846-34afaf2f-2569-45f3-844e-4b4694015990.jpg)

 
## A functional project written in Hashicorp showing how to construct a Two-Tier Architecture with Modules!

## Prerequisites
* AWS CLI installed & configured
* Terraform installed & configured
* IDE of your choice

## Objective

Create a two-tier architecture using modules. This will consists of:
1. Two public subnets for the Web Server tier and two private subnets for the RDS Database tier.
2. Apply appropriate route tables and security groups for both tiers.
3. Create EC2 instances with Apache installed and a custom web page in the Web Tier subnets.
4. Make an Application Load Balancer for the web servers.
5. Deploy an RDS MySQL instance in the RDS Database Tier.
