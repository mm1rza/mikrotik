# aug/16/2023 02:28:01 by RouterOS 6.48.6
# software id = LZAU-D6NR
#
# model = 951G-2HnD
# serial number = 642E061E9188
/interface bridge
add name=lan-hotspot
add name=lan-rumah protocol-mode=none
add name=lan-stb
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n country=indonesia disabled=no \
    frequency=2457 mac-address=84:16:F9:71:EE:29 mode=ap-bridge radio-name=\
    tplink ssid=KAROKE
/interface ethernet
set [ find default-name=ether1 ] mac-address=80:35:C1:55:22:80 name=\
    ether1-isp1
set [ find default-name=ether2 ] mac-address=EA:EA:EA:00:00:00 name=\
    ether2-pusat
set [ find default-name=ether3 ] mac-address=96:66:F1:A3:59:44 name=\
    ether3-isp2
set [ find default-name=ether4 ] name=ether4-depan
set [ find default-name=ether5 ] name=ether5-pc-mirza
/interface vlan
add interface=ether2-pusat name=vlan-1-rumah-641 vlan-id=641
add interface=ether2-pusat name=vlan-2-ppoe-992 vlan-id=992
add interface=ether2-pusat name=vlan-hotspot-in-456 vlan-id=456
add interface=ether4-depan name=vlan-hotspot-out-456 vlan-id=456
add interface=ether5-pc-mirza name=vlan-stb-2225 vlan-id=2225
/interface ovpn-client
add certificate=mnet.crt_0 cipher=aes256 connect-to=103.143.170.11 \
    mac-address=FE:3C:5D:B7:AE:30 name=vpn2 password=mirzarumah45 \
    use-peer-dns=no user=rumah-router-remote
/interface list
add name=ISP
add name=LAN
add name=RUMAH
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa2-psk eap-methods="" mode=dynamic-keys name=\
    cendoldawet supplicant-identity="" wpa2-pre-shared-key=cendoldawet
add authentication-types=wpa2-psk eap-methods="" group-ciphers=tkip,aes-ccm \
    mode=dynamic-keys name=123123123 supplicant-identity="" unicast-ciphers=\
    tkip,aes-ccm wpa2-pre-shared-key=123123123
add authentication-types=wpa2-psk eap-methods="" group-ciphers=tkip,aes-ccm \
    mode=dynamic-keys name=mobilterbang supplicant-identity="" \
    unicast-ciphers=tkip,aes-ccm wpa2-pre-shared-key=mobilterbang
/interface wireless
add keepalive-frames=disabled mac-address=84:16:F9:71:EF:15 master-interface=\
    wlan1 multicast-buffering=disabled name=wlan3-rumah security-profile=\
    123123123 ssid=TN9H wds-cost-range=0 wds-default-cost=0 wps-mode=disabled
/ip pool
add name=pool ranges=192.168.99.21-192.168.99.199
/ppp profile
add address-list=ip-lokal local-address=10.10.16.1 name=MNET-2 on-down=":local\
    \_nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001184386305\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+\$nama+\
    \$remote\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local ips [/ppp active get [find name=\$nama] address];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001184386305\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+\$nama+\
    \$remote\" keep-result=no;" only-one=yes
add address-list=ip-lokal local-address=10.10.16.1 name="MNET-2-NON NOTIF" \
    only-one=yes
/interface l2tp-client
add connect-to=103.143.170.11 disabled=no ipsec-secret=vpn.mnet.my.id \
    keepalive-timeout=10 name=vpn1 password=mirzarumah45 profile=default \
    user=rumah-router-dns
/interface pptp-client
add connect-to=103.143.170.11 keepalive-timeout=15 name=vpn323213213 \
    password=mirzarumah45 profile=default user=rumah-router-dns
/queue simple
add max-limit=1G/1G name="------- VIP & LOKAL -------" packet-marks=vip,lokal \
    priority=1/1 target=192.168.99.0/24,10.10.16.0/24
/queue type
add kind=pfifo name=default-smallets pfifo-limit=5
add kind=sfq name=FULL-SPEED
/queue simple
add max-limit=20M/20M name=SPEEDTEST packet-marks=speedtest priority=1/1 \
    queue=FULL-SPEED/FULL-SPEED target=10.10.16.0/24
add max-limit=1G/1G name="--------ALL TRAFIK--------" queue=default/default \
    target=192.168.99.0/24,10.10.16.0/24
add max-limit=10M/10M name=aty parent="--------ALL TRAFIK--------" target=\
    192.168.99.26/32
add max-limit=20M/24M name=c parent="--------ALL TRAFIK--------" target=\
    10.10.16.0/24
add max-limit=1G/1G name=RUMAHAN parent="--------ALL TRAFIK--------" target=\
    192.168.99.0/24
