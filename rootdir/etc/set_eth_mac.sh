#!/system/bin/sh

MAC_STRING=`cat /proc/eth_mac_addr`
mac_o1=${MAC_STRING:0:2}
mac_o2=${MAC_STRING:2:2}
mac_o3=${MAC_STRING:4:2}
mac_o4=${MAC_STRING:6:2}
mac_o5=${MAC_STRING:8:2}
mac_o6=${MAC_STRING:10:2}

ifconfig eth0 hw ether $mac_o1:$mac_o2:$mac_o3:$mac_o4:$mac_o5:$mac_o6

ifconfig eth0 10.0.0.10
