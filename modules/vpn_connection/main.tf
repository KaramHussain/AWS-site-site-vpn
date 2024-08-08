resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id  = var.customer_gateway_id
  vpn_gateway_id       = var.vpn_gateway_id
  type                 = "ipsec.1"
  static_routes_only   = true
  
  tags = {
    Name = var.vpn_connection_name
  }
}

output "tunnel1_preshared_key" {
  value = aws_vpn_connection.vpn_connection.tunnel1_preshared_key
}


output "tunnel2_preshared_key" {
  value = aws_vpn_connection.vpn_connection.tunnel2_preshared_key
}


resource "aws_vpn_connection_route" "onPrem" {
  destination_cidr_block = var.OnPremCIDR
  vpn_connection_id      = aws_vpn_connection.vpn_connection.id
}

