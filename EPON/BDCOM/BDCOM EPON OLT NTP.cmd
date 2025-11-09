!-----------------------------
! BDCOM EPON OLT NTP Configuration
! Device: BDCOM EPON OLT / Switch
!-----------------------------

! Step 1: Access OLT and enter enable mode
OLT> enable
OLT#

! Step 2: Enter configuration mode
OLT# config
OLT_config#

! Step 3: Set Time Zone
! Format: time-zone <Region>/<City> <GMT offset hours> <GMT offset minutes>
OLT_config# time-zone Asia/Dhaka 6 0

! Step 4: Configure NTP Server
! Replace with your preferred NTP server IP
OLT_config# ntp server 103.15.140.4

!-----------------------------
! Conclusion:
! NTP configuration complete. The OLT/Switch will now sync time with the specified NTP server.
!-----------------------------
