# jun/22/2023 04:23:13 by RouterOS 6.48.6
# software id = 9ZXD-FC8L
#
# model = RouterBOARD 750G r3
# serial number = 6F38069AE243
/interface bridge
add name=lan
/interface ethernet
set [ find default-name=ether1 ] name=ether1-ISP-1
set [ find default-name=ether2 ] name=ether2-ISP-2
set [ find default-name=ether3 ] name=ether3-bridge-lan
set [ find default-name=ether4 ] name=ether4-bridge-lan
set [ find default-name=ether5 ] name=ether5-hotspot
/interface vlan
add interface=ether1-ISP-1 name=vlan1-HOTSPOT vlan-id=15
/interface list
add name=ISP
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot6 login-by=\
    http-chap,http-pap,trial,mac-cookie
add dns-name=muhsin15.com hotspot-address=192.168.160.1 html-directory=\
    flash/hotspot6 login-by=http-chap,http-pap,trial,mac-cookie name=hsprof1 \
    trial-uptime-limit=10m
add dns-name=wifinanbae.com hotspot-address=192.168.170.1 html-directory=\
    flash/hotspot6 login-by=http-chap,http-pap,trial,mac-cookie name=hsprof2 \
    trial-uptime-limit=7h
/ip hotspot user profile
set [ find default=yes ] mac-cookie-timeout=1d rate-limit=1M/1M
/ip pool
add name=hs-pool-5 ranges=192.168.160.11-192.168.160.254
add name=hs-pool-8 ranges=192.168.170.11-192.168.170.254
/ip dhcp-server
add address-pool=hs-pool-5 disabled=no interface=ether5-hotspot lease-time=1h \
    name=dhcp2
add address-pool=hs-pool-8 disabled=no interface=vlan1-HOTSPOT lease-time=1h \
    name=dhcp3
/ip hotspot
add address-pool=hs-pool-5 addresses-per-mac=1 disabled=no interface=\
    ether5-hotspot name=hotspot1 profile=hsprof1
add address-pool=hs-pool-8 addresses-per-mac=1 disabled=no interface=\
    vlan1-HOTSPOT name=hs-vlan1-HOTSPOT profile=hsprof2
/ppp profile
add local-address=10.30.0.1 name=GarudaNET on-down=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\";\r\
    \n:local chat \"-1001876603288\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;" \
    on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\";\r\
    \n:local chat \"-1001876603288\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;" \
    only-one=yes
/interface pptp-client
add connect-to=vpn.mnet.my.id disabled=no name=vpn-merpati-1 password=\
    muhsin17010090 profile=default user=muhsin
/queue simple
add max-limit=1G/1G name="0           VIP" packet-marks=\
    game-ml,game-ff,lokal,vip priority=1/1 target=10.30.0.0/24,192.168.0.0/16
add limit-at=50M/50M max-limit=60M/60M name="1     ALL TRAFIK" target=\
    10.30.0.0/24,192.168.0.0/16
add max-limit=30M/30M name=VOUCHER parent="1     ALL TRAFIK" priority=1/1 \
    target=192.168.221.0/24
add burst-limit=5M/5M burst-time=10s/10s limit-at=2M/2M max-limit=4M/4M name=\
    02-SANDI parent="1     ALL TRAFIK" target=10.30.0.2/32
add limit-at=2M/2M max-limit=2M/2M name=19-fajar parent="1     ALL TRAFIK" \
    target=10.30.0.19/32
add limit-at=2M/2M max-limit=4M/4M name="20-fitri sepul" parent=\
    "1     ALL TRAFIK" target=10.30.0.20/32
add burst-limit=20M/20M burst-time=10s/10s max-limit=20M/20M name=\
    "27 SD PESAREAN 02" parent="1     ALL TRAFIK" target=10.30.0.27/32
add limit-at=4M/4M max-limit=4M/4M name="26 RIYANTO" parent=\
    "1     ALL TRAFIK" target=10.30.0.26/32
add burst-limit=11M/10M burst-time=10s/10s limit-at=5M/5M max-limit=8M/8M \
    name="24-ozi " parent="1     ALL TRAFIK" target=10.30.0.24/32
add limit-at=2M/2M max-limit=7M/7M name="25 ENDAH SURO" parent=\
    "1     ALL TRAFIK" target=10.30.0.25/32
add limit-at=2M/2M max-limit=7M/7M name="23 AMAD ULFIYAH " parent=\
    "1     ALL TRAFIK" target=10.30.0.23/32