add burst-limit=16M/16M burst-threshold=10M/10M burst-time=5s/5s limit-at=\
    1M/1M max-limit=10M/10M name=192.168.99.21 parent=RUMAHAN target=\
    192.168.99.21/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.3 parent=RUMAHAN target=192.168.99.3/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.26 parent=RUMAHAN target=192.168.99.26/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.22 parent=RUMAHAN target=192.168.99.22/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.2 parent=RUMAHAN target=192.168.99.2/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.9 parent=RUMAHAN target=192.168.99.9/32
add burst-limit=12M/12M burst-threshold=8M/8M burst-time=5s/5s limit-at=1M/1M \
    max-limit=8M/8M name=192.168.99.32 parent=RUMAHAN target=192.168.99.32/32
/ip dhcp-server
add add-arp=yes address-pool=pool disabled=no insert-queue-before=c \
    interface=lan-rumah lease-script=":local queueName \"\$leaseActIP\";\r\
    \n:if (\$leaseBound = \"1\") do={\r\
    \n/queue simple add name=\$queueName target=(\$leaseActIP . \"/32\") limit\
    -at=1000k/1000k max-limit=8000k/8000k burst-limit=12000k/12000k burst-thre\
    shold=8000k/8000k burst-time=5/5 parent=\"RUMAHAN\" place-before=\"-------\
    -ALL TRAFIK--------\";\r\
    \n} else={\r\
    \n/queue simple remove \$queueName\r\
    \n}\r\
    \n" lease-time=1m30s name=dhcp1 parent-queue=RUMAHAN
/queue simple
add burst-limit=0/6M burst-threshold=0/5M burst-time=0s/5s limit-at=2M/4M \
    max-limit=4M/5M name=c1-sekar parent=c target=10.10.16.2/32
add burst-limit=8M/11M burst-threshold=6M/8M burst-time=5s/5s limit-at=2M/4M \
    max-limit=6M/8M name=c2-agus parent=c target=10.10.16.3/32
add burst-limit=8M/10M burst-threshold=6M/8M burst-time=5s/5s comment=\
    "SAMPAI DESEMBER 2023" limit-at=2M/4M max-limit=6M/8M name=c3-rini \
    parent=c target=10.10.16.5/32
add burst-limit=8M/11M burst-threshold=6M/8M burst-time=7s/7s limit-at=2M/4M \
    max-limit=6M/8M name=c4-anis parent=c target=10.10.16.4/32
add burst-limit=11M/11M burst-threshold=9M/9M burst-time=5s/5s limit-at=2M/4M \
    max-limit=9M/9M name=c5-andi parent=c target=10.10.16.6/32
add max-limit=150k/200k name=c99-off parent=c target=10.10.16.0/24
/user group
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=lan-rumah interface=ether5-pc-mirza
add bridge=lan-rumah interface=vlan-1-rumah-641
add bridge=lan-rumah interface=wlan1
add bridge=lan-rumah interface=wlan3-rumah
add bridge=lan-rumah interface=ether4-depan
add bridge=lan-stb interface=vlan-stb-2225
add bridge=lan-stb interface=ether3-isp2
add bridge=lan-hotspot interface=vlan-hotspot-in-456
add bridge=lan-hotspot interface=vlan-hotspot-out-456
/ip firewall connection tracking
set tcp-established-timeout=10m
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ether1-isp1 list=ISP
add interface=ether2-pusat list=LAN
add interface=ether3-isp2 list=ISP
add interface=ether4-depan list=LAN
add interface=ether5-pc-mirza list=LAN
add interface=lan-rumah list=LAN
add interface=vlan-1-rumah-641 list=LAN
add interface=wlan1 list=LAN
add interface=vlan-1-rumah-641 list=RUMAH
add disabled=yes interface=vpn2 list=LAN
/interface ovpn-server server
set certificate=mnet.crt_0 keepalive-timeout=30
/interface pppoe-server server
add disabled=no interface=vlan-2-ppoe-992 one-session-per-host=yes \
    service-name=MNET-2
/interface sstp-server server
set keepalive-timeout=30
/ip address
add address=192.168.99.1/24 interface=lan-rumah network=192.168.99.0
add address=192.168.55.254/24 interface=ether2-pusat network=192.168.55.0
add address=10.20.254.2/30 interface=ether2-pusat network=10.20.254.0
add address=192.168.18.39/24 interface=ether1-isp1 network=192.168.18.0
add address=192.168.23.12/24 interface=lan-stb network=192.168.23.0
/ip dhcp-client
add interface=ether1-isp1
add default-route-distance=5 interface=lan-stb
add default-route-distance=5 interface=ether3-isp2
/ip dhcp-server lease
add address=192.168.99.3 address-lists=ip-lokal-mirza client-id=\
    1:50:29:f5:89:28:1d comment="mirza oppo" insert-queue-before=first \
    mac-address=50:29:F5:89:28:1D rate-limit=1000M/1000M server=dhcp1
