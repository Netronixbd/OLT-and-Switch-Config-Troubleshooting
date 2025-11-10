# 🧠 BT-PON FTTH OLT – Login & Configuration Guide
# Date: July 24, 2024
# Device: BT-PON FTTH OLT
# Purpose: Initial login and basic configuration (VLAN, IP, ONU, IGMP, QinQ)

#######################################################################
# 🔐 OLT Login Methods
#######################################################################

# 1️⃣ Through MGMT Port
# PC IP: 192.168.77.11
# Browser: http://192.168.77.254
# Username / Password: admin / admin

# 2️⃣ Through Uplink Port (GE1–GE4)
# PC IP: 192.168.20.11
# Browser: http://192.168.20.1
# Username / Password: admin / admin


#######################################################################
# 🌐 Network Planning
#######################################################################
# VLAN199  -> DHCP Service VLAN
# VLAN1000 -> Management Service VLAN (mgmt)


#######################################################################
# ⚙️ Global Configuration
#######################################################################

# 1. VLAN Configuration
XPON#configure terminal
XPON(config)#vlan database
XPON(config-vlan)#vlan 1000 name MGMT
XPON(config-vlan)#vlan 199 name DHCP
XPON(config-vlan)#exit


# 2. IP Address Configuration
XPON(config)#ip interface vlan 1000
XPON(config)#interface vlan1.1000
XPON(config-vlan1.1000)#ip address 172.17.9.226/24
XPON(config-vlan1.1000)#exit


# 3. Port VLAN Configuration
# --- PON Port Configuration ---
XPON(config)#interface gpon1
XPON(config-gpon1)#switchport mode hybrid
XPON(config-gpon1)#switchport hybrid allowed vlan add 1000 egress-tagged enable
XPON(config-gpon1)#exit

# --- Uplink GE Port Configuration ---
# GE1 as Access Port
XPON(config)#interface ge1
XPON(config-ge1)#switchport access vlan 1000
XPON(config-ge1)#exit

# GE2 as Trunk Port
XPON(config)#interface ge2
XPON(config-ge2)#switchport mode trunk
XPON(config-ge2)#switchport trunk allowed vlan add 199,1000
XPON(config-ge2)#exit


# 4. ONU Registration & VLAN Binding
XPON(config)#interface gpon1
XPON(config-gpon1)#ont add ontid 0 authsn XPON-DD51A5E6 lineprofile name linepfdef srvprofile name srvpfdef desc test
XPON(config-gpon1)#ont port-vlan ontid 0 eth 1-4 transparent 1000
XPON(config-gpon1)#exit


# 5. Service Profile Configuration
# --- SFU Type ONU ---
XPON(config)#gpon configuration
XPON(config-gpon)#ont srvprofile add name sfu
XPON(config-srvprofile-sfu)#port vlan eth 1 tag uservlan 1000
XPON(config-srvprofile-sfu)#port vlan eth 2 tag uservlan 2000
XPON(config-srvprofile-sfu)#port vlan eth 3 tag uservlan 1000
XPON(config-srvprofile-sfu)#port vlan eth 4 tag uservlan 1000
XPON(config-srvprofile-sfu)#ont binding capprofile name cappfdef
XPON(config-srvprofile-sfu)#commit
XPON(config-srvprofile-sfu)#exit

# --- HGU Type ONU ---
XPON(config)#gpon configuration
XPON(config-gpon)#ont srvprofile add name hgu
XPON(config-srvprofile-hgu)#port vlan eth 1 tag uservlan 1000,2000
XPON(config-srvprofile-hgu)#ont binding capprofile name cappfdef
XPON(config-srvprofile-hgu)#commit
XPON(config-srvprofile-hgu)#exit


# 6. IGMP Snooping Configuration
XPON(config)#ip igmp snooping
XPON(config)#ip igmp snooping vlan 1000
XPON(config)#ip igmp snooping fast-leave vlan 1000
XPON(config)#ip igmp snooping mrouter interface ge4 vlan 1000


# 7. QinQ Configuration
# --- GPON Port Configuration ---
XPON(config)#interface gpon8
XPON(config-gpon8)#qinq enable customer-edge-port
XPON(config-gpon8)#qinq profile cvlan 2000 svlan 1580
XPON(config-gpon8)#exit

# --- Uplink GE Port Configuration ---
XPON(config)#interface ge4
XPON(config-ge4)#qinq enable provider-port
XPON(config-ge4)#exit


#######################################################################
# ✅ Summary
#######################################################################
# - VLAN creation and tagging
# - Management IP setup
# - ONU binding with profiles
# - Service profiles for SFU & HGU
# - IGMP Snooping for multicast control
# - QinQ tunneling for VLAN stacking
#######################################################################
