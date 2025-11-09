!-------------------------------------------------------------
! BASIC COMMAND CONFIGURATION FOR CISCO SWITCHES
!-------------------------------------------------------------
! Purpose:
! Cisco switches are among the most widely used devices in 
! enterprise networking. The following commands cover basic 
! setup, VLANs, interface configuration, security, and remote 
! management for Cisco Catalyst switches.
!-------------------------------------------------------------

!-------------------------------------------------------------
! 1. ENTER PRIVILEGED & GLOBAL CONFIGURATION MODE
!-------------------------------------------------------------
Switch> enable                              ! Enter privileged EXEC mode
Switch# configure terminal                  ! Enter global configuration mode
Switch(config)#

!-------------------------------------------------------------
! 2. SET SWITCH HOSTNAME
!-------------------------------------------------------------
Switch(config)# hostname aptech2950         ! Set the switch name
aptech2950(config)#

!-------------------------------------------------------------
! 3. CONFIGURE PASSWORDS
!-------------------------------------------------------------
aptech2950(config)# enable password cisco    ! Set enable password (plain text)
aptech2950(config)# enable secret ciscolab   ! Set enable secret password (encrypted)

!-------------------------------------------------------------
! 4. CREATE MULTIPLE VLANS
!-------------------------------------------------------------
Switch# vlan database
Switch(vlan)# vlan 10 name IT               ! Create VLAN 10 named IT
Switch(vlan)# vlan 20 name HR               ! Create VLAN 20 named HR
Switch(vlan)# vlan 30 name FIN              ! Create VLAN 30 named FIN
Switch(vlan)# vlan 40 name LOG              ! Create VLAN 40 named LOG
Switch(vlan)# exit

!-------------------------------------------------------------
! 5. CONFIGURE VLAN 1 (MANAGEMENT VLAN)
!-------------------------------------------------------------
aptech2950(config)# interface vlan 1
aptech2950(config-if)# ip address 192.168.1.1 255.255.255.0
aptech2950(config-if)# no shutdown
aptech2950(config-if)# exit
aptech2950(config)# ip default-gateway 192.168.1.254

!-------------------------------------------------------------
! 6. CONFIGURE SPECIFIC PORT
!-------------------------------------------------------------
aptech2950(config)# interface fastethernet 0/17
aptech2950(config-if)# switchport mode access
aptech2950(config-if)# switchport access vlan 10
aptech2950(config-if)# duplex full
aptech2950(config-if)# speed 100
aptech2950(config-if)# no shutdown
aptech2950(config-if)# exit

!-------------------------------------------------------------
! 7. VIEW & VERIFY CONFIGURATIONS
!-------------------------------------------------------------
Switch# show version                        ! View system version and info
Switch# show running-config                 ! View current configuration
Switch# show interface fastethernet 0/1     ! View details for interface F0/1
Switch# show interface vlan 1               ! View VLAN interface details
Switch# show mac-address-table              ! Display MAC address table
Switch# show mac-address-table aging-time   ! View MAC aging timer
Switch# show vlan brief                     ! Display VLAN summary

!-------------------------------------------------------------
! 8. RESET SWITCH TO FACTORY DEFAULT
!-------------------------------------------------------------
Switch# erase startup-config
Switch# reload                              ! Reboot and reset to default

!-------------------------------------------------------------
! 9. DUPLEX MODE CONFIGURATION
!-------------------------------------------------------------
aptech2950(config)# interface fastethernet 0/17
aptech2950(config-if)# duplex full          ! Set full duplex (options: full, half, auto)
aptech2950(config-if)# exit

!-------------------------------------------------------------
! 10. CDP (CISCO DISCOVERY PROTOCOL) COMMANDS
!-------------------------------------------------------------
Switch# show cdp                            ! View CDP global configuration
Switch# show cdp interface fastethernet 0/17 ! View CDP details for port F0/17
Switch# show cdp neighbors                  ! List connected Cisco devices
Switch# show cdp traffic                    ! Display CDP traffic statistics

!-------------------------------------------------------------
! 11. TELNET REMOTE LOGIN CONFIGURATION
!-------------------------------------------------------------
aptech2950(config)# interface vlan 1
aptech2950(config-if)# ip address 192.168.1.1 255.255.255.0
aptech2950(config-if)# no shutdown
aptech2950(config-if)# exit

aptech2950(config)# line vty 0 4
aptech2950(config-line)# login
aptech2950(config-line)# password edge
aptech2950(config-line)# exit

aptech2950(config)# enable password cisco

!-------------------------------------------------------------
! 12. HOST (REMOTE PC) CONFIGURATION
!-------------------------------------------------------------
IP Address: 192.168.1.2
Subnet Mask: 255.255.255.0
Gateway: 192.168.1.1

!-------------------------------------------------------------
! 13. TELNET OPERATION
!-------------------------------------------------------------
C:\> telnet 192.168.1.1
Password: edge
aptech2950> en
Password: cisco
aptech2950#

!-------------------------------------------------------------
! END OF CISCO SWITCH BASIC CONFIGURATION
!-------------------------------------------------------------