add address=192.168.99.22 comment="tv belakang" insert-queue-before=first \
    mac-address=04:95:73:F9:96:D7 rate-limit=25M/25M server=dhcp1
add address=192.168.99.4 address-lists=ip-lokal-mirza client-id=\
    1:5c:5f:67:93:12:41 comment="mirza lp hp" insert-queue-before=first \
    mac-address=5C:5F:67:93:12:41 rate-limit=1000M/1000M server=dhcp1
add address=192.168.99.26 client-id=1:b0:4e:26:9e:5c:79 comment=aty \
    mac-address=B0:4E:26:9E:5C:79 server=dhcp1
add address=192.168.99.31 client-id=1:4:b1:67:99:69:80 comment=abah \
    mac-address=04:B1:67:99:69:80 server=dhcp1
add address=192.168.99.5 address-lists=ip-lokal-mirza client-id=\
    1:dc:85:de:8c:e1:ff comment="mirza lp jadul" insert-queue-before=first \
    mac-address=DC:85:DE:8C:E1:FF rate-limit=1000M/1000M server=dhcp1
add address=192.168.99.2 address-lists=ip-lokal-mirza client-id=\
    1:90:a2:5b:d7:1e:25 comment="mirza hp ip" insert-queue-before=first \
    lease-time=1h mac-address=90:A2:5B:D7:1E:25 rate-limit=1000M/1000M \
    server=dhcp1
add address=192.168.99.9 address-lists=ip-lokal-mirza client-id=\
    1:80:35:c1:30:ce:80 comment="ayu xiaomi" insert-queue-before=first \
    mac-address=80:35:C1:30:CE:80 rate-limit=100M/100M server=dhcp1
add address=192.168.99.32 client-id=1:e6:9:c9:1:40:47 comment=umi \
    mac-address=E6:09:C9:01:40:47 server=dhcp1
add address=192.168.99.21 client-id=1:dc:9a:7d:93:ab:42 comment="tv tengah" \
    insert-queue-before=first mac-address=DC:9A:7D:93:AB:42 rate-limit=\
    25M/25M server=dhcp1
add address=192.168.99.23 client-id=1:94:90:34:92:8d:59 comment="tv umi" \
    insert-queue-before=first mac-address=94:90:34:92:8D:59 rate-limit=\
    25M/25M server=dhcp1
add address=192.168.99.57 address-lists=ip-lokal-pc-mirza client-id=\
    1:a8:a1:59:20:de:5 comment="mirza pc" insert-queue-before=first \
    mac-address=A8:A1:59:20:DE:05 rate-limit=1000m/1000m server=dhcp1
/ip dhcp-server network
add address=192.168.99.0/24 dns-server=192.168.99.1 gateway=192.168.99.1
/ip dhcp-server vendor-class-id
add address-pool=pool disabled=yes name="Office Windows" server=dhcp1 vid=\
    "MSFT 5.0"
add disabled=yes name="Android 4.2" server=dhcp1 vid=dhcpcd-5.5.6
add disabled=yes name="Android 4.0" server=dhcp1 vid=dhcpcd-5.2.10
add disabled=yes name="Android 3.0" server=dhcp1 vid="DHCPCD 4.0.15"
add disabled=yes name="Android 2.2" server=dhcp1 vid="DHCPCD 4.0.1"
/ip dns
set allow-remote-requests=yes cache-max-ttl=5m cache-size=51200KiB servers=\
    192.168.18.1,192.168.23.1
