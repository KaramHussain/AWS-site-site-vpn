variable "bgp_asn" {
    description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
    type        = number
}


variable "on_prem_Ip" {
    description = "The IP address of the customer gateway's external interface"
    type        = string
}


variable "customer_gateway" {
    description = "Name of the customer gateway"
    type        = string
}