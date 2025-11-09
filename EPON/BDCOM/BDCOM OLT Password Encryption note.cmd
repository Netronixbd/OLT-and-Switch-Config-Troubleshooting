!-------------------------------------------------------------
! BDCOM EPON OLT Password Encryption
!-------------------------------------------------------------
! Purpose:
! Encrypt login passwords on BDCOM OLT to enhance security.
! This prevents passwords from being visible in plain text.
!-------------------------------------------------------------

! 1. Access OLT
! Use console or Ethernet connection to access OLT CLI.

Username: admin
Password: 

! 2. Enter enable mode
Tipo-OLT> ena
Tipo-OLT#

! 3. Enter configuration mode
Tipo-OLT# config
Tipo-OLT_config#

! 4. Enable password encryption service
Tipo-OLT_config# service password-encryption

! 5. Save the configuration
Tipo-OLT_config# write all
! Saving current configuration...
! OK!
! Now saving current ifindex to flash memory...
! OK!

!-------------------------------------------------------------
! Conclusion:
! After executing the above commands, the login password on
! the OLT will be encrypted. It is now secure and no longer
! displayed in plain text.
!-------------------------------------------------------------
