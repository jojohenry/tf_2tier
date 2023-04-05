 # Terraform: Creating Two-Tier Architecture with Modules
![hello](https://user-images.githubusercontent.com/109822667/229915517-37c54427-d682-4822-9203-bda01ecb00fa.jpg)
 
## A functional project written in Hashicorp showing you how to construct a Two-Tier Architecture with Modules

## Prerequisites
* AWS CLI installed & configured
* Terraform installed & configured
* IDE of your choice

## Objective
Create a two-tier architecture using modules. This will consist of:
* Two public subnets for the Web Server tier and two private subnets for the RDS Database tier
* Public and private route tables and security groups for both tiers
* EC2 instances with Apache installed and custom web page in the public Web Tier subnets
* An Application Load Balancer for the web servers
* An RDS MySQL instance in the RDS Database Tier