add limit-at=10M/10M max-limit=10M/10M name="22 RIZKY" parent=\
    "1     ALL TRAFIK" target=10.30.0.22/32
add limit-at=2M/2M max-limit=5M/4M name="21 JAROAH " parent=\
    "1     ALL TRAFIK" target=10.30.0.21/32
add limit-at=2M/2M max-limit=5M/4M name=08-wariah parent="1     ALL TRAFIK" \
    target=10.30.0.8/32
add limit-at=2M/2M max-limit=10M/10M name="15 -AGUS" parent=\
    "1     ALL TRAFIK" target=10.30.0.15/32
add burst-limit=10M/10M burst-time=10s/10s limit-at=2M/2M max-limit=10M/10M \
    name=16-ADI parent="1     ALL TRAFIK" target=10.30.0.16/32
add burst-time=0s/10s limit-at=10M/10M max-limit=12M/10M name=\
    "17-agus muzayin" parent="1     ALL TRAFIK" target=10.30.0.17/32
add burst-time=10s/10s limit-at=5M/5M max-limit=10M/10M name="09- HERMAN" \
    parent="1     ALL TRAFIK" target=10.30.0.9/32
add burst-time=0s/10s limit-at=2M/2M max-limit=5M/4M name=12-PAIZ parent=\
    "1     ALL TRAFIK" target=10.30.0.12/32
add limit-at=3M/10M max-limit=5M/10M name="01-RUMAH MUHSIN" parent=\
    "1     ALL TRAFIK" target=10.30.0.28/32
add limit-at=5M/5M max-limit=10M/10M name=14-EKI parent="1     ALL TRAFIK" \
    target=10.30.0.14/32
add limit-at=2M/2M max-limit=4M/4M name="10- PUAD " parent="1     ALL TRAFIK" \
    target=10.30.0.10/32
add burst-limit=10M/10M burst-time=15s/20s limit-at=2M/2M max-limit=7M/10M \
    name="11 - HUSNI" parent="1     ALL TRAFIK" target=10.30.0.11/32
add burst-time=15s/15s max-limit=20M/30M name=04-SD-PESAREAN1 parent=\
    "1     ALL TRAFIK" target=10.30.0.4/32
add max-limit=5M/4M name=05-ABROR-FOTOKOPI parent="1     ALL TRAFIK" \
    priority=5/5 target=10.30.0.5/32
add limit-at=2M/2M max-limit=5M/5M name="07-AMAD IDAH" parent=\
    "1     ALL TRAFIK" target=10.30.0.7/32
add max-limit=7M/10M name=29-Darwinah parent="1     ALL TRAFIK" target=\
    10.30.0.13/32
add limit-at=2M/2M max-limit=5M/4M name=febi parent="1     ALL TRAFIK" \
    target=10.30.0.3/32
add limit-at=5M/5M max-limit=7M/7M name=OYAH parent="1     ALL TRAFIK" \
    target=10.30.0.18/32
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=lan interface=ether3-bridge-lan
add bridge=lan interface=ether4-bridge-lan
/ip neighbor discovery-settings
set discover-interface-list=!ISP
/interface detect-internet
set detect-interface-list=ISP internet-interface-list=ISP
/interface list member
add interface=ether1-ISP-1 list=ISP
add interface=ether2-ISP-2 list=ISP
/interface pppoe-server server
add default-profile=GarudaNET disabled=no interface=lan service-name=\
    GarudaNET
/ip address
add address=10.10.12.2/24 comment=isp interface=ether1-ISP-1 network=\
    10.10.12.0
add address=192.168.66.1/24 comment=ptp interface=lan network=192.168.66.0
add address=192.168.221.1/24 comment="hotspot gr2" interface=lan network=\
    192.168.221.0
add address=192.168.68.1/24 comment=ptp interface=lan network=192.168.68.0
add address=192.168.160.1/24 comment="hotspot GR3" interface=ether5-hotspot \
    network=192.168.160.0
add address=192.168.170.1/24 comment="VLAN GR3" interface=vlan1-HOTSPOT \
    network=192.168.170.0
add address=192.168.18.101/24 interface=ether2-ISP-2 network=192.168.18.0
add address=192.168.65.1/24 comment=ptp interface=lan network=192.168.65.0
/ip arp
add address=192.168.66.14 interface=lan
/ip dhcp-server network
add address=192.168.160.0/24 comment="hotspot network" dns-server=\
    192.168.160.1 gateway=192.168.160.1
