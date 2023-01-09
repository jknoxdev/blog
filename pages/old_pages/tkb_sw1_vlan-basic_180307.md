



###cisco config for home switch: ###
```
tkb-sw1#sh run
Building configuration...

Current configuration : 3153 bytes
!
! Last configuration change at 13:30:27 UTC Wed Mar 7 2018 by jknox
! NVRAM config last updated at 13:32:43 UTC Wed Mar 7 2018 by jknox
!
version 12.2
no service pad
service timestamps debug uptime
service timestamps log uptime
service password-encryption
!
hostname tkb-sw1
!
enable secret 5 666
!
username jknox privilege 15 secret 5 666
aaa new-model
!
aaa session-id common
switch 1 provision ws-c3750-48p
system mtu routing 1500
ip subnet-zero
ip routing
ip cef accounting per-prefix non-recursive prefix-length load-balance-hash
ip name-server 208.67.220.220
!
!
!
!
no file verify auto
spanning-tree mode pvst
spanning-tree extend system-id
!
vlan internal allocation policy ascending
!
interface FastEthernet1/0/1
!
interface FastEthernet1/0/2
!
interface FastEthernet1/0/3
!
interface FastEthernet1/0/4
!
interface FastEthernet1/0/5
!
interface FastEthernet1/0/6
!
interface FastEthernet1/0/7
!
interface FastEthernet1/0/8
!
interface FastEthernet1/0/9
!
interface FastEthernet1/0/10
!
interface FastEthernet1/0/11
!
interface FastEthernet1/0/12
!
interface FastEthernet1/0/13
!
interface FastEthernet1/0/14
!
interface FastEthernet1/0/15
!
interface FastEthernet1/0/16
!
interface FastEthernet1/0/17
!
interface FastEthernet1/0/18
!
interface FastEthernet1/0/19
!
interface FastEthernet1/0/20
!
interface FastEthernet1/0/21
!
interface FastEthernet1/0/22
!
interface FastEthernet1/0/23
!
interface FastEthernet1/0/24
!
interface FastEthernet1/0/25
!
interface FastEthernet1/0/26
!
interface FastEthernet1/0/27
!
interface FastEthernet1/0/28
!
interface FastEthernet1/0/29
!
interface FastEthernet1/0/30
!
interface FastEthernet1/0/31
!
interface FastEthernet1/0/32
!
interface FastEthernet1/0/33
 switchport access vlan 20
!
interface FastEthernet1/0/34
 switchport access vlan 20
!
interface FastEthernet1/0/35
 switchport access vlan 20
!
interface FastEthernet1/0/36
 switchport access vlan 20
!
interface FastEthernet1/0/37
 switchport access vlan 20
!
interface FastEthernet1/0/38
 switchport access vlan 20
!
interface FastEthernet1/0/39
 switchport access vlan 20
!
interface FastEthernet1/0/40
 switchport access vlan 20
!
interface FastEthernet1/0/41
 switchport access vlan 20
!
interface FastEthernet1/0/42
 switchport access vlan 20
!
interface FastEthernet1/0/43
 switchport access vlan 20
!
interface FastEthernet1/0/44
 switchport access vlan 20
!
interface FastEthernet1/0/45
 switchport access vlan 20
!
interface FastEthernet1/0/46
 switchport access vlan 20
!
interface FastEthernet1/0/47
 switchport access vlan 20
!
interface FastEthernet1/0/48
 switchport access vlan 20
!
interface GigabitEthernet1/0/1
!
interface GigabitEthernet1/0/2
!
interface GigabitEthernet1/0/3
!
interface GigabitEthernet1/0/4
!
interface Vlan1
 ip address 10.0.10.21 255.255.255.0
!
interface Vlan20
 ip address 10.0.20.20 255.255.255.0
!
ip default-gateway 10.0.10.10
ip classless
ip route profile
ip route 0.0.0.0 0.0.0.0 10.0.10.10
ip http server
!
radius-server source-ports 1645-1646
!
control-plane
!
!
line con 0
line vty 5 15
!
ntp clock-period 36029197
ntp server 10.0.10.3
end
```
