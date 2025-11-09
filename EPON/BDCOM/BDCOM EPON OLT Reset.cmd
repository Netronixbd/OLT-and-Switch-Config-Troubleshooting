!-----------------------------
! BDCOM EPON OLT Reset Commands
! Default Username: admin
! Default Password: admin
! Device: BDCOM P3310D EPON OLT
!-----------------------------

! Step 1: Access OLT
OLT> enable
OLT#

! Step 2: Delete Startup Configuration
OLT# delete startup-config
! this file will be erased, are you sure? (y/n) y

! Step 3: Delete Config Database
OLT# delete config.db
! this file will be erased, are you sure? (y/n) y

! Step 4: Delete Interface Index Configuration
OLT# delete ifindex-config
! this file will be erased, are you sure? (y/n) y

! Step 5: Reboot OLT
OLT# reboot
! Do you want to reboot the Switch (y/n)? y

!-----------------------------
! Conclusion:
! OLT reset complete. After reboot, all configurations will be cleared, and device will be back to factory default.
!-----------------------------
