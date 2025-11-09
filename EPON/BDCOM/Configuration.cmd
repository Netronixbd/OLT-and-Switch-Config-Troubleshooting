!-----------------------------
! BDCOM EPON OLT Full Configuration
! Default Access: 192.168.0.1 / admin / admin
!-----------------------------

! Step 1: Access OLT
! (Console: Serial to USB, baud 9600)
! (Ethernet: PC 192.168.0.10 / 255.255.255.0 → Telnet 192.168.0.1)

! Step 2: VLAN Creation
Switch> enable
Switch# config
Switch_config# vlan 100-104
! VLAN 100 -> Management
! VLAN 101-104 -> PON Ports
Switch_config# exit

! Step 3: Uplink Configuration (G3)
Switch_config# interface gigabitethernet 0/3
Switch_config_g0/3# switchport mode trunk
Switch_config_g0/3# switchport trunk vlan 100-104
Switch_config_g0/3# exit

! Check Mac address table on uplink
Switch_config# show mac address-table interface gigabitethernet 0/3

! Step 4: Management IP Assignment
Switch_config# interface vlan 100
Switch_config_v100# ip address 10.204.253.10 255.255.255.252
Switch_config_v100# exit
Switch_config# ip route 10.204.253.9

! Step 5: PON Port Configuration
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

! Step 6: Save Configuration
Switch_config# write all
!-----------------------------
! End of Configuration
!-----------------------------
