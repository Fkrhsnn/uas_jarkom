# jan/02/1970 00:07:28 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface wireless
set [ find default-name=wlan1 ] ssid=KJ
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KJ
/ip pool
add name=dhcp_pool0 ranges=192.168.2.2-192.168.2.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
add address=10.10.10.1/24 interface=ether3 network=10.10.10.0
add address=12.12.12.2/24 interface=ether4 network=12.12.12.0
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1
/routing rip interface
add send=v1-2
/routing rip neighbor
add address=12.12.12.1
add address=10.10.10.2
/routing rip network
add network=10.10.10.0/24
add network=12.12.12.0/24
add network=192.168.2.0/24
/system identity
set name="Router 2 KJ"

/interface gre
add name=gre-tunnel1 remote-address=12.12.12.1 local-address=12.12.12.2
add name=gre-tunnel2 remote-address=10.10.10.2 local-address=10.10.10.1

/ip address
add address=172.16.1.2/30 interface=gre-tunnel1 network=172.16.1.0
add address=172.16.3.1/30 interface=gre-tunnel2 network=172.16.3.0

/ip route
add distance=1 dst-address=192.168.1.0/24 gateway=172.16.1.1
add distance=1 dst-address=192.168.3.0/24 gateway=172.16.3.2
