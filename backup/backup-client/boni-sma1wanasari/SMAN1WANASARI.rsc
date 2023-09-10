# sep/02/2023 00:00:00 by RouterOS 6.48.4
# software id = WIU9-32SU
#
# model = RB1100x4
# serial number = D8580CCD0A21
/interface bridge
add name=bridge-13-langsungan
add comment="ADA LOGIN INTERFACE 2-5" name=bridge1
add comment="DHCP LANGSUNG KONEK 6-9 DAN 11-13" name=bridge2
add name=bridge3-Biznet
/interface ethernet
set [ find default-name=ether10 ] comment="UNTUK SERVER"
/interface ethernet switch port
set 0 default-vlan-id=0
set 1 default-vlan-id=0
set 2 default-vlan-id=0
set 3 default-vlan-id=0
set 4 default-vlan-id=0
set 5 default-vlan-id=0
set 6 default-vlan-id=0
set 7 default-vlan-id=0
set 8 default-vlan-id=0
set 9 default-vlan-id=0
set 10 default-vlan-id=0
set 11 default-vlan-id=0
set 12 default-vlan-id=0
set 13 default-vlan-id=0
set 14 default-vlan-id=0
set 15 default-vlan-id=0
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] dns-name=sman1wanasari.net html-directory=\
    sman1wanasari login-by=cookie,http-chap,https,http-pap
add dns-name=sman1wanasari.net hotspot-address=192.168.20.1 html-directory=\
    sman1wanasari login-by=cookie,http-chap,https,http-pap name=hsprof1
/ip hotspot user profile
add name=administrasi rate-limit=20M/20M shared-users=2
/ip pool
add name=dhcp_pool0 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool1 ranges=192.168.100.2-192.168.100.254
add name=hs-pool-14 ranges=192.168.20.2-192.168.23.254
add name=dhcp_pool3 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool4 ranges=192.168.45.2-192.168.45.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge2 lease-script="/queue\
    \_simple remove [ find name ~\"hs-<\" ]\r\
    \n\r\
    \n:local queueName \"bridge2_\$leaseActMAC\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=7000k/7000k burst-limit=11000k/11000k burst-thre\
    shold=7000k/7000k burst-time=7/7 parent=\"bridge2\" place-before=\"bridge2\
    \";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}" name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=ether10 lease-script="/queue\
    \_simple remove [ find name ~\"hs-<\" ]\r\
    \n\r\
    \n:local queueName \"ether10_\$leaseActMAC\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=7000k/7000k burst-limit=11000k/11000k burst-thre\
    shold=7000k/7000k burst-time=7/7 parent=\"ether10\" place-before=\"ether10\
    \";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}" name=dhcp2
add address-pool=hs-pool-14 disabled=no interface=bridge1 lease-script=\
    "/queue simple remove [ find name ~\"hs-<\" ]" lease-time=1h name=dhcp3
add address-pool=dhcp_pool4 disabled=no interface=bridge-13-langsungan \
    lease-script=":local queueName \"bridge13_\$leaseActMAC\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=7000k/7000k burst-limit=11000k/11000k burst-thre\
    shold=7000k/7000k burst-time=7/7 parent=\"bridge13\" place-before=\"bridge\
    13\";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}" name=dhcp4
/ip hotspot
add address-pool=hs-pool-14 addresses-per-mac=unlimited disabled=no \
    interface=bridge1 name=hotspot1 profile=hsprof1
/queue simple
add max-limit=50M/50M name="~~~GLOBAL TRAFIK" target=192.168.0.0/16
/ip hotspot user profile
set [ find default=yes ] insert-queue-before="~~~GLOBAL TRAFIK" parent-queue=\
    "~~~GLOBAL TRAFIK" rate-limit="20M/20M 0/0 0/0 0/0 8 5M/5M" shared-users=\
    2
add insert-queue-before="~~~GLOBAL TRAFIK" name=guru parent-queue=\
    "~~~GLOBAL TRAFIK" rate-limit="20M/20M 0/0 0/0 0/0 8 5M/5M" shared-users=\
    2
add insert-queue-before="~~~GLOBAL TRAFIK" name=siswa parent-queue=\
    "~~~GLOBAL TRAFIK" rate-limit="5M/5M 0/0 0/0 0/0 8 5M/5M" shared-users=50
