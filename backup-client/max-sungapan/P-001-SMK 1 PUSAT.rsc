# jun/22/2023 00:00:00 by RouterOS 6.48.6
# software id = FFZN-PEUK
#
# model = RB750Gr3
# serial number = 8AFF0B3164C9
/interface bridge
add name=bridge-lan
/interface ethernet
set [ find default-name=ether1 ] name=ether1-IDPLAY
set [ find default-name=ether2 ] name=ether2-BIZ
set [ find default-name=ether3 ] disabled=yes name=ether3-IDPLAY
/interface pptp-client
add connect-to=103.133.222.110 name=VPN-MONITORING password=test2 user=test2
/interface sstp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id disabled=no keepalive-timeout=\
    10 name=MNET-VPN-SSTP password=awazadawewe123 user=maxtkjsmk
/interface ovpn-client
add certificate=mnet.crt_0 cipher=aes256 comment=MNET-VPN connect-to=\
    vpn.mnet.my.id disabled=yes mac-address=FE:0A:4B:9D:B0:30 name=\
    MNET-VPN-OVPN password=awazadawewe123 use-peer-dns=no user=maxtkjsmk
/interface list
add name=LAN
add comment=MNET-VPN name=MNET-VPN
add exclude=LAN name=ISP
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ppp profile
add dns-server=172.16.0.1 local-address=172.16.0.1 name=PPPOE only-one=yes
/interface l2tp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id ipsec-secret=vpn.mnet.my.id \
    keepalive-timeout=10 name=MNET-VPN-L2TP password=awazadawewe123 profile=\
    default use-ipsec=yes user=maxtkjsmk
/interface pptp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id keepalive-timeout=10 name=\
    MNET-VPN-PPTP password=awazadawewe123 profile=default user=maxtkjsmk
/queue type
add kind=pfifo name=queue2 pfifo-limit=9000
/queue simple
add disabled=yes max-limit=100M/50M name=queue1 queue=queue2/queue2 target=\
    172.16.0.2/32
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface bridge port
add bridge=bridge-lan interface=ether4
add bridge=bridge-lan interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add interface=ether1-IDPLAY list=ISP
add interface=ether2-BIZ list=ISP
add interface=bridge-lan list=LAN
add interface=ether3-IDPLAY list=ISP
add comment=MNET-VPN interface=MNET-VPN-SSTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-L2TP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-PPTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-OVPN list=MNET-VPN
/interface pppoe-server server
add disabled=no interface=bridge-lan one-session-per-host=yes service-name=\
    bebaswis
/ip address
add address=192.168.56.1/24 interface=bridge-lan network=192.168.56.0
/ip dhcp-client
add add-default-route=no disabled=no interface=ether1-IDPLAY use-peer-dns=no
add add-default-route=no disabled=no interface=ether2-BIZ
add add-default-route=no disabled=no interface=ether3-IDPLAY use-peer-dns=no
/ip dns
set allow-remote-requests=yes cache-max-ttl=3s cache-size=4048KiB servers=\
    10.10.10.1,192.168.45.1,192.168.46.1
/ip firewall nat
add action=dst-nat chain=dstnat comment=DNS-1-MANUAL disabled=yes dst-port=\
    53,5353,853 protocol=udp to-addresses=208.67.222.222 to-ports=5353
add action=dst-nat chain=dstnat comment=DNS-2-MANUAL disabled=yes dst-port=\
    53,5353,853 protocol=udp to-addresses=94.140.14.140 to-ports=5353
add action=dst-nat chain=dstnat comment=isp1 dst-port=53,5353,853 protocol=\
    udp to-addresses=192.168.45.1 to-ports=53
add action=dst-nat chain=dstnat comment=isp2 disabled=yes dst-port=\
    53,5353,853 protocol=udp to-addresses=10.10.10.1 to-ports=53
add action=dst-nat chain=dstnat comment=isp3 disabled=yes dst-port=\
    53,5353,853 protocol=udp to-addresses=192.168.46.1 to-ports=53
add action=dst-nat chain=dstnat comment="remote idplay 1" dst-port=8002 \
    protocol=tcp src-address=10.223.223.1 to-addresses=192.168.45.1 to-ports=\
    80
add action=dst-nat chain=dstnat comment="remote idplay 2" dst-port=8004 \
    protocol=tcp src-address=10.223.223.1 to-addresses=192.168.46.1 to-ports=\
    80