add address=192.168.170.0/24 comment="hotspot network" dns-server=\
    192.168.170.1 gateway=192.168.170.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d6h servers=\
    10.10.12.1,192.168.18.1
/ip firewall address-list
add address=10.30.0.0/24 comment=rumahan list=ip-local
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.168.0.0/16 comment="global lokal 192" list=ip-local
add address=192.168.221.0/24 list=ip-ke-isp2
add address=192.168.170.0/24 list=ip-ke-isp2
add address=192.168.160.0/24 list=ip-ke-isp2
add address=192.168.180.0/24 list=ip-ke-isp2
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall mangle
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    !ip-local-private new-routing-mark=isp2 passthrough=no src-address-list=\
    ip-ke-isp2
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    !ip-local-private dst-port=5001-5180,5501-5680,9443,30000-30220,9001 \
    new-routing-mark=isp2 passthrough=no protocol=tcp src-address-list=\
    ip-local
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    !ip-local-private dst-port=5001-5180,5501-5680,9992,30020-30220,9001 \
    new-routing-mark=isp2 passthrough=no protocol=udp src-address-list=\
    ip-local
add action=jump chain=forward dst-address-list=!ip-local-private dst-port=\
    5001-5180,5501-5680,9443,30000-30220,9001 jump-target=game-ml protocol=\
    tcp src-address-list=ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=game-ml \
    protocol=tcp src-address-list=!ip-local-private src-port=\
    5001-5180,5501-5680,9443,30000-30220,9001
add action=jump chain=forward dst-address-list=!ip-local-private dst-port=\
    5001-5180,5501-5680,9992,30020-30220,9001 jump-target=game-ml protocol=\
    udp src-address-list=ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=game-ml \
    protocol=udp src-address-list=!ip-local-private src-port=\
    5001-5180,5501-5680,9992,30020-30220,9001
add action=mark-packet chain=game-ml new-packet-mark=game-ml passthrough=no
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    !ip-local-private dst-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007 \
    new-routing-mark=isp2 passthrough=no protocol=tcp src-address-list=\
    ip-local
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    !ip-local-private dst-port=6008,7008,8008,9008,10000-10009,11000-11019 \
    new-routing-mark=isp2 passthrough=no protocol=udp src-address-list=\
    ip-local
add action=jump chain=forward dst-address-list=!ip-local-private dst-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007 \
    jump-target=game-ff protocol=tcp src-address-list=ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=game-ff \
    protocol=tcp src-address-list=!ip-local-private src-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007
add action=jump chain=forward dst-address-list=!ip-local-private dst-port=\
    6008,7008,8008,9008,10000-10009,11000-11019 jump-target=game-ff protocol=\
    udp src-address-list=ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=game-ff \
    protocol=udp src-address-list=!ip-local-private src-port=\
    6008,7008,8008,9008,10000-10009,11000-11019
add action=mark-packet chain=game-ff new-packet-mark=game-ff passthrough=no
add action=jump chain=prerouting comment=\
    "                BYPASS bbrp koneksi" dst-address-list=ip-local-private \
    jump-target=lokal src-address-list=ip-local-private
add action=jump chain=input dst-address-list=ip-local-private jump-target=\
    lokal src-address-list=ip-local-private
add action=jump chain=forward dst-address-list=ip-local-private jump-target=\
    lokal src-address-list=ip-local-private
add action=jump chain=output dst-address-list=ip-local-private jump-target=\
    lokal src-address-list=ip-local-private
add action=jump chain=postrouting dst-address-list=ip-local-private \
    jump-target=lokal src-address-list=ip-local-private
add action=mark-packet chain=lokal new-packet-mark=lokal passthrough=no
add action=jump chain=prerouting jump-target=vip protocol=icmp
add action=jump chain=input jump-target=vip protocol=icmp
add action=jump chain=forward jump-target=vip protocol=icmp
add action=jump chain=output jump-target=vip protocol=icmp
add action=jump chain=postrouting jump-target=vip protocol=icmp
add action=jump chain=prerouting dst-port=53,5353,853 jump-target=vip \
    protocol=udp src-address-list=ip-local
add action=jump chain=prerouting dst-port=53,5353,853 jump-target=vip \
    protocol=tcp src-address-list=ip-local
add action=mark-packet chain=vip new-packet-mark=vip passthrough=no
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=dst-nat chain=dstnat comment="VPN > MIKROTIK R2 > MIKHMON PORT" \
    dst-port=8728 protocol=tcp src-address=10.123.223.1 to-addresses=\
    192.168.221.2 to-ports=8728