/queue simple
add disabled=yes max-limit=30M/30M name=bridge2 parent="~~~GLOBAL TRAFIK" \
    queue=pcq-upload-default/pcq-download-default target=192.168.2.0/24
add disabled=yes max-limit=25M/25M name=bridge13 parent="~~~GLOBAL TRAFIK" \
    queue=pcq-upload-default/pcq-download-default target=192.168.45.0/24
add disabled=yes max-limit=25M/25M name=ether10 parent="~~~GLOBAL TRAFIK" \
    queue=pcq-upload-default/pcq-download-default target=192.168.100.0/24
add burst-limit=11M/11M burst-threshold=7M/7M burst-time=7s/7s limit-at=1M/1M \
    max-limit=7M/7M name=bridge2_74:AC:B9:66:44:BB parent=bridge2 target=\
    192.168.2.86/32
add burst-limit=11M/11M burst-threshold=7M/7M burst-time=7s/7s limit-at=1M/1M \
    max-limit=7M/7M name=bridge2_74:AC:B9:66:46:15 parent=bridge2 target=\
    192.168.2.32/32
add burst-limit=11M/11M burst-threshold=7M/7M burst-time=7s/7s limit-at=1M/1M \
    max-limit=7M/7M name=bridge2_B0:95:75:C8:05:8E parent=bridge2 target=\
    192.168.2.131/32
add burst-limit=11M/11M burst-threshold=7M/7M burst-time=7s/7s limit-at=1M/1M \
    max-limit=7M/7M name=bridge2_98:DA:C4:32:9A:19 parent=bridge2 target=\
    192.168.2.210/32
add burst-limit=11M/11M burst-threshold=7M/7M burst-time=7s/7s limit-at=1M/1M \
    max-limit=7M/7M name=bridge2_1C:77:F6:E4:FA:9F parent=bridge2 target=\
    192.168.2.120/32
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=ether5
add bridge=bridge2 interface=ether6
add bridge=bridge2 interface=ether7
add bridge=bridge2 interface=ether8
add bridge=bridge3-Biznet interface=ether11
add bridge=bridge3-Biznet interface=ether12
add bridge=bridge2 interface=ether9
add bridge=bridge3-Biznet interface=ether1
add bridge=bridge-13-langsungan interface=ether13
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip address
add address=36.91.77.177/8 disabled=yes interface=ether1 network=36.0.0.0
add address=192.168.20.1/22 comment=hotspot interface=bridge1 network=\
    192.168.20.0
add address=192.168.2.1/24 interface=bridge2 network=192.168.2.0
add address=192.168.100.1/24 interface=ether10 network=192.168.100.0
add address=192.168.1.1/24 disabled=yes interface=ether13 network=192.168.1.0
add address=182.253.106.178/29 interface=bridge3-Biznet network=\
    182.253.106.176
add address=192.168.45.1/24 interface=bridge-13-langsungan network=\
    192.168.45.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
add address=192.168.2.0/24 gateway=192.168.2.1
add address=192.168.20.0/22 comment="hotspot network" gateway=192.168.20.1
add address=192.168.45.0/24 gateway=192.168.45.1
add address=192.168.100.0/24 gateway=192.168.100.1
/ip dns
set allow-remote-requests=yes servers=\
    202.134.0.155,118.98.44.20,8.8.8.8,203.142.82.222,203.142.84.222
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.20.0/22
add action=dst-nat chain=dstnat comment=DAPODIK dst-address=182.253.106.178 \
    dst-port=5774 protocol=tcp to-addresses=192.168.100.254 to-ports=5774
add action=dst-nat chain=dstnat comment=ERAPORT dst-address=182.253.106.178 \
    dst-port=5739 protocol=tcp to-addresses=192.168.100.254 to-ports=5739
add action=dst-nat chain=dstnat comment="REMOTE DESKTOP" dst-address=\
    182.253.106.178 dst-port=3389 protocol=tcp to-addresses=192.168.2.100 \
    to-ports=3389
add action=dst-nat chain=dstnat disabled=yes dst-address=182.253.106.178 \
    dst-port=8000 in-interface=bridge3-Biznet protocol=tcp to-addresses=\
    192.168.1.20 to-ports=80
add action=dst-nat chain=dstnat disabled=yes dst-address=182.253.106.178 \
    dst-port=8080 in-interface=bridge3-Biznet protocol=tcp to-addresses=\
    192.168.1.21 to-ports=80