/ip firewall address-list
add address=192.168.99.0/24 list=ip-lokal
add address=0.0.0.0/8 list=ip-local-private
add address=10.0.0.0/8 list=ip-local-private
add address=100.64.0.0/10 list=ip-local-private
add address=127.0.0.0/8 list=ip-local-private
add address=169.254.0.0/16 list=ip-local-private
add address=172.16.0.0/12 list=ip-local-private
add address=192.0.0.0/24 list=ip-local-private
add address=192.0.2.0/24 list=ip-local-private
add address=192.168.0.0/16 list=ip-local-private
add address=198.18.0.0/15 list=ip-local-private
add address=198.51.100.0/24 list=ip-local-private
add address=203.0.113.0/24 list=ip-local-private
add address=224.0.0.0/3 list=ip-local-private
add address=255.255.255.255 list=ip-local-private
add address=240.0.0.0/4 list=ip-local-private
add address=10.123.22.3 list=ip-lokal-vpn
add address=10.10.16.0/24 list=ip-lokal
add address=192.168.99.2-192.168.99.20 list=ip-lokal-mirza
add address=10.123.22.5 list=ip-lokal-vpn
add address=surfshark.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.privateinternetaccess.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=dnschecker.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=id.wizcase.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=fast.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplocation.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ifconfig.co comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip-adress.eu comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismybrowser.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipchicken.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.li comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=cbn.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip4.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipcow.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=wtfismyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.network comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=myipaddress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipleak.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyipaddress.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismyip.host comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=check-host.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=myip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismypublicip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ip2location.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.live comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=dnsleaktest.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=touch.whatsmyip.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=c.speedtest.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speed.mncplay.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=test-ipv6.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.com.sg comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.speedspot.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speed.ui.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speed.cloudflare.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=bgp.he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipinfo.io comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedsmart.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyip.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip4.host comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whoismyisp.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=showmyisp.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=cekipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedof.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipstack.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=spyber.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=inet-ip.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.fast.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplocation.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyrouterip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=what-is-my-ipv4.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ip.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=realip.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipvoid.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip.zscaler.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipv4.lookup.test-ipv6.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismyasn.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mybrowserinfo.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=tools.ip2location.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=myglobalip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedcheckerapi.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedcheckerapi.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=v4.myipstack.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip.nf comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipku.in comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=noc.kemdikbud.go.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.padinet.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=dnsleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ws-ipv4.nperf.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mapi.clearlink.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=checkip.dyndns.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ip-adress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipcost.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=knrpc.olark.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.cni.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.kemsos.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipaddress.my comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.unair.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=net.etrality.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipapi.co comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=nordvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest-idc.hypernet.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=mw.ipburger.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.xmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.alleasyseo.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=kinsta.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.cbn.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=c.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.showmyipaddress.eu comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=xmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.expressvpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.iplocation.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.astrill.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ultratools.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ip-adress.eu comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplogger.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.vermiip.es comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatismybrowser.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=zenmate.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipchicken.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipburger.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=cactusvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.cactusvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=m.wolframalpha.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismycountry.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipinfo.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.myipaddress.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ipleak.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.tunnelbear.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipv6test.hide.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=checkip.perfect-privacy.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatsmyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.speedtest.net.cdn.cloudflare.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=dualstack.zd.map.fastly.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=zd.map.fastly.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=prd.nperf.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipaddress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.uin-suka.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ispeedtest.bpk.go.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.yam.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.net.in comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.fireprobe.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.mybroadband.co.za comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.maxmind.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.ip2location.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ipvanish.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.mxtoolbox.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.my-ip-finder.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=locator.atlasvpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.vyprvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=account.hotspotshield.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.namecheap.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=browserleaks.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=151.101.86.219 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
/ip firewall filter
add action=fasttrack-connection chain=forward comment="PC MIRZA" \
    src-address-list=ip-lokal-pc-mirza
add action=fasttrack-connection chain=forward port=80,443,1723,1701,1194,8080 \
    protocol=tcp src-address-list=ip-lokal-pc-mirza
add action=fasttrack-connection chain=forward port=80,443,1723,1701,1194,8080 \
    protocol=udp src-address-list=ip-lokal-pc-mirza
add action=fasttrack-connection chain=forward comment="LOKAL MIRZA" \
    dst-address-list=ip-lokal-mirza
add action=fasttrack-connection chain=forward src-address-list=ip-lokal-mirza
add action=passthrough chain=batas comment="batas suci"
add action=fasttrack-connection chain=forward port=8080 protocol=tcp \
    src-address=192.168.99.0/24
add action=fasttrack-connection chain=forward dst-address=192.168.99.0/24 \
    port=8080 protocol=tcp
add action=drop chain=forward comment="BLOKIR MAC ADDRESS" disabled=yes \
    src-mac-address=C8:3D:DC:DA:B5:E2
add action=drop chain=forward comment="                DROP tracert" \
    disabled=yes icmp-options=11:0 in-interface-list=ISP protocol=icmp
add action=drop chain=forward disabled=yes icmp-options=3:3 \
    in-interface-list=ISP protocol=icmp
add action=drop chain=input comment="                DROP (neighbor dis 5678) \
    (mac address 20561) (snmp 161,162) (dude 2210,2211) (proxy 3128,8080) (bte\
    st 2000,3000) (tracert 33434-33534) (dns 53,5353,853)" dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534 \
    in-interface-list=ISP protocol=tcp
add action=drop chain=input dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534 \
    in-interface-list=ISP protocol=udp
add action=drop chain=input comment=\
    "                DROP (winbox 21,22,23,8291,8728,8729,80,443)" dst-port=\
    21,22,23,8291,8728,8729,80,443,8085 in-interface-list=ISP protocol=tcp
add action=drop chain=input dst-port=21,22,23,8291,8728,8729,80,443,8085 \
    in-interface-list=ISP protocol=udp
/ip firewall mangle
add action=mark-routing chain=prerouting disabled=yes dst-address-list=\
    z-list-ip-speedtest dst-port=80,443,5060 new-routing-mark=isp2 \
    passthrough=no protocol=tcp src-address-list=ip-local-private
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    z-list-ip-speedtest dst-port=80,443,5060 new-routing-mark=isp2 \
    passthrough=no protocol=tcp src-address=10.10.16.0/24
