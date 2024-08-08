resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = var.bgp_asn
  ip_address = var.on_prem_Ip
  type       = "ipsec.1"
  
  tags = {
	Name = var.customer_gateway
  }
}