add action=masquerade chain=srcnat comment="PTP internet" src-address=\
    192.168.66.0/24
add action=masquerade chain=srcnat comment="PTP internet" src-address=\
    192.168.68.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.160.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.170.0/24
add action=masquerade chain=srcnat
/ip hotspot user
add name=admin password=123
/ip hotspot user profile
add address-list="" insert-queue-before=*1E mac-cookie-timeout=1d name=3jam \
    parent-queue=*1E rate-limit=1M/1500k session-timeout=3h \
    status-autorefresh=5s
add address-list="" insert-queue-before=*1E mac-cookie-timeout=1d name=6jam \
    parent-queue=*1E rate-limit=1M/1500k session-timeout=3h \
    status-autorefresh=5s
add address-list="" insert-queue-before=*1E mac-cookie-timeout=1d name=\
    "1 HARI" parent-queue=*1E rate-limit=1M/1500k session-timeout=3h \
    status-autorefresh=5s
/ip route
add comment=isp2 distance=1 gateway=192.168.18.1 routing-mark=isp2
add comment=isp1 distance=1 gateway=10.10.12.1 routing-mark=isp1
add comment=isp1 distance=1 gateway=10.10.12.1
add comment=isp2 distance=2 gateway=192.168.18.1
add comment="cek isp1" distance=1 dst-address=1.1.1.2/32 gateway=10.10.12.1
add comment="cek isp2" distance=1 dst-address=149.112.112.112/32 gateway=\
    192.168.18.1
add comment="cek routing manual 2" distance=1 dst-address=149.154.167.220/32 \
    gateway=192.168.18.1
add comment="cek routing manual 1" disabled=yes distance=1 dst-address=\
    149.154.167.220/32 gateway=10.10.12.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
set api-ssl disabled=yes
/ppp secret
add name=02sandi@gnet.com password=02sandi@gnet.com profile=GarudaNET \
    remote-address=10.30.0.2 service=pppoe
add name=03darsono@gnet.com password=03darsono@gnet.com profile=GarudaNET \
    remote-address=10.30.0.3 service=pppoe
add name=04sdpesarean01@gnet.com password=04sdpesarean01@gnet.com profile=\
    GarudaNET remote-address=10.30.0.4 service=pppoe
add name=05abrar@gnet.com password=05abrar@gnet.com profile=GarudaNET \
    remote-address=10.30.0.5 service=pppoe
add name=06febi@gnet.com password=06febi@gnet.com profile=GarudaNET \
    remote-address=10.30.0.6 service=pppoe
add name=07amad@gnet.com password=07amad@gnet.com profile=GarudaNET \
    remote-address=10.30.0.7 service=pppoe
add name=08wariah@gnet.com password=08wariah@gnet.com profile=GarudaNET \
    remote-address=10.30.0.8 service=pppoe
add name=09herman@gnet.com password=09herman@gnet.com profile=GarudaNET \
    remote-address=10.30.0.9 service=pppoe
add name=10puad@gnet.com password=10puad@gnet.com profile=GarudaNET \
    remote-address=10.30.0.10 service=pppoe
add name=11husni@gnet.com password=11husni@gnet.com profile=GarudaNET \
    remote-address=10.30.0.11 service=pppoe
add name=12paiz@gnet.com password=12paiz@gnet.com profile=GarudaNET \
    remote-address=10.30.0.12 service=pppoe
add name=13darwinah@gnet.com password=13darwinah@gnet.com profile=GarudaNET \
    remote-address=10.30.0.13 service=pppoe
add name=14eki@gnet.com password=14eki@gnet.com profile=GarudaNET \
    remote-address=10.30.0.14 service=pppoe
add name=15agus@gnet.com password=15agus@gnet.com profile=GarudaNET \
    remote-address=10.30.0.15 service=pppoe
add name=16adi@gnet.com password=16adi@gnet.com profile=GarudaNET \
    remote-address=10.30.0.16 service=pppoe
add name=17agusmuzayin@gnet.com password=17agusmuzayin@gnet.com profile=\
    GarudaNET remote-address=10.30.0.17 service=pppoe
add name=19fajar@gnet.com password=19fajar@gnet.com profile=GarudaNET \
    remote-address=10.30.0.19 service=pppoe
add name=20sepul@gnet.com password=20sepul@gnet.com profile=GarudaNET \
    remote-address=10.30.0.20 service=pppoe
