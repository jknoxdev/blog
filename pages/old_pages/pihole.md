


### easy config ###
'''
curl -sSL https://install.pi-hole.net | bash
'''

ipv6 address pihole-3: 
2600:8801:3580:56e:20c:29ff:feb2:4158
KWdSh0i

configure both /etc/network/interfaces 
and then /etc/dhcpcd.conf

iface ens160 inet static
  address 10.0.10.50
  netmask 255.255.255.0
  gateway 10.0.10.10

interface eth0
static ip_address=10.0.10.50/24
static routers=10.0.10.10



