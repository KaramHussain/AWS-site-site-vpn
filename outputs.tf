output "strongswan_config" {
  value = templatefile("${path.module}/strongswan_config.tpl", {
    tunnel1_right_ip = module.vpn_connection.tunnel1_right_ip
    tunnel2_right_ip = module.vpn_connection.tunnel2_right_ip
    left_subnet      = var.on_prem_cidr 
    right_subnet     = var.vpc_cidr_block
  })
}

output "ipsect_secrets" {
    # sensitive = true

  value = templatefile("${path.module}/ipsec.secrets.tpl", {
    tunnel1_right_ip = module.vpn_connection.tunnel1_right_ip
    tunnel2_right_ip = module.vpn_connection.tunnel2_right_ip
    # tunnel1_key      = module.vpn_connection.tunnel1_preshared_key
    # tunnel2_key      = module.vpn_connection.tunnel2_preshared_key
    on_prem_Ip      = var.on_prem_Ip
  })
}



