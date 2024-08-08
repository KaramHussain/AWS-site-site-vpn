variable "vpn_gateway" {
    description = "Name of the VPN Gateway"
    type        = string
}

variable "vpc_id" {
    description = "ID of the VPC"
    type        = string
}

variable "routetable_id" {
    description = "ID of the route table"
    type        = string  
}

variable "on_prem_cidr" {
    description = "CIDR block of the on-premises network"
    type        = string
}