add name=21jaroah@gnet.com password=21jaroah@gnet.com profile=GarudaNET \
    remote-address=10.30.0.21 service=pppoe
add name=22rizky@gnet.com password=22rizky@gnet.com profile=GarudaNET \
    remote-address=10.30.0.22 service=pppoe
add name=23amad@mnet.com password=23amad@mnet.com profile=GarudaNET \
    remote-address=10.30.0.23 service=pppoe
add name=24ozzi@gnet.com password=24ozzi@gnet.com profile=GarudaNET \
    remote-address=10.30.0.24 service=pppoe
add name=25endah@gnet.com password=25endah@gnet.com profile=GarudaNET \
    remote-address=10.30.0.25 service=pppoe
add name=26riyanto@gnet.com password=26riyanto@gnet.com profile=GarudaNET \
    remote-address=10.30.0.26 service=pppoe
add name=27sdpesarean02@gnet.com password=27sdpesarean02@gnet.com profile=\
    GarudaNET remote-address=10.30.0.27 service=pppoe
add name=18oyah@gnet.com password=18oyah@gnet.com profile=GarudaNET \
    remote-address=10.30.0.18 service=pppoe
add name=29yunus@gnet.com password=29yunus@gnet.com profile=GarudaNET \
    remote-address=10.30.0.27 service=pppoe
add name=30jelan@gnet.com password=30jelan@gnet.com profile=GarudaNET \
    remote-address=10.30.0.30 service=pppoe
/snmp
set enabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system gps
set set-system-time=yes
/system identity
set name=G-001-GarudaNET
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add comment="rreboot outo setiap hari" disabled=yes interval=1d name=\
    "auto reboot" on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/19/2022 start-time=03:00:00
add interval=1d name=#wajib on-event="/system script run ##pemakaian-bw\r\
    \n\r\
    \n/system script run ####cek-kabel\r\
    \n\r\
    \n/system script run #####backup-router-email&ftp\r\
    \n\r\
    \n/system script run ##clear-dns&log" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=04:23:00
/system script
add dont-require-permissions=no name=#ether1 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\";\r\
    \n:local chatID \"-1001939617038\";\r\
    \n:local namaINT \"ether1-ISP-1\";\r\
    \n:local upscript \"~total-\$namaINT-DOWN\";\r\
    \n:local dlscript \"~total-\$namaINT-UP\";\r\
    \n:local tx [/interface get value-name=\"tx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local rx [/interface get value-name=\"rx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local txMB (\$tx / 1024 / 1024 / 1024);\r\
    \n:local rxMB (\$rx / 1024 / 1024 / 1024);\r\
    \n:if ([:len [/system script find name=\"\$upscript\"]] = 0) do={\r\
    \n/system script add name=\$upscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n:if ([:len [/system script find name=\"\$dlscript\"]] = 0) do={\r\
    \n/system script add name=\$dlscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n/system script set [find name=\$upscript] source=\"\$txMB\"\r\
    \n/system script set [find name=\$dlscript] source=\"\$rxMB\"\r\
    \n:delay 1s;\r\
    \n:local totalUP [/system script get [find name=\$upscript] source];\r\
    \n:local totalDOWN [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;"
add dont-require-permissions=no name=#ether2 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\";\r\
    \n:local chatID \"-1001939617038\";\r\
    \n:local namaINT \"ether2-ISP-2\";\r\
    \n:local upscript \"~total-\$namaINT-DOWN\";\r\
    \n:local dlscript \"~total-\$namaINT-UP\";\r\
    \n:local tx [/interface get value-name=\"tx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local rx [/interface get value-name=\"rx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local txMB (\$tx / 1024 / 1024 / 1024);\r\
    \n:local rxMB (\$rx / 1024 / 1024 / 1024);\r\
    \n:if ([:len [/system script find name=\"\$upscript\"]] = 0) do={\r\
    \n/system script add name=\$upscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n:if ([:len [/system script find name=\"\$dlscript\"]] = 0) do={\r\
    \n/system script add name=\$dlscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n/system script set [find name=\$upscript] source=\"\$txMB\"\r\
    \n/system script set [find name=\$dlscript] source=\"\$rxMB\"\r\
    \n:delay 1s;\r\
    \n:local totalUP [/system script get [find name=\$upscript] source];\r\
    \n:local totalDOWN [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;"
