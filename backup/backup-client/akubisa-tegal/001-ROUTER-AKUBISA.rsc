# sep/02/2023 00:00:00 by RouterOS 6.49.8
# software id = UPAY-PFAJ
#
# model = RB450Gx4
# serial number = HEE08WP5EPE
/interface bridge
add name=bridge-dosen
add name=bridge-mahasiswa
/interface ethernet
set [ find default-name=ether1 ] name=ether1-isp1
set [ find default-name=ether2 ] name=ether2-isp2
set [ find default-name=ether4 ] name=ether4-atas
set [ find default-name=ether5 ] name=ether5-kelas
/interface sstp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id keepalive-timeout=10 name=\
    MNET-VPN-SSTP password=akubisarouter23445 user=akubisarouter23
/interface ovpn-client
add certificate=mnet.crt_0 cipher=aes256 comment=MNET-VPN connect-to=\
    vpn.mnet.my.id disabled=yes mac-address=FE:81:30:6E:FD:83 name=\
    MNET-VPN-OVPN password=akubisarouter23445 use-peer-dns=no user=\
    akubisarouter23
/interface list
add name=ISP
add name=LAN
add comment=MNET-VPN name=MNET-VPN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.16.0.2-172.16.7.254
add name=dhcp_pool1 ranges=10.0.0.2-10.0.3.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge-mahasiswa \
    lease-script=":local queueName \"\$leaseActIP\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=10000k/10000k burst-limit=15000k/15000k burst-th\
    reshold=10000k/10000k burst-time=5/5 parent=\"mahasiswa\" place-before=\"m\
    ahasiswa\";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}\r\
    \n" name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=bridge-dosen lease-script=":\
    local queueName \"\$leaseActIP\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=14000k/14000k burst-limit=20000k/20000k burst-th\
    reshold=14000k/14000k burst-time=5/5 parent=\"dosen\" place-before=\"dosen\
    \";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}\r\
    \n" name=dhcp2
/interface l2tp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id disabled=no ipsec-secret=\
    vpn.mnet.my.id keepalive-timeout=10 name=MNET-VPN-L2TP password=\
    akubisarouter23445 profile=default user=akubisarouter23
/interface pptp-client
add comment=MNET-VPN connect-to=vpn.mnet.my.id keepalive-timeout=10 name=\
    MNET-VPN-PPTP password=akubisarouter23445 profile=default user=\
    akubisarouter23
/queue simple
add max-limit=1G/1G name="---------- VIP" packet-marks=lokal,vip priority=1/1 \
    target=10.0.0.0/8,172.16.0.0/12
add max-limit=1G/1G name="------ALL TRAFIK" target=10.0.0.0/8,172.16.0.0/12
add max-limit=1G/1G name=mahasiswa parent="------ALL TRAFIK" target=\
    172.16.0.0/21
add max-limit=1G/1G name=dosen parent="------ALL TRAFIK" priority=6/6 target=\
    10.0.0.0/22
add burst-limit=15M/15M burst-threshold=10M/10M burst-time=5s/5s limit-at=\
    1M/1M max-limit=10M/10M name=172.16.7.253 parent=mahasiswa target=\
    172.16.7.253/32