add action=dst-nat chain=dstnat comment="remote rb bale to vpn" dst-port=8912 \
    protocol=tcp src-address=10.223.223.1 to-addresses=172.16.0.2 to-ports=\
    8291
add action=masquerade chain=srcnat comment=INTERNET out-interface-list=ISP
add action=masquerade chain=srcnat comment=GLOBAL
add action=dst-nat chain=dstnat comment="DNS KE BIZNET" disabled=yes \
    dst-port=53,5353,853 protocol=udp to-addresses=10.18.18.18 to-ports=53
add action=dst-nat chain=dstnat comment=MNET-VPN dst-port=53,5353,853 \
    protocol=udp to-addresses=10.223.223.1 to-ports=53
add action=masquerade chain=srcnat comment=MNET-NAT-VPN out-interface-list=\
    MNET-VPN
/ip route
add distance=1 gateway=10.10.10.1 routing-mark=biz
add distance=1 gateway=192.168.45.1 routing-mark=idplay
add distance=1 gateway=192.168.46.1 routing-mark=idplay2
add comment=MNET-VPN distance=1 gateway=10.123.223.1 routing-mark=MNET
add comment=isp1 distance=1 gateway=192.168.45.1
add comment=isp2 distance=2 gateway=10.10.10.1
add comment=isp3 distance=3 gateway=192.168.46.1
add comment="isp99 last hope" distance=99 gateway=10.10.10.1
add comment="CEK ISP1" distance=1 dst-address=4.2.2.2/32 gateway=192.168.45.1
add comment="CEK ISP2" distance=1 dst-address=4.2.2.3/32 gateway=10.10.10.1
add comment="CEK ISP3" distance=1 dst-address=4.2.2.4/32 gateway=192.168.46.1
add comment=VPN3 distance=3 dst-address=43.229.254.178/32 gateway=\
    192.168.46.1
add comment=VPN2 distance=1 dst-address=103.143.170.11/32 gateway=10.10.10.1
add comment=VPN1 distance=2 dst-address=103.143.170.11/32 gateway=\
    192.168.45.1
add comment=main1 distance=99 dst-address=103.143.170.11/32 gateway=\
    10.10.10.1
/ppp secret
add name=001bale@mnet.com password=001bale@mnet.com profile=PPPOE \
    remote-address=172.16.0.2 service=pppoe
add name=test password=test profile=PPPOE remote-address=172.16.0.3 service=\
    pppoe
add name=smk password=smk profile=PPPOE remote-address=172.16.0.3 service=\
    pppoe
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name="P-001-SMK 1 PUSAT"
/system package update
set channel=long-term
/system scheduler
add interval=12h name="##backup ke server mirza" on-event=\
    "/system script run ##backupkeservermirza" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2020 start-time=00:00:00
