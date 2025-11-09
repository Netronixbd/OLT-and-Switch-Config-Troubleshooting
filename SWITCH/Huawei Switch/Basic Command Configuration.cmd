!-------------------------------------------------------------
! Huawei Switch Basic Command Configuration
!-------------------------------------------------------------
! Purpose:
! This document provides basic commands to configure VLANs,
! IP addresses, default gateway, and other common settings 
! on Huawei switches. It also covers display commands and 
! factory reset procedures.
!-------------------------------------------------------------

! Step 1: Enter system view (configuration mode)
<Quidway> // User view mode
<Quidway> system-view
[Quidway] // Now in configuration view

!-------------------------------------------------------------
! Step 2: Create VLANs
[Quidway] vlan 10
[Quidway-vlan10] quit
[Quidway] vlan 100
[Quidway-vlan100] quit

!-------------------------------------------------------------
! Step 3: Add ports to VLANs
[Quidway] interface GigabitEthernet2/0/1  ! 10G optical port
[Quidway-GigabitEthernet2/0/1] port link-type access
[Quidway-GigabitEthernet2/0/1] port default vlan 100
[Quidway-GigabitEthernet2/0/1] quit

[Quidway] interface GigabitEthernet1/0/0
[Quidway-GigabitEthernet1/0/0] port link-type access
[Quidway-GigabitEthernet1/0/0] port default vlan 10
[Quidway-GigabitEthernet1/0/0] quit

!-------------------------------------------------------------
! Step 4: Add multiple ports to VLAN
[Quidway] vlan 10
[Quidway-vlan10] port GigabitEthernet1/0/0 to 1/0/29
[Quidway-vlan10] quit

!-------------------------------------------------------------
! Step 5: Configure IP addresses for VLAN interfaces
[Quidway] interface Vlanif100
[Quidway-Vlanif100] ip address 119.167.200.90 255.255.255.252
[Quidway-Vlanif100] quit

[Quidway] interface Vlanif10
[Quidway-Vlanif10] ip address 119.167.206.129 255.255.255.128
[Quidway-Vlanif10] quit

!-------------------------------------------------------------
! Step 6: Configure the default gateway
[Quidway] ip route-static 0.0.0.0 0.0.0.0 119.167.200.89

!-------------------------------------------------------------
! Step 7: Save configuration, reset, and reboot
<Quidway> save
<Quidway> reset saved-configuration
<Quidway> reboot

!-------------------------------------------------------------
! Step 8: Common display commands
<Quidway> display current-configuration    ! Show current running config
<Quidway> display device                  ! Show device status
<Quidway> display interface ?             ! Show interface options
<Quidway> display version                 ! Show firmware version
<Quidway> display vlan ?                  ! Show VLAN configuration

!-------------------------------------------------------------
! Step 9: Restore factory settings
<Quidway> reset saved-configuration

!-------------------------------------------------------------
! Conclusion:
! The above commands cover basic VLAN, interface, IP, and
! gateway configuration on Huawei switches. Common display 
! commands help verify configuration and status.
!-------------------------------------------------------------
