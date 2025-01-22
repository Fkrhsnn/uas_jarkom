# jan/02/1970 00:50:56 by RouterOS 6.48.6
# software id = PQMT-7BFQ
#
# model = RB941-2nD
# serial number = HDJ08PVRQPJ
/interface wireless
set [ find default-name=wlan1 ] ssid=KHI
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KHI
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool1 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool2 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool3 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool4 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool4 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.1.1/24 interface=ether2 network=192.168.1.0
add address=12.12.12.1/24 interface=ether4 network=12.12.12.0
add address=11.11.11.1/24 interface=ether3 network=11.11.11.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/routing rip interface
add send=v1-2
/routing rip neighbor
add address=12.12.12.2
add address=10.10.10.2
/routing rip network
add network=12.12.12.0/24
add network=11.11.11.0/24
add network=192.168.1.0/24
/system identity
set name=Router1

/interface gre
add name=tunnel1 local-address=12.12.12.1 remote-address=12.12.12.2
add name=tunnel2 local-address=11.11.11.1 remote-address=11.11.11.2

/ip address
add address=10.1.0.1/30 interface=tunnel1 network=10.1.0.0
add address=10.2.0.1/30 interface=tunnel2 network=10.2.0.0

/ip route
add dst-address=192.168.2.0/24 gateway=10.1.0.2
add dst-address=192.168.3.0/24 gateway=10.2.0.2