add action=mark-packet chain=forward dst-address-list=!ip-local-private \
    dst-port=8080 new-packet-mark=speedtest passthrough=no protocol=tcp \
    src-address=10.10.16.0/24
add action=mark-packet chain=forward dst-address=10.10.16.0/24 \
    new-packet-mark=speedtest passthrough=no protocol=tcp src-address-list=\
    !ip-local-private src-port=8080
add action=mark-routing chain=prerouting comment=isp3 dst-address-list=\
    !ip-local-private new-routing-mark=isp3 passthrough=no src-address=\
    10.10.16.0/24
add action=passthrough chain=dota2 disabled=yes
add action=mark-routing chain=prerouting dst-port=\
    9100-9200,8230-8250,8110-8120 new-routing-mark=isp3 passthrough=no \
    protocol=tcp src-address-list=ip-lokal-pc-mirza
add action=mark-routing chain=prerouting dst-port=\
    28010-28200,27010-27200,39000 new-routing-mark=isp3 passthrough=no \
    protocol=udp src-address-list=ip-lokal-pc-mirza
add action=passthrough chain=dota2 disabled=yes
add action=passthrough chain=coc disabled=yes
add action=mark-routing chain=prerouting comment=isp3 dst-port=9330-9340 \
    new-routing-mark=isp3 passthrough=no protocol=tcp src-address-list=\
    ip-lokal-pc-mirza
add action=passthrough chain=coc disabled=yes
add action=passthrough chain=ML disabled=yes
add action=mark-routing chain=prerouting disabled=yes dst-port=\
    5520-5529,10003,30000-30900,8443,5289-5352,5354-5509,5517 \
    new-routing-mark=isp3 passthrough=no protocol=tcp src-address-list=\
    ip-lokal-pc-mirza
add action=mark-routing chain=prerouting disabled=yes dst-port="5000-5221,5224\
    -5227,5229-5241,5243-5287,5551-5559,5601-5700,9000-9010,9443" \
    new-routing-mark=isp3 passthrough=no protocol=tcp src-address-list=\
    ip-lokal-pc-mirza
add action=mark-routing chain=prerouting disabled=yes dst-port="4001-4009,5000\
    -5221,5224-5241,5243-5509,5551-5559,5601-5700,8130,8443,9120" \
    new-routing-mark=isp3 passthrough=no protocol=udp src-address-list=\
    ip-lokal-pc-mirza
add action=mark-routing chain=prerouting disabled=yes dst-port=\
    2702,3702,5517-5529,8001,9000-9010,9992,10003,30000-30900,5289-5352 \
    new-routing-mark=isp3 passthrough=no protocol=udp src-address-list=\
    ip-lokal-pc-mirza
add action=passthrough chain=ML disabled=yes
add action=jump chain=prerouting dst-address-list=ip-local-private \
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
    protocol=udp
add action=jump chain=prerouting dst-port=53,5353,853 jump-target=vip \
    protocol=tcp
add action=jump chain=prerouting jump-target=vip port=8290,8291,8299,8399 \
    protocol=tcp
add action=mark-packet chain=vip new-packet-mark=vip passthrough=no
/ip firewall nat
add action=dst-nat chain=dstnat comment=11 disabled=yes dst-port=53,5353,853 \
    protocol=udp src-address-list=ip-lokal-pc-mirza to-addresses=10.123.22.3 \
    to-ports=53
add action=dst-nat chain=dstnat comment=11 disabled=yes dst-port=53,5353,853 \
    protocol=tcp src-address-list=ip-lokal-pc-mirza to-addresses=10.123.22.3 \
    to-ports=53
add action=dst-nat chain=dstnat comment=22 disabled=yes dst-port=53,5353,853 \
    protocol=udp src-address-list=ip-lokal-mirza to-addresses=10.123.22.3 \
    to-ports=53
add action=dst-nat chain=dstnat comment=22 disabled=yes dst-port=53,5353,853 \
    protocol=tcp src-address-list=ip-lokal-mirza to-addresses=10.123.22.3 \
    to-ports=53
add action=dst-nat chain=dstnat comment="PORT WINBOX VPN > THIS MIKROTIK" \
    dst-port=8291 protocol=tcp src-address-list=ip-lokal-vpn to-addresses=\
    192.168.99.1 to-ports=8291
add action=dst-nat chain=dstnat comment=\
    "IP VPN WINBOX MNET UTAMA            > IP LOKAL MNET" dst-address=\
    103.143.170.11 dst-port=8299 protocol=tcp to-addresses=192.168.55.1 \
    to-ports=8291
add action=dst-nat chain=dstnat comment=\
    "IP VPN WINBOX RUMAH                      > IP LOKAL MNET" dst-address=\
    103.143.170.11 dst-port=8399 protocol=tcp to-addresses=192.168.99.1 \
    to-ports=8291
