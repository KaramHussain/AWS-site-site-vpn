output "tunnel1_right_ip" {
  value = aws_vpn_connection.vpn_connection.tunnel1_address
}

output "tunnel2_right_ip" {
  value = aws_vpn_connection.vpn_connection.tunnel2_address
}