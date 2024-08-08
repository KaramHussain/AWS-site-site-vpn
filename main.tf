provider "aws" {
  region = "us-east-1"
}

######################### CREATING vpc ########################################
module "VPC" {
  source                     = "./modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  vpc_name                   = var.vpc_name
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}

######################### CREATING SECURITY GROUP ########################################
module "Web_sg" {
  source        = "./modules/security_group"
  name          = var.server_sg
  vpc_id        = module.VPC.vpc_id
  description   = var.server_sg_description
  ingress_rules = var.server_sg_ingress_rules
}


######################### CREATING EC2 INSTANCE ########################################
resource "aws_instance" "web" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id     = module.VPC.public_subnet_ids[0]
  vpc_security_group_ids = [module.Web_sg.security_group_id]
  tags = {
    Name = "Web Server"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Welcome to Terraform</h1>" > /var/www/html/index.html
              EOF
}


############################# CREATING VPN GATEWAY ########################################
module "VPN_Gateway" {
  source        = "./modules/virtual_gateway"
  vpn_gateway   = var.vpn_gateway
  vpc_id        = module.VPC.vpc_id
  routetable_id = module.VPC.public_route_table_id
  on_prem_cidr  = var.on_prem_cidr
}

module "customer_gateway" {
  source = "./modules/customer_gateway"
  customer_gateway = var.customer_gateway
  bgp_asn = var.bgp_asn
  on_prem_Ip = var.on_prem_Ip
}

module "vpn_connection" {
  source = "./modules/vpn_connection"
  OnPremCIDR = var.on_prem_cidr
  vpn_connection_name = var.vpn_connection_name
  customer_gateway_id = module.customer_gateway.customer_gateway_id
  vpn_gateway_id = module.VPN_Gateway.vpn_gateway_id
}