add action=dst-nat chain=dstnat comment=mirzapc1 protocol=tcp \
    src-address-list=ip-lokal-vpn to-addresses=192.168.99.57
add action=dst-nat chain=dstnat comment=mirzapc1 protocol=udp \
    src-address-list=ip-lokal-vpn to-addresses=192.168.99.57
add action=masquerade chain=srcnat
/ip route
add comment=isp2 distance=1 gateway=10.20.254.1 routing-mark=isp2
add comment=isp3 distance=1 gateway=192.168.23.1 routing-mark=isp3
add comment=isp1 distance=1 gateway=192.168.18.1 routing-mark=isp1
add distance=1 gateway=10.123.22.3 routing-mark=vpn
add comment=iisp1 distance=1 gateway=192.168.18.1
add comment=iisp3 distance=2 gateway=192.168.23.1
add comment=iisp2 distance=3 gateway=10.20.254.1
add comment="cek isp3" distance=1 dst-address=1.1.1.2/32 gateway=192.168.23.1
add comment="cek isp1" distance=1 dst-address=4.2.2.1/32 gateway=192.168.18.1
add comment="cek isp1" distance=1 dst-address=8.8.4.4/32 gateway=192.168.18.1
add comment="cek isp3" distance=1 dst-address=8.8.8.8/32 gateway=192.168.23.1
add comment="cek isp1" distance=1 dst-address=94.140.14.14/32 gateway=\
    192.168.18.1
add comment=isp2 distance=5 dst-address=103.143.170.11/32 gateway=\
    192.168.23.1
add comment=isp1 distance=44 dst-address=103.143.170.11/32 gateway=\
    192.168.18.1
add comment="cek isp3" distance=1 dst-address=149.112.112.112/32 gateway=\
    192.168.23.1
/ip route rule
add comment="PC MIRZA PAKSA" disabled=yes src-address=192.168.99.57/32 table=\
    isp3
add comment="PC MIRZA PAKSA" disabled=yes src-address=192.168.99.57/32 table=\
    isp1
add comment="TV TENGAH" disabled=yes src-address=192.168.99.22/32 table=isp3
add comment="HP IP" disabled=yes src-address=192.168.99.2/32 table=isp3
add dst-address=10.10.0.0/20 table=isp2
add dst-address=172.16.0.0/12 table=isp2
add dst-address=192.168.55.0/24 table=isp2
add dst-address=192.168.19.0/24 table=isp2
add dst-address=192.168.21.0/24 table=isp2
add dst-address=192.168.22.0/24 table=isp2
add disabled=yes dst-address=192.168.23.0/24 table=isp2
add disabled=yes dst-address=192.168.24.0/24 table=isp2
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add name=29sekar@mnet.com password=29sekar@mnet.com profile=MNET-2 \
    remote-address=10.10.16.2 service=pppoe
add name=anis@mnet.com password=anis@mnet.com profile=MNET-2 remote-address=\
    10.10.16.4 service=pppoe
add comment="SAMPAI DESEMBER 2023" name=rini@mnet.com password=rini@mnet.com \
    profile=MNET-2 remote-address=10.10.16.5 service=pppoe
add name=agus@mnet.com password=agus@mnet.com profile="MNET-2-NON NOTIF" \
    remote-address=10.10.16.3 service=pppoe
add name=andi@mnet.com password=andi@mnet.com profile=MNET-2 remote-address=\
    10.10.16.6 service=pppoe
/snmp
set enabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=mirza-1-router-rumah
/system note
set note="Using nice.rsc from www.mikrotik.co.id, 6 September 2022 12:00:07 WI\
    B, 7462 lines." show-at-login=no
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add interval=1d name=#backup+hs+romon+cek-kabel on-event=\
    "/system script run #####backup-router-email&ftp\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=02:28:00
add disabled=yes interval=1d name=###restart-tiap-00-hari on-event=\
    "/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=04:24:55
