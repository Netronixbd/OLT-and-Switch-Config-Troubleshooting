!-------------------------------------------------------------
! BDCOM EPON OLT SHOW Commands Reference
!-------------------------------------------------------------
! These commands are useful for monitoring, troubleshooting,
! and checking OLT status without changing configurations.
! Beginners and system admins can benefit from these commands.
!-------------------------------------------------------------

! 1. Show Full Configuration
show running-config
! Use to display the full OLT configuration.

show running-config interface epON 0/1
! Show specific epon interface configuration.

show running-config interface epON 0/1:1
! Show specific ONU configuration under epon 0/1.

show running-config interface gigaEthernet 0/1
! Show specific gigaEthernet interface configuration.

! 2. ONU Information & Status
show epon active-onu
! Show all active ONU information.

show epon active-onu interface epON 0/2
! Show active ONU information for specific interface.

show epon active-onu mac-address b485.3d26.d8d3
! Search ONU by MAC address.

show epon always-laser-on-onu
! Check ONU laser always-on status.

show epon always-laser-on-onu interface epON 0/2
! Check specific ONU laser status.

show epon inactive-onu
! Show inactive ONU information.

show epon inactive-onu interface epON 0/2
! Show inactive ONU info for a specific interface.

show epon interface epON 0/2:2 onu ctc basic-info
! Find ONU MAC address and basic info.

show epon interface epON 0/2:2 onu port 1 state
! Check ONU LAN port status (UP/DOWN).

show epon interface epON 0/3:2 onu ctc dba
! Show ONU queue DBA configuration.

show epon interface epON 0/2:2 onu ctc SNMP-info
! Show ONU SNMP information.

show epon interface epON 0/2:3 onu d-info
! Show ONU double MAC information.

show epon interface epON 0/2:5 onu mac address-table
! Show ONU MAC address table.

show epon interface epON 0/2:4 onu mac-aging-time
! Show ONU MAC aging time.

show epon interface epON 0/2:9 onu pon-port statistics
! Show ONU interface statistics.

show epon interface epON 0/2:10 onu pon-port state
! Show ONU interface state.

show epon interface epON 0/2:12 onu port 1 ctc auto-negotiation
! Show ONU port auto-negotiation status.

show epon interface epON 0/2:14 onu port 1 ctc flow-control
! Show ONU port flow-control status.

show epon interface epON 0/2:14 onu port 1-4 mcst mc-VLAN
! Show ONU multicast VLAN configuration.

show epon interface epON 0/2:14 onu port 1 ctc mcst tag-stripe
! Show ONU multicast VLAN tag-stripe.

show epon interface epON 0/2:14 onu port 1 ctc QoS
! Show ONU port QoS configuration.

show epon onu-information
! Show all ONU information under every epon.

! 3. Interface & VLAN Information
show interface brief
! Show all interface statuses.

show interface range epON 0/1
! Show TX/RX power and status for range of epon interfaces.

show interface epON 0/2
! Show specific interface information.

show ip interface VLAN 1
! Show specific VLAN interface IP configuration.

show VLAN
! Show VLAN information.

! 4. MAC Address & ARP
show mac address-table
! Show all MAC address tables.

show mac address-table interface epON 0/1
! Show specific epon interface MAC table.

show mac address-table interface epON 0/1:5
! Show specific ONU MAC table.

show mac-address-table dynamic
! Show dynamic MAC addresses.

show the arp
! Show ARP table with IP and interface.

! 5. Routing & Traffic
show ip route detail
! Show all routes in OLT.

show ip route-static
! Show static routes.

show ip traffic
! Show IP traffic information.

! 6. Security & Users
show aaa users
! Show AAA active login users.

show local users
! Show all local users.

show ip sshd
! Show SSH server status.

show telnet
! Show incoming Telnet connections.

! 7. Aggregation & LACP
show aggregator-group detail
! Show link aggregation (LACP/Bonding) information.

! 8. Miscellaneous Commands
show break
! Show switch breakpoint information.

show cpu
! Show CPU usage.

show debug
! Show debugging option status.

show dot1x
! Show IEEE 802.1X information.

show epon optical-transceiver-diagnosis
! Show all EPON optical power (dBm).

show epon optical-transceiver-diagnosis interface epON 0/2
! Show EPON optical power for specific interface.

show epon optical-transceiver-diagnosis interface epON 0/2:1
! Show specific ONU optical power (dBm).

show gpon optical-transceiver-diagnosis interface gpON 0/2
! Show GPON ONU RX/TX power.

show policy-map
! Show policy-map bandwidth configuration.

show alias
! Show alias command information.

show logging
! Show all logs.

show onu-config-template
! Show ONU template configuration.

!-------------------------------------------------------------
! End of BDCOM OLT SHOW Commands Reference
!-------------------------------------------------------------
