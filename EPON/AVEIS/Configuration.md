=================================
Aveis EPON OLT CLI Configuration
=================================

IP Address: 192.168.100.1
Username: root
Password: admin


Uplink Configuration
---------------------
OLT(config)#
OLT(config)# interface ge 1
OLT(config-ge-1)# vlan mode trunk
OLT(config-ge-1)# vlan trunk 100-105
OLT(config-ge-1)# exit
OLT(config)#


VLAN Creation:
--------------
OLT(config)#
OLT(config)#vlan standard 100-105
OLT(config-vlan-list)#exit


MGMT Configuration:
-------------------
OLT(config)#
OLT(config)# interface vlanif 100
OLT(config-vlanif-100)# ifconfig 10.30.30.2/30
OLT(config-vlanif-100)# exit
OLT(config)# ip route-static dest-ip 10.30.30.1
OLT(config)#


EPON Port Configuration:
------------------------

PON-1:
------
OLT(config)#
OLT(config)# interface epon 1
OLT(config-epon-1)# vlan mode access
OLT(config-epon-1)# vlan access 101
OLT(config-epon-1)# exit
OLT(config)#


PON-2:
------
OLT(config)#
OLT(config)# interface epon 2
OLT(config-epon-2)# vlan mode access
OLT(config-epon-2)# vlan access 102
OLT(config-epon-2)# exit
OLT(config)#


PON-3:
------
OLT(config)#
OLT(config)# interface epon 3
OLT(config-epon-3)# vlan mode access
OLT(config-epon-3)# vlan access 103
OLT(config-epon-3)# exit
OLT(config)#


PON-4:
------
OLT(config)#
OLT(config)# interface epon 4
OLT(config-epon-4)# vlan mode access
OLT(config-epon-4)# vlan access 104
OLT(config-epon-4)# exit
OLT(config)# exit


Save Configuration
-------------------
OLT# copy running-config startup-config