add dont-require-permissions=no name=~total-ether1-ISP-1-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=16
add dont-require-permissions=no name=~total-ether2-ISP-2-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=3
add dont-require-permissions=no name=~total-ether2-ISP-2-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=45
add dont-require-permissions=no name=~total-ether1-ISP-1-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=248
add dont-require-permissions=no name=##pemakaian-bw owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system script run #ether1\r\
    \n:delay 500ms;\r\
    \n/system script run #ether2\r\
    \n:delay 500ms;\r\
    \n/system script run #lan\r\
    \n\r\
    \n:delay 5s;\r\
    \n/interface reset-counters ether1-ISP-1\r\
    \n/interface reset-counters ether2-ISP-2\r\
    \n/interface reset-counters lan\r\
    \n/queue simple reset-counters-all\r\
    \n/queue tree reset-counters-all"
add dont-require-permissions=no name=#lan owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\";\r\
    \n:local chatID \"-1001939617038\";\r\
    \n:local namaINT \"lan\";\r\
    \n:local upscript \"~total-\$namaINT-DOWN\";\r\
    \n:local dlscript \"~total-\$namaINT-UP\";\r\
    \n:local tx [/interface get value-name=\"tx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local rx [/interface get value-name=\"rx-byte\" [find name=\"\$namaINT\
    \"]];\r\
    \n:local txMB (\$tx / 1024 / 1024 / 1024);\r\
    \n:local rxMB (\$rx / 1024 / 1024 / 1024);\r\
    \n:if ([:len [/system script find name=\"\$upscript\"]] = 0) do={\r\
    \n/system script add name=\$upscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n:if ([:len [/system script find name=\"\$dlscript\"]] = 0) do={\r\
    \n/system script add name=\$dlscript\r\
    \n:delay 1s;\r\
    \n}\r\
    \n/system script set [find name=\$upscript] source=\"\$txMB\"\r\
    \n/system script set [find name=\$dlscript] source=\"\$rxMB\"\r\
    \n:delay 1s;\r\
    \n:local totalUP [/system script get [find name=\$upscript] source];\r\
    \n:local totalDOWN [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;"
add dont-require-permissions=no name=~total-lan-DOWN owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    249
add dont-require-permissions=no name=~total-lan-UP owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    20
add dont-require-permissions=no name=####cek-kabel owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local server ([/system identity get name])\r\
    \n:local botid \"6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA\"\r\
    \n:local chatid \"-1001939617038\";\r\
    \n\r\
    \n/interface ethernet monitor [find] once do={\r\
    \n\r\
    \n:if (\$\"rate\" = \"10Mbps\") do={\r\
    \n/tool fetch \"https://api.telegram.org/bot\$botid/sendmessage\?chat_id=\
    \$chatid&text=\$server%0APort \$name Rate is \$rate\" keep-result=no;};\r\
    \n}"
add dont-require-permissions=yes name=#####backup-router-email&ftp owner=\
    mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local ftphost \"vpn.mnet.my.id\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/backup-client/muksin-jatibarang/\"\r\
    \n\r\
    \n:local identity [/system identity get name]\r\
    \n:local mnet1 \"\$identity.backup\"\r\
    \n:local mnet2 \"\$identity.rsc\"\r\
    \n\r\
    \n/system backup save name=\$mnet1\r\
    \n/export compact file=\$mnet2\r\
    \n\r\
    \n:delay 10s;\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet1 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/\$mnet1\" upload=ye\
    s\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet2 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/\$mnet2\" upload=ye\
    s"