add action=dst-nat chain=dstnat dst-address=182.253.106.178 dst-port=2023 \
    protocol=tcp to-addresses=192.168.100.254 to-ports=2023
/ip hotspot ip-binding
add comment=gepeng mac-address=A2:CA:04:D2:6C:BC type=bypassed
add comment=iimamhk mac-address=7C:03:AB:1A:99:03 type=bypassed
add mac-address=82:CB:C3:8D:C9:CF type=bypassed
/ip hotspot user
add disabled=yes name=admin
add name=ha password=ha profile=guru
add name=Gepeng password=Gepeng
add name=iimamhk password=iimamhk
add name=ks.hardi password=ks.hardi profile=guru
add name=siswa password=siswa profile=siswa
add name=boni password=boni
add name=gr.st password=gr.st profile=guru
add name=gr.br password=gr.br profile=guru
add name=gr.ga password=gr.ga profile=guru
add name=gr.ks password=gr.ks profile=guru
add name=gr.wh password=gr.wh profile=guru
add name=gr.sh password=gr.sh profile=guru
add name=gr.sb password=gr.sb profile=guru
add name=gr.ds password=gr.ds profile=guru
add name=gr.rj password=gr.rj profile=guru
add name=gr.ls password=gr.ls profile=guru
add name=gr.bn password=gr.bn
add name=gr.ry password=gr.ry profile=guru
add name=gr.me password=gr.me profile=guru
add name=gr.rr password=gr.rr profile=guru
add name=gr.tb password=gr.tb profile=guru
add name=gr.um password=gr.um profile=guru
add name=gr.nh password=gr.nh profile=guru
add name=gr.ra password=gr.ra profile=guru
add name=gr.el password=gr.el profile=guru
add name=gr.rw password=gr.rw profile=guru
add name=gr.as password=gr.as profile=guru
add name=gr.lf password=gr.lf profile=guru
add name=gr.nf password=gr.nf profile=guru
add name=gr.yt password=gr.yt profile=guru
add name=gr.iw password=gr.iw profile=guru
add name=gr.pn password=gr.pn profile=guru
add name=gr.kp password=gr.kp profile=guru
add name=gr.ft password=gr.ft profile=guru
add name=gr.wr password=gr.wr profile=guru
add name=gr.er password=gr.er profile=guru
add name=gr.ib password=gr.ib profile=guru
add name=gr.fr password=gr.fr profile=guru
add name=gr.mr password=gr.mr profile=guru
add name=gr.ma password=gr.ma profile=guru
add name=gr.ti password=gr.ti profile=guru
add name=gr.if password=gr.if profile=guru
add name=gr.uz password=gr.uz profile=guru
add name=gr.em password=gr.em profile=guru
add name=gr.id password=gr.id profile=guru
add name=ad.eri password=ad.eri profile=administrasi
add name=ad.kiki password=ad.kiki profile=administrasi
add name=ad.hanto password=ad.hanto profile=administrasi
add name=ad.warnudi password=ad.warnudi profile=administrasi
add name=ad.gian password=ad.gian profile=administrasi
add name=ad.agus password=ad.agus profile=administrasi
add name=ad.karmen password=ad.karmen profile=administrasi
add name=ad.lulu password=ad.lulu profile=administrasi
add name=ad.kris password=ad.kris profile=administrasi
add name=ad.tarom password=ad.tarom profile=administrasi
add name=gr.fo password=gr.fo profile=guru
add name=cobawifidisit password=cobawifidisit profile=administrasi
add name="sri budi" password=Astuti2013 profile=guru
add name=gr.el76 password=gr.el76 profile=guru
/ip route
add distance=1 gateway=182.253.106.177
add distance=1 gateway=36.91.77.176
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=818
set ssh disabled=yes
set api disabled=yes
set winbox port=8290
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=SMAN1WANASARI
/system scheduler
add interval=12h name="##backup ke server mirza" on-event=\
    "/system script run ##backupkeservermirza" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2020 start-time=00:00:00
/system script
add dont-require-permissions=yes name=##backupkeservermirza owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local ftphost \"vpn.mnet.my.id\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/backup-client/boni-sma1wanasari/\"\r\
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
/tool romon
set enabled=yes