add interval=1m name=~ping on-event=":local intisp \"isp1\"\r\
    \n:local namaisp \"isp1\"\r\
    \n\r\
    \n:local time [/system clock get time]\r\
    \n:local error \"\$namaisp mati \$time -\"\r\
    \n:local aman \"\$namaisp nyala \$time -\"\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.1\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.1\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.1\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.1\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.4.4 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.4.4\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.4.4\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.8.8 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.8.8\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.8.8\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.10 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.10\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.10\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.11 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.11\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.11\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.9 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 9.9.9.9\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.9\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.112 count=3 ]\
    \_= 0) do={\r\
    \nlog error (\"\$error 149.112.112.112\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.112\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.220.220 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.220.220\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.220\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.222.222 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.222.222\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.222\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.14 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.14\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.14\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.15 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.15\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.15\")\r\
    \n};\r\
    \n\r\
    \n#:delay 1s;\r\
    \n#log info message=\"\$namaisp batasssss\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5m name="~ping vpn mnet" on-event=\
    "/system script run MNET-VPN-CEK" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=no name=#####backup-router-email&ftp owner=\
    mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local ftphost \"103.143.170.11\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/\"\r\
    \n\r\
    \n:local identity2 [/system identity get name]\r\
    \n:local identity \"ROUTER-RUMAH\"\r\
    \n:local mnet1 \"\$identity.backup\"\r\
    \n:local mnet2 \"\$identity.rsc\"\r\
    \n\r\
    \n:log info message=\"++++++++++++++++++++++++++++++++++++++++++++++++++++\
    +++++++++++++++++++++\";\r\
    \n:log info message=\"===> Membuat file backup router\";\r\
    \n/system backup save name=\$mnet1\r\
    \n/export compact file=\$mnet2\r\
    \n:log info message=\"===> File backup router selesai dibuat\";\r\
    \n:delay 5s;\r\
    \n\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet1 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/\$mnet1\" up\
    load=yes\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet2 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/export/\$mne\
    t2\" upload=yes\r\
    \n \r\
    \n:log info message=\"===> File backup telah di kirim ke mirza\";\r\
    \n\r\
    \n:log info message=\"++++++++++++++++++++++++++++++++++++++++++++++++++++\
    +++++++++++++++++++++\";"
add dont-require-permissions=no name="!                  CLEAR LOG" owner=\
    mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system logging action set memory memory-lines=1\r\
    \n/system logging action set memory memory-lines=1000\r\
    \n"