add dont-require-permissions=no name=##clear-dns&log owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip dns cache flush\r\
    \n/system logging action set memory memory-lines=1\r\
    \n/system logging action set memory memory-lines=1000\r\
    \n/queue simple remove [ find name ~\"hs-<\" ]"
/tool netwatch
add comment="002 OMNITIK" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9D\\8C = OMNITIK PUSAT\" keep-result=no;\r\
    \n}" host=192.168.66.2 interval=5s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessa\
    ge\\\?chat_id=-1001880353671&text=\\E2\\9C\\85 = OMNITIK PUSAT\" keep-resu\
    lt=no;\r\
    \n}"
add comment="003 FEBI" down-script="/tool fetch url=\"https://api.telegram.org\
    /bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=\
    -1001880353671&text=\\E2\\9D\\8C = FEBI\" keep-result=no;\r\
    \n}" host=192.168.66.3 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = FEBI\" keep-result=no;\r\
    \n}"
add comment="007 SD PESAREAN 1" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\
    \?chat_id=-1001880353671&text=\\E2\\9D\\8C = SD PESAREAN 1\" keep-result=n\
    o;\r\
    \n}" host=192.168.66.4 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = SD PESAREAN 1\" keep-result=no;\r\
    \n}"
add comment="005 FOTOKOPI ABROR" down-script="/tool fetch url=\"https://api.te\
    legram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\
    \?chat_id=-1001880353671&text=\\E2\\9D\\8C = FOTOKOPI ABROR\" keep-result=\
    no;\r\
    \n}" host=192.168.66.5 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = FOTOKOPI ABROR\" keep-result=no;\r\
    \n}"
add comment="008 PUAD" down-script="/tool fetch url=\"https://api.telegram.org\
    /bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=\
    -1001880353671&text=\\E2\\9D\\8C = PUAD\" keep-result=no;\r\
    \n}" host=192.168.66.8 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = PUAD\" keep-result=no;\r\
    \n}"
add comment="009 HUSNI" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id\
    =-1001880353671&text=\\E2\\9D\\8C = HUSNI\" keep-result=no;\r\
    \n}" host=192.168.68.3 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = HUSNI\" keep-result=no;\r\
    \n}"
add comment="010 AGUS" down-script="/tool fetch url=\"https://api.telegram.org\
    /bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=\
    -1001880353671&text=\\E2\\9D\\8C = AGUS\" keep-result=no;\r\
    \n}" host=192.168.68.7 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = AGUS\" keep-result=no;\r\
    \n}"
add comment="013 ADI" down-script="/tool fetch url=\"https://api.telegram.org/\
    bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-\
    1001880353671&text=\\E2\\9D\\8C = ADI\" keep-result=no;\r\
    \n}" host=192.168.66.13 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = ADI\" keep-result=no;\r\
    \n}"
add comment="011 PAIZ" down-script="/tool fetch url=\"https://api.telegram.org\
    /bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=\
    -1001880353671&text=\\E2\\9D\\8C = PAIZ\" keep-result=no;\r\
    \n}" host=192.168.66.10 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = PAIZ\" keep-result=no;\r\
    \n}"
add comment="   ISP 2" down-script="/ip route disable [find comment=\"isp2\"]\
    \r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]\r\
    \n/ip route rule disable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp2\"]\r\
    \n/ip route disable [find comment=\"iiisp2\"]\r\
    \n/ip route disable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \nlog error (\"isp2 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot6100161454:AAG0zi0jeagXPbR\
    9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-1001939617038&text=\\E2\\9D\\\
    8C = ISP 2\" keep-result=no;\r\
    \n}" host=149.112.112.112 interval=5s timeout=2s up-script="/ip route enab\
    le [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]\r\
    \n/ip route rule enable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp2\"]\r\
    \n/ip route enable [find comment=\"iiisp2\"]\r\
    \n/ip route enable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \nlog warning (\"isp2 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot6100161454:AAG0zi0jeagXPbR\
    9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-1001939617038&text=\\E2\\9C\\\
    85 = ISP 2\" keep-result=no;\r\
    \n}"
add comment="   ISP 1" down-script="/ip route disable [find comment=\"isp1\"]\
    \r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]\r\
    \n/ip route rule disable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp1\"]\r\
    \n/ip route disable [find comment=\"iiisp1\"]\r\
    \n/ip route disable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \nlog error (\"isp1 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot6100161454:AAG0zi0jeagXPbR\
    9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-1001939617038&text=\\E2\\9D\\\
    8C = ISP 1\" keep-result=no;\r\
    \n}" host=1.1.1.2 timeout=2s up-script="/ip route enable [find comment=\"i\
    sp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]\r\
    \n/ip route rule enable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp1\"]\r\
    \n/ip route enable [find comment=\"iiisp1\"]\r\
    \n/ip route enable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \nlog warning (\"isp1 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot6100161454:AAG0zi0jeagXPbR\
    9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-1001939617038&text=\\E2\\9C\\\
    85 = ISP 1\" keep-result=no;\r\
    \n}"
add comment="001 LHG PENERIMA TEGAL" down-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessa\
    ge\\\?chat_id=-1001880353671&text=\\E2\\9D\\8C = LHG PENERIMA TEGAL\" keep\
    -result=no;\r\
    \n}" host=192.168.55.20 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessa\
    ge\\\?chat_id=-1001880353671&text=\\E2\\9C\\85 = LHG PENERIMA TEGAL\" keep\
    -result=no;\r\
    \n}"
add comment="004 SECTORAL" down-script="/tool fetch url=\"https://api.telegram\
    .org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat\
    _id=-1001880353671&text=\\E2\\9D\\8C = SECTORAL\" keep-result=no;\r\
    \n}" host=192.168.68.2 interval=5s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessa\
    ge\\\?chat_id=-1001880353671&text=\\E2\\9C\\85 = SECTORAL\" keep-result=no\
    ;\r\
    \n}"
add comment="012 ULFIYAH" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9D\\8C = ULFIYAH\" keep-result=no;\r\
    \n}" host=192.168.68.4 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = ULFIYAH\" keep-result=no;\r\
    \n}"
add comment="015 RIYANTO" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9D\\8C = RIYANTO\" keep-result=no;\r\
    \n}" host=192.168.66.19 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = RIYANTO\" keep-result=no;\r\
    \n}"
add comment="016 RIZKI" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id\
    =-1001880353671&text=\\E2\\9D\\8C = RIZKI\" keep-result=no;\r\
    \n}" host=192.168.66.18 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = RIZKI\" keep-result=no;\r\
    \n}"
add comment="017 OZI" down-script="/tool fetch url=\"https://api.telegram.org/\
    bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=-\
    1001880353671&text=\\E2\\9D\\8C = OZI\" keep-result=no;\r\
    \n}" host=192.168.68.16 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = OZI\" keep-result=no;\r\
    \n}"
add comment="018 AGUS UMAROH" down-script="/tool fetch url=\"https://api.teleg\
    ram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?c\
    hat_id=-1001880353671&text=\\E2\\9D\\8C = AGUS UMAROH\" keep-result=no;\r\
    \n}" host=192.168.68.7 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = AGUS UMAROH\" keep-result=no;\r\
    \n}"
add comment="019 FITRI SEPUL" down-script="/tool fetch url=\"https://api.teleg\
    ram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?c\
    hat_id=-1001880353671&text=\\E2\\9D\\8C = FITRI SEPUL\" keep-result=no;\r\
    \n}" host=192.168.66.17 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = FITRI SEPUL\" keep-result=no;\r\
    \n}"
add comment="020 DARWINAH" down-script="/tool fetch url=\"https://api.telegram\
    .org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat\
    _id=-1001880353671&text=\\E2\\9D\\8C = DARWINAH\" keep-result=no;\r\
    \n}" host=192.168.68.8 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = DARWINAH\" keep-result=no;\r\
    \n}"
add comment="022 ENDAH PUSAT" down-script="/tool fetch url=\"https://api.teleg\
    ram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?c\
    hat_id=-1001880353671&text=\\E2\\9D\\8C = ENDAH PUSAT\" keep-result=no;\r\
    \n}" host=192.168.65.2 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = ENDAH PUSAT\" keep-result=no;\r\
    \n}"
add comment="021 ENDAH CLIENT" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?\
    chat_id=-1001880353671&text=\\E2\\9D\\8C = ENDAH CLIENT\" keep-result=no;\
    \r\
    \n}" host=192.168.65.3 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = ENDAH CLIENT\" keep-result=no;\r\
    \n}"
add comment="023 SD PESAREAN 2" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\
    \?chat_id=-1001880353671&text=\\E2\\9D\\8C = SD PESAREAN 2\" keep-result=n\
    o;\r\
    \n}" host=192.168.66.7 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = SD PESAREAN 2\" keep-result=no;\r\
    \n}"
add comment="006 OYAH" down-script="/tool fetch url=\"https://api.telegram.org\
    /bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_id=\
    -1001880353671&text=\\E2\\9D\\8C = OYAH\" keep-result=no;\r\
    \n}" host=192.168.66.6 up-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_i\
    d=-1001880353671&text=\\E2\\9C\\85 = OYAH\" keep-result=no;\r\
    \n}"
add comment="01agus muzayin" down-script="/tool fetch url=\"https://api.telegr\
    am.org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?ch\
    at_id=-1001880353671&text=\\E2\\9D\\8C = Agus muzayin\" keep-result=no;\r\
    \n}" host=192.168.66.14 up-script="/tool fetch url=\"https://api.telegram.\
    org/bot6100161454:AAG0zi0jeagXPbR9xTy9soSU3fa9Mbqy9rA/sendmessage\\\?chat_\
    id=-1001880353671&text=\\E2\\9C\\85 = Agus muzayin\" keep-result=no;\r\
    \n}"
/tool romon
set enabled=yes secrets=322
/tool user-manager database
set db-path=flash/user-manager
