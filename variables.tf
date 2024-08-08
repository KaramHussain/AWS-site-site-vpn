variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "vpn"
}

# Declare variable for private subnet CIDR blocks
variable "private_subnet_cidr_blocks" {
  description = "value of the private subnet CIDR block"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Declare variable for public subnet CIDR blocks
variable "public_subnet_cidr_blocks" {
  description = "value of the public subnet CIDR block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "availability_zones" {
  type        = list(string)
  description = "value of the availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

####################### Server_SG    #####################################


variable "server_sg" {
  type        = string
  default     = "server_security_group"
  description = "value of the security group name"
}

variable "server_sg_description" {
  type        = string
  default     = "Allow HTTP and HTTPS traffic"
  description = "value of the security group description"
}


variable "server_sg_ingress_rules" {
  description = "List of ingress rule objects"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "HTTPS ingress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}



###################### VPN Gateway ############################

variable "vpn_gateway" {
  description = "Name of the VPN Gateway"
  type        = string
  default = "demoVPNGateway"
}

variable "on_prem_cidr" {
  description = "CIDR block of the on-premises network"
  type        = string
  default = "10.114.0.0/20"
}


###################### Customer Gateway ############################

variable "customer_gateway" {
  description = "Name of the Customer Gateway"
  type        = string
  default = "demoCustomerGateway"
  
}

variable "bgp_asn" {
  description = "BGP ASN of the Customer Gateway"
  type        = number
  default = 65000
}

variable "on_prem_Ip" {
  description = "IP address of the Customer Gateway"
  type        = string
  default = "46.101.197.89"
}



###################### VPN Connection ############################

variable "vpn_connection_name" {
  description = "Name of the VPN connection"
  type        = string
  default = "value of the vpn connection name"
}