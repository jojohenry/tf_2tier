 # Terraform: Creating Two-Tier Architecture with modules

 ("C:\Users\Jojo\Downloads\hello.jpg")
 
## A functional project written in Hashicorp showing how to construct a Two-Tier Architecture with Modules!

## Prerequisites
* Terraform Cloud Account
* GitHub Account
* AWS Account

## Steps

1. Create a two-tier architecture using modules. This will consists of:
 * Two public subnets for the Web Server tier and two private subnets for the RDS Database tier.
 * Apply appropriate route tables and security groups for both tiers.
 * Create EC2 instances with Apache installed and a custom web page in the Web Tier subnets.
 * Make an Application Load Balancer for the web servers.
 * Deploy an RDS MySQL instance in the RDS Database Tier.
2. Push code to GitHub
3. Use Terraform Cloud to deploy two-tier architecture
4. Verify resources in AWS Console