/queue type
add kind=pfifo name="default-small ORIGINAL" pfifo-limit=10
set 10 kind=sfq
/user group
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge-dosen interface=ether3
add bridge=bridge-mahasiswa interface=ether4-atas
add bridge=bridge-mahasiswa interface=ether5-kelas
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=ether1-isp1 list=ISP
add interface=ether2-isp2 list=ISP
add interface=ether3 list=LAN
add interface=ether4-atas list=LAN
add interface=ether5-kelas list=LAN
add comment=MNET-VPN interface=MNET-VPN-SSTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-L2TP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-PPTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-OVPN list=MNET-VPN
/ip address
add address=172.16.0.1/21 interface=bridge-mahasiswa network=172.16.0.0
add address=10.0.0.1/22 interface=bridge-dosen network=10.0.0.0
/ip dhcp-client
add disabled=no interface=ether1-isp1
add interface=ether2-isp2
/ip dhcp-server network
add address=10.0.0.0/22 dns-server=10.0.0.1 gateway=10.0.0.1
add address=172.16.0.0/21 dns-server=172.16.0.1 gateway=172.16.0.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d servers=8.8.8.8,1.1.1.1
/ip firewall address-list
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-private-local
add address=8.8.8.8 comment="DNS GOOGLE" list=ip-private-dns
add address=8.8.4.4 comment="DNS GOOGLE" list=ip-private-dns
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=ip-private-dns
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=ip-private-dns
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private-dns
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private-dns
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private-dns
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private-dns
add address=9.9.9.9 comment="DNS QUAD 9" list=ip-private-dns
add address=149.112.112.112 comment="DNS QUAD 9" list=ip-private-dns
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private-dns
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private-dns
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private-dns
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private-dns
add address=208.67.222.222 comment="DNS OpenDNS" list=ip-private-dns
add address=208.67.220.220 comment="DNS OpenDNS" list=ip-private-dns
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private-dns
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private-dns
add address=94.140.14.14 comment="DNS AdGuard" list=ip-private-dns
add address=94.140.15.15 comment="DNS AdGuard" list=ip-private-dns
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=\
    ip-private-dns
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=\
    ip-private-dns
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    ip-private-dns
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    ip-private-dns
add address=77.88.8.1 comment="DNS Yandex" list=ip-private-dns
add address=77.88.8.8 comment="DNS Yandex" list=ip-private-dns
add address=211.233.84.186 comment=SNTP list=ip-private-dns
add address=216.239.35.4 comment=SNTP list=ip-private-dns
add address=download.mikrotik.com comment=LAINNYA list=ip-private-dns
add address=api.telegram.org comment=LAINNYA list=ip-private-dns
add address=licence.mikrotik.com comment=LAINNYA list=ip-private-dns
add address=vpn.mnet.my.id comment=LAINNYA list=ip-private-dns
add address=mnet.my.id comment=LAINNYA list=ip-private-dns
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=\
    ip-private-2-local&dns
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=8.8.8.8 comment="DNS GOOGLE" list=ip-private-2-local&dns
add address=8.8.4.4 comment="DNS GOOGLE" list=ip-private-2-local&dns
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=ip-private-2-local&dns
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=ip-private-2-local&dns
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private-2-local&dns
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private-2-local&dns
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private-2-local&dns
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private-2-local&dns
add address=9.9.9.9 comment="DNS QUAD 9" list=ip-private-2-local&dns
add address=149.112.112.112 comment="DNS QUAD 9" list=ip-private-2-local&dns
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private-2-local&dns
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private-2-local&dns
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private-2-local&dns
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private-2-local&dns
add address=208.67.222.222 comment="DNS OpenDNS" list=ip-private-2-local&dns
add address=208.67.220.220 comment="DNS OpenDNS" list=ip-private-2-local&dns
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private-2-local&dns
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private-2-local&dns
add address=94.140.14.14 comment="DNS AdGuard" list=ip-private-2-local&dns
add address=94.140.15.15 comment="DNS AdGuard" list=ip-private-2-local&dns
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=\
    ip-private-2-local&dns
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=\
    ip-private-2-local&dns
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    ip-private-2-local&dns
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    ip-private-2-local&dns
add address=77.88.8.1 comment="DNS Yandex" list=ip-private-2-local&dns
add address=77.88.8.8 comment="DNS Yandex" list=ip-private-2-local&dns
add address=211.233.84.186 comment=SNTP list=ip-private-2-local&dns
add address=216.239.35.4 comment=SNTP list=ip-private-2-local&dns
add address=download.mikrotik.com comment=LAINNYA list=ip-private-2-local&dns
add address=api.telegram.org comment=LAINNYA list=ip-private-2-local&dns
add address=licence.mikrotik.com comment=LAINNYA list=ip-private-2-local&dns
add address=vpn.mnet.my.id comment=LAINNYA list=ip-private-2-local&dns
add address=mnet.my.id comment=LAINNYA list=ip-private-2-local&dns
add address=172.16.0.0/21 list=ip-mahasiswa
add address=172.16.0.0/21 comment=mahasiswa list=ip-local
add address=10.0.0.0/22 comment=dosen list=ip-local
/ip firewall mangle
add action=jump chain=prerouting comment=\
    "                BYPASS bbrp koneksi" dst-address-list=ip-private-local \
    jump-target=lokal src-address-list=ip-private-local
add action=jump chain=input dst-address-list=ip-private-local jump-target=\
    lokal src-address-list=ip-private-local
add action=jump chain=forward dst-address-list=ip-private-local jump-target=\
    lokal src-address-list=ip-private-local
add action=jump chain=output dst-address-list=ip-private-local jump-target=\
    lokal src-address-list=ip-private-local
add action=jump chain=postrouting dst-address-list=ip-private-local \
    jump-target=lokal src-address-list=ip-private-local
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
add action=masquerade chain=srcnat comment="KE ISP" out-interface-list=ISP
add action=masquerade chain=srcnat comment=MNET-NAT-VPN out-interface-list=\
    MNET-VPN
/ip route
add comment=MNET-VPN distance=1 gateway=10.123.223.1 routing-mark=MNET
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/snmp
set enabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=001-ROUTER-AKUBISA
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add interval=12h name="##backup ke server mirza" on-event=\
    "/system script run ##backupkeservermirza" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2020 start-time=00:00:00
/system script
add dont-require-permissions=yes name=##backupkeservermirza owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local ftphost \"vpn.mnet.my.id\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/backup-client/akubisa-tegal/\"\r\
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
add dont-require-permissions=no name=##updatedanupgrade owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system package update\r\
    \nset channel=long-term\r\
    \n:delay 2s;\r\
    \n/system package update\r\
    \ncheck-for-updates once\r\
    \n:delay 3s;\r\
    \n:if ( [get status] = \"New version is available\") do={ install }\r\
    \n\r\
    \n#update frimware\r\
    \n/system routerboard upgrade\r\
    \ny\r\
    \ny"
/tool netwatch
add comment=MNET-VPN down-script="/ip firewall nat disable [find comment=\"MNE\
    T-VPN\"]\r\
    \n/ip firewall mangle disable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall raw disable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall filter disable [find comment=\"MNET-VPN\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"MNET-VPN\"]\r\
    \n/ip route rule disable [find comment=\"MNET-VPN\"]" host=10.123.223.1 \
    interval=5s up-script="/ip firewall nat enable [find comment=\"MNET-VPN\"]\
    \r\
    \n/ip firewall mangle enable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall raw enable [find comment=\"MNET-VPN\"]\r\
    \n/ip firewall filter enable [find comment=\"MNET-VPN\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"MNET-VPN\"]\r\
    \n/ip route rule enable [find comment=\"MNET-VPN\"]"
/tool romon
set enabled=yes
