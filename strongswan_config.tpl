Save the below content to /etc/ipsec.conf

config setup
conn Tunnel1
    authby=secret
    auto=start
    left=%defaultroute
    leftid=46.101.197.89
    right=${tunnel1_right_ip}
    type=tunnel
    ikelifetime=28800s
    keylife=3600s
    esp=aes128-sha1-modp1024
    ike=aes128-sha1-modp1024
    keyingtries=%forever
    keyexchange=ike
    leftsubnet=${left_subnet}
    rightsubnet=${right_subnet}       
    dpddelay=10
    dpdtimeout=30


conn Tunnel2
    authby=secret
    auto=start
    left=%defaultroute
    leftid=46.101.197.89
    right=${tunnel2_right_ip}
    type=tunnel
    ikelifetime=28800s
    keylife=3600s
    esp=aes128-sha1-modp1024
    ike=aes128-sha1-modp1024
    keyingtries=%forever
    keyexchange=ike
    leftsubnet=${left_subnet}
    rightsubnet=${right_subnet}
    dpddelay=10
    dpdtimeout=30