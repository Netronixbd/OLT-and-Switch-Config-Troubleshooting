!-----------------------------
! BDCOM/EPON OLT Read-Only User Creation
! Purpose: Create a user with read-only access for support engineers
!-----------------------------

! Step 1: Access OLT and enter enable mode
switch> enable
switch#

! Step 2: Enter configuration mode
switch# config
switch_config#

! Step 3: Create a Read-Only user group
switch_config# localauthor Read
switch_config_localauthor_Read# exec privilege default 8
switch_config_localauthor_Read# exit

! Step 4: Create a Read-Only user and assign it to the Read group
! Replace "technicalafnan" and "123456" with desired username & password
switch_config# username technicalafnan password 123456 author-group Read

! Step 5: Save configuration
switch_config# write all

!-----------------------------
! Notes:
! - This user will have read-only access.
! - They can view information but cannot modify configurations.
! - Ideal for assistant/support engineers to prevent accidental network changes.
!-----------------------------