add dont-require-permissions=no name="!  isp1    ON ( AKTIF )" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/tool netwatch set disabled=no [find comment=\"   isp1\"]\r\
    \n/tool netwatch set disabled=yes [find comment=\"z - isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp1\"]\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n\r\
    \n\r\
    \n/ip dns cache flush"
add dont-require-permissions=no name="!  isp1   OFF" owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool netwatch set disabled=yes [find comment=\"   isp1\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"z - isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1\"]\r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp1\"]\r\
    \n\r\
    \n/interface enable vpn11\r\
    \n/interface enable vpndns\r\
    \n/interface enable vpn11\r\
    \n/interface enable vpndns\r\
    \n\r\
    \n/ip dns cache flush"
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
    \ny"
add dont-require-permissions=no name=#update-speedtest owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    if ([:len [/file find name=list-ip-speedtest.rsc]] > 0) do={/file remove l\
    ist-ip-speedtest.rsc }; \r\
    \n\r\
    \n:delay 1s\r\
    \n/tool fetch url=\"https://mnet.my.id/file/uploads/settingan-mikrotik/ip-\
    address/list-ip-speedtest.rsc\" mode=http;/import list-ip-speedtest.rsc\r\
    \n\r\
    \n:delay 5s\r\
    \n/file remove list-ip-speedtest.rsc"
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
/tool bandwidth-server
set enabled=no
/tool graphing interface
add interface=ether1-isp1
add interface=ether2-pusat
/tool mac-server
set allowed-interface-list=none
/tool mac-server mac-winbox
set allowed-interface-list=none
/tool mac-server ping
set enabled=no
/tool netwatch
add comment="   isp2 router mnet" down-script="\r\
    \n/ip route disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]\r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp2\"]\r\
    \n/ip dns cache flush" host=10.20.254.1 interval=5s up-script="\r\
    \n/ip route enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp2\"]\r\
    \n/ip dns cache flush\r\
    \n"
add comment="  VPN1 DNS" down-script="/ip route disable [find comment=\"vpn1\"\
    ]\r\
    \n/ip route rule disable [find comment=\"vpn1\"]\r\
    \n/ip firewall nat disable [find comment=\"vpn1\"]\r\
    \n/ip firewall mangle disable [find comment=\"vpn1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"vvpn1\"]\r\
    \n/ip route disable [find comment=\"vvvpn1\"]\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn1\r\
    \n\r\
    \nlog error (\"rumah vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C rumah vpn1\" keep-result=no;\r\
    \n" host=10.123.22.3 interval=5s timeout=2s up-script="/ip route enable [f\
    ind comment=\"vpn1\"]\r\
    \n/ip route rule enable [find comment=\"vpn1\"]\r\
    \n/ip firewall nat enable [find comment=\"vpn1\"]\r\
    \n/ip firewall mangle enable [find comment=\"vpn1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"vvpn1\"]\r\
    \n/ip route enable [find comment=\"vvvpn1\"]\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n:delay 500ms;\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog warning (\"rumah vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 rumah vpn1\" keep-result=no;"
add comment="   isp3" down-script="/ip route disable [find comment=\"isp3\"]\r\
    \n/ip route rule disable [find comment=\"isp3\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp3\"]\r\
    \n/ip firewall nat disable [find comment=\"isp3\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp3\"]\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2" host=8.8.8.8 interval=7s timeout=3s up-script="/\
    ip route enable [find comment=\"isp3\"]\r\
    \n/ip route rule enable [find comment=\"isp3\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp3\"]\r\
    \n/ip firewall nat enable [find comment=\"isp3\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp3\"]\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2"
add comment="201 ap ats r tamu" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001184386305&text=\\E2\\9D\\8C 201 ap ats r tamu\" keep-result\
    =no;\r\
    \n\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+ap+atas\
    +tamu\" keep-result=no;\r\
    \n" host=192.168.99.201 interval=5s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001184386305&text=\\E2\\9C\\85 201 ap ats r tamu\" keep-r\
    esult=no;\r\
    \n\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+ap+atas\
    +tamu\" keep-result=no;\r\
    \n"
add comment="  VPN2 REMOTE" down-script="/ip route disable [find comment=\"vpn\
    2\"]\r\
    \n/ip route rule disable [find comment=\"vpn2\"]\r\
    \n/ip firewall nat disable [find comment=\"vpn2\"]\r\
    \n/ip firewall mangle disable [find comment=\"vpn2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"vvpn2\"]\r\
    \n/ip route disable [find comment=\"vvvpn2\"]\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn2\r\
    \n\r\
    \nlog error (\"rumah vpn2\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C rumah vpn2\" keep-result=no;\r\
    \n" host=10.123.22.5 interval=5s timeout=2s up-script="/ip route enable [f\
    ind comment=\"vpn2\"]\r\
    \n/ip route rule enable [find comment=\"vpn2\"]\r\
    \n/ip firewall nat enable [find comment=\"vpn2\"]\r\
    \n/ip firewall mangle enable [find comment=\"vpn2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"vvpn2\"]\r\
    \n/ip route enable [find comment=\"vvvpn2\"]\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n:delay 500ms;\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog warning (\"rumah vpn2\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 rumah vpn2\" keep-result=no;"
add comment="202 ap dpn kmr 5gh" down-script="/tool fetch url=\"https://api.te\
    legram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001184386305&text=\\E2\\9D\\8C 202  ap dpn kmr 5gh\" keep-resu\
    lt=no;" host=192.168.99.202 interval=5s up-script="/tool fetch url=\"https\
    ://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/send\
    message\\\?chat_id=-1001184386305&text=\\E2\\9C\\85 202  ap dpn kmr 5gh\" \
    keep-result=no;"
add comment="203 ap zte tv" down-script="/tool fetch url=\"https://api.telegra\
    m.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?cha\
    t_id=-1001184386305&text=\\E2\\9D\\8C 203 ap zte tv\" keep-result=no;\r\
    \n\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+ap+depa\
    n+tv\" keep-result=no;\r\
    \n" host=192.168.99.203 interval=5s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001184386305&text=\\E2\\9C\\85 203 ap zte tv\" keep-resul\
    t=no;\r\
    \n\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+ap+depa\
    n+tv\" keep-result=no;\r\
    \n"
add comment="204 ap dpn kmr dpn mrza" down-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001184386305&text=\\E2\\9D\\8C 204 ap dpn kmr dpn mrza\" \
    keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+ap+depa\
    n+kamar\" keep-result=no;\r\
    \n" host=192.168.99.204 interval=5s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001184386305&text=\\E2\\9C\\85 204 ap dpn kmr dpn mrza\" \
    keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+ap+depa\
    n+kamar\" keep-result=no;\r\
    \n"
add comment="253 ap outdoor lawas" down-script="\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+ap+outd\
    oor+lawas\" keep-result=no;\r\
    \n" host=192.168.99.253 interval=5s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001184386305&text=\\E2\\9C\\85 253 ap outdoor lawas\" kee\
    p-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+ap+outd\
    oor+lawas\" keep-result=no;\r\
    \n"
add comment="   isp1" down-script="/ip route disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]\r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp1\"]\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n\r\
    \nlog error (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 rumah\" keep-result=no;" host=8.8.4.4 interval=12s up-script="/ip \
    route enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp1\"]\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n\r\
    \nlog warning (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 rumah\" keep-result=no;"
add comment="z - isp1" disabled=yes down-script="\r\
    \nlog error (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 8888 rumah notif\" keep-result=no;" host=94.140.14.14 interval=3s \
    timeout=100ms up-script="\r\
    \nlog warning (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 8888 rumah notif\" keep-result=no;"
add comment="z - isp1" disabled=yes down-script="\r\
    \nlog error (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 4221 rumah notif\" keep-result=no;" host=4.2.2.1 interval=3s \
    timeout=100ms up-script="\r\
    \nlog warning (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 4221 rumah notif\" keep-result=no;"
add comment="z - isp1" disabled=yes down-script="\r\
    \nlog error (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 8888 rumah notif\" keep-result=no;" host=8.8.4.4 interval=3s \
    timeout=100ms up-script="\r\
    \nlog warning (\"isp1 rumah\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 8888 rumah notif\" keep-result=no;"
/tool romon
set enabled=yes secrets=455
