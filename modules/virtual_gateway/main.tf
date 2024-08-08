resource "aws_vpn_gateway" "vpn_gateway" {
    vpc_id = var.vpc_id
    amazon_side_asn = 64512
    tags = {
        Name = var.vpn_gateway
    }
}

resource "aws_route" "routes" {
    route_table_id         = var.routetable_id
    destination_cidr_block = var.on_prem_cidr
    gateway_id = aws_vpn_gateway.vpn_gateway.id
}


resource "aws_vpn_gateway_route_propagation" "routepropogation" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gateway.id
  route_table_id = var.routetable_id
}