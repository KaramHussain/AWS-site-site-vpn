variable "vpn_connection_name" {
  description = "Name of the VPN connection"
  type        = string
  
}

variable "customer_gateway_id" {
  type = string
  description = "value of the customer gateway id"
}

variable "vpn_gateway_id" {
  type = string
  description = "value of the vpn gateway id" 
}

variable "OnPremCIDR" {
  description = "CIDR block of the on-premises network"
  type        = string
  default = "10.114.0.0/20"
}