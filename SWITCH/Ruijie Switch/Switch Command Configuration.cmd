!-------------------------------------------------------------
! RUIJIE SWITCH BASIC COMMAND CONFIGURATION
!-------------------------------------------------------------
! Purpose:
! This guide outlines essential configuration commands for
! Ruijie switches, including VLAN setup, port configuration,
! spanning tree, port security, and routing setup.
!-------------------------------------------------------------

!-------------------------------------------------------------
! Step 1: Preparation Commands
enable                                   ! Enter privileged mode
exit                                     ! Return to previous mode
end                                      ! Return to privileged mode
copy running-config startup-config       ! Save configuration
del flash:config.text                    ! Delete configuration (for switches / 1700 routers)
erase startup-config                     ! Delete configuration (for 2500 routers)
del flash:vlan.dat                       ! Delete VLAN configuration (for switches)

configure terminal                       ! Enter global configuration mode
(config)# hostname SwitchA               ! Set hostname
(config)# banner motd &                  ! Set Message of the Day (MOTD) with & as delimiter

! Password setup
(config)# enable secret level 1 0 star   ! Level 1 user password (unencrypted)
(config)# enable secret level 15 0 star  ! Privileged mode password (unencrypted)
! Note: Level 1 = basic user, Level 15 = highest privilege, 0 = no encryption

! Enable management services
(config)# enable services web-server     ! Enable web management
! Available services: web-server, telnet-server, ssh-server

!-------------------------------------------------------------
! Step 2: Viewing Information
show running-config                      ! View current configuration
show interface fastethernet 0/3          ! View info for interface F0/3
show interface serial 1/2                ! View info for serial interface S1/2
show interface                           ! View info for all interfaces
show ip interface brief                  ! Show summarized interface info
show ip interface                        ! Show all IP interface details
show version                             ! Display version info
show mac-address-table                   ! Display MAC address table
show vlan                                ! Display VLAN info
show vlan id 10                          ! Display VLAN 10 info
show interface fastethernet 0/1          ! Display mode of port F0/1
show aggregateport 1 summary             ! Display info for aggregated port AG1
show spanning-tree                       ! Display spanning tree info
show spanning-tree interface fastethernet 0/1  ! Display STP status of port
show port-security                       ! View port security info
show port-security address               ! View MAC/IP binding info
show ip access-lists listname            ! View ACL named “listname”

!-------------------------------------------------------------
! Step 3: Basic Port Configuration
(config)# interface fastethernet 0/3
(config-if)# speed 10                    ! Set port speed (10/100/auto)
(config-if)# duplex full                 ! Set duplex mode (full/half/auto)
(config-if)# no shutdown                 ! Enable port
(config-if)# switchport access vlan 10   ! Assign port to VLAN 10
(config-if)# switchport mode trunk       ! Set port to trunk mode
(config-if)# port-group 1                ! Add port to aggregation group AG1

! Configure multiple ports at once
(config)# interface range fa 0/1-2,0/5,0/7-9

!-------------------------------------------------------------
! Step 4: Creating Aggregated Ports
(config)# interface aggregateport 1
(config-if)# switchport mode trunk
(config)# interface range f0/23-24
(config-if-range)# port-group 1          ! Add to aggregation group AG1

!-------------------------------------------------------------
! Step 5: Spanning Tree Configuration
switch(config)# spanning-tree
switch(config)# spanning-tree mst configuration
switch(config-mst)# name RUIJIE          ! MST name
switch(config-mst)# revision 1           ! MST revision number
switch(config-mst)# instance 0 vlan 10,20
switch(config-mst)# instance 1 vlan 30,40

! Set priority for instances
switch(config)# spanning-tree mst 0 priority 4096
switch(config)# spanning-tree mst 1 priority 8192

! Configure VRRP for VLAN interfaces
switch(config)# interface vlan 10
switch(config-if)# vrrp 1 ip 192.168.10.1
switch(config)# interface vlan 20
switch(config-if)# vrrp 1 ip 192.168.20.1
switch(config)# interface vlan 30
switch(config-if)# vrrp 2 ip 192.168.30.1
switch(config)# interface vlan 40
switch(config-if)# vrrp 2 ip 192.168.40.1

!-------------------------------------------------------------
! Step 6: Basic VLAN Configuration
(config)# vlan 10
(config-vlan)# name VLAN_10
(config-if)# switchport access vlan 10

! VLAN interface setup
(config)# interface vlan 10
(config-if)# ip address 192.168.1.1 255.255.255.0
(config-if)# no shutdown
! Note: Layer 2 switches can only have one management IP for remote access.

!-------------------------------------------------------------
! Step 7: Port Security Configuration
(config)# interface fastethernet 0/1
(config-if)# switchport port-security           ! Enable port security

! a) Set maximum MAC connection
(config-if)# switchport port-security maximum 1
(config-if)# switchport port-security violation shutdown
! Options:
!  - protect   : Drop unknown packets when limit reached
!  - restrict  : Trap notification only
!  - shutdown  : Disable port and send Trap alert

! b) IP and MAC binding
(config-if)# switchport port-security mac-address xxxx.xxxx.xxxx ip-address 172.16.1.1

!-------------------------------------------------------------
! Step 8: Layer 3 Routing Configuration (L3 Switch)
(config)# ip routing                           ! Enable L3 routing
(config)# interface fastethernet 0/1
(config-if)# no switchport                     ! Convert port to L3
(config-if)# ip address 192.168.1.1 255.255.255.0
(config-if)# no shutdown

!-------------------------------------------------------------
! Step 9: Static & Dynamic Routing Protocols
(config)# ip route 172.16.1.0 255.255.255.0 172.16.2.1
! Static route — next-hop 172.16.2.1

! RIP Configuration
(config)# router rip
(config-router)# network 172.16.1.0
(config-router)# version 2
(config-router)# no auto-summary

! OSPF Configuration
(config)# router ospf 1
(config-router)# network 192.168.1.0 0.0.0.255 area 0

!-------------------------------------------------------------
! Conclusion:
! These commands form the essential configuration toolkit for
! Ruijie switches. The syntax closely resembles Huawei and H3C,
! making it easy for engineers to transition between vendors.
!-------------------------------------------------------------
