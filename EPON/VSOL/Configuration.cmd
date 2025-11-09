# -------------------------------
# Default OLT Info
# -------------------------------
# IP Address: 192.168.8.100
# Username: admin
# Password: Xpon@Olt9417#
# Enable Password: Xpon@Olt9417#

# -------------------------------
# Step 1: Login & Enable Configuration Mode
# -------------------------------
Username: admin
Password: Xpon@Olt9417#

epon-OLT> ena
Password: Xpon@Olt9417#

epon-OLT# configure terminal
epon-OLT(config)#

# -------------------------------
# Step 2: Create VLANs (400-404)
# VLAN Usage:
# VLAN 400 -> OLT MGT (remote management)
# VLAN 401 -> PON-1
# VLAN 402 -> PON-2
# VLAN 403 -> PON-3
# VLAN 404 -> PON-4
# -------------------------------
vlan 400-404
exit

# -------------------------------
# Step 3: Configure Uplink Port (G1) as Trunk
# -------------------------------
interface gigabitethernet 0/1
switchport mode trunk
switchport trunk vlan 400-404
exit

# Check MAC address table on uplink
show mac address-table interface gigabitethernet 0/1

# -------------------------------
# Step 4: Assign Management IP
# -------------------------------
interface VLAN 400
ip address 10.100.100.2 255.255.255.252
exit

# Set default route
ip route 0.0.0.0/0 10.100.100.1

# -------------------------------
# Step 5: Configure PON Ports (Access Mode)
# -------------------------------

# PON-1
interface epon 0/1
switchport mode access
switchport access vlan 401
exit

# PON-2
interface epon 0/2
switchport mode access
switchport access vlan 402
exit

# PON-3
interface epon 0/3
switchport mode access
switchport access vlan 403
exit

# PON-4
interface epon 0/4
switchport mode access
switchport access vlan 404
exit