add interval=1m name="~ping vpn mnet" on-event=\
    "/system script run MNET-VPN-CEK" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=yes name=##backupkeservermirza owner=admin \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local ftphost \"vpn.mnet.my.id\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/backup-client/max-sungapan/\"\r\
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
add dont-require-permissions=no name=MNET-VPN-CEK owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    if ([/ping address=10.123.223.1 count=3 ] = 0) do={\r\
    \n#log error (\"VPN ga konek\")\r\
    \n\t/interface set MNET-VPN-SSTP disabled=no\r\
    \n\tdelay 2s;\r\
    \n\t/interface set MNET-VPN-L2TP disabled=no\r\
    \n\tdelay 2s;\r\
    \n\t/interface set MNET-VPN-PPTP disabled=no\r\
    \n\tdelay 2s;\r\
    \n\t/interface set MNET-VPN-OVPN disabled=no\r\
    \n\tdelay 2s;\r\
    \n\t\r\
    \n\t:if ([/ping interface=\"MNET-VPN-SSTP\" address=10.123.223.1 count=5 ]\
    \_= 0) do={\r\
    \n\t/interface set MNET-VPN-SSTP disabled=yes\r\
    \n\t\t:if ([/ping interface=\"MNET-VPN-L2TP\" address=10.123.223.1 count=5\
    \_] = 0) do={\r\
    \n\t\t/interface set MNET-VPN-L2TP disabled=yes\r\
    \n\t\t\t:if ([/ping interface=\"MNET-VPN-PPTP\" address=10.123.223.1 count\
    =5 ] = 0) do={\r\
    \n\t\t\t/interface set MNET-VPN-PPTP disabled=yes\r\
    \n\t\t\t\t:if ([/ping interface=\"MNET-VPN-OVPN\" address=10.123.223.1 cou\
    nt=5 ] = 0) do={\r\
    \n\t\t\t\t\t/interface set MNET-VPN-OVPN disabled=yes\r\
    \n\t\t\t\t\t\tdelay 5s;\r\
    \n\t\t\t\t\t\t/system script run MNET-VPN-CEK\r\
    \n\t\t\t\t} else={\r\
    \n\t\t\t\t/interface set MNET-VPN-SSTP disabled=yes\r\
    \n\t\t\t\t/interface set MNET-VPN-L2TP disabled=yes\r\
    \n\t\t\t\t/interface set MNET-VPN-PPTP disabled=yes\r\
    \n\t\t\t\t};\r\
    \n\t\t\t} else={\r\
    \n\t\t\t/interface set MNET-VPN-SSTP disabled=yes\r\
    \n\t\t\t/interface set MNET-VPN-L2TP disabled=yes\r\
    \n\t\t\t/interface set MNET-VPN-OVPN disabled=yes\r\
    \n\t\t\t};\r\
    \n\t\t} else={\r\
    \n\t\t/interface set MNET-VPN-SSTP disabled=yes\r\
    \n\t\t/interface set MNET-VPN-PPTP disabled=yes\r\
    \n\t\t/interface set MNET-VPN-OVPN disabled=yes\r\
    \n\t\t};\r\
    \n\t} else={\r\
    \n\tlog warning (\"MNET-VPN-SSTP konek\")\r\
    \n\t/interface set MNET-VPN-L2TP disabled=yes\r\
    \n\t/interface set MNET-VPN-PPTP disabled=yes\r\
    \n\t/interface set MNET-VPN-OVPN disabled=yes\r\
    \n\t};\r\
    \n} else={\r\
    \n#log warning (\"VPN konek\")\r\
    \n};"
/tool graphing interface
add interface=ether1-IDPLAY
add interface=ether2-BIZ
add interface=ether3-IDPLAY
add interface=ether4
add interface=ether5
/tool graphing resource
add
/tool mac-server
set allowed-interface-list=LAN
/tool netwatch
add comment=" ISP1 ID CEK" down-script="/ip route disable [find comment=\"isp1\
    \"]\r\
    \n/ip route disable [find comment=\"VPN1\"]\r\
    \n" host=4.2.2.2 interval=5s up-script="/ip route enable [find comment=\"i\
    sp1\"]\r\
    \n/ip route enable [find comment=\"VPN1\"]\r\
    \n"
add comment=" ISP2 BIZ CEK" down-script="/ip route disable [find comment=\"isp\
    2\"]\r\
    \n/ip route disable [find comment=\"VPN2\"]" host=4.2.2.3 interval=10s \
    up-script="/ip route enable [find comment=\"isp2\"]\r\
    \n/ip route enable [find comment=\"VPN2\"]"
add comment="DNS 1" disabled=yes down-script=\
    "/ip firewall nat set disable=yes [find comment=DNS-1]" host=\
    208.67.222.222 interval=5s up-script=\
    "/ip firewall nat set disable=no [find comment=DNS-1]"
add comment=" ISP3 IDPLAY-2 CEK" down-script="/ip route disable [find comment=\
    \"isp3\"]\r\
    \n/ip route disable [find comment=\"VPN3\"]" host=4.2.2.4 interval=10s \
    up-script="/ip route enable [find comment=\"isp3\"]\r\
    \n/ip route enable [find comment=\"VPN3\"]"
add comment="DNS 2" disabled=yes down-script=\
    "/ip firewall nat set disable=yes [find comment=DNS-2]" host=\
    94.140.14.140 interval=5s up-script=\
    "/ip firewall nat set disable=no [find comment=DNS-2]"
add comment=MNET-VPN down-script="/ip firewall nat disable [find comment=\"MNE\
    T-VPN\"]\r\
    \n/ip firewall mangle disable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall raw disable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall filter disable [find comment=\"MNET-VPN\"]" host=\
    10.123.223.1 interval=5s up-script="/ip firewall nat enable [find comment=\
    \"MNET-VPN\"]\r\
    \n/ip firewall mangle enable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall raw enable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall filter enable [find comment=\"MNET-VPN\"]"
/tool romon
set enabled=yes
/tool user-manager database
set db-path=flash/user-manager
