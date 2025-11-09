!-------------------------------------------------------------
! MikroTik + BDCOM OLT LACP (Bonding) & VLAN Configuration
!-------------------------------------------------------------

! Step 1: MikroTik LACP (Bonding) Configuration
/interface bonding
add name=LACP-OLT slaves=ether1,ether3 mode=802.3ad transmit-hash-policy=layer-2-and-3 disabled=no
! ether1 and ether3 combined to form LACP-OLT bond with 2Gbps total bandwidth.

! Step 1a: VLAN Creation on LACP Interface
/interface vlan
add interface=LACP-OLT name=OLT-MGT vlan-id=100
add interface=LACP-OLT name=EPON-1 vlan-id=101
add interface=LACP-OLT name=EPON-2 vlan-id=102
add interface=LACP-OLT name=EPON-3 vlan-id=103
add interface=LACP-OLT name=EPON-4 vlan-id=104

! Step 1b: IP Address Assignment for Management VLAN
/ip address
add address=10.200.201.5/30 interface=OLT-MGT disable=no

!-------------------------------------------------------------
! Step 2: BDCOM OLT LACP Configuration

! Step 2a: Create Port Aggregator (Logical LACP Interface)
/interface Port-aggregator1
Switch> enable
Switch# config
Switch_config# interface Port-aggregator1
Switch_config_p1# switchport mode trunk
Switch_config_p1# switchport trunk vlan-allowed 100-104
Switch_config_p1# no shutdown
Switch_config_p1# exit

! Step 2b: Configure Physical Uplink Ports GE0/1 and GE0/2
Switch_config# interface gigaEthernet 0/1
Switch_config_g0/1# switchport mode trunk
Switch_config_g0/1# switchport trunk vlan-allowed 100-104
Switch_config_g0/1# no shutdown
Switch_config_g0/1# aggregator-group 1 mode lacp
Switch_config_g0/1# exit

Switch_config# interface gigaEthernet 0/2
Switch_config_g0/2# switchport mode trunk
Switch_config_g0/2# switchport trunk vlan-allowed 100-104
Switch_config_g0/2# no shutdown
Switch_config_g0/2# aggregator-group 1 mode lacp
Switch_config_g0/2# exit

! Step 2c: Assign IP Address for Management VLAN
Switch_config# interface VLAN 100
Switch_config_v100# ip address 10.200.201.6  255.255.255.252
Switch_config_v100# exit
Switch_config# ip route 10.200.201.5

! Step 2d: Configure PON Ports with VLANs

! PON-1
Switch_config# interface epon 0/1
Switch_config_epon0/1# switchport mode access
Switch_config_epon0/1# switchport pvid 101
Switch_config_epon0/1# exit

! PON-2
Switch_config# interface epon 0/2
Switch_config_epon0/2# switchport mode access
Switch_config_epon0/2# switchport pvid 102
Switch_config_epon0/2# exit

! PON-3
Switch_config# interface epon 0/3
Switch_config_epon0/3# switchport mode access
Switch_config_epon0/3# switchport pvid 103
Switch_config_epon0/3# exit

! PON-4
Switch_config# interface epon 0/4
Switch_config_epon0/4# switchport mode access
Switch_config_epon0/4# switchport pvid 104
Switch_config_epon0/4# exit

! Step 2e: Save Configuration
Switch_config# write all

!-------------------------------------------------------------
! Step 3: Verify LACP Status

! On MikroTik:
! /interface bonding monitor LACP-OLT
! Both ether1 and ether3 should be “active”.

! On BDCOM OLT:
! show interface port-aggregator 1
! Both GE0/1 and GE0/2 should be part of the channel-group.

!-------------------------------------------------------------
! Step 4: Testing
! - Disconnect one uplink cable: internet should still work.
! - Run bandwidth test: verify load balancing between two links.
! - Check VLAN/PPPoE sessions: must pass through LACP bond.

!-------------------------------------------------------------
! Why LACP is Important for ISPs:
! - Prevents downtime if one uplink fails.
! - Combines multiple links to increase total bandwidth.
! - Example: two 1Gbps links in LACP = 2Gbps total capacity.
!-------------------------------------------------------------
