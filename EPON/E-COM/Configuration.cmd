# -------------------------------
# Step 1: VLAN Creation (100-104) on ECOM OLT
# VLAN Descriptions:
# VLAN 100 -> MGMT VLAN with management IP
# VLAN 101 -> Access for PON-1
# VLAN 102 -> Access for PON-2
# VLAN 103 -> Access for PON-3
# VLAN 104 -> Access for PON-4
# -------------------------------
configure terminal
vlan 100-104
# Output: Create vlan successfully: 100-104

# -------------------------------
# Step 2: ECOM OLT Access & Management IP Setup
# Connect to OLT management port
telnet admin@192.168.1.1

# Change management IP to avoid conflict
configure terminal
interface vlanif 100
ip address 10.10.10.2 255.255.255.252
exit
ip route 0.0.0.0/0 10.10.10.1
save

# -------------------------------
# Step 3: Port Configuration on ECOM OLT
# Uplink Port (Trunk Mode) -> Carry all VLANs 100-104
# -------------------------------
interface gigabitEthernet 0/0
vlan mode 1 trunk
vlan trunk 1 100-104
exit

# PON Ports (Access Mode) -> Each PON port assigned a VLAN

# PON-1
interface epon 0/1
vlan mode 1 access
vlan access 1 101
exit

# PON-2
interface epon 0/2
vlan mode 2 access
vlan access 2 102
exit

# PON-3
interface epon 0/3
vlan mode 3 access
vlan access 3 103
exit

# PON-4
interface epon 0/4
vlan mode 4 access
vlan access 4 104
exit

# -------------------------------
# Step 4: Line and Service Profiles (Optional)
# -------------------------------

# Create Line Profile with VLAN tagging
configure terminal
line-profile 1
vlan 100-104
qos enable
exit

# Create Service Profile for bandwidth
service-profile 1
bandwidth 10m 2m
exit

# -------------------------------
# Step 5: Register ONU Devices (Optional)
# Bind ONU by serial with profiles
# -------------------------------
pon-onu 0/0 add serial SERIAL_NUMBER line-profile 1 service-profile 1
exit
