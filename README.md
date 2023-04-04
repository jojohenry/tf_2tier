 # Terraform: Creating Two-Tier Architecture with modules

 
## A functional project written in Hashicorp showing how to construct a Two-Tier Architecture with Modules!

## Prerequisites
* Terraform Cloud Account
* GitHub Account
* AWS Account

Create a two-tier architecture using modules. This will consists of:
1. Two public subnets for the Web Server tier and two private subnets for the RDS Database tier.
2. Apply appropriate route tables and security groups for both tiers.
3. Create EC2 instances with Apache installed and a custom web page in the Web Tier subnets.
4. Make an Application Load Balancer for the web servers.
5. Deploy an RDS MySQL instance in the RDS Database Tier.
