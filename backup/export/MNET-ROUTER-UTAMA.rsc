# jun/22/2023 04:23:18 by RouterOS 6.48.6
# software id = 1ULD-5FDY
#
# model = RouterBOARD 3011UiAS
# serial number = 8EED0A011100
/interface bridge
add name=lan
/interface ethernet
set [ find default-name=ether1 ] comment=b-valen mac-address=\
    74:DF:BF:88:37:11 name=ether1-isp1
set [ find default-name=ether2 ] comment=o-mirza mac-address=\
    74:DF:BF:88:37:22 name=ether2-isp2
set [ find default-name=ether3 ] mac-address=74:DF:BF:88:37:33 name=\
    ether3-isp3
set [ find default-name=ether4 ] mac-address=74:DF:BF:88:37:44 name=\
    ether4-isp4
set [ find default-name=ether5 ] mac-address=74:DF:BF:88:37:55 name=\
    ether5-isp5
set [ find default-name=ether6 ] name=ether6-tower
set [ find default-name=ether8 ] name=ether8-belakang
set [ find default-name=ether9 ] name=ether9-mirza
/interface vlan
add interface=lan name=vlan-hotspot vlan-id=456
/interface ovpn-client
add certificate=mnet.crt_0 cipher=aes256 connect-to=103.143.170.11 \
    mac-address=FE:EC:3E:F1:DC:9A name=vpn2 password=456awasadawewe456 \
    use-peer-dns=no user=mnet-router-remote
/interface list
add name=ISP
add name=LAN
add name=VPN
add include=ISP,VPN name=ISP+VPN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot1
add dns-name=hotspotan.com hotspot-address=172.16.0.1 html-directory=hotspot1 \
    login-by=http-chap,mac-cookie name=vlan-hotspot
/ip pool
add name=dhcp_pool0 ranges=172.16.0.31-172.16.3.239
/ip hotspot
add address-pool=dhcp_pool0 addresses-per-mac=unlimited disabled=no \
    idle-timeout=10m interface=vlan-hotspot name=vlan-hotspot profile=\
    vlan-hotspot
/ppp profile
set *0 use-encryption=no
add address-list=ip-local local-address=10.10.1.1 name=area-bebek on-down=":lo\
    cal nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;" \
    on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;" \
    only-one=yes
add address-list=ip-local local-address=10.10.2.1 name=area-tegal on-down=":lo\
    cal nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;" \
    on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;" \
    only-one=yes
add address-list=ip-local local-address=10.10.1.1 name=area-bebek-NON-NOTIF \
    only-one=yes
add address-list=ip-local local-address=10.10.2.1 name=area-tegal-NON-NOTIF \
    only-one=yes
/interface l2tp-client
add connect-to=103.143.170.11 disabled=no ipsec-secret=vpn.mnet.my.id \
    keepalive-timeout=15 name=vpn1 password=456awasadawewe456 profile=default \
    user=mnet-router-dns
/interface pptp-client
add connect-to=103.143.170.11 keepalive-timeout=10 name=vvppnn1 password=\
    456awasadawewe456 profile=default user=mnet-router-dns
/queue simple
add max-limit=100M/100M name="~~~ VIP & LOKAL ~~~" packet-marks=vip,lokal \
    priority=1/1 target=10.0.0.0/8,172.16.0.0/12
add max-limit=100M/100M name="~~~       GAME      ~~~" packet-marks=\
    game-ml,game-ff priority=3/3 target=10.0.0.0/8,172.16.0.0/12
/queue type
add kind=pcq name=pcq-download pcq-classifier=dst-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pcq name=pcq-upload pcq-classifier=src-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pfifo name=default-100 pfifo-limit=100
add kind=sfq name=FULL-SPEED
/queue simple
add disabled=yes max-limit=50M/50M name="~~~    BYPASS     ~~~" priority=1/1 \
    queue=default/default target=10.10.2.11/32
add max-limit=12M/12M name="~~~ SPEEDTEST ~~~" packet-marks=speedtest \
    priority=4/4 queue=default/default target=10.10.0.0/21
add name="--------ALL TRAFIK--------" queue=default/default target=\
    10.0.0.0/8,172.16.0.0/12
add limit-at=1M/2M max-limit=3M/5M name="==warung-evi" parent=\
    "--------ALL TRAFIK--------" target=\
    172.16.3.251/32,172.16.3.252/32,172.16.3.253/32
add max-limit=1G/1G name=~~MIRZA parent="--------ALL TRAFIK--------" target=\
    10.20.254.2/32,10.10.2.254/32
add disabled=yes max-limit=100M/100M name=rtrw-muksin-LOSS parent=\
    "--------ALL TRAFIK--------" target=10.10.12.2/32
add max-limit=50M/50M name=rtrw-muksin parent="--------ALL TRAFIK--------" \
    target=10.10.12.2/32
add max-limit=80M/80M name=rumahan parent="--------ALL TRAFIK--------" \
    target=10.10.0.0/21
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no insert-queue-before=\
    "==warung-evi" interface=vlan-hotspot lease-script=\
    "/queue simple remove [ find name ~\"hs-<\" ]" name=dhcp1 parent-queue=\
    "--------ALL TRAFIK--------"
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=no insert-queue-before="==warung-evi" \
    keepalive-timeout=4m name=-default on-login=\
    ":put (\",,0,,,noexp,Disable,\")" parent-queue=\
    "--------ALL TRAFIK--------" rate-limit="1M/3M 0/0 0/0 0/0 8 0/0" \
    shared-users=unlimited
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=\
    -default-1-hp on-login=":put (\",rem,0,31d,0,,Disable,\"); {:local date [ \
    /system clock get date ];:local year [ :pick \$date 7 11 ];:local month [ \
    :pick \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user\
    \_find where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2];\
    \_:if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys\
    \_sch add name=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :\
    delay 2s; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" \
    ] next-run]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:\
    pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [find where name\
    =\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$da\
    te \$exp\" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hot\
    spot user set comment=\$exp [find where name=\"\$user\"];}; /sys sch remov\
    e [find where name=\"\$user\"]}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=wawan \
    on-login=":put (\",remc,1000,31d,2000,,Enable,\"); {:local date [ /system \
    clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$\
    date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find wh\
    ere name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$u\
    code = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add n\
    ame=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s; :\
    local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]\
    ; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0\
    \_6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$\
    year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\
    \"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-31d-|-wawan-|-\$comment\" owner=\"\$month\$year\
    \" source=\$date comment=mikhmon; [:local mac \$\"mac-address\"; /ip hotsp\
    ot user set mac-address=\$mac [find where name=\$user]]}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=witno-12jam \
    on-login=":put (\",remc,1000,31d,2000,,Disable,\"); {:local date [ /system\
    \_clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \
    \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find \
    where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\
    \$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch ad\
    d name=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-31d-|-witno-12jam-|-\$comment\" owner=\"\$month\
    \$year\" source=\$date comment=mikhmon}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d1mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/1500K 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=evi \
    on-login=":put (\",remc,1000,31d,2000,,Disable,\"); {:local date [ /system\
    \_clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \
    \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find \
    where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\
    \$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch ad\
    d name=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-31d-|-evi-|-\$comment\" owner=\"\$month\$year\" \
    source=\$date comment=mikhmon}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "3M/5M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m \
    mac-cookie-timeout=2d name=agus on-login=":put (\",rem,1000,31d,2000,,Disa\
    ble,\"); {:local date [ /system clock get date ];:local year [ :pick \$dat\
    e 7 11 ];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot us\
    er get [/ip hotspot user find where name=\"\$user\"] comment]; :local ucod\
    e [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$com\
    ment = \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$dat\
    e interval=\"31d\"; :delay 2s; :local exp [ /sys sch get [ /sys sch find w\
    here name=\"\$user\" ] next-run]; :local getxp [len \$exp]; :if (\$getxp =\
    \_15) do={ :local d [:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s\
    \_(\"/\"); :local exp (\"\$d\$s\$year \$t\"); /ip hotspot user set comment\
    =\$exp [find where name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspot \
    user set comment=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\$g\
    etxp > 15) do={ /ip hotspot user set comment=\$exp [find where name=\"\$us\
    er\"];}; /sys sch remove [find where name=\"\$user\"]}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "3M/5M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=wati \
    on-login=":put (\",remc,1000,31d,2000,,Disable,\"); {:local date [ /system\
    \_clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \
    \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find \
    where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\
    \$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch ad\
    d name=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-31d-|-wati-|-\$comment\" owner=\"\$month\$year\"\
    \_source=\$date comment=mikhmon}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=nazim \
    on-login=":put (\",remc,1000,31d,2000,,Disable,\"); {:local date [ /system\
    \_clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \
    \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find \
    where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\
    \$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch ad\
    d name=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-31d-|-nazim-|-\$comment\" owner=\"\$month\$year\
    \" source=\$date comment=mikhmon}}\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add insert-queue-before="==warung-evi" keepalive-timeout=4m name=dian \
    on-login=":put (\",rem,1000,31d,2000,,Disable,\"); {:local date [ /system \
    clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$\
    date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find wh\
    ere name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$u\
    code = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add n\
    ame=\"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s; :\
    local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]\
    ; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0\
    \_6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$\
    year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\
    \"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]}}\r\
    \n\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n:if ([/ip hotspot user get \$x uptime]<00:00:01 ) do={\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add add-mac-cookie=no insert-queue-before="==warung-evi" keepalive-timeout=4m \
    !mac-cookie-timeout name=-default-trial on-login=":put (\",,0,,,noexp,Disa\
    ble,\")\r\
    \n\r\
    \n\r\
    \n:local x \"\$user\";\r\
    \n{\r\
    \n:local nama \"\$user\";\r\
    \n:local ips [/ip hotspot active get [find user=\"\$nama\"] address];\r\
    \n:local exp [/ip hotspot user get [find name=\"\$nama\"] comment];\r\
    \n:local exp2 [ :pick \$exp 16 25 ];\r\
    \n:local profile [/ip hotspot user get [find name=\"\$nama\"] profile];\r\
    \n:local date \"\$[/system clock get date]\";\r\
    \n:local time \"\$[/system clock get time]\";\r\
    \n:local time2 [ :pick \$time 0 5 ];\r\
    \n:local mac [/ip hotspot active get [find user=\"\$nama\"] mac-address];\
    \r\
    \n:local host [/ip dhcp-server lease get [find address=\"\$ips\"] host-nam\
    e];\r\
    \n:local host2 [len \$host];\r\
    \n:if (\$host2 < 1) do={:set host (\$host \"<s>unknown</s>\");};\r\
    \n:if (\$host2 > 2) do={:set host (\$host \"\$host\");};\r\
    \n:local host3 [ :pick \$host 0 18 ];\r\
    \n:local lby [/ip hotspot active get [find user=\"\$nama\"] login-by];\r\
    \n:local limitjam [/ip hotspot user get [find name=\"\$nama\"] limit-uptim\
    e];\r\
    \n:local yasip  [ :pick \$limitjam  1 2 ];\r\
    \n:local yasip2 [ :pick \$limitjam  0 2 ];\r\
    \n:local limit [/ip hotspot active get [find user=\"\$nama\"] limit-bytes-\
    total];\r\
    \n:local totq [((\$limit)/1048576)];\r\
    \n:local useraktif [/ip hotspot active print count-only];\r\
    \n:local avgRtt;\r\
    \n/tool flood-ping \$ips count=5 do={\r\
    \n  :if (\$sent = 5) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001184386305&text=\\F0\\9F\\9F\
    \\A2 <b>TRIAL</b>%0A- pada : \$date %2d \$time2%0A- mac : \$mac%0A- hp : \
    \$host3%0A- ping ke hp : \$avgRtt%0Dms&parse_mode=html\" mode=http keep-re\
    sult=no;\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0" shared-users=unlimited
/queue simple
add disabled=yes max-limit=20M/35M name="Merpati PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.2.0/24
add disabled=yes max-limit=20M/35M name="Bebek PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.1.0/24
add max-limit=45M/45M name=merpati parent=rumahan target=10.10.2.0/24
add max-limit=25M/50M name=bebek parent=rumahan target=10.10.1.0/24
add limit-at=1k/1k max-limit=220k/220k name="~~blm bayar" parent=bebek \
    target=10.10.1.0/24
add limit-at=1k/1k max-limit=220k/220k name="~~blm bayar " parent=merpati \
    target=10.10.2.0/24
add burst-limit=0/9M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/8M name=topik parent=merpati queue=\
    pcq-upload-default/pcq-download-default target=10.10.2.11/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/7M name=bunasir parent=merpati target=10.10.2.13/32
add burst-limit=0/11M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/9M name=syukur parent=merpati target=10.10.2.27/32
add burst-limit=0/11M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/9M name=dinang parent=merpati target=10.10.2.16/32
add burst-limit=0/7M burst-threshold=0/6M burst-time=0s/5s limit-at=1M/2M \
    max-limit=3M/6M name=fuad parent=merpati target=10.10.2.17/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/5s limit-at=1M/2M \
    max-limit=3M/7M name=wati parent=merpati target=10.10.2.18/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/5s limit-at=1M/2M \
    max-limit=3M/9M name=ali-geprek parent=merpati target=10.10.2.19/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/5s limit-at=1M/2M \
    max-limit=3M/7M name=dian parent=merpati target=10.10.2.23/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/5s limit-at=1M/2M \
    max-limit=3M/7M name=rokhim parent=merpati target=10.10.2.24/32
add burst-limit=0/11M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/9M name=mul parent=merpati target=10.10.2.14/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=laeli parent=merpati target=10.10.2.26/32
add burst-limit=0/9M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/7M name=kukuh parent=bebek target=10.10.1.11/32
add limit-at=1M/2M max-limit=3M/6M name=amin parent=bebek target=\
    10.10.1.12/32
add burst-limit=0/10M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=wawan parent=bebek target=10.10.1.13/32
add limit-at=1k/1k max-limit=3M/6M name=irham parent=bebek target=\
    10.10.1.14/32
add limit-at=1M/2M max-limit=3M/6M name=ozi parent=bebek target=10.10.1.16/32
add limit-at=1M/2M max-limit=4M/10M name=slamet parent=bebek target=\
    10.10.1.15/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/9s limit-at=1M/2M \
    max-limit=3M/8M name=wawan-cafe parent=bebek target=10.10.1.17/32
add limit-at=1M/2M max-limit=4M/8M name=bayu-kantor parent=bebek target=\
    10.10.1.18/32
add limit-at=1M/2M max-limit=3M/6M name=sd-suro1 parent=bebek target=\
    10.10.1.19/32
add limit-at=1M/2M max-limit=4M/10M name=sd-pager3 parent=bebek target=\
    10.10.1.28/32
add limit-at=1M/2M max-limit=3M/6M name=bayu-rumah parent=bebek target=\
    10.10.1.20/32
add limit-at=1M/2M max-limit=3M/6M name=witno parent=bebek target=\
    10.10.1.21/32
add limit-at=1M/2M max-limit=3M/7M name=sri parent=bebek target=10.10.1.22/32
add limit-at=1M/2M max-limit=3M/6M name=aan parent=bebek target=10.10.1.23/32
add limit-at=1M/2M max-limit=3M/6M name=turino parent=bebek target=\
    10.10.1.24/32
add limit-at=1M/2M max-limit=3M/6M name=dikrom parent=bebek target=\
    10.10.1.25/32
add limit-at=1M/2M max-limit=3M/6M name=nazim parent=bebek target=\
    10.10.1.26/32
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=bacasaja policy="read,test,winbox,api,romon,!local,!telnet,!ssh,!ftp,\
    !reboot,!write,!policy,!password,!web,!sniff,!sensitive,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
add name=mikhmon policy="read,write,sensitive,api,!local,!telnet,!ssh,!ftp,!re\
    boot,!policy,!test,!winbox,!password,!web,!sniff,!romon,!dude,!tikapp"
add name=mikhmonbaca policy="read,sensitive,api,!local,!telnet,!ssh,!ftp,!rebo\
    ot,!write,!policy,!test,!winbox,!password,!web,!sniff,!romon,!dude,!tikapp\
    "
add name=romon policy="read,test,api,romon,!local,!telnet,!ssh,!ftp,!reboot,!w\
    rite,!policy,!winbox,!password,!web,!sniff,!sensitive,!dude,!tikapp"
/interface bridge port
add bridge=lan interface=ether6-tower
add bridge=lan interface=ether7
add bridge=lan interface=ether8-belakang
add bridge=lan interface=ether9-mirza
add bridge=lan interface=ether10
/ip firewall connection tracking
set tcp-established-timeout=30m
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add interface=ether1-isp1 list=ISP
add interface=ether2-isp2 list=ISP
add interface=ether6-tower list=LAN
add interface=ether7 list=LAN
add interface=ether8-belakang list=LAN
add interface=ether9-mirza list=LAN
add interface=ether10 list=LAN
add interface=vpn2 list=VPN
add interface=vvppnn1 list=VPN
add interface=vpn1 list=VPN
/interface ovpn-server server
set certificate=mnet.crt_0 keepalive-timeout=30
/interface pppoe-server server
add disabled=no interface=lan one-session-per-host=yes service-name=\
    MNET-UTAMA
/interface sstp-server server
set keepalive-timeout=30
/ip address
add address=10.10.12.1/24 interface=lan network=10.10.12.0
add address=172.16.0.1/22 interface=vlan-hotspot network=172.16.0.0
add address=192.168.55.1/24 interface=lan network=192.168.55.0
add address=192.168.18.2/24 interface=ether1-isp1 network=192.168.18.0
add address=10.20.254.1/30 interface=lan network=10.20.254.0
add address=192.168.23.5/24 interface=ether2-isp2 network=192.168.23.0
/ip cloud
set update-time=no
/ip dhcp-client
add add-default-route=no interface=ether1-isp1 use-peer-dns=no
add add-default-route=no interface=ether2-isp2 use-peer-dns=no
/ip dhcp-server lease
add address=172.16.3.251 client-id=1:ee:9d:a9:bb:3c:ce comment=\
    T-evi-warung-ALI mac-address=EE:9D:A9:BB:3C:CE server=dhcp1
add address=172.16.3.252 client-id=1:fa:c0:92:a4:5f:ba comment=\
    T-evi-warung-EVI mac-address=FA:C0:92:A4:5F:BA server=dhcp1
add address=172.16.3.250 client-id=1:4:b1:67:99:69:80 comment=abah \
    insert-queue-before=~~MIRZA mac-address=04:B1:67:99:69:80 rate-limit=\
    "3M/5M 0/0 0/0 0/0 8 0/0" server=dhcp1
add address=172.16.3.253 client-id=1:a4:cc:b9:1c:20:6f comment=\
    "T-evi-warung-ALI anyar" mac-address=A4:CC:B9:1C:20:6F server=dhcp1
add address=172.16.3.254 client-id=1:80:35:c1:30:ce:80 comment=mirza \
    insert-queue-before=~~MIRZA mac-address=80:35:C1:30:CE:80 rate-limit=\
    "20M/20M 0/0 0/0 0/0 8 0/0" server=dhcp1
add address=172.16.3.249 comment="tv belakang" insert-queue-before=first \
    mac-address=04:95:73:F9:96:D7 rate-limit="10M/10M 0/0 0/0 0/0 8 0/0" \
    server=dhcp1
/ip dhcp-server network
add address=172.16.0.0/22 gateway=172.16.0.1
/ip dns
set allow-remote-requests=yes cache-size=51200KiB servers=10.123.22.7
/ip dns static
add address=172.16.0.1 name=hotspot.com ttl=5m
/ip firewall address-list
add address=172.16.0.0/22 comment=hotspot-voucher/12 list=ip-local
add address=10.10.12.2 comment=rtrw-muksin list=ip-local
add address=www.biznetnetworks.com list=z-list-ip-web-blokir
add address=surfshark.com list=z-list-ip-speedtest-statik
add address=www.privateinternetaccess.com list=z-list-ip-speedtest-statik
add address=dnschecker.org list=z-list-ip-speedtest-statik
add address=id.wizcase.com list=z-list-ip-speedtest-statik
add address=whatsmyip.org list=z-list-ip-speedtest-statik
add address=speedtest.net list=z-list-ip-speedtest-statik
add address=fast.com list=z-list-ip-speedtest-statik
add address=whatismyip.net list=z-list-ip-speedtest-statik
add address=iplocation.net list=z-list-ip-speedtest-statik
add address=ifconfig.co list=z-list-ip-speedtest-statik
add address=whatismyip.org list=z-list-ip-speedtest-statik
add address=ip-adress.eu list=z-list-ip-speedtest-statik
add address=whatismybrowser.com list=z-list-ip-speedtest-statik
add address=ipchicken.com list=z-list-ip-speedtest-statik
add address=whatismyip.li list=z-list-ip-speedtest-statik
add address=cbn.net.id list=z-list-ip-speedtest-statik
add address=whatismyip4.com list=z-list-ip-speedtest-statik
add address=ipcow.com list=z-list-ip-speedtest-statik
add address=wtfismyip.com list=z-list-ip-speedtest-statik
add address=whatismyip.network list=z-list-ip-speedtest-statik
add address=myipaddress.com list=z-list-ip-speedtest-statik
add address=whatismyip.com list=z-list-ip-speedtest-statik
add address=ipleak.net list=z-list-ip-speedtest-statik
add address=whatismyipaddress.com list=z-list-ip-speedtest-statik
add address=whatismyip.host list=z-list-ip-speedtest-statik
add address=check-host.net list=z-list-ip-speedtest-statik
add address=ipleak.com list=z-list-ip-speedtest-statik
add address=myip.com list=z-list-ip-speedtest-statik
add address=whatismypublicip.com list=z-list-ip-speedtest-statik
add address=ip2location.com list=z-list-ip-speedtest-statik
add address=whatismyip.live list=z-list-ip-speedtest-statik
add address=whatsmyip.com list=z-list-ip-speedtest-statik
add address=dnsleaktest.com list=z-list-ip-speedtest-statik
add address=ipsaya.com list=z-list-ip-speedtest-statik
add address=touch.whatsmyip.org list=z-list-ip-speedtest-statik
add address=c.speedtest.net list=z-list-ip-speedtest-statik
add address=speed.mncplay.id list=z-list-ip-speedtest-statik
add address=test-ipv6.com list=z-list-ip-speedtest-statik
add address=speedtest.com.sg list=z-list-ip-speedtest-statik
add address=api.speedspot.org list=z-list-ip-speedtest-statik
add address=speed.ui.com list=z-list-ip-speedtest-statik
add address=speed.cloudflare.com list=z-list-ip-speedtest-statik
add address=speedtestcustom.com list=z-list-ip-speedtest-statik
add address=bgp.he.net list=z-list-ip-speedtest-statik
add address=he.net list=z-list-ip-speedtest-statik
add address=ipinfo.io list=z-list-ip-speedtest-statik
add address=speedsmart.net list=z-list-ip-speedtest-statik
add address=whatsmyip.net list=z-list-ip-speedtest-statik
add address=ip4.host list=z-list-ip-speedtest-statik
add address=whoismyisp.org list=z-list-ip-speedtest-statik
add address=showmyisp.com list=z-list-ip-speedtest-statik
add address=cekipsaya.com list=z-list-ip-speedtest-statik
add address=speedof.me list=z-list-ip-speedtest-statik
add address=ipstack.com list=z-list-ip-speedtest-statik
add address=spyber.com list=z-list-ip-speedtest-statik
add address=inet-ip.info list=z-list-ip-speedtest-statik
add address=api.fast.com list=z-list-ip-speedtest-statik
add address=iplocation.com list=z-list-ip-speedtest-statik
add address=whatsmyrouterip.com list=z-list-ip-speedtest-statik
add address=what-is-my-ipv4.com list=z-list-ip-speedtest-statik
add address=ip.me list=z-list-ip-speedtest-statik
add address=realip.info list=z-list-ip-speedtest-statik
add address=ipvoid.com list=z-list-ip-speedtest-statik
add address=ip.zscaler.com list=z-list-ip-speedtest-statik
add address=ipv4.lookup.test-ipv6.com list=z-list-ip-speedtest-statik
add address=whatismyasn.org list=z-list-ip-speedtest-statik
add address=mybrowserinfo.com list=z-list-ip-speedtest-statik
add address=tools.ip2location.com list=z-list-ip-speedtest-statik
add address=myglobalip.com list=z-list-ip-speedtest-statik
add address=speedcheckerapi.com list=z-list-ip-speedtest-statik
add address=www.speedcheckerapi.com list=z-list-ip-speedtest-statik
add address=v4.myipstack.com list=z-list-ip-speedtest-statik
add address=ip.nf list=z-list-ip-speedtest-statik
add address=ipku.in list=z-list-ip-speedtest-statik
add address=noc.kemdikbud.go.id list=z-list-ip-speedtest-statik
add address=speedtest.padinet.com list=z-list-ip-speedtest-statik
add address=dnsleak.com list=z-list-ip-speedtest-statik
add address=ws-ipv4.nperf.com list=z-list-ip-speedtest-statik
add address=mapi.clearlink.com list=z-list-ip-speedtest-statik
add address=checkip.dyndns.org list=z-list-ip-speedtest-statik
add address=www.ip-adress.com list=z-list-ip-speedtest-statik
add address=ipcost.com list=z-list-ip-speedtest-statik
add address=knrpc.olark.com list=z-list-ip-speedtest-statik
add address=speedtest.cni.net.id list=z-list-ip-speedtest-statik
add address=speedtest.kemsos.net list=z-list-ip-speedtest-statik
add address=ipaddress.my list=z-list-ip-speedtest-statik
add address=speedtest.unair.ac.id list=z-list-ip-speedtest-statik
add address=net.etrality.com list=z-list-ip-speedtest-statik
add address=ipapi.co list=z-list-ip-speedtest-statik
add address=nordvpn.com list=z-list-ip-speedtest-statik
add address=speedtest-idc.hypernet.co.id list=z-list-ip-speedtest-statik
add address=mw.ipburger.com list=z-list-ip-speedtest-statik
add address=www.xmyip.com list=z-list-ip-speedtest-statik
add address=www.alleasyseo.com list=z-list-ip-speedtest-statik
add address=kinsta.com list=z-list-ip-speedtest-statik
add address=speedtest.cbn.id list=z-list-ip-speedtest-statik
add address=c.speedtestcustom.com list=z-list-ip-speedtest-statik
add address=10.20.254.2 comment="admin-mirza rumah" list=ip-local
add address=www.showmyipaddress.eu list=z-list-ip-speedtest-statik
add address=xmyip.com list=z-list-ip-speedtest-statik
add address=www.expressvpn.com list=z-list-ip-speedtest-statik
add address=www.iplocation.net list=z-list-ip-speedtest-statik
add address=www.astrill.com list=z-list-ip-speedtest-statik
add address=www.ultratools.com list=z-list-ip-speedtest-statik
add address=www.ip-adress.eu list=z-list-ip-speedtest-statik
add address=iplogger.org list=z-list-ip-speedtest-statik
add address=www.vermiip.es list=z-list-ip-speedtest-statik
add address=www.whatismybrowser.com list=z-list-ip-speedtest-statik
add address=zenmate.com list=z-list-ip-speedtest-statik
add address=www.ipchicken.com list=z-list-ip-speedtest-statik
add address=www.ipburger.com list=z-list-ip-speedtest-statik
add address=cactusvpn.com list=z-list-ip-speedtest-statik
add address=www.cactusvpn.com list=z-list-ip-speedtest-statik
add address=whatismycountry.com list=z-list-ip-speedtest-statik
add address=ipinfo.info list=z-list-ip-speedtest-statik
add address=www.myipaddress.com list=z-list-ip-speedtest-statik
add address=www.ipleak.net list=z-list-ip-speedtest-statik
add address=api.tunnelbear.com list=z-list-ip-speedtest-statik
add address=ipv6test.hide.me list=z-list-ip-speedtest-statik
add address=checkip.perfect-privacy.com list=z-list-ip-speedtest-statik
add address=www.whatsmyip.org list=z-list-ip-speedtest-statik
add address=192.168.15.1-192.168.25.254 comment=\
    "192.168.15.1   -   192.168.25.254" list=z-list-ip-redirect
add address=10.10.0.0/16 comment="      10.10.0.1   -   10.10.255.254" list=\
    z-list-ip-redirect
add address=172.16.0.0/22 comment="    172.16.0.1   -   172.16.3.254" list=\
    z-list-ip-redirect
add address=internetpositif.uzone.id list=z-list-ip-web-blokir
add address=151.101.86.219 comment="SEJEN DEWEK" list=\
    z-list-ip-speedtest-statik
add address=www.speedtest.net.cdn.cloudflare.net list=\
    z-list-ip-speedtest-statik
add address=dualstack.zd.map.fastly.net list=z-list-ip-speedtest-statik
add address=zd.map.fastly.net list=z-list-ip-speedtest-statik
add address=prd.nperf.com list=z-list-ip-speedtest-statik
add address=192.168.15.1-192.168.29.254 comment=192.168.15.1-192.168.29.254 \
    list=ip-modem-isp
add address=www.ipaddress.com list=z-list-ip-speedtest-statik
add address=www.indihome.co.id list=z-list-ip-web-blokir
add address=speedtest.uin-suka.ac.id list=z-list-ip-speedtest-statik
add address=ispeedtest.bpk.go.id list=z-list-ip-speedtest-statik
add address=speedtest.yam.net.id list=z-list-ip-speedtest-statik
add address=speedtest.net.in list=z-list-ip-speedtest-statik
add address=www.fireprobe.net list=z-list-ip-speedtest-statik
add address=speedtest.mybroadband.co.za list=z-list-ip-speedtest-statik
add address=www.maxmind.com list=z-list-ip-speedtest-statik
add address=api.ip2location.com list=z-list-ip-speedtest-statik
add address=www.ipvanish.com list=z-list-ip-speedtest-statik
add address=api.mxtoolbox.com list=z-list-ip-speedtest-statik
add address=www.my-ip-finder.com list=z-list-ip-speedtest-statik
add address=locator.atlasvpn.com list=z-list-ip-speedtest-statik
add address=www.vyprvpn.com list=z-list-ip-speedtest-statik
add address=account.hotspotshield.com list=z-list-ip-speedtest-statik
add address=www.namecheap.com list=z-list-ip-speedtest-statik
add address=browserleaks.com list=z-list-ip-speedtest-statik
add address=192.168.55.0/24 comment="ip private PTP MNET" list=\
    ip-local-private
add address=10.123.22.1 list=ip-vpn-lokal
add address=8.8.8.8 comment="DNS GOOGLE" list=ip-private
add address=8.8.4.4 comment="DNS GOOGLE" list=ip-private
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=ip-private
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=ip-private
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private
add address=9.9.9.9 comment="DNS QUAD 9" list=ip-private
add address=149.112.112.112 comment="DNS QUAD 9" list=ip-private
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private
add address=208.67.222.222 comment="DNS OpenDNS" list=ip-private
add address=208.67.220.220 comment="DNS OpenDNS" list=ip-private
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=ip-private
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=ip-private
add address=94.140.14.14 comment="DNS AdGuard" list=ip-private
add address=94.140.15.15 comment="DNS AdGuard" list=ip-private
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=ip-private
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=ip-private
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    ip-private
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    ip-private
add address=77.88.8.1 comment="DNS Yandex" list=ip-private
add address=77.88.8.8 comment="DNS Yandex" list=ip-private
add address=211.233.84.186 comment=SNTP list=ip-private
add address=216.239.35.4 comment=SNTP list=ip-private
add address=download.mikrotik.com comment=LAINNYA list=ip-private
add address=api.telegram.org comment=LAINNYA list=ip-private
add address=licence.mikrotik.com comment=LAINNYA list=ip-private
add address=vpn.mnet.my.id comment=LAINNYA list=ip-private
add address=mnet.my.id comment=LAINNYA list=ip-private
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-private&lokal
add address=8.8.8.8 comment="DNS GOOGLE" list=ip-private&lokal
add address=8.8.4.4 comment="DNS GOOGLE" list=ip-private&lokal
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=ip-private&lokal
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=ip-private&lokal
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private&lokal
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    ip-private&lokal
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private&lokal
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    ip-private&lokal
add address=9.9.9.9 comment="DNS QUAD 9" list=ip-private&lokal
add address=149.112.112.112 comment="DNS QUAD 9" list=ip-private&lokal
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private&lokal
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    ip-private&lokal
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private&lokal
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    ip-private&lokal
add address=208.67.222.222 comment="DNS OpenDNS" list=ip-private&lokal
add address=208.67.220.220 comment="DNS OpenDNS" list=ip-private&lokal
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private&lokal
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=\
    ip-private&lokal
add address=94.140.14.14 comment="DNS AdGuard" list=ip-private&lokal
add address=94.140.15.15 comment="DNS AdGuard" list=ip-private&lokal
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=\
    ip-private&lokal
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=\
    ip-private&lokal
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    ip-private&lokal
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    ip-private&lokal
add address=77.88.8.1 comment="DNS Yandex" list=ip-private&lokal
add address=77.88.8.8 comment="DNS Yandex" list=ip-private&lokal
add address=211.233.84.186 comment=SNTP list=ip-private&lokal
add address=216.239.35.4 comment=SNTP list=ip-private&lokal
add address=download.mikrotik.com comment=LAINNYA list=ip-private&lokal
add address=api.telegram.org comment=LAINNYA list=ip-private&lokal
add address=licence.mikrotik.com comment=LAINNYA list=ip-private&lokal
add address=vpn.mnet.my.id comment=LAINNYA list=ip-private&lokal
add address=mnet.my.id comment=LAINNYA list=ip-private&lokal
add address=103.143.170.11 comment=vpn-idnix list=ip-vpn-publik
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE disabled=yes list=\
    ip-local-private
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-local-private
add address=10.20.254.2 comment="admin-mirza rumah" list=ip-local-to-isp2
add address=10.10.2.24 comment=merpati-rohkim disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.25 comment=merpati-mala disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.26 comment=merpati-laeli disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.16 comment=merpati-dinang disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.23 comment=merpati-dian disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.19 comment=merpati-ali-geprek disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.22 comment=bebek-sri list=ip-local-to-isp1
add address=10.10.1.15 comment=bebek-slamet disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.26 comment=bebek-nazim disabled=yes list=ip-local-to-isp1
add address=10.10.1.11 comment=bebek-kukuh disabled=yes list=ip-local-to-isp1
add address=10.10.1.20 comment=bebek-bayu-rumah disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.18 comment=bebek-bayu-kantor disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.18 comment="merpati-wati @ TGL 4 NOV" disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.11 comment=merpati-topik disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.27 comment="merpati-syukur @FIX RTO" disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.17 comment="merpati-fuad @FIX RTO" disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.13 comment=merpati-bunasir disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.21 comment=bebek-witno disabled=yes list=ip-local-to-isp1
add address=10.10.1.13 comment=bebek-wawan-rumah disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.17 comment=bebek-wawan-cafe disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.24 comment=bebek-turino disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.19 comment=bebek-sd-suro-1 disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.16 comment=bebek-ozi disabled=yes list=ip-local-to-isp1
add address=10.10.1.14 comment=bebek-irham disabled=yes list=ip-local-to-isp1
add address=10.10.1.25 comment=bebek-dikrom disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.12 comment=bebek-amin disabled=yes list=ip-local-to-isp1
add address=10.10.1.23 comment=bebek-aan disabled=yes list=ip-local-to-isp1
add address=10.10.2.14 comment=merpati-mul disabled=yes list=ip-local-to-isp1
add address=10.10.12.2 comment=rtrw-muksin list=ip-local-to-isp2
add address=fm1.firstmedia.com list=z-list-ip-web-blokir
add address=firstmedia.com list=z-list-ip-web-blokir
add address=internetsehat.firstmedia.com list=z-list-ip-web-blokir
add address=10.10.2.0/24 comment=merpati/24 list=ip-local-to-isp2
add address=10.10.1.0/24 comment=bebek/24 list=ip-local-to-isp2
add address=172.16.0.0/22 comment=hotspot-voucher/12 list=ip-local-to-isp2
add address=vpn.mnet.my.id list=ip-vpn-publik
add address=10.10.1.28 comment=bebek-sd-pager-3 list=ip-local-to-isp1
add address=10.10.2.254 comment=merpati-belakangrumah list=ip-local-to-isp1
add address=172.16.0.0/22 comment=@@hotspot-voucher/12 list=ip-local-to-isp1
add address=www.uzone.id list=z-list-ip-web-blokir
add address=mercusuar.uzone.id list=z-list-ip-web-blokir
add address=172.16.0.0/22 comment=hotspot-voucher/12 list=ip-local-game
add address=10.10.1.11 comment=bebek-kukuh list=ip-local-game
add address=10.10.1.12 comment=bebek-amin list=ip-local-game
add address=10.10.1.13 comment=bebek-wawan list=ip-local-game
add address=10.10.1.14 comment=bebek-irham disabled=yes list=ip-local-game
add address=10.10.1.15 comment=bebek-slamet disabled=yes list=ip-local-game
add address=10.10.1.16 comment=bebek-ozi list=ip-local-game
add address=10.10.1.17 comment=bebek-wawancafe list=ip-local-game
add address=10.10.1.18 comment=bebek-bayukantor list=ip-local-game
add address=10.10.1.19 comment=bebek-sdsuro1 disabled=yes list=ip-local-game
add address=10.10.1.20 comment=bebek-bayurumah list=ip-local-game
add address=10.10.1.21 comment=bebek-witno list=ip-local-game
add address=10.10.1.22 comment=bebek-sri list=ip-local-game
add address=10.10.1.23 comment=bebek-aan list=ip-local-game
add address=10.10.1.24 comment=bebek-turino list=ip-local-game
add address=10.10.1.25 comment=bebek-dikrom list=ip-local-game
add address=10.10.1.26 comment=bebek-nazim disabled=yes list=ip-local-game
add address=10.10.1.28 comment=bebek-sdpager3 disabled=yes list=ip-local-game
add address=10.10.2.11 comment=bebek-topik list=ip-local-game
add address=10.10.2.13 comment=tegal-bunasir list=ip-local-game
add address=10.10.2.14 comment=tegal-mul list=ip-local-game
add address=10.10.2.16 comment=tegal-dinang list=ip-local-game
add address=10.10.2.17 comment=tegal-fuad list=ip-local-game
add address=10.10.2.18 comment=tegal-wati disabled=yes list=ip-local-game
add address=10.10.2.19 comment=tegal-aligeprek list=ip-local-game
add address=10.10.2.23 comment=tegal-dian list=ip-local-game
add address=10.10.2.24 comment=tegal-rokhim list=ip-local-game
add address=10.10.2.25 comment=tegal-mala list=ip-local-game
add address=10.10.2.26 comment=tegal-laeli list=ip-local-game
add address=10.10.2.27 comment=tegal-syukur list=ip-local-game
add address=10.10.2.254 comment=tegal-rumahbelakang list=ip-local-game
add address=10.10.12.2 comment=muksin list=ip-local-game-2
add address=10.10.2.12 comment=merpati-masjidmudzakirin disabled=yes list=\
    ip-local-to-isp1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=add-src-to-address-list address-list=zzz-list-lp-brute-force-1 \
    address-list-timeout=10m chain=input comment=\
    "                DROP brute force ping" packet-size=100 protocol=icmp
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-final \
    address-list-timeout=1h chain=input packet-size=200 protocol=icmp \
    src-address-list=zzz-list-lp-brute-force-1
add action=drop chain=input protocol=icmp src-address-list=\
    zzz-list-ip-brute-force-final
add action=drop chain=forward comment="                DROP tracert" \
    icmp-options=11:0 in-interface-list=ISP protocol=icmp
add action=drop chain=forward icmp-options=3:3 in-interface-list=ISP \
    protocol=icmp
add action=drop chain=input comment="                DROP (neighbor dis 5678) \
    (mac address 20561) (snmp 161,162) (dude 2210,2211) (proxy 3128,8080) (bte\
    st 2000,3000) (tracert 33434-33534) (dns 53,5353,853)" dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534,53,5353,853 \
    in-interface-list=ISP protocol=tcp
add action=drop chain=input dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534,53,5353,853 \
    in-interface-list=ISP protocol=udp
add action=drop chain=input comment=\
    "                DROP (winbox 21,22,23,8291,8728,8729,80,443)" dst-port=\
    21,22,23,8291,8728,8729,80,443,8085 in-interface-list=ISP protocol=tcp
add action=drop chain=input dst-port=21,22,23,8291,8728,8729,80,443,8085 \
    in-interface-list=ISP protocol=udp
add action=passthrough chain=unused-hs-chain comment="COBA DI BAWAH" \
    disabled=yes
add action=accept chain=input disabled=yes src-address=10.20.254.2
add action=jump chain=input comment="                DROP SYN Flood protect | \
    /ip settings set tcp-syncookies=yes" connection-state=new disabled=yes \
    jump-target=SYN-input protocol=tcp tcp-flags=syn
add action=accept chain=SYN-input connection-state=new disabled=yes limit=\
    400,5:packet protocol=tcp tcp-flags=syn
add action=drop chain=SYN-input connection-state=new disabled=yes protocol=\
    tcp tcp-flags=syn
/ip firewall mangle
add action=mark-routing chain=prerouting comment=\
    "                Routing VPN > ISP 2" disabled=yes dst-address-list=\
    ip-vpn-publik new-routing-mark=ether2 passthrough=no src-address-list=\
    ip-local
add action=mark-routing chain=prerouting comment=\
    "                BYPASS speedtest" dst-address-list=\
    z-list-ip-speedtest-statik dst-port=80,443,5060 new-routing-mark=vpn \
    passthrough=no protocol=tcp src-address-list=ip-local
add action=jump chain=forward dst-address-list=z-list-ip-speedtest-statik \
    dst-port=80,443,5060 jump-target=vip protocol=tcp src-address-list=\
    ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=vip \
    protocol=tcp src-address-list=z-list-ip-speedtest-statik src-port=\
    80,443,5060
add action=mark-routing chain=prerouting comment=\
    "                ROUTING apps" dst-address-list=!ip-local-private \
    dst-port=8080 new-routing-mark=ether1 passthrough=no protocol=tcp \
    src-address-list=ip-local
add action=mark-packet chain=forward dst-address-list=!ip-local-private \
    dst-port=8080 new-packet-mark=speedtest passthrough=no protocol=tcp \
    src-address=10.10.0.0/21
add action=mark-packet chain=forward dst-address=10.10.0.0/21 \
    new-packet-mark=speedtest passthrough=no protocol=tcp src-address-list=\
    !ip-local-private src-port=8080
add action=passthrough chain=GAME comment="                BYPASS game" \
    disabled=yes
add action=mark-routing chain=prerouting comment=isp1 dst-address-list=\
    !ip-private&lokal dst-port=5001-5180,5501-5680,9443,30000-30220,9001 \
    new-routing-mark=ether1 passthrough=no protocol=tcp src-address-list=\
    ip-local-to-isp2
add action=mark-routing chain=prerouting comment=isp1 dst-address-list=\
    !ip-private&lokal dst-port=5001-5180,5501-5680,9992,30020-30220,9001 \
    new-routing-mark=ether1 passthrough=no protocol=udp src-address-list=\
    ip-local-to-isp2
add action=jump chain=forward dst-address-list=!ip-private&lokal dst-port=\
    5001-5180,5501-5680,9443,30000-30220,9001 jump-target=game-ml protocol=\
    tcp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=tcp src-address-list=!ip-private&lokal src-port=\
    5001-5180,5501-5680,9443,30000-30220,9001
add action=jump chain=forward dst-address-list=!ip-private&lokal dst-port=\
    5001-5180,5501-5680,9992,30020-30220,9001 jump-target=game-ml protocol=\
    udp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=udp src-address-list=!ip-private&lokal src-port=\
    5001-5180,5501-5680,9992,30020-30220,9001
add action=mark-packet chain=game-ml new-packet-mark=game-ml passthrough=no
add action=mark-routing chain=prerouting comment=isp1 dst-address-list=\
    !ip-private&lokal dst-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007 \
    new-routing-mark=ether1 passthrough=no protocol=tcp src-address-list=\
    ip-local-to-isp2
add action=mark-routing chain=prerouting comment=isp1 dst-address-list=\
    !ip-private&lokal dst-port=6008,7008,8008,9008,10000-10009,11000-11019 \
    new-routing-mark=ether1 passthrough=no protocol=udp src-address-list=\
    ip-local-to-isp2
add action=jump chain=forward dst-address-list=!ip-private&lokal dst-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007 \
    jump-target=game-ff protocol=tcp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=tcp src-address-list=!ip-private&lokal src-port=\
    6006,7006,8006,9006,11000-11019,39003,39006,39698,39779,10000-10007
add action=jump chain=forward dst-address-list=!ip-private&lokal dst-port=\
    6008,7008,8008,9008,10000-10009,11000-11019 jump-target=game-ff protocol=\
    udp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=udp src-address-list=!ip-private&lokal src-port=\
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
add action=mark-routing chain=prerouting comment=\
    "                ROUTING koneksi" dst-address-list=!ip-modem-isp \
    new-routing-mark=ether1 passthrough=no src-address-list=ip-local-to-isp1
add action=mark-routing chain=prerouting dst-address-list=!ip-modem-isp \
    new-routing-mark=ether2 passthrough=no src-address-list=ip-local-to-isp2
add action=change-ttl chain=forward comment=\
    "                DISABLE hotspot tethering" disabled=yes dst-address=\
    172.16.0.0/22 new-ttl=set:1 passthrough=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local to-addresses=10.123.22.7 to-ports=53
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local to-addresses=10.123.22.7 to-ports=53
add action=dst-nat chain=dstnat comment=vpn2 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local to-addresses=10.123.22.1 to-ports=53
add action=dst-nat chain=dstnat comment=vpn2 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local to-addresses=10.123.22.1 to-ports=53
add action=dst-nat chain=dstnat comment=isp2 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local-to-isp2 to-addresses=192.168.23.1 to-ports=\
    53
add action=dst-nat chain=dstnat comment=isp2 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local-to-isp2 to-addresses=192.168.23.1 to-ports=\
    53
add action=dst-nat chain=dstnat comment=isp1 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local to-addresses=192.168.18.1 to-ports=53
add action=dst-nat chain=dstnat comment=isp1 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local to-addresses=192.168.18.1 to-ports=53
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT modem isp > vpn" dst-port=14561 protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=192.168.18.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14562 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.23.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14563 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.22.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14564 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.19.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14565 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.21.1 to-ports=80
add action=dst-nat chain=dstnat comment="vpn.mnet.my.id:14446 | OMNITIK" \
    dst-port=14446 protocol=tcp src-address-list=ip-vpn-lokal to-addresses=\
    192.168.55.6 to-ports=8291
add action=dst-nat chain=dstnat comment=kukuh dst-port=44321 protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=10.10.1.11 to-ports=8080
add action=masquerade chain=srcnat dst-address-list=ip-modem-isp \
    src-address-list=ip-vpn-lokal
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT ftp lokal > vps mnet" dst-address=192.168.55.1 \
    dst-port=21 protocol=tcp src-address=192.168.55.0/24 to-addresses=\
    103.143.170.11 to-ports=21
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT login page:80 > vps mnet" dst-address-list=\
    z-list-ip-redirect dst-port=80,8080 protocol=tcp src-address-list=\
    z-list-ip-redirect to-addresses=103.143.170.11 to-ports=80
add action=dst-nat chain=dstnat disabled=yes dst-address-list=\
    z-list-ip-web-blokir dst-port=80,443 protocol=tcp src-address-list=\
    z-list-ip-redirect to-addresses=149.154.167.99
add action=masquerade chain=srcnat comment="                KE INTERNET" \
    src-address=10.20.254.2
add action=masquerade chain=srcnat dst-address-list=ip-private \
    out-interface-list=ISP src-address=192.168.55.0/24
add action=masquerade chain=srcnat out-interface-list=ISP+VPN \
    src-address-list=ip-local
/ip hotspot ip-binding
add comment="AP 02 evi warung" mac-address=88:D2:74:D2:73:C6 type=bypassed
add comment="AP 03 agus warung" mac-address=9C:6F:52:C0:7B:84 type=bypassed
add comment="AP 09 kukuh rumah" mac-address=E8:48:B8:7C:7E:72 type=bypassed
add comment="AP 15 wati warung" mac-address=9C:6F:52:C0:AF:98 type=bypassed
add comment="AP 16 dian rumah" mac-address=60:18:88:D6:55:F6 type=bypassed
add comment="AP 21 wawan rumah" mac-address=60:18:88:B5:4A:92 type=bypassed
add comment="AP 22 wawan cafe" mac-address=28:FF:3E:E8:1E:EC type=bypassed
add comment="AP 23 nazim warung" mac-address=D4:76:EA:BB:62:CB type=bypassed
add comment="AP 24 witno rumah" mac-address=AC:64:62:F8:0C:AA type=bypassed
add comment=T-evi-warung-ALI mac-address=EE:9D:A9:BB:3C:CE type=bypassed
add comment=T-evi-warung-EVI mac-address=FA:C0:92:A4:5F:BA type=bypassed
add comment="T-evi-warung-ALI anyar" mac-address=A4:CC:B9:1C:20:6F type=\
    bypassed
add comment=~~ABAH mac-address=04:B1:67:99:69:80 type=bypassed
add comment="~~TV BELAKANG" mac-address=04:95:73:F9:96:D7 type=bypassed
add comment="~~MIRZA LAPTOP HP" disabled=yes mac-address=5C:5F:67:93:12:41 \
    type=bypassed
add comment="~~MIRZA LAPTOP JADUL" disabled=yes mac-address=DC:85:DE:8C:E1:FF \
    type=bypassed
add comment="ciw924 | OPPO-A54 " disabled=yes mac-address=32:38:03:E9:EC:8A \
    type=blocked
add comment="7jui64 | android-6dd1a81e1faa8aae" disabled=yes mac-address=\
    CC:2D:83:9B:C0:BA type=blocked
add comment="wvi728 | vivo-2007" disabled=yes mac-address=10:BC:97:0B:75:F5 \
    type=blocked
/ip hotspot user
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ggp353 password=ggp353 \
    profile=-default-1-hp
add comment="jun/01/2055 19:51:55" name=cobawifidulu password=cobawifidulu
add comment="jun/01/2055 19:51:55" name=cobawifidisit password=cobawifidisit
add comment="jun/01/2055 19:51:55" name=cobawifidelet password=cobawifidelet
add comment="jun/01/2055 19:51:55" name=mnet212 password=mnet212 profile=\
    -default-1-hp
add comment="jun/01/2055 19:51:55" name=merpati3871 password=merpati3871 \
    profile=-default-1-hp
add comment="jun/23/2023 09:30:15" limit-uptime=8h name=zxz683 password=\
    zxz683 profile=-default-1-hp
add comment="jul/03/2023 08:27:40" limit-uptime=8h name=rmg639 password=\
    rmg639 profile=agus
add comment="jul/05/2023 21:52:02" limit-uptime=8h name=pae278 password=\
    pae278 profile=agus
add comment="jul/08/2023 17:38:57" limit-uptime=8h name=dix562 password=\
    dix562 profile=-default-1-hp
add comment="jun/28/2023 21:29:33" limit-uptime=8h name=grw424 password=\
    grw424 profile=agus
add comment="jun/30/2023 17:14:23" limit-uptime=8h name=dcc463 password=\
    dcc463 profile=agus
add comment="jun/25/2023 20:26:26" limit-uptime=8h name=kyg489 password=\
    kyg489 profile=agus
add comment="jun/29/2023 18:07:42" limit-uptime=8h name=iic682 password=\
    iic682 profile=agus
add comment="jul/03/2023 01:34:12" limit-uptime=8h name=ncd749 password=\
    ncd749 profile=agus
add comment="jun/25/2023 18:42:14" limit-uptime=8h name=nxd924 password=\
    nxd924 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xus758 password=xus758 \
    profile=-default-1-hp
add comment="jul/03/2023 00:04:57" limit-uptime=8h name=cmn786 password=\
    cmn786 profile=agus
add comment="jul/05/2023 09:15:13" limit-uptime=8h name=mwa787 password=\
    mwa787 profile=agus
add comment="jul/04/2023 23:54:50" limit-uptime=8h name=azd942 password=\
    azd942 profile=agus
add comment="jul/01/2023 16:49:11" limit-uptime=8h name=rbb933 password=\
    rbb933 profile=agus
add comment="jul/02/2023 07:23:33" limit-uptime=8h name=fgr575 password=\
    fgr575 profile=agus
add comment="jul/05/2023 02:06:52" limit-uptime=8h name=kpu748 password=\
    kpu748 profile=agus
add comment="jul/04/2023 04:56:00" limit-uptime=8h name=sez445 password=\
    sez445 profile=agus
add comment="jul/05/2023 16:34:46" limit-uptime=8h name=hna729 password=\
    hna729 profile=agus
add comment="jul/02/2023 21:27:59" limit-uptime=8h name=tmv922 password=\
    tmv922 profile=agus
add comment="jun/27/2023 16:55:06" limit-uptime=8h name=rre765 password=\
    rre765 profile=agus
add comment="jul/02/2023 09:11:17" limit-uptime=8h name=aea863 password=\
    aea863 profile=agus
add comment="jul/02/2023 21:50:35" limit-uptime=8h name=hwz945 password=\
    hwz945 profile=agus
add comment="jul/07/2023 23:09:05" limit-uptime=8h name=jzb932 password=\
    jzb932 profile=-default-1-hp
add comment="jul/07/2023 07:30:20" limit-uptime=8h name=emr578 password=\
    emr578 profile=-default-1-hp
add comment="jul/05/2023 12:01:43" limit-uptime=8h name=fmj248 password=\
    fmj248 profile=agus
add comment="jul/01/2023 06:22:15" limit-uptime=8h name=sfb737 password=\
    sfb737 profile=agus
add comment="jun/29/2023 18:27:01" limit-uptime=8h name=jxt882 password=\
    jxt882 profile=agus
add comment="jun/27/2023 16:14:16" limit-uptime=8h name=muu662 password=\
    muu662 profile=agus
add comment="jul/01/2023 22:44:18" limit-uptime=8h name=fur538 password=\
    fur538 profile=agus
add comment="jul/01/2023 09:40:01" limit-uptime=8h name=mdk398 password=\
    mdk398 profile=agus
add comment="jul/04/2023 06:55:29" limit-uptime=8h name=erd862 password=\
    erd862 profile=agus
add comment="jul/08/2023 09:21:44" limit-uptime=8h name=fxs862 password=\
    fxs862 profile=-default-1-hp
add comment="jul/01/2023 12:49:50" limit-uptime=8h name=jui776 password=\
    jui776 profile=agus
add comment="jul/06/2023 09:57:30" limit-uptime=8h name=apw527 password=\
    apw527 profile=agus
add comment="jul/03/2023 16:36:45" limit-uptime=8h name=yjh863 password=\
    yjh863 profile=agus
add comment="jun/28/2023 07:16:38" limit-uptime=8h name=msi285 password=\
    msi285 profile=agus
add comment="jul/04/2023 21:30:07" limit-uptime=8h name=tvj724 password=\
    tvj724 profile=agus
add comment="jun/30/2023 23:09:59" limit-uptime=8h name=fae688 password=\
    fae688 profile=agus
add comment="jul/06/2023 01:07:30" limit-uptime=8h name=imz267 password=\
    imz267 profile=agus
add comment="jul/04/2023 12:57:59" limit-uptime=8h name=dki432 password=\
    dki432 profile=agus
add comment="jun/29/2023 13:27:38" limit-uptime=8h name=gzi635 password=\
    gzi635 profile=agus
add comment="jul/07/2023 03:33:51" limit-uptime=8h name=jjr989 password=\
    jjr989 profile=-default-1-hp
add comment="jul/02/2023 20:23:51" limit-uptime=8h name=fjr278 password=\
    fjr278 profile=agus
add comment="jul/06/2023 08:38:52" limit-uptime=8h name=xcn234 password=\
    xcn234 profile=agus
add comment="jul/04/2023 17:55:23" limit-uptime=8h name=rzr839 password=\
    rzr839 profile=agus
add comment="jun/26/2023 01:59:32" limit-uptime=8h name=rvy829 password=\
    rvy829 profile=agus
add comment="jul/10/2023 01:44:21" limit-uptime=8h name=vdn883 password=\
    vdn883 profile=-default-1-hp
add comment="jul/06/2023 13:02:48" limit-uptime=8h name=tey439 password=\
    tey439 profile=agus
add comment="jun/28/2023 00:39:28" limit-uptime=8h name=aiy978 password=\
    aiy978 profile=agus
add comment="jun/26/2023 08:41:17" limit-uptime=8h name=vkf387 password=\
    vkf387 profile=agus
add comment="jun/30/2023 11:24:03" limit-uptime=8h name=kxk464 password=\
    kxk464 profile=agus
add comment="jun/29/2023 01:17:23" limit-uptime=8h name=znp644 password=\
    znp644 profile=agus
add comment="jun/30/2023 04:21:15" limit-uptime=8h name=mut277 password=\
    mut277 profile=agus
add comment="jun/28/2023 19:53:41" limit-uptime=8h name=nms853 password=\
    nms853 profile=agus
add comment="jun/30/2023 00:51:26" limit-uptime=8h name=dtf435 password=\
    dtf435 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=kxk372 password=kxk372 \
    profile=-default-1-hp
add comment="jun/24/2023 19:50:39" limit-uptime=8h name=kxf365 password=\
    kxf365 profile=evi
add comment="jun/23/2023 13:21:01" limit-uptime=8h name=ejf863 password=\
    ejf863 profile=evi
add comment="jun/23/2023 12:57:28" limit-uptime=8h name=xse735 password=\
    xse735 profile=evi
add comment="jun/22/2023 21:06:03" limit-uptime=8h name=tch558 password=\
    tch558 profile=evi
add comment="jun/22/2023 11:02:26" limit-uptime=8h name=ywj329 password=\
    ywj329 profile=evi
add comment="jun/22/2023 11:49:45" limit-uptime=8h name=eyg264 password=\
    eyg264 profile=evi
add comment="jun/25/2023 15:31:06" limit-uptime=8h name=scf735 password=\
    scf735 profile=evi
add comment="jun/24/2023 15:11:26" limit-uptime=8h name=frk788 password=\
    frk788 profile=evi
add comment="jun/23/2023 12:56:02" limit-uptime=8h name=kye469 password=\
    kye469 profile=evi
add comment="jun/26/2023 13:12:10" limit-uptime=8h name=upd364 password=\
    upd364 profile=evi
add comment="jun/26/2023 20:23:31" limit-uptime=8h name=hmp365 password=\
    hmp365 profile=evi
add comment="jun/27/2023 09:57:44" limit-uptime=8h name=axs825 password=\
    axs825 profile=evi
add comment="jun/27/2023 11:38:47" limit-uptime=8h name=eue493 password=\
    eue493 profile=evi
add comment="jun/25/2023 11:06:33" limit-uptime=8h name=ruh638 password=\
    ruh638 profile=evi
add comment="jun/27/2023 12:33:39" limit-uptime=8h name=myn393 password=\
    myn393 profile=evi
add comment="jun/25/2023 19:03:03" limit-uptime=8h name=tjx856 password=\
    tjx856 profile=evi
add comment="jun/26/2023 12:32:42" limit-uptime=8h name=mna888 password=\
    mna888 profile=evi
add comment="jun/26/2023 13:11:20" limit-uptime=8h name=vgs859 password=\
    vgs859 profile=evi
add comment="jun/27/2023 18:50:38" limit-uptime=8h name=bzk838 password=\
    bzk838 profile=evi
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=kig388 password=kig388 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=fwp832 password=fwp832 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=afw553 password=afw553 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=jsu847 password=jsu847 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dfd986 password=dfd986 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=cfv258 password=cfv258 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=mms922 password=mms922 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dha326 password=dha326 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xnv695 password=xnv695 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=wff923 password=wff923 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dtr662 password=dtr662 \
    profile=-default-1-hp
add comment="jul/11/2023 10:53:09" limit-uptime=8h name=hnm986 password=\
    hnm986 profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=jer276 password=jer276 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ktp769 password=ktp769 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ghc893 password=ghc893 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bpd945 password=bpd945 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=wvv249 password=wvv249 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=myv358 password=myv358 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=nae376 password=nae376 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=cmb932 password=cmb932 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=jmj966 password=jmj966 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=nbw369 password=nbw369 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=sij847 password=sij847 \
    profile=-default-1-hp
add comment="jun/28/2023 09:16:01" limit-uptime=8h name=xtg764 password=\
    xtg764 profile=evi
add comment="jun/28/2023 12:40:08" limit-uptime=8h name=cbm468 password=\
    cbm468 profile=evi
add comment="jun/28/2023 13:01:46" limit-uptime=8h name=int784 password=\
    int784 profile=evi
add comment="jun/28/2023 13:25:20" limit-uptime=8h name=mrm857 password=\
    mrm857 profile=evi
add comment="jun/28/2023 18:51:17" limit-uptime=8h name=vui768 password=\
    vui768 profile=evi
add comment="jul/01/2023 19:40:40" limit-uptime=8h name=hgy549 password=\
    hgy549 profile=evi
add comment="jun/30/2023 10:30:17" limit-uptime=8h name=vnw575 password=\
    vnw575 profile=evi
add comment="jun/30/2023 11:35:20" limit-uptime=8h name=xgp354 password=\
    xgp354 profile=evi
add comment="jun/30/2023 11:38:22" limit-uptime=8h name=hky549 password=\
    hky549 profile=evi
add comment="jun/30/2023 13:06:48" limit-uptime=8h name=adb898 password=\
    adb898 profile=evi
add comment="jun/30/2023 14:29:08" limit-uptime=8h name=tcm435 password=\
    tcm435 profile=evi
add comment="jun/30/2023 18:23:35" limit-uptime=8h name=yxz534 password=\
    yxz534 profile=evi
add comment="jul/01/2023 15:19:32" limit-uptime=8h name=gev356 password=\
    gev356 profile=evi
add comment="jul/01/2023 15:22:41" limit-uptime=8h name=ppt784 password=\
    ppt784 profile=evi
add comment="jul/01/2023 15:20:39" limit-uptime=8h name=tiu687 password=\
    tiu687 profile=evi
add comment="jul/01/2023 15:54:52" limit-uptime=8h name=jme766 password=\
    jme766 profile=evi
add comment="jul/01/2023 17:05:18" limit-uptime=8h name=mdb752 password=\
    mdb752 profile=evi
add comment="jul/01/2023 19:44:48" limit-uptime=8h name=xkv364 password=\
    xkv364 profile=evi
add comment="jul/01/2023 15:52:59" limit-uptime=8h name=adu339 password=\
    adu339 profile=evi
add comment="jul/02/2023 12:38:36" limit-uptime=8h name=atv366 password=\
    atv366 profile=evi
add comment="jul/03/2023 18:11:57" limit-uptime=8h name=spi663 password=\
    spi663 profile=evi
add comment="jul/03/2023 15:35:57" limit-uptime=8h name=ugt525 password=\
    ugt525 profile=evi
add comment="jul/03/2023 14:34:49" limit-uptime=8h name=dru949 password=\
    dru949 profile=evi
add comment="jul/03/2023 12:51:58" limit-uptime=8h name=dfd954 password=\
    dfd954 profile=evi
add comment="jul/03/2023 10:19:42" limit-uptime=8h name=ixb899 password=\
    ixb899 profile=evi
add comment="jul/05/2023 12:52:49" limit-uptime=8h name=fnb264 password=\
    fnb264 profile=evi
add comment="jul/05/2023 08:28:24" limit-uptime=8h name=dcp862 password=\
    dcp862 profile=evi
add comment="jul/05/2023 07:37:49" limit-uptime=8h name=xbe235 password=\
    xbe235 profile=evi
add comment="jul/04/2023 21:03:16" limit-uptime=8h name=gas967 password=\
    gas967 profile=evi
add comment="jul/04/2023 13:00:12" limit-uptime=8h name=ruh522 password=\
    ruh522 profile=evi
add comment="jul/10/2023 12:50:11" limit-uptime=8h name=wna748 password=\
    wna748 profile=evi
add comment="jul/10/2023 13:15:49" limit-uptime=8h name=dgh788 password=\
    dgh788 profile=evi
add comment="jul/07/2023 16:58:11" limit-uptime=8h name=rki597 password=\
    rki597 profile=evi
add comment="jul/05/2023 14:11:45" limit-uptime=8h name=zst586 password=\
    zst586 profile=evi
add comment="jul/07/2023 14:10:40" limit-uptime=8h name=mgv826 password=\
    mgv826 profile=evi
add comment="jul/10/2023 12:49:51" limit-uptime=8h name=eaa568 password=\
    eaa568 profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nxt465 password=nxt465 \
    profile=evi
add comment="jul/07/2023 14:40:57" limit-uptime=8h name=aiu332 password=\
    aiu332 profile=evi
add comment="jul/09/2023 10:56:42" limit-uptime=8h name=hgr669 password=\
    hgr669 profile=evi
add comment="jul/09/2023 20:16:45" limit-uptime=8h name=kzz968 password=\
    kzz968 profile=evi
add comment="jul/15/2023 11:56:02" limit-uptime=8h name=ddr284 password=\
    ddr284 profile=evi
add comment="jul/14/2023 11:42:24" limit-uptime=8h name=hsf984 password=\
    hsf984 profile=evi
add comment="jul/11/2023 14:08:35" limit-uptime=8h name=bte575 password=\
    bte575 profile=evi
add comment="jul/11/2023 15:32:37" limit-uptime=8h name=vzj937 password=\
    vzj937 profile=evi
add comment="jul/11/2023 14:07:55" limit-uptime=8h name=ybc768 password=\
    ybc768 profile=evi
add comment="jul/17/2023 12:27:02" limit-uptime=8h name=wus394 password=\
    wus394 profile=evi
add comment="jul/15/2023 19:08:19" limit-uptime=8h name=hsa466 password=\
    hsa466 profile=evi
add comment="jul/11/2023 13:37:47" limit-uptime=8h name=cnd845 password=\
    cnd845 profile=evi
add comment="jul/15/2023 15:59:11" limit-uptime=8h name=ena427 password=\
    ena427 profile=evi
add comment="jul/15/2023 16:00:20" limit-uptime=8h name=agv993 password=\
    agv993 profile=evi
add comment="jul/18/2023 09:57:55" limit-uptime=8h name=kbk685 password=\
    kbk685 profile=evi
add comment="jul/17/2023 13:01:31" limit-uptime=8h name=ifp697 password=\
    ifp697 profile=evi
add comment="jul/18/2023 14:55:32" limit-uptime=8h name=sfa697 password=\
    sfa697 profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=hcc236 password=hcc236 \
    profile=evi
add comment="jul/10/2023 13:28:53" limit-uptime=8h name=cjk238 password=\
    cjk238 profile=evi
add comment="jul/21/2023 19:19:24" limit-uptime=8h name=kss892 password=\
    kss892 profile=evi
add comment="jul/21/2023 19:41:28" limit-uptime=8h name=tmf249 password=\
    tmf249 profile=evi
add comment="jul/21/2023 19:41:18" limit-uptime=8h name=jsi846 password=\
    jsi846 profile=evi
add comment="jul/22/2023 10:12:24" limit-uptime=8h name=xig347 password=\
    xig347 profile=evi
add comment="jul/21/2023 19:42:32" limit-uptime=8h name=bdf424 password=\
    bdf424 profile=evi
add comment="jul/20/2023 11:31:40" limit-uptime=8h name=yen533 password=\
    yen533 profile=evi
add comment="jul/21/2023 18:23:17" limit-uptime=8h name=yan589 password=\
    yan589 profile=evi
add comment="jul/20/2023 12:52:09" limit-uptime=8h name=ysu224 password=\
    ysu224 profile=evi
add comment="jul/21/2023 18:54:32" limit-uptime=8h name=dpn485 password=\
    dpn485 profile=evi
add comment="jul/21/2023 18:58:31" limit-uptime=8h name=wne599 password=\
    wne599 profile=evi
add comment="jul/19/2023 11:08:20" limit-uptime=8h name=eem687 password=\
    eem687 profile=evi
add comment="jul/19/2023 12:12:24" limit-uptime=8h name=byy332 password=\
    byy332 profile=evi
add comment="jul/19/2023 12:32:19" limit-uptime=8h name=nke788 password=\
    nke788 profile=evi
add comment="jul/19/2023 18:21:27" limit-uptime=8h name=kye835 password=\
    kye835 profile=evi
add comment="jul/20/2023 07:42:52" limit-uptime=8h name=igc728 password=\
    igc728 profile=evi
add comment="jul/22/2023 13:44:12" limit-uptime=8h name=jxd948 password=\
    jxd948 profile=evi
add comment="jul/22/2023 14:12:38" limit-uptime=8h name=tut987 password=\
    tut987 profile=evi
add comment="jul/22/2023 18:22:45" limit-uptime=8h name=fzi546 password=\
    fzi546 profile=evi
add comment="jul/22/2023 17:21:46" limit-uptime=8h name=ttn687 password=\
    ttn687 profile=evi
add comment="jul/22/2023 10:26:59" limit-uptime=8h name=utg663 password=\
    utg663 profile=evi
add comment="jul/22/2023 20:10:40" limit-uptime=8h name=mmm992 password=\
    mmm992 profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=jpe743 password=jpe743 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=iyf753 password=iyf753 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nim844 password=nim844 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=emy495 password=emy495 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=pzg522 password=pzg522 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rss857 password=rss857 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=gnk645 password=gnk645 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=cdf386 password=cdf386 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=wpx838 password=wpx838 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=cff954 password=cff954 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=bah495 password=bah495 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=enm867 password=enm867 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=wes687 password=wes687 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=pif332 password=pif332 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=htt582 password=htt582 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=aaw855 password=aaw855 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=gtr532 password=gtr532 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=num749 password=num749 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rbr453 password=rbr453 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=duw265 password=duw265 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ctt988 password=ctt988 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=hnd887 password=hnd887 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=iyz544 password=iyz544 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=cas858 password=cas858 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ydy254 password=ydy254 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=she247 password=she247 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fgz765 password=fgz765 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rpn784 password=rpn784 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=uwu655 password=uwu655 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fzg299 password=fzg299 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fkj254 password=fkj254 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=syp368 password=syp368 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=jfp866 password=jfp866 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=bea599 password=bea599 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=yvn263 password=yvn263 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=wpa437 password=wpa437 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=amf798 password=amf798 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nip775 password=nip775 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=tgf399 password=tgf399 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ffe393 password=ffe393 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=apw657 password=apw657 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=gaa352 password=gaa352 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=hta329 password=hta329 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=bvw786 password=bvw786 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=zhw465 password=zhw465 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=szb862 password=szb862 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=bkj399 password=bkj399 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=eiu527 password=eiu527 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=eav984 password=eav984 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fhu339 password=fhu339 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=zhu963 password=zhu963 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ekv358 password=ekv358 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=dns947 password=dns947 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fbp478 password=fbp478 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=mpf454 password=mpf454 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=sau928 password=sau928 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ftd865 password=ftd865 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vfu393 password=vfu393 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ydr864 password=ydr864 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=bez736 password=bez736 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=pvb957 password=pvb957 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vga935 password=vga935 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nhi433 password=nhi433 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rbu339 password=rbu339 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vxp587 password=vxp587 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=haz246 password=haz246 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ifs387 password=ifs387 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=jzb888 password=jzb888 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=pyx332 password=pyx332 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=giz448 password=giz448 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ydc622 password=ydc622 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vnd287 password=vnd287 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=zky524 password=zky524 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=eka826 password=eka826 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=wgs984 password=wgs984 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=tfn997 password=tfn997 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fum688 password=fum688 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=sgx987 password=sgx987 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ihm954 password=ihm954 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ysw689 password=ysw689 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fpn442 password=fpn442 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=sjh298 password=sjh298 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=mtw238 password=mtw238 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=crp788 password=crp788 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rsn474 password=rsn474 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=hvh364 password=hvh364 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=heh699 password=heh699 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rsz984 password=rsz984 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=xnh828 password=xnh828 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=daz533 password=daz533 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=npm425 password=npm425 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=rmw396 password=rmw396 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=thv289 password=thv289 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=uat947 password=uat947 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vgh787 password=vgh787 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=wsg357 password=wsg357 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fxw268 password=fxw268 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=cey453 password=cey453 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=jtc796 password=jtc796 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=yyy868 password=yyy868 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=eks956 password=eks956 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=eae926 password=eae926 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=jsy328 password=jsy328 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=zfp278 password=zfp278 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=knz439 password=knz439 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=uam833 password=uam833 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fyv734 password=fyv734 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=yke966 password=yke966 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=zzz898 password=zzz898 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fcc889 password=fcc889 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ifu542 password=ifu542 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nbz462 password=nbz462 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=cyu758 password=cyu758 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=tms442 password=tms442 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=nut358 password=nut358 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=vjf547 password=vjf547 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=fte224 password=fte224 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=pxx477 password=pxx477 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=hhn369 password=hhn369 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=iwz534 password=iwz534 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=tiu946 password=tiu946 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=ksf222 password=ksf222 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=twh348 password=twh348 \
    profile=evi
add comment=vc-743-04.12.23-evi limit-uptime=8h name=dsk284 password=dsk284 \
    profile=evi
add comment="jul/12/2023 08:55:11" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=nsz489 password=nsz489 profile=wawan
add comment="jul/13/2023 20:03:27" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=ksp982 password=ksp982 profile=wawan
add comment="jul/15/2023 06:43:11" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=cpz479 password=cpz479 profile=wawan
add comment="jul/16/2023 06:45:14" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=sgm594 password=sgm594 profile=wawan
add comment="jul/04/2023 16:01:14" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=yhh394 password=yhh394 profile=wawan
add comment="jul/05/2023 13:12:54" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=wvc479 password=wvc479 profile=wawan
add comment="jul/06/2023 15:20:27" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=ktb259 password=ktb259 profile=wawan
add comment="jul/07/2023 18:10:38" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=irc696 password=irc696 profile=wawan
add comment="jul/11/2023 07:22:28" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=dwh492 password=dwh492 profile=wawan
add comment="jul/01/2023 07:41:18" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=kys945 password=kys945 profile=wawan
add comment="jul/02/2023 10:07:23" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=fxd656 password=fxd656 profile=wawan
add comment="jul/02/2023 10:23:58" limit-uptime=12h mac-address=\
    20:64:CB:C6:F3:E1 name=pwx773 password=pwx773 profile=wawan
add comment="jul/03/2023 10:55:04" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=irg392 password=irg392 profile=wawan
add comment="jul/03/2023 21:58:34" limit-uptime=12h mac-address=\
    DE:E4:4B:BE:63:ED name=aap875 password=aap875 profile=wawan
add comment="jun/29/2023 11:36:08" limit-uptime=12h mac-address=\
    DA:AC:07:3A:6D:7A name=jgr954 password=jgr954 profile=wawan
add comment="jun/29/2023 11:36:39" limit-uptime=12h mac-address=\
    D8:55:75:CF:9F:CD name=xti679 password=xti679 profile=wawan
add comment="jun/29/2023 15:25:49" limit-uptime=12h mac-address=\
    0C:98:38:3C:BF:9F name=ige327 password=ige327 profile=wawan
add comment="jun/29/2023 16:51:57" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=yus256 password=yus256 profile=wawan
add comment="jul/17/2023 09:30:54" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=uep265 password=uep265 profile=wawan
add comment="jun/23/2023 08:18:10" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=ucd979 password=ucd979 profile=wawan
add comment="jun/23/2023 19:08:11" limit-uptime=12h mac-address=\
    0C:98:38:3C:BF:9F name=khu252 password=khu252 profile=wawan
add comment="jun/24/2023 07:27:30" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=zmu438 password=zmu438 profile=wawan
add comment="jun/25/2023 06:35:54" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=tpb645 password=tpb645 profile=wawan
add comment="jun/26/2023 21:51:00" limit-uptime=12h mac-address=\
    DE:E4:4B:BE:63:ED name=syu252 password=syu252 profile=wawan
add comment="jul/18/2023 07:59:33" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=ztb768 password=ztb768 profile=wawan
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=bpx999 password=bpx999 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=frd986 password=frd986 \
    profile=-default-1-hp
add comment="jun/22/2023 10:06:55" limit-uptime=12h name=xxy256 password=\
    xxy256 profile=-default-1-hp
add comment="jun/26/2023 02:37:26" limit-uptime=12h name=mji863 password=\
    mji863 profile=-default-1-hp
add comment="jun/28/2023 21:23:38" limit-uptime=12h name=knz573 password=\
    knz573 profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=msv538 password=msv538 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ujp553 password=ujp553 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ubc547 password=ubc547 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ddf254 password=ddf254 \
    profile=-default-1-hp
add comment="jun/23/2023 18:31:18" limit-uptime=8h name=acj466 password=\
    acj466 profile=dian
add comment="jun/26/2023 09:32:50" limit-uptime=8h name=dcc877 password=\
    dcc877 profile=dian
add comment="jun/24/2023 19:46:26" limit-uptime=8h name=unr242 password=\
    unr242 profile=dian
add comment="jun/23/2023 18:28:49" limit-uptime=8h name=ani347 password=\
    ani347 profile=dian
add comment="jun/24/2023 17:40:49" limit-uptime=8h name=jhh933 password=\
    jhh933 profile=dian
add comment="jun/25/2023 06:49:54" limit-uptime=8h name=vdt242 password=\
    vdt242 profile=dian
add comment="jun/24/2023 20:33:58" limit-uptime=8h name=neh478 password=\
    neh478 profile=dian
add comment="jun/25/2023 20:02:41" limit-uptime=8h name=ebx963 password=\
    ebx963 profile=dian
add comment="jun/24/2023 09:29:20" limit-uptime=8h name=cfj225 password=\
    cfj225 profile=dian
add comment="jun/25/2023 08:18:55" limit-uptime=8h name=ehi572 password=\
    ehi572 profile=dian
add comment="jun/26/2023 13:23:13" limit-uptime=8h name=zya986 password=\
    zya986 profile=dian
add comment="jun/26/2023 14:31:45" limit-uptime=8h name=ged475 password=\
    ged475 profile=dian
add comment="jun/26/2023 13:50:09" limit-uptime=8h name=sni536 password=\
    sni536 profile=dian
add comment="jun/26/2023 14:30:09" limit-uptime=8h name=kcr232 password=\
    kcr232 profile=dian
add comment="jun/27/2023 09:20:52" limit-uptime=8h name=rnf577 password=\
    rnf577 profile=dian
add comment="jun/27/2023 15:38:17" limit-uptime=8h name=fbj856 password=\
    fbj856 profile=dian
add comment="jun/27/2023 17:01:21" limit-uptime=8h name=wkd785 password=\
    wkd785 profile=dian
add comment="jun/27/2023 17:09:14" limit-uptime=8h name=ykm633 password=\
    ykm633 profile=dian
add comment="jun/28/2023 05:57:28" limit-uptime=8h name=ckm999 password=\
    ckm999 profile=dian
add comment="jun/28/2023 08:10:49" limit-uptime=8h name=ctu427 password=\
    ctu427 profile=dian
add comment="jun/28/2023 19:43:29" limit-uptime=8h name=hun722 password=\
    hun722 profile=dian
add comment="jun/29/2023 05:31:15" limit-uptime=8h name=esm655 password=\
    esm655 profile=dian
add comment="jun/28/2023 21:25:48" limit-uptime=8h name=niw862 password=\
    niw862 profile=dian
add comment="jun/28/2023 14:52:01" limit-uptime=8h name=xfc538 password=\
    xfc538 profile=dian
add comment="jun/28/2023 14:21:01" limit-uptime=8h name=pdc428 password=\
    pdc428 profile=dian
add comment="jun/30/2023 17:15:17" limit-uptime=8h name=kam953 password=\
    kam953 profile=dian
add comment="jun/30/2023 13:25:47" limit-uptime=8h name=zfh744 password=\
    zfh744 profile=dian
add comment="jun/30/2023 18:22:24" limit-uptime=8h name=hrf275 password=\
    hrf275 profile=dian
add comment="jun/29/2023 17:13:58" limit-uptime=8h name=ddc975 password=\
    ddc975 profile=dian
add comment="jun/29/2023 15:55:37" limit-uptime=8h name=ppp836 password=\
    ppp836 profile=dian
add comment="jul/01/2023 22:16:45" limit-uptime=8h name=khn626 password=\
    khn626 profile=dian
add comment="jul/01/2023 14:27:36" limit-uptime=8h name=vbc983 password=\
    vbc983 profile=dian
add comment="jul/01/2023 16:59:24" limit-uptime=8h name=dmu435 password=\
    dmu435 profile=dian
add comment="jul/01/2023 16:59:35" limit-uptime=8h name=cfc493 password=\
    cfc493 profile=dian
add comment="jul/03/2023 10:11:03" limit-uptime=8h name=kkr862 password=\
    kkr862 profile=dian
add comment="jul/02/2023 20:03:50" limit-uptime=8h name=tkz597 password=\
    tkz597 profile=dian
add comment="jul/02/2023 15:11:27" limit-uptime=8h name=ahs379 password=\
    ahs379 profile=dian
add comment="jul/01/2023 23:19:45" limit-uptime=8h name=tia373 password=\
    tia373 profile=dian
add comment="jul/01/2023 22:31:18" limit-uptime=8h name=rbd387 password=\
    rbd387 profile=dian
add comment="jul/03/2023 10:48:11" limit-uptime=8h name=hep334 password=\
    hep334 profile=dian
add comment="jul/04/2023 14:06:52" limit-uptime=8h name=hzw559 password=\
    hzw559 profile=dian
add comment="jul/03/2023 22:27:44" limit-uptime=8h name=aww234 password=\
    aww234 profile=dian
add comment="jul/03/2023 18:12:23" limit-uptime=8h name=kps676 password=\
    kps676 profile=dian
add comment="jul/03/2023 10:34:14" limit-uptime=8h name=nai848 password=\
    nai848 profile=dian
add comment="jul/04/2023 06:16:40" limit-uptime=8h name=eyv429 password=\
    eyv429 profile=dian
add comment="jul/04/2023 10:38:54" limit-uptime=8h name=mar333 password=\
    mar333 profile=dian
add comment="jul/04/2023 18:35:16" limit-uptime=8h name=dve877 password=\
    dve877 profile=dian
add comment="jul/03/2023 19:40:55" limit-uptime=8h name=hwr585 password=\
    hwr585 profile=dian
add comment="jul/03/2023 12:06:56" limit-uptime=8h name=yrr637 password=\
    yrr637 profile=dian
add comment="jun/23/2023 07:37:23" limit-uptime=8h name=mue327 password=\
    mue327 profile=dian
add comment="jun/22/2023 19:53:52" limit-uptime=8h name=nci289 password=\
    nci289 profile=dian
add comment="jun/22/2023 20:13:05" limit-uptime=8h name=hbi839 password=\
    hbi839 profile=dian
add comment="jun/23/2023 12:10:12" limit-uptime=8h name=sda622 password=\
    sda622 profile=dian
add comment="jun/23/2023 18:17:15" limit-uptime=8h name=hji923 password=\
    hji923 profile=dian
add comment="jun/23/2023 10:44:04" limit-uptime=8h name=pyc389 password=\
    pyc389 profile=dian
add comment="jun/22/2023 20:06:29" limit-uptime=8h name=ewm743 password=\
    ewm743 profile=dian
add comment="jun/22/2023 12:36:21" limit-uptime=8h name=iji256 password=\
    iji256 profile=dian
add comment="jun/22/2023 19:19:31" limit-uptime=8h name=nve986 password=\
    nve986 profile=dian
add comment="jun/23/2023 14:25:54" limit-uptime=8h name=xrw434 password=\
    xrw434 profile=dian
add comment="jun/23/2023 12:12:22" limit-uptime=8h name=tay385 password=\
    tay385 profile=dian
add comment="jun/25/2023 05:31:42" limit-uptime=8h name=ztf323 password=\
    ztf323 profile=dian
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=kdg427 password=kdg427 \
    profile=-default-1-hp
add comment="jul/19/2023 08:56:20" limit-uptime=8h name=twc599 password=\
    twc599 profile=wati
add comment="jul/15/2023 21:07:35" limit-uptime=8h name=umx959 password=\
    umx959 profile=wati
add comment="jul/04/2023 06:31:05" limit-uptime=8h name=zgw255 password=\
    zgw255 profile=wati
add comment="jul/21/2023 18:53:09" limit-uptime=8h name=ghc725 password=\
    ghc725 profile=wati
add comment="jul/13/2023 11:42:56" limit-uptime=8h name=njh277 password=\
    njh277 profile=wati
add comment="jul/03/2023 01:16:24" limit-uptime=8h name=kun542 password=\
    kun542 profile=wati
add comment="jul/14/2023 22:48:25" limit-uptime=8h name=puy738 password=\
    puy738 profile=wati
add comment="jul/05/2023 22:41:50" limit-uptime=8h name=mzn353 password=\
    mzn353 profile=wati
add comment="jul/13/2023 21:12:26" limit-uptime=8h name=fhw998 password=\
    fhw998 profile=wati
add comment="jul/03/2023 09:32:16" limit-uptime=8h name=wav556 password=\
    wav556 profile=wati
add comment="jul/12/2023 02:02:23" limit-uptime=8h name=xkb638 password=\
    xkb638 profile=wati
add comment="jul/03/2023 21:18:17" limit-uptime=8h name=njc756 password=\
    njc756 profile=wati
add comment="jul/10/2023 09:08:33" limit-uptime=8h name=tyj473 password=\
    tyj473 profile=wati
add comment="jul/07/2023 03:46:17" limit-uptime=8h name=epw555 password=\
    epw555 profile=wati
add comment="jul/05/2023 21:00:37" limit-uptime=8h name=ibp355 password=\
    ibp355 profile=wati
add comment="jul/03/2023 19:36:50" limit-uptime=8h name=fmn958 password=\
    fmn958 profile=wati
add comment="jul/02/2023 14:12:52" limit-uptime=8h name=kvf637 password=\
    kvf637 profile=wati
add comment="jul/20/2023 12:19:57" limit-uptime=8h name=nab342 password=\
    nab342 profile=wati
add comment="jul/02/2023 19:20:55" limit-uptime=8h name=fky324 password=\
    fky324 profile=wati
add comment="jul/09/2023 13:29:22" limit-uptime=8h name=hwd279 password=\
    hwd279 profile=wati
add comment="jul/08/2023 08:49:55" limit-uptime=8h name=ngu862 password=\
    ngu862 profile=wati
add comment="jun/23/2023 18:29:31" limit-uptime=8h name=xif382 password=\
    xif382 profile=wati
add comment="jul/16/2023 07:13:58" limit-uptime=8h name=emw337 password=\
    emw337 profile=wati
add comment="jul/10/2023 19:59:05" limit-uptime=8h name=ipp787 password=\
    ipp787 profile=wati
add comment="jul/01/2023 23:42:54" limit-uptime=8h name=fjz628 password=\
    fjz628 profile=wati
add comment="jun/24/2023 13:24:38" limit-uptime=8h name=exs586 password=\
    exs586 profile=wati
add comment="jul/16/2023 12:36:35" limit-uptime=8h name=cya544 password=\
    cya544 profile=wati
add comment="jul/11/2023 19:36:08" limit-uptime=8h name=pxu769 password=\
    pxu769 profile=wati
add comment="jul/11/2023 13:02:49" limit-uptime=8h name=jdr293 password=\
    jdr293 profile=wati
add comment="jul/11/2023 07:22:12" limit-uptime=8h name=www827 password=\
    www827 profile=wati
add comment="jul/21/2023 18:18:56" limit-uptime=8h name=grv773 password=\
    grv773 profile=wati
add comment="jun/28/2023 11:08:33" limit-uptime=8h name=eyj555 password=\
    eyj555 profile=wati
add comment="jul/19/2023 07:33:45" limit-uptime=8h name=thn979 password=\
    thn979 profile=wati
add comment="jul/21/2023 16:50:23" limit-uptime=8h name=iur682 password=\
    iur682 profile=wati
add comment="jun/23/2023 21:45:08" limit-uptime=8h name=ejd865 password=\
    ejd865 profile=wati
add comment="jul/15/2023 02:57:48" limit-uptime=8h name=hxd587 password=\
    hxd587 profile=wati
add comment="jun/22/2023 18:07:00" limit-uptime=8h name=wwu646 password=\
    wwu646 profile=wati
add comment="jul/15/2023 22:42:50" limit-uptime=8h name=tzs698 password=\
    tzs698 profile=wati
add comment="jul/05/2023 23:29:41" limit-uptime=8h name=bzb445 password=\
    bzb445 profile=wati
add comment="jun/28/2023 16:23:35" limit-uptime=8h name=ghs836 password=\
    ghs836 profile=wati
add comment="jun/24/2023 15:24:32" limit-uptime=8h name=ciw226 password=\
    ciw226 profile=wati
add comment="jul/09/2023 12:16:41" limit-uptime=8h name=jyp386 password=\
    jyp386 profile=wati
add comment="jul/14/2023 02:52:05" limit-uptime=8h name=xxj555 password=\
    xxj555 profile=wati
add comment="jul/08/2023 13:54:13" limit-uptime=8h name=tuw353 password=\
    tuw353 profile=wati
add comment="jul/12/2023 08:43:54" limit-uptime=8h name=sek623 password=\
    sek623 profile=wati
add comment="jul/14/2023 22:49:20" limit-uptime=8h name=izt429 password=\
    izt429 profile=wati
add comment="jul/06/2023 15:36:43" limit-uptime=8h name=avg698 password=\
    avg698 profile=wati
add comment="jul/05/2023 14:10:16" limit-uptime=8h name=rbm926 password=\
    rbm926 profile=wati
add comment="jun/28/2023 16:01:00" limit-uptime=8h name=zja924 password=\
    zja924 profile=wati
add comment="jul/04/2023 11:15:17" limit-uptime=8h name=zgp448 password=\
    zgp448 profile=wati
add comment="jul/06/2023 11:59:45" limit-uptime=8h name=acb987 password=\
    acb987 profile=wati
add comment="jul/21/2023 18:42:22" limit-uptime=8h name=gwa353 password=\
    gwa353 profile=wati
add comment="jul/07/2023 21:29:32" limit-uptime=8h name=anu548 password=\
    anu548 profile=wati
add comment="jun/26/2023 15:26:53" limit-uptime=8h name=whk593 password=\
    whk593 profile=wati
add comment="jul/17/2023 22:47:00" limit-uptime=8h name=wkt839 password=\
    wkt839 profile=wati
add comment="jul/20/2023 11:24:15" limit-uptime=8h name=hks539 password=\
    hks539 profile=wati
add comment="jul/09/2023 01:34:53" limit-uptime=8h name=vge585 password=\
    vge585 profile=wati
add comment="jul/10/2023 14:44:05" limit-uptime=8h name=uyh868 password=\
    uyh868 profile=wati
add comment="jul/03/2023 07:00:24" limit-uptime=8h name=yma262 password=\
    yma262 profile=wati
add comment="jun/27/2023 23:49:34" limit-uptime=8h name=tsg769 password=\
    tsg769 profile=wati
add comment="jun/28/2023 18:08:27" limit-uptime=8h name=zjr367 password=\
    zjr367 profile=wati
add comment="jul/07/2023 18:59:19" limit-uptime=8h name=mxs378 password=\
    mxs378 profile=wati
add comment="jun/22/2023 11:37:49" limit-uptime=8h name=fac449 password=\
    fac449 profile=wati
add comment="jul/11/2023 21:35:48" limit-uptime=8h name=tea233 password=\
    tea233 profile=wati
add comment="jul/12/2023 20:25:05" limit-uptime=8h name=hcb388 password=\
    hcb388 profile=wati
add comment="jun/30/2023 21:47:03" limit-uptime=8h name=dbv243 password=\
    dbv243 profile=wati
add comment="jul/17/2023 18:09:28" limit-uptime=8h name=rcr888 password=\
    rcr888 profile=wati
add comment="jul/21/2023 20:05:46" limit-uptime=8h name=rhk539 password=\
    rhk539 profile=wati
add comment="jun/26/2023 21:56:22" limit-uptime=8h name=szn758 password=\
    szn758 profile=wati
add comment="jul/01/2023 10:21:07" limit-uptime=8h name=vkm547 password=\
    vkm547 profile=wati
add comment="jul/14/2023 19:29:48" limit-uptime=8h name=bby687 password=\
    bby687 profile=wati
add comment=vc-749-05.02.23-wati limit-uptime=8h name=zmw545 password=zmw545 \
    profile=wati
add comment="jul/08/2023 20:04:05" limit-uptime=8h name=yga382 password=\
    yga382 profile=wati
add comment="jul/08/2023 20:05:08" limit-uptime=8h name=mha435 password=\
    mha435 profile=wati
add comment="jun/27/2023 23:49:44" limit-uptime=8h name=zkj828 password=\
    zkj828 profile=wati
add comment="jul/01/2023 19:12:13" limit-uptime=8h name=xjn896 password=\
    xjn896 profile=wati
add comment="jul/19/2023 00:04:53" limit-uptime=8h name=xvi324 password=\
    xvi324 profile=wati
add comment="jun/25/2023 12:08:10" limit-uptime=8h name=uxb423 password=\
    uxb423 profile=wati
add comment="jun/29/2023 19:49:37" limit-uptime=8h name=jbb429 password=\
    jbb429 profile=wati
add comment="jul/02/2023 09:50:44" limit-uptime=8h name=jdg346 password=\
    jdg346 profile=wati
add comment="jun/30/2023 21:36:28" limit-uptime=8h name=wna388 password=\
    wna388 profile=wati
add comment="jul/12/2023 09:02:31" limit-uptime=8h name=wdd797 password=\
    wdd797 profile=wati
add comment="jul/03/2023 10:44:21" limit-uptime=8h name=brw823 password=\
    brw823 profile=wati
add comment="jun/26/2023 10:50:37" limit-uptime=8h name=tgz694 password=\
    tgz694 profile=wati
add comment="jul/21/2023 19:20:55" limit-uptime=8h name=dht863 password=\
    dht863 profile=wati
add comment="jul/01/2023 13:50:58" limit-uptime=8h name=rje543 password=\
    rje543 profile=wati
add comment="jun/26/2023 13:03:56" limit-uptime=8h name=ktr777 password=\
    ktr777 profile=wati
add comment="jun/29/2023 18:26:03" limit-uptime=8h name=ush488 password=\
    ush488 profile=wati
add comment="jul/05/2023 01:20:14" limit-uptime=8h name=cie667 password=\
    cie667 profile=wati
add comment="jun/22/2023 16:11:20" limit-uptime=8h name=jia789 password=\
    jia789 profile=wati
add comment="jul/06/2023 00:20:57" limit-uptime=8h name=vvg349 password=\
    vvg349 profile=wati
add comment="jul/14/2023 09:12:48" limit-uptime=8h name=vmx993 password=\
    vmx993 profile=wati
add comment="jun/26/2023 18:47:07" limit-uptime=8h name=etc539 password=\
    etc539 profile=wati
add comment="jul/18/2023 05:49:57" limit-uptime=8h name=cie683 password=\
    cie683 profile=wati
add comment="jul/15/2023 09:45:11" limit-uptime=8h name=axg672 password=\
    axg672 profile=wati
add comment="jun/23/2023 16:18:46" limit-uptime=8h name=uap249 password=\
    uap249 profile=wati
add comment="jun/23/2023 18:17:02" limit-uptime=8h name=ipf374 password=\
    ipf374 profile=wati
add comment="jul/21/2023 11:03:28" limit-uptime=8h name=fak584 password=\
    fak584 profile=wati
add comment="jul/10/2023 22:43:01" limit-uptime=8h name=aev483 password=\
    aev483 profile=wati
add comment="jul/18/2023 12:09:18" limit-uptime=8h name=vuk867 password=\
    vuk867 profile=wati
add comment="jul/19/2023 19:40:57" limit-uptime=8h name=kuf384 password=\
    kuf384 profile=wati
add comment="jun/29/2023 17:18:31" limit-uptime=8h name=epr764 password=\
    epr764 profile=wati
add comment="jul/19/2023 07:59:26" limit-uptime=8h name=hpv623 password=\
    hpv623 profile=wati
add comment="jul/18/2023 13:07:50" limit-uptime=8h name=hiz759 password=\
    hiz759 profile=wati
add comment="jul/03/2023 14:02:42" limit-uptime=8h name=ucr988 password=\
    ucr988 profile=wati
add comment="jun/29/2023 09:29:14" limit-uptime=8h name=dwb729 password=\
    dwb729 profile=wati
add comment="jun/30/2023 22:38:37" limit-uptime=8h name=mbz645 password=\
    mbz645 profile=wati
add comment="jun/27/2023 22:09:18" limit-uptime=8h name=vue799 password=\
    vue799 profile=wati
add comment="jun/23/2023 21:41:37" limit-uptime=8h name=pvd694 password=\
    pvd694 profile=wati
add comment="jul/13/2023 20:23:35" limit-uptime=8h name=ppr574 password=\
    ppr574 profile=wati
add comment="jun/23/2023 14:00:06" limit-uptime=8h name=ymd266 password=\
    ymd266 profile=wati
add comment="jun/27/2023 20:02:22" limit-uptime=8h name=hab562 password=\
    hab562 profile=wati
add comment="jun/30/2023 21:35:30" limit-uptime=8h name=bmt562 password=\
    bmt562 profile=wati
add comment="jul/11/2023 14:13:11" limit-uptime=8h name=uch528 password=\
    uch528 profile=wati
add comment=vc-749-05.02.23-wati limit-uptime=8h name=ade745 password=ade745 \
    profile=wati
add comment="jul/20/2023 18:10:01" limit-uptime=8h name=ifs694 password=\
    ifs694 profile=wati
add comment="jul/12/2023 02:49:10" limit-uptime=8h name=xmt739 password=\
    xmt739 profile=wati
add comment="jun/29/2023 17:58:23" limit-uptime=8h name=twh698 password=\
    twh698 profile=wati
add comment="jun/28/2023 08:47:42" limit-uptime=8h name=tpk342 password=\
    tpk342 profile=wati
add comment="jul/01/2023 18:54:34" limit-uptime=8h name=ibf525 password=\
    ibf525 profile=wati
add comment="jul/03/2023 08:17:55" limit-uptime=8h name=nmh249 password=\
    nmh249 profile=wati
add comment="jul/01/2023 18:54:22" limit-uptime=8h name=zut897 password=\
    zut897 profile=wati
add comment="jul/18/2023 11:45:38" limit-uptime=8h name=fpk964 password=\
    fpk964 profile=wati
add comment="jun/29/2023 18:39:42" limit-uptime=8h name=jnt585 password=\
    jnt585 profile=wati
add comment="jul/07/2023 12:09:42" limit-uptime=8h name=stk562 password=\
    stk562 profile=wati
add comment="jul/11/2023 20:36:41" limit-uptime=8h name=saw488 password=\
    saw488 profile=wati
add comment="jul/04/2023 20:12:46" limit-uptime=8h name=uxn643 password=\
    uxn643 profile=wati
add comment="jul/03/2023 12:58:32" limit-uptime=8h name=pab473 password=\
    pab473 profile=wati
add comment="jul/20/2023 19:13:07" limit-uptime=8h name=gxd589 password=\
    gxd589 profile=wati
add comment="jun/24/2023 00:03:32" limit-uptime=8h name=bzc836 password=\
    bzc836 profile=wati
add comment="jul/13/2023 12:49:21" limit-uptime=8h name=nyv929 password=\
    nyv929 profile=wati
add comment="jul/19/2023 23:41:45" limit-uptime=8h name=zjb254 password=\
    zjb254 profile=wati
add comment="jul/02/2023 08:00:01" limit-uptime=8h name=fni876 password=\
    fni876 profile=wati
add comment="jul/07/2023 22:19:05" limit-uptime=8h name=mmd596 password=\
    mmd596 profile=wati
add comment="jul/16/2023 18:26:25" limit-uptime=8h name=ttz772 password=\
    ttz772 profile=wati
add comment="jun/26/2023 13:57:50" limit-uptime=8h name=aku983 password=\
    aku983 profile=wati
add comment="jul/17/2023 12:10:39" limit-uptime=8h name=jmr355 password=\
    jmr355 profile=wati
add comment="jun/26/2023 18:30:57" limit-uptime=8h name=rmg283 password=\
    rmg283 profile=wati
add comment="jun/22/2023 23:03:56" limit-uptime=8h name=gec355 password=\
    gec355 profile=wati
add comment="jun/25/2023 12:11:23" limit-uptime=8h name=rae937 password=\
    rae937 profile=wati
add comment="jul/12/2023 19:25:11" limit-uptime=8h name=esw827 password=\
    esw827 profile=wati
add comment="jul/20/2023 11:50:41" limit-uptime=8h name=ads585 password=\
    ads585 profile=wati
add comment="jun/30/2023 18:38:14" limit-uptime=8h name=jip379 password=\
    jip379 profile=wati
add comment="jul/19/2023 19:06:07" limit-uptime=8h name=cnk626 password=\
    cnk626 profile=wati
add comment="jun/26/2023 19:35:19" limit-uptime=8h name=hbs889 password=\
    hbs889 profile=wati
add comment="jul/16/2023 21:15:28" limit-uptime=8h name=sht496 password=\
    sht496 profile=wati
add comment="jun/25/2023 13:59:22" limit-uptime=8h name=ndd432 password=\
    ndd432 profile=wati
add comment="jun/25/2023 16:37:50" limit-uptime=8h name=mbw365 password=\
    mbw365 profile=wati
add comment="jul/01/2023 16:05:03" limit-uptime=8h name=kti773 password=\
    kti773 profile=wati
add comment="jul/04/2023 20:45:12" limit-uptime=8h name=wja557 password=\
    wja557 profile=wati
add comment="jun/27/2023 19:43:11" limit-uptime=8h name=wad265 password=\
    wad265 profile=wati
add comment="jun/22/2023 12:54:41" limit-uptime=8h name=iwj697 password=\
    iwj697 profile=wati
add comment="jun/22/2023 21:58:56" limit-uptime=8h name=wuc285 password=\
    wuc285 profile=wati
add comment="jun/27/2023 14:08:57" limit-uptime=8h name=atd258 password=\
    atd258 profile=wati
add comment="jul/18/2023 10:49:21" limit-uptime=8h name=rzj895 password=\
    rzj895 profile=wati
add comment="jun/22/2023 18:11:19" limit-uptime=8h name=ijw672 password=\
    ijw672 profile=wati
add comment="jun/25/2023 11:14:33" limit-uptime=8h name=gvb452 password=\
    gvb452 profile=wati
add comment="jul/10/2023 21:23:45" limit-uptime=8h name=gbj332 password=\
    gbj332 profile=wati
add comment="jul/02/2023 01:12:34" limit-uptime=8h name=rrr733 password=\
    rrr733 profile=wati
add comment="jul/08/2023 03:21:34" limit-uptime=8h name=rrk257 password=\
    rrk257 profile=wati
add comment="jul/20/2023 22:59:25" limit-uptime=8h name=gjc996 password=\
    gjc996 profile=wati
add comment="jul/18/2023 23:19:15" limit-uptime=8h name=bbx962 password=\
    bbx962 profile=wati
add comment="jul/03/2023 19:52:25" limit-uptime=8h name=ydi665 password=\
    ydi665 profile=wati
add comment="jun/24/2023 22:17:24" limit-uptime=8h name=jsm379 password=\
    jsm379 profile=wati
add comment=vc-749-05.02.23-wati limit-uptime=8h name=udy229 password=udy229 \
    profile=wati
add comment="jun/30/2023 20:12:28" limit-uptime=8h name=rnw393 password=\
    rnw393 profile=wati
add comment="jul/02/2023 01:15:00" limit-uptime=8h name=wng753 password=\
    wng753 profile=wati
add comment="jul/15/2023 15:12:49" limit-uptime=8h name=zaj646 password=\
    zaj646 profile=wati
add comment="jul/04/2023 20:15:44" limit-uptime=8h name=weg635 password=\
    weg635 profile=wati
add comment="jun/24/2023 19:32:15" limit-uptime=8h name=xwc873 password=\
    xwc873 profile=wati
add comment="jul/14/2023 12:07:20" limit-uptime=8h name=trr875 password=\
    trr875 profile=wati
add comment="jul/14/2023 12:15:29" limit-uptime=8h name=vzf884 password=\
    vzf884 profile=wati
add comment="jul/01/2023 16:10:19" limit-uptime=8h name=eds625 password=\
    eds625 profile=wati
add comment="jul/22/2023 20:08:38" limit-uptime=8h name=jxa799 password=\
    jxa799 profile=wati
add comment="jul/13/2023 14:41:02" limit-uptime=8h name=rwj429 password=\
    rwj429 profile=wati
add comment="jul/04/2023 11:40:28" limit-uptime=8h name=sia558 password=\
    sia558 profile=wati
add comment="jul/18/2023 02:40:07" limit-uptime=8h name=mwb823 password=\
    mwb823 profile=wati
add comment="jul/01/2023 12:15:15" limit-uptime=8h name=mjz866 password=\
    mjz866 profile=wati
add comment="jul/11/2023 18:29:38" limit-uptime=8h name=uuh947 password=\
    uuh947 profile=wati
add comment="jul/18/2023 09:51:27" limit-uptime=8h name=vaw439 password=\
    vaw439 profile=wati
add comment="jun/25/2023 20:11:10" limit-uptime=8h name=wts557 password=\
    wts557 profile=wati
add comment="jul/12/2023 20:17:55" limit-uptime=8h name=sxc733 password=\
    sxc733 profile=wati
add comment="jul/21/2023 11:27:27" limit-uptime=8h name=cxu974 password=\
    cxu974 profile=wati
add comment="jun/29/2023 17:01:36" limit-uptime=8h name=xbu437 password=\
    xbu437 profile=wati
add comment="jun/24/2023 14:14:37" limit-uptime=8h name=bxa689 password=\
    bxa689 profile=wati
add comment="jun/26/2023 10:19:52" limit-uptime=8h name=fyu874 password=\
    fyu874 profile=wati
add comment="jul/03/2023 18:12:26" limit-uptime=8h name=gev395 password=\
    gev395 profile=wati
add comment="jul/19/2023 09:11:47" limit-uptime=8h name=yyf487 password=\
    yyf487 profile=wati
add comment="jun/27/2023 18:33:51" limit-uptime=8h name=bgt368 password=\
    bgt368 profile=wati
add comment="jun/25/2023 18:29:36" limit-uptime=8h name=fut899 password=\
    fut899 profile=wati
add comment="jun/30/2023 01:58:29" limit-uptime=8h name=eps475 password=\
    eps475 profile=wati
add comment="jun/24/2023 20:02:36" limit-uptime=8h name=uki876 password=\
    uki876 profile=wati
add comment="jul/18/2023 13:24:20" limit-uptime=8h name=ywv559 password=\
    ywv559 profile=wati
add comment="jun/27/2023 14:07:55" limit-uptime=8h name=sag557 password=\
    sag557 profile=wati
add comment="jul/18/2023 10:45:53" limit-uptime=8h name=pei366 password=\
    pei366 profile=wati
add comment="jun/26/2023 20:18:37" limit-uptime=8h name=van976 password=\
    van976 profile=wati
add comment="jun/24/2023 12:53:15" limit-uptime=8h name=gxn982 password=\
    gxn982 profile=wati
add comment="jul/10/2023 16:44:33" limit-uptime=8h name=zur558 password=\
    zur558 profile=wati
add comment="jun/30/2023 19:53:03" limit-uptime=8h name=mep777 password=\
    mep777 profile=wati
add comment="jun/29/2023 14:41:42" limit-uptime=8h name=vmw795 password=\
    vmw795 profile=wati
add comment="jul/19/2023 13:12:44" limit-uptime=8h name=gbz353 password=\
    gbz353 profile=wati
add comment="jul/03/2023 15:05:27" limit-uptime=8h name=sfg495 password=\
    sfg495 profile=wati
add comment="jul/18/2023 11:02:08" limit-uptime=8h name=axh452 password=\
    axh452 profile=wati
add comment="jul/14/2023 18:53:32" limit-uptime=8h name=bfg337 password=\
    bfg337 profile=wati
add comment="jun/26/2023 14:24:33" limit-uptime=8h name=uvu299 password=\
    uvu299 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yzz892 password=yzz892 \
    profile=-default-1-hp
add comment="jun/24/2023 17:19:46" limit-uptime=8h name=btw826 password=\
    btw826 profile=agus
add comment="jun/24/2023 16:20:17" limit-uptime=8h name=pkc749 password=\
    pkc749 profile=agus
add comment="jun/27/2023 15:24:14" limit-uptime=8h name=vtn724 password=\
    vtn724 profile=-default-1-hp
add comment="jun/23/2023 01:42:29" limit-uptime=8h name=edk867 password=\
    edk867 profile=agus
add comment="jun/24/2023 12:32:43" limit-uptime=8h name=ett772 password=\
    ett772 profile=agus
add comment="jun/24/2023 13:13:24" limit-uptime=8h name=uyt695 password=\
    uyt695 profile=agus
add comment="jun/23/2023 22:18:10" limit-uptime=8h name=uiv962 password=\
    uiv962 profile=agus
add comment="jun/24/2023 20:00:03" limit-uptime=8h name=rhv584 password=\
    rhv584 profile=agus
add comment="jun/24/2023 17:24:50" limit-uptime=8h name=xpi565 password=\
    xpi565 profile=agus
add comment="jun/28/2023 16:55:47" limit-uptime=8h name=vmx933 password=\
    vmx933 profile=-default-1-hp
add comment="jul/01/2023 18:35:09" limit-uptime=8h name=bgg934 password=\
    bgg934 profile=-default-1-hp
add comment="jun/25/2023 20:55:32" limit-uptime=8h name=tmr428 password=\
    tmr428 profile=agus
add comment="jun/22/2023 20:44:54" limit-uptime=8h name=iks484 password=\
    iks484 profile=agus
add comment="jun/22/2023 22:37:39" limit-uptime=8h name=msk466 password=\
    msk466 profile=agus
add comment="jun/24/2023 22:35:08" limit-uptime=8h name=krb389 password=\
    krb389 profile=agus
add comment="jun/24/2023 20:33:53" limit-uptime=8h name=cze964 password=\
    cze964 profile=agus
add comment="jun/24/2023 06:23:28" limit-uptime=8h name=ryx778 password=\
    ryx778 profile=agus
add comment="jun/22/2023 19:23:45" limit-uptime=8h name=nts859 password=\
    nts859 profile=agus
add comment="jun/23/2023 11:19:44" limit-uptime=8h name=cms625 password=\
    cms625 profile=agus
add comment="jun/22/2023 17:55:37" limit-uptime=8h name=pst737 password=\
    pst737 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dsh465 password=dsh465 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=wgv995 password=wgv995 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ney844 password=ney844 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hhs266 password=hhs266 \
    profile=-default-1-hp
add comment="jun/22/2023 09:12:20" limit-uptime=8h name=dkt377 password=\
    dkt377 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bnm953 password=bnm953 \
    profile=-default-1-hp
add comment="jun/22/2023 12:56:10" limit-uptime=8h name=deu722 password=\
    deu722 profile=nazim
add comment="jun/22/2023 12:56:28" limit-uptime=8h name=uyi795 password=\
    uyi795 profile=nazim
add comment="jun/22/2023 16:42:13" limit-uptime=8h name=cva567 password=\
    cva567 profile=nazim
add comment="jun/22/2023 08:59:17" limit-uptime=8h name=awu288 password=\
    awu288 profile=nazim
add comment="jun/22/2023 18:56:42" limit-uptime=8h name=jjn959 password=\
    jjn959 profile=nazim
add comment="jun/22/2023 19:42:07" limit-uptime=8h name=kpw456 password=\
    kpw456 profile=nazim
add comment="jun/23/2023 16:58:50" limit-uptime=8h name=ehv788 password=\
    ehv788 profile=nazim
add comment="jun/23/2023 17:15:41" limit-uptime=8h name=hdv736 password=\
    hdv736 profile=nazim
add comment="jun/24/2023 10:36:07" limit-uptime=8h name=jas465 password=\
    jas465 profile=nazim
add comment="jun/24/2023 12:21:03" limit-uptime=8h name=bhf757 password=\
    bhf757 profile=nazim
add comment="jun/24/2023 12:20:41" limit-uptime=8h name=gbx856 password=\
    gbx856 profile=nazim
add comment="jun/24/2023 17:18:05" limit-uptime=8h name=zgg274 password=\
    zgg274 profile=nazim
add comment="jun/24/2023 18:33:53" limit-uptime=8h name=ity428 password=\
    ity428 profile=nazim
add comment="jun/24/2023 19:38:37" limit-uptime=8h name=ccx739 password=\
    ccx739 profile=nazim
add comment="jun/24/2023 19:52:14" limit-uptime=8h name=ujm954 password=\
    ujm954 profile=nazim
add comment="jun/24/2023 20:00:19" limit-uptime=8h name=gia885 password=\
    gia885 profile=nazim
add comment="jun/24/2023 21:17:18" limit-uptime=8h name=jsu762 password=\
    jsu762 profile=nazim
add comment="jul/02/2023 06:12:27" limit-uptime=8h name=hvh553 password=\
    hvh553 profile=-default-1-hp
add comment="jun/25/2023 07:09:04" limit-uptime=8h name=vun689 password=\
    vun689 profile=nazim
add comment="jun/27/2023 21:37:25" limit-uptime=8h name=bap755 password=\
    bap755 profile=-default-1-hp
add comment="jun/24/2023 20:52:09" limit-uptime=8h name=shp855 password=\
    shp855 profile=nazim
add comment="jun/25/2023 18:45:14" limit-uptime=8h name=xes894 password=\
    xes894 profile=nazim
add comment="jun/25/2023 21:05:03" limit-uptime=8h name=gyf586 password=\
    gyf586 profile=nazim
add comment="jun/26/2023 17:23:49" limit-uptime=8h name=uvh333 password=\
    uvh333 profile=nazim
add comment="jun/25/2023 16:57:07" limit-uptime=8h name=ekx428 password=\
    ekx428 profile=nazim
add comment="jun/25/2023 16:59:09" limit-uptime=8h name=fme942 password=\
    fme942 profile=nazim
add comment="jun/26/2023 13:03:20" limit-uptime=8h name=tcr454 password=\
    tcr454 profile=nazim
add comment="jun/26/2023 13:49:23" limit-uptime=8h name=ggp342 password=\
    ggp342 profile=nazim
add comment="jun/22/2023 11:31:21" limit-uptime=12h name=jis445 password=\
    jis445 profile=witno-12jam
add comment="jun/22/2023 14:13:18" limit-uptime=12h name=txs877 password=\
    txs877 profile=witno-12jam
add comment="jun/24/2023 16:13:09" limit-uptime=12h name=hif762 password=\
    hif762 profile=witno-12jam
add comment="jun/23/2023 13:22:13" limit-uptime=12h name=ezu357 password=\
    ezu357 profile=witno-12jam
add comment="jun/23/2023 13:49:15" limit-uptime=12h name=mfa252 password=\
    mfa252 profile=witno-12jam
add comment="jun/23/2023 17:03:09" limit-uptime=12h name=fkp666 password=\
    fkp666 profile=witno-12jam
add comment="jun/24/2023 09:38:18" limit-uptime=12h name=fbi292 password=\
    fbi292 profile=witno-12jam
add comment="jun/24/2023 11:40:12" limit-uptime=12h name=swa227 password=\
    swa227 profile=witno-12jam
add comment="jun/25/2023 19:51:11" limit-uptime=12h name=ezx965 password=\
    ezx965 profile=witno-12jam
add comment="jun/26/2023 10:12:15" limit-uptime=12h name=kst274 password=\
    kst274 profile=witno-12jam
add comment="jun/26/2023 17:09:19" limit-uptime=12h name=ncn927 password=\
    ncn927 profile=witno-12jam
add comment="jun/26/2023 18:07:00" limit-uptime=12h name=ekf694 password=\
    ekf694 profile=witno-12jam
add comment="jun/26/2023 18:10:03" limit-uptime=12h name=fhe556 password=\
    fhe556 profile=witno-12jam
add comment="jul/01/2023 01:27:39" limit-uptime=12h name=amr688 password=\
    amr688 profile=witno-12jam
add comment="jun/27/2023 11:07:33" limit-uptime=12h name=xac942 password=\
    xac942 profile=witno-12jam
add comment="jul/01/2023 11:25:33" limit-uptime=12h name=irt354 password=\
    irt354 profile=witno-12jam
add comment="jun/28/2023 09:09:41" limit-uptime=12h name=pwg754 password=\
    pwg754 profile=witno-12jam
add comment="jun/28/2023 19:24:04" limit-uptime=12h name=xws656 password=\
    xws656 profile=witno-12jam
add comment="jun/29/2023 07:40:11" limit-uptime=12h name=fbw953 password=\
    fbw953 profile=witno-12jam
add comment="jun/29/2023 11:52:29" limit-uptime=12h name=smy293 password=\
    smy293 profile=witno-12jam
add comment="jun/29/2023 16:47:51" limit-uptime=12h name=gun537 password=\
    gun537 profile=witno-12jam
add comment="jul/03/2023 17:04:26" limit-uptime=12h name=rei223 password=\
    rei223 profile=witno-12jam
add comment="jun/30/2023 18:22:22" limit-uptime=12h name=xgp223 password=\
    xgp223 profile=witno-12jam
add comment="jul/01/2023 09:26:10" limit-uptime=12h name=ipc585 password=\
    ipc585 profile=witno-12jam
add comment="jul/02/2023 13:07:55" limit-uptime=12h name=jxp263 password=\
    jxp263 profile=witno-12jam
add comment="jul/01/2023 10:36:47" limit-uptime=12h name=sxm768 password=\
    sxm768 profile=witno-12jam
add comment="jul/01/2023 18:12:24" limit-uptime=12h name=ids442 password=\
    ids442 profile=witno-12jam
add comment="jul/02/2023 19:12:51" limit-uptime=12h name=mce576 password=\
    mce576 profile=witno-12jam
add comment="jul/06/2023 14:52:08" limit-uptime=12h name=xsj683 password=\
    xsj683 profile=witno-12jam
add comment="jul/03/2023 13:22:01" limit-uptime=12h name=yam978 password=\
    yam978 profile=witno-12jam
add comment="jul/04/2023 08:29:44" limit-uptime=12h name=hin965 password=\
    hin965 profile=witno-12jam
add comment="jul/04/2023 10:42:31" limit-uptime=12h name=emp679 password=\
    emp679 profile=witno-12jam
add comment="jul/04/2023 16:55:22" limit-uptime=12h name=zdm678 password=\
    zdm678 profile=witno-12jam
add comment="jul/04/2023 18:18:06" limit-uptime=12h name=eym948 password=\
    eym948 profile=witno-12jam
add comment="jul/04/2023 19:05:33" limit-uptime=12h name=vdt544 password=\
    vdt544 profile=witno-12jam
add comment="jul/05/2023 09:14:04" limit-uptime=12h name=xhm458 password=\
    xhm458 profile=witno-12jam
add comment="jul/05/2023 09:27:54" limit-uptime=12h name=fik357 password=\
    fik357 profile=witno-12jam
add comment="jul/05/2023 11:16:55" limit-uptime=12h name=ygc259 password=\
    ygc259 profile=witno-12jam
add comment="jul/05/2023 12:52:35" limit-uptime=12h name=zva736 password=\
    zva736 profile=witno-12jam
add comment="jul/05/2023 23:12:21" limit-uptime=12h name=dtt272 password=\
    dtt272 profile=witno-12jam
add comment="jul/06/2023 10:43:11" limit-uptime=12h name=kcg752 password=\
    kcg752 profile=witno-12jam
add comment="jul/06/2023 10:53:29" limit-uptime=12h name=hjy687 password=\
    hjy687 profile=witno-12jam
add comment="jul/06/2023 11:46:59" limit-uptime=12h name=zah792 password=\
    zah792 profile=witno-12jam
add comment="jul/06/2023 12:01:15" limit-uptime=12h name=xhg473 password=\
    xhg473 profile=witno-12jam
add comment="jul/08/2023 09:35:24" limit-uptime=12h name=jmk466 password=\
    jmk466 profile=witno-12jam
add comment="jul/07/2023 18:08:28" limit-uptime=12h name=uhw238 password=\
    uhw238 profile=witno-12jam
add comment="jul/08/2023 10:43:46" limit-uptime=12h name=wae563 password=\
    wae563 profile=witno-12jam
add comment="jul/08/2023 11:46:58" limit-uptime=12h name=zna565 password=\
    zna565 profile=witno-12jam
add comment="jul/08/2023 16:49:10" limit-uptime=12h name=dss263 password=\
    dss263 profile=witno-12jam
add comment="jul/09/2023 08:49:28" limit-uptime=12h name=svy934 password=\
    svy934 profile=witno-12jam
add comment="jul/09/2023 10:48:38" limit-uptime=12h name=pgn348 password=\
    pgn348 profile=witno-12jam
add comment="jul/09/2023 11:03:27" limit-uptime=12h name=gur885 password=\
    gur885 profile=witno-12jam
add comment="jul/09/2023 12:49:07" limit-uptime=12h name=sxn865 password=\
    sxn865 profile=witno-12jam
add comment="jul/09/2023 18:25:35" limit-uptime=12h name=nxm943 password=\
    nxm943 profile=witno-12jam
add comment="jul/10/2023 09:12:36" limit-uptime=12h name=gfn925 password=\
    gfn925 profile=witno-12jam
add comment="jul/10/2023 15:21:11" limit-uptime=12h name=ger439 password=\
    ger439 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=szu898 password=szu898 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=def342 password=def342 \
    profile=-default-1-hp
add comment="jul/11/2023 14:39:47" limit-uptime=12h name=udx573 password=\
    udx573 profile=witno-12jam
add comment="jul/14/2023 15:32:56" limit-uptime=12h name=ihn953 password=\
    ihn953 profile=-default-1-hp
add comment="jul/12/2023 09:29:34" limit-uptime=12h name=mug885 password=\
    mug885 profile=witno-12jam
add comment="jul/12/2023 10:37:10" limit-uptime=12h name=ywm353 password=\
    ywm353 profile=witno-12jam
add comment="jul/05/2023 12:15:45" limit-uptime=8h name=fvz829 password=\
    fvz829 profile=dian
add comment="jul/05/2023 12:21:30" limit-uptime=8h name=hhp384 password=\
    hhp384 profile=dian
add comment="jul/05/2023 13:29:27" limit-uptime=8h name=mxn755 password=\
    mxn755 profile=dian
add comment="jul/08/2023 06:36:00" limit-uptime=8h name=pyi782 password=\
    pyi782 profile=dian
add comment="jul/07/2023 06:59:23" limit-uptime=8h name=fas257 password=\
    fas257 profile=dian
add comment="jul/06/2023 20:50:32" limit-uptime=8h name=kjt876 password=\
    kjt876 profile=dian
add comment="jul/12/2023 09:43:54" limit-uptime=8h name=ugz676 password=\
    ugz676 profile=dian
add comment="jul/05/2023 18:22:48" limit-uptime=8h name=ake577 password=\
    ake577 profile=dian
add comment="jul/07/2023 13:45:39" limit-uptime=8h name=wyk754 password=\
    wyk754 profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=cwc978 password=cwc978 \
    profile=dian
add comment="jul/07/2023 21:54:58" limit-uptime=8h name=aar596 password=\
    aar596 profile=dian
add comment="jul/09/2023 08:50:48" limit-uptime=8h name=ere477 password=\
    ere477 profile=dian
add comment="jul/08/2023 21:41:17" limit-uptime=8h name=bbu542 password=\
    bbu542 profile=dian
add comment="jul/08/2023 12:17:35" limit-uptime=8h name=zgn987 password=\
    zgn987 profile=dian
add comment="jul/08/2023 08:58:43" limit-uptime=8h name=hnx464 password=\
    hnx464 profile=dian
add comment="jul/09/2023 08:56:27" limit-uptime=8h name=dzh748 password=\
    dzh748 profile=dian
add comment="jul/10/2023 20:05:39" limit-uptime=8h name=xxh278 password=\
    xxh278 profile=dian
add comment="jul/10/2023 11:16:37" limit-uptime=8h name=aig758 password=\
    aig758 profile=dian
add comment="jul/11/2023 22:44:12" limit-uptime=8h name=shs998 password=\
    shs998 profile=dian
add comment="jul/11/2023 14:33:04" limit-uptime=8h name=mwe599 password=\
    mwe599 profile=dian
add comment="jul/11/2023 22:20:13" limit-uptime=8h name=xyw836 password=\
    xyw836 profile=dian
add comment="jul/10/2023 19:51:54" limit-uptime=8h name=ncm646 password=\
    ncm646 profile=dian
add comment="jul/09/2023 12:39:18" limit-uptime=8h name=faa373 password=\
    faa373 profile=dian
add comment="jul/09/2023 16:31:02" limit-uptime=8h name=tkx253 password=\
    tkx253 profile=dian
add comment="jul/09/2023 18:19:24" limit-uptime=8h name=erb932 password=\
    erb932 profile=dian
add comment="jul/13/2023 22:08:03" limit-uptime=8h name=ncr865 password=\
    ncr865 profile=dian
add comment="jul/12/2023 23:05:14" limit-uptime=8h name=jib324 password=\
    jib324 profile=dian
add comment="jul/13/2023 07:39:37" limit-uptime=8h name=pjx228 password=\
    pjx228 profile=dian
add comment="jul/12/2023 13:35:14" limit-uptime=8h name=ugx235 password=\
    ugx235 profile=dian
add comment="jul/12/2023 17:21:40" limit-uptime=8h name=frd872 password=\
    frd872 profile=dian
add comment="jul/14/2023 13:13:34" limit-uptime=8h name=nes342 password=\
    nes342 profile=dian
add comment="jul/14/2023 18:58:00" limit-uptime=8h name=dpg997 password=\
    dpg997 profile=dian
add comment="jul/13/2023 20:02:38" limit-uptime=8h name=vxt689 password=\
    vxt689 profile=dian
add comment="jul/13/2023 14:05:16" limit-uptime=8h name=xyj656 password=\
    xyj656 profile=dian
add comment="jul/13/2023 07:38:25" limit-uptime=8h name=xde726 password=\
    xde726 profile=dian
add comment="jul/14/2023 19:40:57" limit-uptime=8h name=mab268 password=\
    mab268 profile=dian
add comment="jul/15/2023 13:52:33" limit-uptime=8h name=dce232 password=\
    dce232 profile=dian
add comment="jul/15/2023 20:52:04" limit-uptime=8h name=zap863 password=\
    zap863 profile=dian
add comment="jul/16/2023 21:37:49" limit-uptime=8h name=kte857 password=\
    kte857 profile=dian
add comment="jul/15/2023 19:32:40" limit-uptime=8h name=jyn326 password=\
    jyn326 profile=dian
add comment="jul/16/2023 08:58:53" limit-uptime=8h name=wuv559 password=\
    wuv559 profile=dian
add comment="jul/16/2023 09:18:44" limit-uptime=8h name=ygt527 password=\
    ygt527 profile=dian
add comment="jul/16/2023 18:32:51" limit-uptime=8h name=isa494 password=\
    isa494 profile=dian
add comment="jul/16/2023 09:43:54" limit-uptime=8h name=amg353 password=\
    amg353 profile=dian
add comment="jul/15/2023 21:38:32" limit-uptime=8h name=vgw798 password=\
    vgw798 profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=kjr243 password=kjr243 \
    profile=dian
add comment="jul/17/2023 18:07:23" limit-uptime=8h name=wbb582 password=\
    wbb582 profile=dian
add comment="jul/17/2023 21:34:59" limit-uptime=8h name=wec926 password=\
    wec926 profile=dian
add comment="jul/18/2023 12:18:55" limit-uptime=8h name=uxw659 password=\
    uxw659 profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=xdf385 password=xdf385 \
    profile=dian
add comment="jul/17/2023 11:22:41" limit-uptime=8h name=xkf754 password=\
    xkf754 profile=dian
add comment="jul/17/2023 20:40:54" limit-uptime=8h name=jpf899 password=\
    jpf899 profile=dian
add comment="jul/18/2023 13:29:46" limit-uptime=8h name=wgb879 password=\
    wgb879 profile=dian
add comment="jul/18/2023 18:09:32" limit-uptime=8h name=kmh473 password=\
    kmh473 profile=dian
add comment="jul/16/2023 20:59:29" limit-uptime=8h name=fjj224 password=\
    fjj224 profile=dian
add comment="jul/05/2023 16:25:56" limit-uptime=8h name=kgb382 password=\
    kgb382 profile=dian
add comment="jul/06/2023 10:39:10" limit-uptime=8h name=cpf793 password=\
    cpf793 profile=dian
add comment="jul/07/2023 16:48:50" limit-uptime=8h name=ixi668 password=\
    ixi668 profile=dian
add comment="jul/11/2023 12:40:10" limit-uptime=8h name=knv946 password=\
    knv946 profile=dian
add comment="jul/11/2023 07:18:53" limit-uptime=8h name=sas823 password=\
    sas823 profile=dian
add comment="jul/18/2023 20:09:19" limit-uptime=8h name=adj695 password=\
    adj695 profile=dian
add comment="jul/19/2023 10:19:31" limit-uptime=8h name=ebm926 password=\
    ebm926 profile=dian
add comment="jul/18/2023 22:14:21" limit-uptime=8h name=enf624 password=\
    enf624 profile=dian
add comment="jul/19/2023 01:48:29" limit-uptime=8h name=vvp798 password=\
    vvp798 profile=dian
add comment="jul/18/2023 20:28:23" limit-uptime=8h name=kbj993 password=\
    kbj993 profile=dian
add comment="jul/19/2023 12:34:47" limit-uptime=8h name=rrp956 password=\
    rrp956 profile=dian
add comment="jul/19/2023 12:37:30" limit-uptime=8h name=exh367 password=\
    exh367 profile=dian
add comment="jul/19/2023 20:16:30" limit-uptime=8h name=pvm959 password=\
    pvm959 profile=dian
add comment="jul/20/2023 19:16:10" limit-uptime=8h name=rpx569 password=\
    rpx569 profile=dian
add comment="jul/20/2023 22:13:33" limit-uptime=8h name=jbn929 password=\
    jbn929 profile=dian
add comment="jul/20/2023 12:45:20" limit-uptime=8h name=wue645 password=\
    wue645 profile=dian
add comment="jul/21/2023 18:31:13" limit-uptime=8h name=rrc362 password=\
    rrc362 profile=dian
add comment="jul/21/2023 10:10:01" limit-uptime=8h name=eri966 password=\
    eri966 profile=dian
add comment="jul/21/2023 19:34:18" limit-uptime=8h name=vkj576 password=\
    vkj576 profile=dian
add comment="jul/20/2023 20:51:27" limit-uptime=8h name=mpe733 password=\
    mpe733 profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=nfj558 password=nfj558 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=wbu333 password=wbu333 \
    profile=dian
add comment="jul/22/2023 22:23:30" limit-uptime=8h name=ygc832 password=\
    ygc832 profile=dian
add comment="jul/22/2023 20:40:13" limit-uptime=8h name=buh392 password=\
    buh392 profile=dian
add comment="jul/22/2023 06:58:10" limit-uptime=8h name=fai528 password=\
    fai528 profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=tyw666 password=tyw666 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=fsf897 password=fsf897 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=tyd655 password=tyd655 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=gat533 password=gat533 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=nah472 password=nah472 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=aih862 password=aih862 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=yrr485 password=yrr485 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=iru563 password=iru563 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=ddy834 password=ddy834 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=kse768 password=kse768 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=iib538 password=iib538 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=wzy893 password=wzy893 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=wmy223 password=wmy223 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=dre443 password=dre443 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=wai542 password=wai542 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=ugf633 password=ugf633 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=rkh324 password=rkh324 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=sxp654 password=sxp654 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=kcv635 password=kcv635 \
    profile=dian
add comment=vc-533-05.24.23-dian limit-uptime=8h name=vzg652 password=vzg652 \
    profile=dian
add comment="jul/10/2023 11:12:22" limit-uptime=8h name=crp269 password=\
    crp269 profile=agus
add comment="jul/10/2023 20:30:11" limit-uptime=8h name=irv242 password=\
    irv242 profile=agus
add comment="jul/12/2023 17:57:09" limit-uptime=8h name=diu369 password=\
    diu369 profile=agus
add comment="jul/09/2023 05:27:39" limit-uptime=8h name=zcd757 password=\
    zcd757 profile=agus
add comment="jul/10/2023 12:51:18" limit-uptime=8h name=yjc484 password=\
    yjc484 profile=agus
add comment="jul/07/2023 13:19:33" limit-uptime=8h name=mex647 password=\
    mex647 profile=agus
add comment="jul/09/2023 13:44:04" limit-uptime=8h name=vih895 password=\
    vih895 profile=agus
add comment="jul/10/2023 23:58:53" limit-uptime=8h name=ppm373 password=\
    ppm373 profile=agus
add comment="jul/12/2023 22:58:22" limit-uptime=8h name=eef589 password=\
    eef589 profile=agus
add comment="jul/09/2023 20:18:41" limit-uptime=8h name=whx523 password=\
    whx523 profile=agus
add comment="jul/10/2023 03:16:11" limit-uptime=8h name=huh898 password=\
    huh898 profile=agus
add comment="jul/09/2023 07:42:05" limit-uptime=8h name=mji258 password=\
    mji258 profile=agus
add comment="jul/07/2023 21:34:31" limit-uptime=8h name=wsr265 password=\
    wsr265 profile=agus
add comment="jul/10/2023 00:31:22" limit-uptime=8h name=xxh662 password=\
    xxh662 profile=agus
add comment="jul/13/2023 13:08:53" limit-uptime=8h name=gxn553 password=\
    gxn553 profile=agus
add comment="jul/13/2023 22:26:28" limit-uptime=8h name=itj455 password=\
    itj455 profile=agus
add comment="jul/13/2023 19:30:36" limit-uptime=8h name=drd682 password=\
    drd682 profile=agus
add comment="jul/13/2023 18:44:02" limit-uptime=8h name=jwx365 password=\
    jwx365 profile=agus
add comment="jul/14/2023 01:43:43" limit-uptime=8h name=bzc972 password=\
    bzc972 profile=agus
add comment="jul/12/2023 19:39:56" limit-uptime=8h name=mnp783 password=\
    mnp783 profile=agus
add comment="jul/09/2023 02:17:21" limit-uptime=8h name=grj962 password=\
    grj962 profile=agus
add comment="jul/13/2023 17:39:04" limit-uptime=8h name=zan374 password=\
    zan374 profile=agus
add comment="jul/07/2023 18:04:59" limit-uptime=8h name=rwf392 password=\
    rwf392 profile=agus
add comment="jul/14/2023 10:24:27" limit-uptime=8h name=gev934 password=\
    gev934 profile=agus
add comment="jul/16/2023 16:33:13" limit-uptime=8h name=ymb434 password=\
    ymb434 profile=agus
add comment="jul/09/2023 13:43:08" limit-uptime=8h name=vzn356 password=\
    vzn356 profile=agus
add comment="jul/12/2023 20:59:10" limit-uptime=8h name=skc797 password=\
    skc797 profile=agus
add comment="jul/15/2023 16:53:55" limit-uptime=8h name=tmm243 password=\
    tmm243 profile=agus
add comment="jul/15/2023 00:41:31" limit-uptime=8h name=ixv488 password=\
    ixv488 profile=agus
add comment="jul/14/2023 22:54:15" limit-uptime=8h name=knv433 password=\
    knv433 profile=agus
add comment="jul/13/2023 21:03:08" limit-uptime=8h name=jap633 password=\
    jap633 profile=agus
add comment="jul/14/2023 14:12:31" limit-uptime=8h name=ybp755 password=\
    ybp755 profile=agus
add comment="jul/11/2023 21:12:07" limit-uptime=8h name=sxy878 password=\
    sxy878 profile=agus
add comment="jul/14/2023 19:33:55" limit-uptime=8h name=bia765 password=\
    bia765 profile=agus
add comment="jul/13/2023 14:01:44" limit-uptime=8h name=pat247 password=\
    pat247 profile=agus
add comment="jul/15/2023 20:18:39" limit-uptime=8h name=chi848 password=\
    chi848 profile=agus
add comment="jul/07/2023 13:49:57" limit-uptime=8h name=vim423 password=\
    vim423 profile=agus
add comment="jul/07/2023 18:01:49" limit-uptime=8h name=dny864 password=\
    dny864 profile=agus
add comment="jul/17/2023 19:20:36" limit-uptime=8h name=vdz448 password=\
    vdz448 profile=agus
add comment="jul/15/2023 14:34:21" limit-uptime=8h name=phe566 password=\
    phe566 profile=agus
add comment="jul/12/2023 16:58:56" limit-uptime=8h name=tcz856 password=\
    tcz856 profile=agus
add comment="jul/14/2023 11:04:00" limit-uptime=8h name=bxf698 password=\
    bxf698 profile=agus
add comment="jul/12/2023 01:06:31" limit-uptime=8h name=iii577 password=\
    iii577 profile=agus
add comment="jul/14/2023 23:15:29" limit-uptime=8h name=jzz562 password=\
    jzz562 profile=agus
add comment="jul/09/2023 17:36:12" limit-uptime=8h name=xiv979 password=\
    xiv979 profile=agus
add comment="jul/08/2023 16:09:18" limit-uptime=8h name=uck952 password=\
    uck952 profile=agus
add comment="jul/10/2023 22:09:07" limit-uptime=8h name=rew653 password=\
    rew653 profile=agus
add comment="jul/11/2023 16:33:52" limit-uptime=8h name=xam996 password=\
    xam996 profile=agus
add comment="jul/07/2023 13:44:25" limit-uptime=8h name=srz478 password=\
    srz478 profile=agus
add comment="jul/12/2023 16:29:38" limit-uptime=8h name=wfh669 password=\
    wfh669 profile=agus
add comment="jul/11/2023 15:34:21" limit-uptime=8h name=ish843 password=\
    ish843 profile=agus
add comment="jul/11/2023 02:13:15" limit-uptime=8h name=axt868 password=\
    axt868 profile=agus
add comment="jul/08/2023 22:50:33" limit-uptime=8h name=jjr942 password=\
    jjr942 profile=agus
add comment="jul/11/2023 10:47:58" limit-uptime=8h name=amv692 password=\
    amv692 profile=agus
add comment="jul/11/2023 13:32:53" limit-uptime=8h name=bhc468 password=\
    bhc468 profile=agus
add comment="jun/27/2023 11:02:29" limit-uptime=8h name=kmh532 password=\
    kmh532 profile=nazim
add comment="jun/27/2023 12:24:30" limit-uptime=8h name=dvg266 password=\
    dvg266 profile=nazim
add comment="jun/27/2023 17:17:23" limit-uptime=8h name=zim889 password=\
    zim889 profile=nazim
add comment="jun/27/2023 20:35:38" limit-uptime=8h name=jrx289 password=\
    jrx289 profile=nazim
add comment="jun/27/2023 16:32:08" limit-uptime=8h name=cri848 password=\
    cri848 profile=nazim
add comment="jun/27/2023 19:33:09" limit-uptime=8h name=dab663 password=\
    dab663 profile=nazim
add comment="jun/27/2023 19:45:23" limit-uptime=8h name=emd864 password=\
    emd864 profile=nazim
add comment="jun/28/2023 13:39:25" limit-uptime=8h name=wnp444 password=\
    wnp444 profile=nazim
add comment="jun/28/2023 07:48:22" limit-uptime=8h name=jrp494 password=\
    jrp494 profile=nazim
add comment="jun/28/2023 13:45:51" limit-uptime=8h name=yjc743 password=\
    yjc743 profile=nazim
add comment="jun/28/2023 16:40:50" limit-uptime=8h name=nbp847 password=\
    nbp847 profile=nazim
add comment="jun/29/2023 11:20:44" limit-uptime=8h name=err447 password=\
    err447 profile=nazim
add comment="jun/29/2023 13:52:35" limit-uptime=8h name=tyi627 password=\
    tyi627 profile=nazim
add comment="jul/01/2023 09:30:22" limit-uptime=8h name=bzb247 password=\
    bzb247 profile=nazim
add comment="jun/30/2023 09:25:04" limit-uptime=8h name=bpz298 password=\
    bpz298 profile=nazim
add comment="jun/28/2023 16:53:55" limit-uptime=8h name=pfu544 password=\
    pfu544 profile=nazim
add comment="jun/29/2023 18:33:33" limit-uptime=8h name=pjk459 password=\
    pjk459 profile=nazim
add comment="jun/30/2023 09:49:34" limit-uptime=8h name=ads879 password=\
    ads879 profile=nazim
add comment="jul/01/2023 18:30:34" limit-uptime=8h name=zsi384 password=\
    zsi384 profile=nazim
add comment="jun/28/2023 18:00:44" limit-uptime=8h name=ecf582 password=\
    ecf582 profile=nazim
add comment="jun/29/2023 17:20:58" limit-uptime=8h name=tiw898 password=\
    tiw898 profile=nazim
add comment="jul/01/2023 21:41:16" limit-uptime=8h name=cjn785 password=\
    cjn785 profile=nazim
add comment="jun/30/2023 16:08:56" limit-uptime=8h name=cdg397 password=\
    cdg397 profile=nazim
add comment="jun/30/2023 16:57:09" limit-uptime=8h name=kfd359 password=\
    kfd359 profile=nazim
add comment="jul/01/2023 20:16:19" limit-uptime=8h name=efu688 password=\
    efu688 profile=nazim
add comment="jul/01/2023 11:55:14" limit-uptime=8h name=suc835 password=\
    suc835 profile=nazim
add comment="jul/02/2023 15:31:59" limit-uptime=8h name=gjb749 password=\
    gjb749 profile=nazim
add comment="jul/02/2023 08:37:14" limit-uptime=8h name=vxe457 password=\
    vxe457 profile=nazim
add comment="jul/02/2023 08:34:48" limit-uptime=8h name=iph979 password=\
    iph979 profile=nazim
add comment="jul/01/2023 17:41:44" limit-uptime=8h name=rsr349 password=\
    rsr349 profile=nazim
add comment="jul/02/2023 16:08:37" limit-uptime=8h name=ysc288 password=\
    ysc288 profile=nazim
add comment="jul/02/2023 12:26:34" limit-uptime=8h name=nfx533 password=\
    nfx533 profile=nazim
add comment="jul/02/2023 10:11:27" limit-uptime=8h name=izz383 password=\
    izz383 profile=nazim
add comment="jul/02/2023 08:38:09" limit-uptime=8h name=zxh597 password=\
    zxh597 profile=nazim
add comment="jul/01/2023 17:21:12" limit-uptime=8h name=vpd982 password=\
    vpd982 profile=nazim
add comment="jul/03/2023 09:01:50" limit-uptime=8h name=kxb877 password=\
    kxb877 profile=nazim
add comment="jul/02/2023 16:31:20" limit-uptime=8h name=pwf529 password=\
    pwf529 profile=nazim
add comment="jul/02/2023 10:07:40" limit-uptime=8h name=usf623 password=\
    usf623 profile=nazim
add comment="jul/02/2023 18:44:37" limit-uptime=8h name=rnb738 password=\
    rnb738 profile=nazim
add comment="jul/02/2023 19:30:08" limit-uptime=8h name=bst879 password=\
    bst879 profile=nazim
add comment="jul/03/2023 10:37:18" limit-uptime=8h name=jsg993 password=\
    jsg993 profile=nazim
add comment="jul/03/2023 10:20:06" limit-uptime=8h name=egz338 password=\
    egz338 profile=nazim
add comment="jul/04/2023 11:07:28" limit-uptime=8h name=anx868 password=\
    anx868 profile=nazim
add comment="jul/02/2023 19:46:21" limit-uptime=8h name=apk847 password=\
    apk847 profile=nazim
add comment="jul/03/2023 12:21:14" limit-uptime=8h name=pxz788 password=\
    pxz788 profile=nazim
add comment="jul/03/2023 18:26:51" limit-uptime=8h name=iwd989 password=\
    iwd989 profile=nazim
add comment="jul/03/2023 19:27:36" limit-uptime=8h name=bfg922 password=\
    bfg922 profile=nazim
add comment="jul/03/2023 14:19:54" limit-uptime=8h name=nmb643 password=\
    nmb643 profile=nazim
add comment="jul/03/2023 11:12:31" limit-uptime=8h name=rxx436 password=\
    rxx436 profile=nazim
add comment="jul/01/2023 17:09:39" limit-uptime=8h name=vym633 password=\
    vym633 profile=nazim
add comment="jul/04/2023 11:16:04" limit-uptime=8h name=zpk434 password=\
    zpk434 profile=nazim
add comment="jul/04/2023 11:17:59" limit-uptime=8h name=awm875 password=\
    awm875 profile=nazim
add comment="jul/04/2023 11:56:28" limit-uptime=8h name=eie284 password=\
    eie284 profile=nazim
add comment="jul/05/2023 12:18:06" limit-uptime=8h name=kxp423 password=\
    kxp423 profile=nazim
add comment="jul/07/2023 12:47:01" limit-uptime=8h name=yey797 password=\
    yey797 profile=nazim
add comment="jul/05/2023 15:45:05" limit-uptime=8h name=zfn329 password=\
    zfn329 profile=nazim
add comment="jul/06/2023 11:21:36" limit-uptime=8h name=yhw575 password=\
    yhw575 profile=nazim
add comment="jul/06/2023 19:28:47" limit-uptime=8h name=gmc885 password=\
    gmc885 profile=nazim
add comment="jul/05/2023 12:36:53" limit-uptime=8h name=fgf675 password=\
    fgf675 profile=nazim
add comment="jul/05/2023 10:15:49" limit-uptime=8h name=wip998 password=\
    wip998 profile=nazim
add comment="jul/06/2023 20:33:25" limit-uptime=8h name=jsp524 password=\
    jsp524 profile=nazim
add comment="jul/05/2023 19:33:01" limit-uptime=8h name=vfm356 password=\
    vfm356 profile=nazim
add comment="jul/06/2023 21:58:55" limit-uptime=8h name=pmw796 password=\
    pmw796 profile=nazim
add comment="jul/05/2023 19:33:08" limit-uptime=8h name=mzu783 password=\
    mzu783 profile=nazim
add comment="jul/05/2023 16:50:12" limit-uptime=8h name=jfh774 password=\
    jfh774 profile=nazim
add comment="jul/08/2023 12:05:32" limit-uptime=8h name=cba648 password=\
    cba648 profile=nazim
add comment="jul/08/2023 16:28:03" limit-uptime=8h name=zkg833 password=\
    zkg833 profile=nazim
add comment="jul/07/2023 11:24:46" limit-uptime=8h name=szc566 password=\
    szc566 profile=nazim
add comment="jul/07/2023 11:06:24" limit-uptime=8h name=emp327 password=\
    emp327 profile=nazim
add comment="jul/06/2023 21:30:49" limit-uptime=8h name=hfx992 password=\
    hfx992 profile=nazim
add comment="jul/08/2023 12:16:50" limit-uptime=8h name=ysf837 password=\
    ysf837 profile=nazim
add comment="jul/07/2023 19:43:48" limit-uptime=8h name=rwy827 password=\
    rwy827 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=vvn264 password=vvn264 \
    profile=-default-1-hp
add comment="jul/07/2023 14:01:17" limit-uptime=8h name=ndz297 password=\
    ndz297 profile=nazim
add comment="jul/08/2023 10:02:21" limit-uptime=8h name=dth888 password=\
    dth888 profile=nazim
add comment="jul/08/2023 14:17:06" limit-uptime=8h name=cxb697 password=\
    cxb697 profile=nazim
add comment="jul/09/2023 09:48:42" limit-uptime=8h name=gsj375 password=\
    gsj375 profile=nazim
add comment="jul/09/2023 21:33:55" limit-uptime=8h name=hbu688 password=\
    hbu688 profile=nazim
add comment="jul/08/2023 16:49:45" limit-uptime=8h name=ixv297 password=\
    ixv297 profile=nazim
add comment="jul/08/2023 18:56:26" limit-uptime=8h name=pru876 password=\
    pru876 profile=nazim
add comment="jul/08/2023 19:50:29" limit-uptime=8h name=xrx828 password=\
    xrx828 profile=nazim
add comment="jul/09/2023 20:37:15" limit-uptime=8h name=ysu589 password=\
    ysu589 profile=nazim
add comment="jul/08/2023 20:55:49" limit-uptime=8h name=gbu796 password=\
    gbu796 profile=nazim
add comment="jul/09/2023 11:24:00" limit-uptime=8h name=kdf944 password=\
    kdf944 profile=nazim
add comment="jul/09/2023 12:15:18" limit-uptime=8h name=rci974 password=\
    rci974 profile=nazim
add comment="jul/09/2023 10:51:40" limit-uptime=8h name=dii629 password=\
    dii629 profile=nazim
add comment="jul/09/2023 13:24:36" limit-uptime=8h name=fvu454 password=\
    fvu454 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yed449 password=yed449 \
    profile=-default-1-hp
add comment="jul/10/2023 10:04:00" limit-uptime=8h name=tac458 password=\
    tac458 profile=nazim
add comment="jul/09/2023 18:11:45" limit-uptime=8h name=dhw426 password=\
    dhw426 profile=nazim
add comment="jul/10/2023 11:47:04" limit-uptime=8h name=hef599 password=\
    hef599 profile=nazim
add comment="jul/10/2023 13:42:17" limit-uptime=8h name=yky966 password=\
    yky966 profile=nazim
add comment="jul/10/2023 17:14:41" limit-uptime=8h name=mbg582 password=\
    mbg582 profile=nazim
add comment="jul/10/2023 18:37:22" limit-uptime=8h name=rys778 password=\
    rys778 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rbu335 password=rbu335 \
    profile=-default-1-hp
add comment="jul/10/2023 13:49:58" limit-uptime=8h name=kwz999 password=\
    kwz999 profile=nazim
add comment="jul/10/2023 18:21:58" limit-uptime=8h name=dny868 password=\
    dny868 profile=nazim
add comment="jul/10/2023 19:35:06" limit-uptime=8h name=jsz352 password=\
    jsz352 profile=nazim
add comment="jul/11/2023 18:18:43" limit-uptime=8h name=yyt664 password=\
    yyt664 profile=nazim
add comment="jul/11/2023 18:13:09" limit-uptime=8h name=npr566 password=\
    npr566 profile=nazim
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hij638 password=hij638 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=gtd265 password=gtd265 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=dmu266 password=dmu266 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=tvb542 password=tvb542 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hyu747 password=hyu747 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=kaj656 password=kaj656 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=jtr467 password=jtr467 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=tgx686 password=tgx686 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=dgk549 password=dgk549 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=xbm642 password=xbm642 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hkf799 password=hkf799 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=vns324 password=vns324 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=wtw828 password=wtw828 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=rpx526 password=rpx526 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ren482 password=ren482 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ufs539 password=ufs539 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ujm275 password=ujm275 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=rbk459 password=rbk459 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ptt546 password=ptt546 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=khp527 password=khp527 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=efb362 password=efb362 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hgs742 password=hgs742 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=iad527 password=iad527 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=kja736 password=kja736 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ciw265 password=ciw265 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=wst742 password=wst742 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=gag754 password=gag754 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=kdx334 password=kdx334 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=wyp358 password=wyp358 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=jda867 password=jda867 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=xuy446 password=xuy446 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=rug247 password=rug247 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=yvy627 password=yvy627 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=jrf288 password=jrf288 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hjz585 password=hjz585 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=myh593 password=myh593 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=xzj577 password=xzj577 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ruf637 password=ruf637 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=crj758 password=crj758 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=vwv756 password=vwv756 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=agn268 password=agn268 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=yvb827 password=yvb827 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=yau467 password=yau467 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=iji576 password=iji576 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=vxs327 password=vxs327 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=xbb649 password=xbb649 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hzm682 password=hzm682 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=mpj842 password=mpj842 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=xuc258 password=xuc258 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=vim487 password=vim487 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=ayy462 password=ayy462 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=nmi853 password=nmi853 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=chg744 password=chg744 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=hbz367 password=hbz367 \
    profile=agus
add comment=vc-393-06.05.23-agus limit-uptime=8h name=acg485 password=acg485 \
    profile=agus
add comment="jul/19/2023 11:38:25" limit-uptime=8h name=cna947 password=\
    cna947 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=zuu782 password=zuu782 \
    profile=agus
add comment="jul/16/2023 21:06:42" limit-uptime=8h name=cpe725 password=\
    cpe725 profile=agus
add comment="jul/23/2023 01:38:05" limit-uptime=8h name=uvc648 password=\
    uvc648 profile=agus
add comment="jul/20/2023 05:27:53" limit-uptime=8h name=xgu282 password=\
    xgu282 profile=agus
add comment="jul/17/2023 21:43:14" limit-uptime=8h name=hzt526 password=\
    hzt526 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=hdz634 password=hdz634 \
    profile=agus
add comment="jul/20/2023 22:20:51" limit-uptime=8h name=cyh996 password=\
    cyh996 profile=agus
add comment="jul/19/2023 02:29:15" limit-uptime=8h name=yra865 password=\
    yra865 profile=agus
add comment="jul/18/2023 19:05:23" limit-uptime=8h name=rfv473 password=\
    rfv473 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=yjs428 password=yjs428 \
    profile=agus
add comment="jul/18/2023 23:48:44" limit-uptime=8h name=fbn994 password=\
    fbn994 profile=agus
add comment="jul/19/2023 01:51:27" limit-uptime=8h name=vxc982 password=\
    vxc982 profile=agus
add comment="jul/18/2023 13:06:36" limit-uptime=8h name=pnx555 password=\
    pnx555 profile=agus
add comment="jul/16/2023 18:02:19" limit-uptime=8h name=sbh485 password=\
    sbh485 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=zer574 password=zer574 \
    profile=agus
add comment="jul/22/2023 13:54:24" limit-uptime=8h name=mrv669 password=\
    mrv669 profile=agus
add comment="jul/21/2023 21:57:20" limit-uptime=8h name=xjf865 password=\
    xjf865 profile=agus
add comment="jul/20/2023 19:43:03" limit-uptime=8h name=ncp694 password=\
    ncp694 profile=agus
add comment="jul/19/2023 15:28:33" limit-uptime=8h name=sff523 password=\
    sff523 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=bds668 password=bds668 \
    profile=agus
add comment="jul/21/2023 01:59:03" limit-uptime=8h name=mfz782 password=\
    mfz782 profile=agus
add comment="jul/22/2023 06:17:34" limit-uptime=8h name=jdw284 password=\
    jdw284 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=dnc372 password=dnc372 \
    profile=agus
add comment="jul/19/2023 04:31:52" limit-uptime=8h name=sbv255 password=\
    sbv255 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=ksv662 password=ksv662 \
    profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=vti834 password=vti834 \
    profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=iur959 password=iur959 \
    profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=vcx878 password=vcx878 \
    profile=agus
add comment="jul/19/2023 00:20:10" limit-uptime=8h name=pwu935 password=\
    pwu935 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=xth723 password=xth723 \
    profile=agus
add comment="jul/18/2023 20:15:25" limit-uptime=8h name=kcm746 password=\
    kcm746 profile=agus
add comment="jul/23/2023 01:48:46" limit-uptime=8h name=khm523 password=\
    khm523 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=urz539 password=urz539 \
    profile=agus
add comment="jul/16/2023 20:54:07" limit-uptime=8h name=dzx954 password=\
    dzx954 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=zip556 password=zip556 \
    profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=umr675 password=umr675 \
    profile=agus
add comment="jul/19/2023 14:38:07" limit-uptime=8h name=njw273 password=\
    njw273 profile=agus
add comment="jul/19/2023 15:01:04" limit-uptime=8h name=dgp595 password=\
    dgp595 profile=agus
add comment="jul/18/2023 01:17:17" limit-uptime=8h name=bwy759 password=\
    bwy759 profile=agus
add comment="jul/19/2023 17:33:11" limit-uptime=8h name=zrs563 password=\
    zrs563 profile=agus
add comment="jul/18/2023 16:19:08" limit-uptime=8h name=spv422 password=\
    spv422 profile=agus
add comment="jul/17/2023 19:47:55" limit-uptime=8h name=xkj839 password=\
    xkj839 profile=agus
add comment="jul/16/2023 00:19:57" limit-uptime=8h name=krg882 password=\
    krg882 profile=agus
add comment="jul/15/2023 22:29:30" limit-uptime=8h name=ktu559 password=\
    ktu559 profile=agus
add comment="jul/21/2023 01:55:14" limit-uptime=8h name=xfj946 password=\
    xfj946 profile=agus
add comment=vc-415-06.05.23-agus limit-uptime=8h name=tmp854 password=tmp854 \
    profile=agus
add comment="jul/19/2023 23:25:04" limit-uptime=8h name=krx745 password=\
    krx745 profile=agus
add comment="jul/21/2023 20:43:14" limit-uptime=8h name=pti868 password=\
    pti868 profile=agus
add comment="jul/16/2023 22:40:54" limit-uptime=8h name=sfp646 password=\
    sfp646 profile=agus
add comment="jul/21/2023 19:33:05" limit-uptime=8h name=txr229 password=\
    txr229 profile=agus
add comment="jul/17/2023 10:55:42" limit-uptime=8h name=tvu538 password=\
    tvu538 profile=agus
add comment="jul/16/2023 19:11:54" limit-uptime=8h name=tmu374 password=\
    tmu374 profile=agus
add comment="jul/17/2023 10:58:53" limit-uptime=8h name=asu575 password=\
    asu575 profile=agus
add comment="jul/17/2023 19:06:06" limit-uptime=8h name=sre327 password=\
    sre327 profile=agus
add comment=vc-567-06.05.23-dian limit-uptime=8h name=vrj747 password=vrj747 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=bfe575 password=bfe575 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ppb528 password=ppb528 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=inv626 password=inv626 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=aat582 password=aat582 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=xis454 password=xis454 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=une398 password=une398 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=cnr882 password=cnr882 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rwu256 password=rwu256 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wfa487 password=wfa487 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=hnh227 password=hnh227 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ubj945 password=ubj945 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=frj484 password=frj484 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=prc789 password=prc789 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ehk992 password=ehk992 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=aue634 password=aue634 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ndv499 password=ndv499 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=trc782 password=trc782 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pgh352 password=pgh352 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=dpu983 password=dpu983 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=txm378 password=txm378 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=xmt253 password=xmt253 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=hgz452 password=hgz452 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=avr273 password=avr273 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ern265 password=ern265 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=uba832 password=uba832 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=zip462 password=zip462 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ved692 password=ved692 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=cjp397 password=cjp397 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=jjc325 password=jjc325 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=msc764 password=msc764 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=cmg785 password=cmg785 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ssu235 password=ssu235 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=vix344 password=vix344 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=shh554 password=shh554 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rib288 password=rib288 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=khi996 password=khi996 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=kvr443 password=kvr443 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=gap826 password=gap826 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=myb292 password=myb292 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rka538 password=rka538 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=sxf824 password=sxf824 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wsn348 password=wsn348 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=zay786 password=zay786 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pyd342 password=pyd342 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wbp355 password=wbp355 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rhm935 password=rhm935 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=twf632 password=twf632 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wzc594 password=wzc594 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=nxw377 password=nxw377 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=sxf739 password=sxf739 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=udr432 password=udr432 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=kng598 password=kng598 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pve822 password=pve822 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=mze826 password=mze826 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rdc284 password=rdc284 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wtt955 password=wtt955 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=zud385 password=zud385 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=bpu232 password=bpu232 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=xnn679 password=xnn679 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pih295 password=pih295 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=sub792 password=sub792 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=gpc934 password=gpc934 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=gui385 password=gui385 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pmx933 password=pmx933 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=pxn844 password=pxn844 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=viy957 password=viy957 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=siy627 password=siy627 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ytd564 password=ytd564 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=sjm996 password=sjm996 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rhi398 password=rhi398 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wkm487 password=wkm487 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=zrh536 password=zrh536 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=mnd989 password=mnd989 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=xtw986 password=xtw986 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=gvs852 password=gvs852 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=iyz548 password=iyz548 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ude673 password=ude673 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ckx446 password=ckx446 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=vdj972 password=vdj972 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ryy343 password=ryy343 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=inr929 password=inr929 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=itm252 password=itm252 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=mgw455 password=mgw455 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=rsx979 password=rsx979 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=azf227 password=azf227 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=una459 password=una459 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=dkj245 password=dkj245 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wks356 password=wks356 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=kdc975 password=kdc975 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=jgg947 password=jgg947 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=amd599 password=amd599 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=hdx794 password=hdx794 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=mxr836 password=mxr836 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ekt252 password=ekt252 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=njv952 password=njv952 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=hup454 password=hup454 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=ruk634 password=ruk634 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=wnb382 password=wnb382 \
    profile=dian
add comment=vc-567-06.05.23-dian limit-uptime=8h name=vuy896 password=vuy896 \
    profile=dian
add comment="jul/22/2023 08:47:28" limit-uptime=8h name=kcn456 password=\
    kcn456 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=edn498 password=edn498 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sgn879 password=sgn879 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rna575 password=rna575 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jwi742 password=jwi742 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yst856 password=yst856 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jsk636 password=jsk636 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xgp985 password=xgp985 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=fpk992 password=fpk992 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=khv637 password=khv637 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zbz795 password=zbz795 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=kym644 password=kym644 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uih264 password=uih264 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dwp342 password=dwp342 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jkz969 password=jkz969 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sfd582 password=sfd582 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wwz455 password=wwz455 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hfc742 password=hfc742 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=meu922 password=meu922 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hke494 password=hke494 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=fbx565 password=fbx565 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jih345 password=jih345 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=efw738 password=efw738 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vus824 password=vus824 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jfv569 password=jfv569 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cfx329 password=cfx329 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=chc235 password=chc235 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pnt686 password=pnt686 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uyu653 password=uyu653 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gch562 password=gch562 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jai453 password=jai453 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=tuz264 password=tuz264 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xxi486 password=xxi486 \
    profile=wati
add comment="jul/22/2023 19:50:03" limit-uptime=8h name=rzs358 password=\
    rzs358 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dvj792 password=dvj792 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dif974 password=dif974 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vsp383 password=vsp383 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=myi745 password=myi745 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hvx463 password=hvx463 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wvs996 password=wvs996 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=egh923 password=egh923 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dim229 password=dim229 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gea589 password=gea589 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jfc966 password=jfc966 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zut757 password=zut757 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=mbn827 password=mbn827 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vxr752 password=vxr752 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ezu738 password=ezu738 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jah558 password=jah558 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=huf274 password=huf274 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vvg735 password=vvg735 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xmd889 password=xmd889 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=keg296 password=keg296 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ric358 password=ric358 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hty656 password=hty656 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rtp548 password=rtp548 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=itf975 password=itf975 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yvx442 password=yvx442 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pfb398 password=pfb398 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ved752 password=ved752 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nby965 password=nby965 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=kgr643 password=kgr643 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hca529 password=hca529 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pbr366 password=pbr366 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wwf738 password=wwf738 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ydr994 password=ydr994 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xza594 password=xza594 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=shg533 password=shg533 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=byx824 password=byx824 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vgw698 password=vgw698 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=msb668 password=msb668 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=faj497 password=faj497 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zxt975 password=zxt975 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=bai335 password=bai335 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pua495 password=pua495 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ein787 password=ein787 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hmy367 password=hmy367 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xeg453 password=xeg453 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wyr648 password=wyr648 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rks864 password=rks864 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cih255 password=cih255 \
    profile=wati
add comment="jul/22/2023 19:32:42" limit-uptime=8h name=uci585 password=\
    uci585 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hmh282 password=hmh282 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dfm675 password=dfm675 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xrx497 password=xrx497 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cdn436 password=cdn436 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=htf738 password=htf738 \
    profile=wati
add comment="jul/22/2023 23:49:26" limit-uptime=8h name=wax343 password=\
    wax343 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=upr999 password=upr999 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vww623 password=vww623 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pug969 password=pug969 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wsk498 password=wsk498 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=bfi254 password=bfi254 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gxd492 password=gxd492 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vpz399 password=vpz399 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wat383 password=wat383 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rwe695 password=rwe695 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gvv369 password=gvv369 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uch388 password=uch388 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zbg344 password=zbg344 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sct723 password=sct723 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=iei225 password=iei225 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=aia772 password=aia772 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ugp277 password=ugp277 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rxw694 password=rxw694 \
    profile=wati
add comment="jul/22/2023 17:05:12" limit-uptime=8h name=wjg288 password=\
    wjg288 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=fwr296 password=fwr296 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cnu865 password=cnu865 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dgi892 password=dgi892 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jrk668 password=jrk668 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=csb374 password=csb374 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wch624 password=wch624 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=svd543 password=svd543 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=crb462 password=crb462 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ryn987 password=ryn987 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sjt789 password=sjt789 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xdp783 password=xdp783 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=bpy572 password=bpy572 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ddp236 password=ddp236 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yjs683 password=yjs683 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nff898 password=nff898 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=udf578 password=udf578 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=asf368 password=asf368 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xgj985 password=xgj985 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hdm888 password=hdm888 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jhp992 password=jhp992 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pbz266 password=pbz266 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yzy896 password=yzy896 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=und954 password=und954 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=umc256 password=umc256 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ueh289 password=ueh289 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=bph852 password=bph852 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yns235 password=yns235 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=acy442 password=acy442 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=tzx996 password=tzx996 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uye237 password=uye237 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rnp979 password=rnp979 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uja742 password=uja742 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jzc565 password=jzc565 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=suc253 password=suc253 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hca292 password=hca292 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dkv273 password=dkv273 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zce228 password=zce228 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ijk245 password=ijk245 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jdb988 password=jdb988 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ckf465 password=ckf465 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zkx377 password=zkx377 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dnx753 password=dnx753 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wwh597 password=wwh597 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ghb356 password=ghb356 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xca968 password=xca968 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gtz948 password=gtz948 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cyr939 password=cyr939 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sns679 password=sns679 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=adf629 password=adf629 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gxh496 password=gxh496 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=dcp342 password=dcp342 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hxy877 password=hxy877 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gux486 password=gux486 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=zwa686 password=zwa686 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=tth947 password=tth947 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wky937 password=wky937 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pzi352 password=pzi352 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=fkv487 password=fkv487 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=izr789 password=izr789 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wpt294 password=wpt294 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uyg586 password=uyg586 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jfv524 password=jfv524 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=avd657 password=avd657 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vug694 password=vug694 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uei734 password=uei734 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nxh244 password=nxh244 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yrh254 password=yrh254 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cnd388 password=cnd388 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gbp744 password=gbp744 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rcv758 password=rcv758 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nfv829 password=nfv829 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hmn478 password=hmn478 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hku486 password=hku486 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nix962 password=nix962 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xni934 password=xni934 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=pze985 password=pze985 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=div585 password=div585 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vvd553 password=vvd553 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hyb595 password=hyb595 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rjr354 password=rjr354 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yrh365 password=yrh365 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jhv574 password=jhv574 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ntn395 password=ntn395 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xmf685 password=xmf685 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=phu522 password=phu522 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=izd949 password=izd949 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=cmy862 password=cmy862 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=byg464 password=byg464 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hjp347 password=hjp347 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jzf455 password=jzf455 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uch854 password=uch854 \
    profile=wati
add comment="jul/22/2023 14:29:58" limit-uptime=8h name=vze736 password=\
    vze736 profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=mux959 password=mux959 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jmc426 password=jmc426 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=sur632 password=sur632 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wff824 password=wff824 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ttj754 password=ttj754 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xty527 password=xty527 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gdz794 password=gdz794 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rwd999 password=rwd999 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=evb382 password=evb382 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=bss857 password=bss857 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=kne573 password=kne573 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ezj223 password=ezj223 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wdm647 password=wdm647 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=brg248 password=brg248 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vyp686 password=vyp686 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=kar699 password=kar699 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ztf422 password=ztf422 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ppm576 password=ppm576 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gkg684 password=gkg684 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=eah464 password=eah464 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xvi858 password=xvi858 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=xgg977 password=xgg977 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=byh493 password=byh493 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rpr984 password=rpr984 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=gnv687 password=gnv687 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ycb774 password=ycb774 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vgn677 password=vgn677 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hsj563 password=hsj563 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=mrs842 password=mrs842 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=edd627 password=edd627 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=arb952 password=arb952 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=yyu262 password=yyu262 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=mky574 password=mky574 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hrm375 password=hrm375 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rww645 password=rww645 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=kci974 password=kci974 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=nep386 password=nep386 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jdz334 password=jdz334 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=rnz482 password=rnz482 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=csw684 password=csw684 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=wad853 password=wad853 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=efx748 password=efx748 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=hsw492 password=hsw492 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=mbt478 password=mbt478 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=ucb678 password=ucb678 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=stu723 password=stu723 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=beb574 password=beb574 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jys789 password=jys789 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=vzw923 password=vzw923 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=tdy978 password=tdy978 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=uiy286 password=uiy286 \
    profile=wati
add comment=vc-673-06.05.23-wati limit-uptime=8h name=jvm747 password=jvm747 \
    profile=wati
add comment="jul/12/2023 05:39:05" limit-uptime=8h name=djv954 password=\
    djv954 profile=nazim
add comment="jul/11/2023 17:01:10" limit-uptime=8h name=yue622 password=\
    yue622 profile=nazim
add comment="jul/12/2023 06:40:09" limit-uptime=8h name=evm353 password=\
    evm353 profile=nazim
add comment="jul/12/2023 16:04:21" limit-uptime=8h name=ivr288 password=\
    ivr288 profile=nazim
add comment="jul/13/2023 00:18:49" limit-uptime=8h name=dpc572 password=\
    dpc572 profile=nazim
add comment="jul/13/2023 19:48:00" limit-uptime=8h name=zzj552 password=\
    zzj552 profile=nazim
add comment="jul/12/2023 19:19:21" limit-uptime=8h name=nzv635 password=\
    nzv635 profile=nazim
add comment="jul/12/2023 12:01:20" limit-uptime=8h name=bye546 password=\
    bye546 profile=nazim
add comment="jul/12/2023 17:04:35" limit-uptime=8h name=prr356 password=\
    prr356 profile=nazim
add comment="jul/12/2023 15:33:04" limit-uptime=8h name=dgr799 password=\
    dgr799 profile=nazim
add comment="jul/12/2023 16:30:04" limit-uptime=8h name=hrm892 password=\
    hrm892 profile=nazim
add comment="jul/12/2023 16:59:50" limit-uptime=8h name=wvb495 password=\
    wvb495 profile=nazim
add comment="jul/14/2023 10:52:11" limit-uptime=8h name=vmv548 password=\
    vmv548 profile=nazim
add comment="jul/13/2023 11:21:39" limit-uptime=8h name=efa857 password=\
    efa857 profile=nazim
add comment="jul/13/2023 10:52:45" limit-uptime=8h name=cnj228 password=\
    cnj228 profile=nazim
add comment="jul/14/2023 16:45:09" limit-uptime=8h name=ezy294 password=\
    ezy294 profile=nazim
add comment="jul/13/2023 20:47:42" limit-uptime=8h name=zfh564 password=\
    zfh564 profile=nazim
add comment="jul/15/2023 21:29:48" limit-uptime=8h name=twc683 password=\
    twc683 profile=nazim
add comment="jul/13/2023 20:41:38" limit-uptime=8h name=rei259 password=\
    rei259 profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=mcn246 password=mcn246 \
    profile=nazim
add comment="jul/15/2023 10:48:27" limit-uptime=8h name=che929 password=\
    che929 profile=nazim
add comment="jul/14/2023 15:32:46" limit-uptime=8h name=ffu972 password=\
    ffu972 profile=nazim
add comment="jul/14/2023 13:26:32" limit-uptime=8h name=cjt382 password=\
    cjt382 profile=nazim
add comment="jul/14/2023 11:30:44" limit-uptime=8h name=him637 password=\
    him637 profile=nazim
add comment="jul/14/2023 11:15:14" limit-uptime=8h name=wua744 password=\
    wua744 profile=nazim
add comment="jul/15/2023 17:01:57" limit-uptime=8h name=scg632 password=\
    scg632 profile=nazim
add comment="jul/15/2023 16:51:30" limit-uptime=8h name=rbd629 password=\
    rbd629 profile=nazim
add comment="jul/14/2023 15:59:17" limit-uptime=8h name=jiv536 password=\
    jiv536 profile=nazim
add comment="jul/14/2023 22:26:13" limit-uptime=8h name=vhm648 password=\
    vhm648 profile=nazim
add comment="jul/15/2023 20:34:14" limit-uptime=8h name=khs334 password=\
    khs334 profile=nazim
add comment="jul/16/2023 17:01:28" limit-uptime=8h name=zuc999 password=\
    zuc999 profile=nazim
add comment="jul/16/2023 10:31:35" limit-uptime=8h name=cen722 password=\
    cen722 profile=nazim
add comment="jul/15/2023 21:09:17" limit-uptime=8h name=vmd694 password=\
    vmd694 profile=nazim
add comment="jul/16/2023 15:02:37" limit-uptime=8h name=wzr526 password=\
    wzr526 profile=nazim
add comment="jul/17/2023 11:13:43" limit-uptime=8h name=mus273 password=\
    mus273 profile=nazim
add comment="jul/17/2023 11:21:22" limit-uptime=8h name=syi722 password=\
    syi722 profile=nazim
add comment="jul/17/2023 10:45:15" limit-uptime=8h name=czk389 password=\
    czk389 profile=nazim
add comment="jul/17/2023 08:38:21" limit-uptime=8h name=rwj937 password=\
    rwj937 profile=nazim
add comment="jul/18/2023 20:14:26" limit-uptime=8h name=btp393 password=\
    btp393 profile=nazim
add comment="jul/17/2023 07:43:57" limit-uptime=8h name=tdb333 password=\
    tdb333 profile=nazim
add comment="jul/18/2023 13:08:07" limit-uptime=8h name=bpv898 password=\
    bpv898 profile=nazim
add comment="jul/17/2023 13:24:31" limit-uptime=8h name=jyj272 password=\
    jyj272 profile=nazim
add comment="jul/17/2023 11:40:58" limit-uptime=8h name=etz337 password=\
    etz337 profile=nazim
add comment="jul/17/2023 19:54:53" limit-uptime=8h name=xik648 password=\
    xik648 profile=nazim
add comment="jul/17/2023 12:21:55" limit-uptime=8h name=bhv653 password=\
    bhv653 profile=nazim
add comment="jul/19/2023 12:29:09" limit-uptime=8h name=jni425 password=\
    jni425 profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=kry554 password=kry554 \
    profile=nazim
add comment="jul/18/2023 14:24:10" limit-uptime=8h name=dxd964 password=\
    dxd964 profile=nazim
add comment="jul/18/2023 11:27:48" limit-uptime=8h name=bib639 password=\
    bib639 profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=svc762 password=svc762 \
    profile=nazim
add comment="jul/19/2023 16:36:25" limit-uptime=8h name=fva278 password=\
    fva278 profile=nazim
add comment="jul/19/2023 12:13:12" limit-uptime=8h name=nkp763 password=\
    nkp763 profile=nazim
add comment="jul/18/2023 21:07:55" limit-uptime=8h name=etm365 password=\
    etm365 profile=nazim
add comment="jul/19/2023 12:27:08" limit-uptime=8h name=kwd246 password=\
    kwd246 profile=nazim
add comment="jul/19/2023 20:57:20" limit-uptime=8h name=nzk964 password=\
    nzk964 profile=nazim
add comment="jul/19/2023 18:41:08" limit-uptime=8h name=utr327 password=\
    utr327 profile=nazim
add comment="jul/20/2023 11:53:22" limit-uptime=8h name=cbb896 password=\
    cbb896 profile=nazim
add comment="jul/20/2023 19:45:31" limit-uptime=8h name=rui593 password=\
    rui593 profile=nazim
add comment="jul/21/2023 11:12:56" limit-uptime=8h name=gcn234 password=\
    gcn234 profile=nazim
add comment="jul/20/2023 16:29:33" limit-uptime=8h name=zhp964 password=\
    zhp964 profile=nazim
add comment="jul/20/2023 17:02:54" limit-uptime=8h name=ufw788 password=\
    ufw788 profile=nazim
add comment="jul/20/2023 18:36:59" limit-uptime=8h name=wnc368 password=\
    wnc368 profile=nazim
add comment="jul/22/2023 07:45:45" limit-uptime=8h name=upz767 password=\
    upz767 profile=nazim
add comment="jul/21/2023 19:51:39" limit-uptime=8h name=xsg243 password=\
    xsg243 profile=nazim
add comment="jul/22/2023 07:22:15" limit-uptime=8h name=mac645 password=\
    mac645 profile=nazim
add comment="jul/22/2023 21:08:55" limit-uptime=8h name=wus635 password=\
    wus635 profile=nazim
add comment="jul/22/2023 22:56:06" limit-uptime=8h name=fmb253 password=\
    fmb253 profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=jgx699 password=jgx699 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=gjt569 password=gjt569 \
    profile=nazim
add comment="jul/22/2023 13:09:41" limit-uptime=8h name=rsn368 password=\
    rsn368 profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=xmf747 password=xmf747 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=bmj385 password=bmj385 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=rau734 password=rau734 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=btk298 password=btk298 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=xzn972 password=xzn972 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=myh898 password=myh898 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=xyb643 password=xyb643 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=uam738 password=uam738 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=jmu928 password=jmu928 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=hdp922 password=hdp922 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=baj289 password=baj289 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=kwh526 password=kwh526 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=ehk489 password=ehk489 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=khj254 password=khj254 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=nkh878 password=nkh878 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=haa379 password=haa379 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=jxi392 password=jxi392 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=itu423 password=itu423 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=jca799 password=jca799 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=ymj222 password=ymj222 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=pwc484 password=pwc484 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=pvy483 password=pvy483 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=iyw577 password=iyw577 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=pdw445 password=pdw445 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=hxf764 password=hxf764 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=hsf456 password=hsf456 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=gat326 password=gat326 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=rgp227 password=rgp227 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=swy372 password=swy372 \
    profile=nazim
add comment=vc-780-06.10.23-nazim limit-uptime=8h name=fvx942 password=fvx942 \
    profile=nazim
add comment="jul/12/2023 10:51:53" limit-uptime=12h name=hby336 password=\
    hby336 profile=witno-12jam
add comment="jul/12/2023 19:47:48" limit-uptime=12h name=cjp498 password=\
    cjp498 profile=witno-12jam
add comment="jul/13/2023 07:43:25" limit-uptime=12h name=jur564 password=\
    jur564 profile=witno-12jam
add comment="jul/14/2023 13:31:15" limit-uptime=12h name=kym432 password=\
    kym432 profile=witno-12jam
add comment="jul/14/2023 17:21:15" limit-uptime=12h name=apg565 password=\
    apg565 profile=witno-12jam
add comment="jul/15/2023 16:18:15" limit-uptime=12h name=mac527 password=\
    mac527 profile=witno-12jam
add comment="jul/16/2023 09:47:28" limit-uptime=12h name=tti579 password=\
    tti579 profile=witno-12jam
add comment="jul/16/2023 13:20:21" limit-uptime=12h name=ddy942 password=\
    ddy942 profile=witno-12jam
add comment="jul/16/2023 14:17:05" limit-uptime=12h name=ibg344 password=\
    ibg344 profile=witno-12jam
add comment="jul/16/2023 16:21:53" limit-uptime=12h name=sgx397 password=\
    sgx397 profile=witno-12jam
add comment="jul/16/2023 19:10:12" limit-uptime=12h name=itk739 password=\
    itk739 profile=witno-12jam
add comment="jul/17/2023 08:56:53" limit-uptime=12h name=nnk524 password=\
    nnk524 profile=witno-12jam
add comment="jul/17/2023 14:52:37" limit-uptime=12h name=vwx467 password=\
    vwx467 profile=witno-12jam
add comment="jul/17/2023 15:16:20" limit-uptime=12h name=rxt334 password=\
    rxt334 profile=witno-12jam
add comment="jul/17/2023 16:05:06" limit-uptime=12h name=irw248 password=\
    irw248 profile=witno-12jam
add comment="jul/17/2023 22:35:43" limit-uptime=12h name=jwf996 password=\
    jwf996 profile=witno-12jam
add comment="jul/19/2023 18:27:36" limit-uptime=12h name=mjs384 password=\
    mjs384 profile=witno-12jam
add comment="jul/19/2023 18:32:01" limit-uptime=12h name=tuw536 password=\
    tuw536 profile=witno-12jam
add comment="jul/20/2023 10:22:43" limit-uptime=12h name=ggw572 password=\
    ggw572 profile=witno-12jam
add comment="jul/18/2023 18:07:04" limit-uptime=12h name=rud554 password=\
    rud554 profile=witno-12jam
add comment="jul/22/2023 11:17:58" limit-uptime=12h name=yvm593 password=\
    yvm593 profile=witno-12jam
add comment="jul/19/2023 09:19:14" limit-uptime=12h name=kcj928 password=\
    kcj928 profile=witno-12jam
add comment="jul/19/2023 14:37:51" limit-uptime=12h name=pwe547 password=\
    pwe547 profile=witno-12jam
add comment="jul/19/2023 18:20:36" limit-uptime=12h name=cbc536 password=\
    cbc536 profile=witno-12jam
add comment="jul/20/2023 13:55:45" limit-uptime=12h name=wdk777 password=\
    wdk777 profile=witno-12jam
add comment="jul/21/2023 18:15:46" limit-uptime=12h name=zkc459 password=\
    zkc459 profile=witno-12jam
add comment="jul/22/2023 09:49:36" limit-uptime=12h name=zfk362 password=\
    zfk362 profile=witno-12jam
add comment="jul/22/2023 10:37:07" limit-uptime=12h name=ucv673 password=\
    ucv673 profile=witno-12jam
add comment="jul/22/2023 12:43:12" limit-uptime=12h name=tzg359 password=\
    tzg359 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ces743 password=\
    ces743 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=enx466 password=\
    enx466 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=cpt452 password=\
    cpt452 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=pzi655 password=\
    pzi655 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=mid367 password=\
    mid367 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=jpu468 password=\
    jpu468 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=mcd743 password=\
    mcd743 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=vwn726 password=\
    vwn726 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ubv636 password=\
    ubv636 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=gin327 password=\
    gin327 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=fwy324 password=\
    fwy324 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=sit528 password=\
    sit528 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=xtf787 password=\
    xtf787 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=xrb724 password=\
    xrb724 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=xwr549 password=\
    xwr549 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=vbh356 password=\
    vbh356 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=vms952 password=\
    vms952 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ctk676 password=\
    ctk676 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=yck954 password=\
    yck954 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=vnt667 password=\
    vnt667 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=rdp667 password=\
    rdp667 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ena657 password=\
    ena657 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=tkp757 password=\
    tkp757 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=wwt437 password=\
    wwt437 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=bpv825 password=\
    bpv825 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ucy249 password=\
    ucy249 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=gdr252 password=\
    gdr252 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=bcz685 password=\
    bcz685 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=gpb492 password=\
    gpb492 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=hms583 password=\
    hms583 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=tsn586 password=\
    tsn586 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=zdk632 password=\
    zdk632 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=tmf944 password=\
    tmf944 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ezf442 password=\
    ezf442 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=esa798 password=\
    esa798 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=dmt988 password=\
    dmt988 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=gez636 password=\
    gez636 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=hgm534 password=\
    hgm534 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=jkj455 password=\
    jkj455 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=kzc579 password=\
    kzc579 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=dzz264 password=\
    dzz264 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=hia923 password=\
    hia923 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=vhd998 password=\
    vhd998 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=bey446 password=\
    bey446 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=kgb859 password=\
    kgb859 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=gux672 password=\
    gux672 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=dau235 password=\
    dau235 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=ixh399 password=\
    ixh399 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=xac224 password=\
    xac224 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=awc578 password=\
    awc578 profile=witno-12jam
add comment=vc-911-06.10.23-witno limit-uptime=12h name=smj486 password=\
    smj486 profile=witno-12jam
add comment="jul/19/2023 13:22:54" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=iwm556 password=iwm556 profile=wawan
add comment="jul/19/2023 19:13:09" limit-uptime=12h mac-address=\
    12:75:2D:77:92:62 name=mpf363 password=mpf363 profile=wawan
add comment="jul/20/2023 16:58:02" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=wmg744 password=wmg744 profile=wawan
add comment="jul/21/2023 20:38:37" limit-uptime=12h mac-address=\
    00:EC:0A:BE:1E:1D name=vix364 password=vix364 profile=wawan
add comment="jul/21/2023 20:50:50" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=kfm634 password=kfm634 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=jcn444 password=\
    jcn444 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=zwa925 password=\
    zwa925 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=pug327 password=\
    pug327 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=had373 password=\
    had373 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=axv452 password=\
    axv452 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=afz698 password=\
    afz698 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=mtp686 password=\
    mtp686 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=cdf894 password=\
    cdf894 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ixz577 password=\
    ixz577 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=npp953 password=\
    npp953 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ekw788 password=\
    ekw788 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vta792 password=\
    vta792 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=gah997 password=\
    gah997 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=bee672 password=\
    bee672 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ggx525 password=\
    ggx525 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=tyj485 password=\
    tyj485 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ekr872 password=\
    ekr872 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=dfa546 password=\
    dfa546 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=xre694 password=\
    xre694 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=mep598 password=\
    mep598 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=xfk925 password=\
    xfk925 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=hax637 password=\
    hax637 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=txw387 password=\
    txw387 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=xyr223 password=\
    xyr223 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=hnb745 password=\
    hnb745 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=sfc932 password=\
    sfc932 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=sxv288 password=\
    sxv288 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=jse859 password=\
    jse859 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=knr267 password=\
    knr267 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=pue698 password=\
    pue698 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=bpr768 password=\
    bpr768 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=dnk792 password=\
    dnk792 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=pfk878 password=\
    pfk878 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vgf287 password=\
    vgf287 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vpu389 password=\
    vpu389 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=cvz968 password=\
    cvz968 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=bum289 password=\
    bum289 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vsd766 password=\
    vsd766 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vpf767 password=\
    vpf767 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ejb795 password=\
    ejb795 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=gvh993 password=\
    gvh993 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vbd265 password=\
    vbd265 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=imv526 password=\
    imv526 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=juh528 password=\
    juh528 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=chb984 password=\
    chb984 profile=wawan
/ip route
add comment=isp2 distance=1 gateway=192.168.23.1 routing-mark=ether2
add comment=isp2>isp1 distance=2 gateway=192.168.18.1 routing-mark=ether2
add comment=isp2>vpn1 distance=4 gateway=10.123.22.7 routing-mark=ether2
add comment=vpn1 distance=1 gateway=10.123.22.7 routing-mark=vpn
add comment=vpn1 distance=2 gateway=10.123.22.1 routing-mark=vpn
add comment=iiisp1 distance=3 gateway=192.168.18.1 routing-mark=vpn
add comment=iiisp2 distance=6 gateway=192.168.23.1 routing-mark=vpn
add comment=isp1 distance=1 gateway=192.168.18.1 routing-mark=ether1
add comment=isp1>isp2 distance=2 gateway=192.168.23.1 routing-mark=ether1
add comment=isp1>vpn1 distance=3 gateway=10.123.22.7 routing-mark=ether1
add comment=iisp1 distance=1 gateway=192.168.18.1
add comment=iisp2 distance=20 gateway=192.168.23.1
add comment="     cek ISP2" distance=1 dst-address=1.1.1.2/32 gateway=\
    192.168.23.1
add comment="     cek ISP1" distance=1 dst-address=1.1.1.3/32 gateway=\
    192.168.18.1
add comment="     cek ISP1" distance=1 dst-address=8.8.4.4/32 gateway=\
    192.168.18.1
add comment="     cek ISP2" distance=1 dst-address=8.8.8.8/32 gateway=\
    192.168.23.1
add comment="     cek ISP2" disabled=yes distance=1 dst-address=9.9.9.9/32 \
    gateway=192.168.23.1
add comment=TEST disabled=yes distance=1 dst-address=10.10.16.0/24 gateway=\
    10.20.254.2
add comment=iiiisp1 distance=11 dst-address=103.143.170.11/32 gateway=\
    192.168.18.1
add comment=iiiisp2 distance=12 dst-address=103.143.170.11/32 gateway=\
    192.168.23.1
add comment="     cek ISP2" distance=1 dst-address=149.112.112.112/32 \
    gateway=192.168.23.1
/ip service
set telnet disabled=yes
set www port=8085
set ssh disabled=yes
set api-ssl disabled=yes
/lcd
set backlight-timeout=never default-screen=stats enabled=no touch-screen=\
    disabled
/lcd pin
set pin-number=6413
/lcd interface
set ether1-isp1 disabled=yes
set ether2-isp2 disabled=yes
set ether3-isp3 disabled=yes
set ether4-isp4 disabled=yes
set ether5-isp5 disabled=yes
set sfp1 disabled=yes
set ether6-tower disabled=yes
set ether7 disabled=yes
set ether8-belakang disabled=yes
set ether9-mirza disabled=yes
set ether10 disabled=yes
add interface=lan
/lcd interface pages
add interfaces=lan
/ppp secret
add comment=bebek-kukuh name=kukuh@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.11 service=pppoe
add comment=bebek-wawan name=wawan@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.13 service=pppoe
add comment=bebek-amin name=amin@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.12 service=pppoe
add comment=bebek-irham name=irham@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.14 service=pppoe
add comment=bebek-slamet name=slamet@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.15 service=pppoe
add comment=bebek-ozi name=ozi@mnet.com password=123 profile=area-bebek \
    remote-address=10.10.1.16 service=pppoe
add comment=bebek-wawancafe name=001wawancafe@mnet.com password=123 profile=\
    area-bebek remote-address=10.10.1.17 service=pppoe
add comment=tegal-topik name=010topik@mnet.com password=123 profile=\
    area-tegal remote-address=10.10.2.11 service=pppoe
add comment=tegal-dinang name=011dinang@mnet.com password=123 profile=\
    area-tegal remote-address=10.10.2.16 service=pppoe
add comment=bebek-bayukantor name=002bayu@mnet.com password=123 profile=\
    area-bebek remote-address=10.10.1.18 service=pppoe
add comment=bebek-witno name=013witno@mnet.com password=013witno@mnet.com \
    profile=area-bebek remote-address=10.10.1.21 service=pppoe
add comment=bebek-sdsuro1 name=014sdsurokidul1@mnet.com password=\
    014sdsurokidul1@mnet.com profile=area-bebek remote-address=10.10.1.19 \
    service=pppoe
add comment=bebek-sri name=021sri@mnet.com password=021sri@mnet.com profile=\
    area-bebek remote-address=10.10.1.22 service=pppoe
add comment=tegal-bunasir name=05bunasir@mnet.com password=05bunasir@mnet.com \
    profile=area-tegal-NON-NOTIF remote-address=10.10.2.13 service=pppoe
add comment=bebek-bayurumah name=014bayurumah@mnet.com password=123 profile=\
    area-bebek remote-address=10.10.1.20 service=pppoe
add comment=tegal-wati name=012wati@mnet.com password=123 profile=area-tegal \
    remote-address=10.10.2.18 service=pppoe
add comment=tegal-fuad name=010fuad@mnet.com password=123 profile=area-tegal \
    remote-address=10.10.2.17 service=pppoe
add comment=tegal-aligeprek name=011aligeprek@mnet.com password=123 profile=\
    area-tegal remote-address=10.10.2.19 service=pppoe
add comment=bebek-aan name=020aan@mnet.com password=020aan@mnet.com profile=\
    area-bebek remote-address=10.10.1.23 service=pppoe
add comment=tegal-dian name=dian@mnet.com password=dian@mnet.com profile=\
    area-tegal remote-address=10.10.2.23 service=pppoe
add comment=tegal-rokhim name=rokhim@mnet.com password=rokhim@mnet.com \
    profile=area-tegal remote-address=10.10.2.24 service=pppoe
add comment=bebek-turino name=turino@mnet.com password=turino@mnet.com \
    profile=area-bebek remote-address=10.10.1.24 service=pppoe
add comment=bebek-nazim name=nazim@mnet.com password=nazim@mnet.com profile=\
    area-bebek remote-address=10.10.1.26 service=pppoe
add comment=bebek-dikrom name=dikrom@mnet.com password=dikrom@mnet.com \
    profile=area-bebek remote-address=10.10.1.25 service=pppoe
add comment=tegal-laeli name=laeli@mnet.com password=laeli@mnet.com profile=\
    area-tegal remote-address=10.10.2.26 service=pppoe
add comment=tegal-syukur name=syukur@mnet.com password=syukur@mnet.com \
    profile=area-tegal remote-address=10.10.2.27 service=pppoe
add comment=tegal-mul name=mul@mnet.com password=mul@mnet.com profile=\
    area-tegal remote-address=10.10.2.14 service=pppoe
add comment=bebek-sdpager03 name=sdpager03@mnet.com password=123 profile=\
    area-bebek remote-address=10.10.1.28 service=pppoe
add comment=tegal-mirza name=rumahbelakang@mnet.com password=\
    rumahbelakang@mnet.com profile=area-tegal remote-address=10.10.2.254 \
    service=pppoe
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=001-CORE
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add comment="Monitor Profile wawan" interval=2m19s name=wawan on-event=":local\
    \_dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\
    \"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :p\
    ick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 \
    ];:local monthint ([ :find \$montharray \$month]);:local month (\$monthint\
    \_+ 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\
    \"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$\
    days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local mi\
    nutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local da\
    te [ /system clock get date ]; :local time [ /system clock get time ]; :lo\
    cal today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :fo\
    reach i in [ /ip hotspot user find where profile=\"wawan\" ] do={ :local c\
    omment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot user\
    \_get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comme\
    nt 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d\
    =\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today\
    \_and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or \
    (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \
    \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=read,write,sensitive start-date=jan/05/2022 start-time=03:26:36
add comment="Monitor Profile witno-12jam" interval=2m46s name=witno-12jam \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"witno-\
    12jam\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :local \
    name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12 2\
    0]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:l\
    ocal expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; \
    :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today and \$\
    expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip\
    \_hotspot user remove \$i ]; [ /ip hotspot active remove [find where user=\
    \$name] ];}}}" policy=read,write,sensitive start-date=jan/26/2022 \
    start-time=01:34:13
add interval=1d name=#wajib on-event="/system script run ##pemakaian-bw\r\
    \n\r\
    \n/system script run ###romon\r\
    \n\r\
    \n/system script run ####cek-kabel\r\
    \n\r\
    \n/system script run #####backup-router-email&ftp\r\
    \n\r\
    \n/system script run ##clear-dns&log" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=04:23:00
add interval=4w name=###restart-tiap-00-hari on-event="/system reboot" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=04:24:55
add interval=1m name="~ping isp2" on-event=":local intisp \"ether2\"\r\
    \n:local namaisp \"isp2\"\r\
    \n\r\
    \n:local time [/system clock get time]\r\
    \n:local error \"     \$namaisp mati \$time -\"\r\
    \n:local aman \"     \$namaisp nyala \$time -\"\r\
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
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.4.4 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.4.4\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.4.4\")\r\
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
    start-date=apr/11/2022 start-time=17:31:44
add interval=1m name="~ping isp1" on-event=":local intisp \"ether1\"\r\
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
    start-date=apr/11/2022 start-time=17:31:44
add comment="Monitor Profile evi" interval=2m11s name=evi on-event=":local dat\
    eint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"jun\
    \",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick \
    \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];:l\
    ocal monthint ([ :find \$montharray \$month]);:local month (\$monthint + 1\
    );:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\$ye\
    ar\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$days\"\
    )];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minutes \
    [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date [ /\
    system clock get date ]; :local time [ /system clock get time ]; :local to\
    day [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach \
    i in [ /ip hotspot user find where profile=\"evi\" ] do={ :local comment [\
    \_/ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$\
    i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \
    \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comme\
    nt] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$e\
    xpt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd =\
    \_\$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [\
    \_/ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    read,write,sensitive start-date=apr/22/2022 start-time=02:11:46
add comment="Monitor Profile agus" interval=2m53s name=agus on-event=":local d\
    ateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"j\
    un\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick\
    \_\$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];\
    :local monthint ([ :find \$montharray \$month]);:local month (\$monthint +\
    \_1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\
    \$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$da\
    ys\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minu\
    tes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date\
    \_[ /system clock get date ]; :local time [ /system clock get time ]; :loc\
    al today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :for\
    each i in [ /ip hotspot user find where profile=\"agus\" ] do={ :local com\
    ment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot user g\
    et \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment \
    3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$\
    comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today an\
    d \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$e\
    xpd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i \
    ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    read,write,sensitive start-date=apr/22/2022 start-time=03:27:56
add comment="Monitor Profile wati" interval=2m57s name=wati on-event=":local d\
    ateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"j\
    un\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick\
    \_\$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];\
    :local monthint ([ :find \$montharray \$month]);:local month (\$monthint +\
    \_1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\
    \$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$da\
    ys\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minu\
    tes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date\
    \_[ /system clock get date ]; :local time [ /system clock get time ]; :loc\
    al today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :for\
    each i in [ /ip hotspot user find where profile=\"wati\" ] do={ :local com\
    ment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot user g\
    et \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment \
    3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$\
    comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today an\
    d \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$e\
    xpd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i \
    ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    read,write,sensitive start-date=apr/22/2022 start-time=01:58:47
add comment="Monitor Profile nazim" interval=2m55s name=nazim on-event=":local\
    \_dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\
    \"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :p\
    ick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 \
    ];:local monthint ([ :find \$montharray \$month]);:local month (\$monthint\
    \_+ 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\
    \"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$\
    days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local mi\
    nutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local da\
    te [ /system clock get date ]; :local time [ /system clock get time ]; :lo\
    cal today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :fo\
    reach i in [ /ip hotspot user find where profile=\"nazim\" ] do={ :local c\
    omment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot user\
    \_get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comme\
    nt 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d\
    =\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today\
    \_and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or \
    (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \
    \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=read,write,sensitive start-date=apr/22/2022 start-time=03:53:24
add comment="Monitor Profile dian" interval=2m26s name=dian on-event=":local d\
    ateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\",\"j\
    un\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [ :pick\
    \_\$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7 11 ];\
    :local monthint ([ :find \$montharray \$month]);:local month (\$monthint +\
    \_1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonum (\"\
    \$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$month\$da\
    ys\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local minu\
    tes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :local date\
    \_[ /system clock get date ]; :local time [ /system clock get time ]; :loc\
    al today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] ; :for\
    each i in [ /ip hotspot user find where profile=\"dian\" ] do={ :local com\
    ment [ /ip hotspot user get \$i comment]; :local name [ /ip hotspot user g\
    et \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment \
    3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$\
    comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today an\
    d \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$e\
    xpd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i \
    ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" policy=\
    read,write,sensitive start-date=apr/22/2022 start-time=05:47:43
add comment="Monitor Profile -default-1-hp" interval=2m40s name=-default-1-hp \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"-defau\
    lt-1-hp\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :loca\
    l name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12\
    \_20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do=\
    {:local expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime]\
    \_; :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today an\
    d \$expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [\
    \_/ip hotspot user remove \$i ]; [ /ip hotspot active remove [find where u\
    ser=\$name] ];}}}" policy=read,write,sensitive start-date=may/10/2022 \
    start-time=04:53:32
add name=###wajib-after-ON on-event="/system script run ##clear-dns&log\r\
    \n\r\
    \n:delay 00:01:30\r\
    \n\r\
    \n/system script run ##clear-dns&log" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=15m name="\$      auto ON" on-event="/ip firewall mangle enable [\
    find comment=\"                DISABLE hotspot tethering\"]\r\
    \n/system scheduler enable  \"\\\$      auto OFF\"\r\
    \n/system scheduler disable \"\\\$      auto ON\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=15m name="\$      auto OFF" on-event="/ip firewall m\
    angle disable [find comment=\"                DISABLE hotspot tethering\"]\
    \r\
    \n/system scheduler disable \"\\\$      auto OFF\"\r\
    \n/system scheduler enable  \"\\\$      auto ON\"\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d name="\$  auto trial on jm set6" on-event="/ip hotspot profile\
    \_set vlan-hotspot login-by=http-chap,mac-cookie,trial" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/03/2022 start-time=18:30:00
add interval=1d name="\$ auto trial off jm set9" on-event=\
    "/ip hotspot profile set vlan-hotspot login-by=http-chap,mac-cookie" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/03/2022 start-time=20:30:00
add interval=3m name="~ping vpn1 &vpn2" on-event=":if ([/ping address=10.123.2\
    2.1 count=5 ] = 0) do={\r\
    \nlog error (\"VPN MATI AUTO REKONEK 5 MENIT\")\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/interface enable vpn1\r\
    \n\r\
    \n} else={\r\
    \n\r\
    \n};\r\
    \n" policy=\
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
    \n:local identity \"MNET-ROUTER-UTAMA\"\r\
    \n:local mnet1 \"\$identity.backup\"\r\
    \n:local mnet2 \"\$identity.rsc\"\r\
    \n\r\
    \n/system backup save name=\$mnet1\r\
    \n/export compact file=\$mnet2\r\
    \n:delay 5s;\r\
    \n\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet1 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/\$mnet1\" up\
    load=yes\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet2 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/export/\$mne\
    t2\" upload=yes\r\
    \n\r\
    \n:log info message=\"===> File backup telah di kirim ke server\";"
add dont-require-permissions=no name="!              CLEAR LOG" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/system logging action set memory memory-lines=1\r\
    \n/system logging action set memory memory-lines=1000\r\
    \n"
add dont-require-permissions=no name=#ether1 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
    \n:local namaINT \"ether1-isp1\";\r\
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
    \n:local totalDOWN [/system script get [find name=\$upscript] source];\r\
    \n:local totalUP [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;\r\
    \n"
add dont-require-permissions=no name=~total-lan-DOWN owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    541
add dont-require-permissions=no name=~total-lan-UP owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    41
add dont-require-permissions=no name=#ether2 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
    \n:local namaINT \"ether2-isp2\";\r\
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
    \n:local totalDOWN [/system script get [find name=\$upscript] source];\r\
    \n:local totalUP [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;\r\
    \n"
add dont-require-permissions=no name=#ether3 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
    \n:local namaINT \"ether3-isp3\";\r\
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
    \n:local totalDOWN [/system script get [find name=\$upscript] source];\r\
    \n:local totalUP [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;\r\
    \n"
add dont-require-permissions=no name=#ether4 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
    \n:local namaINT \"ether4-isp4\";\r\
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
    \n:local totalDOWN [/system script get [find name=\$upscript] source];\r\
    \n:local totalUP [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;\r\
    \n"
add dont-require-permissions=no name=~total-ether1-isp1-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=6
add dont-require-permissions=no name=~total-ether1-isp1-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=79
add dont-require-permissions=no name=~total-ether2-isp2-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=33
add dont-require-permissions=no name=~total-ether2-isp2-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=532
add dont-require-permissions=no name=~total-ether3-isp3-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=~total-ether3-isp3-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=~total-ether4-isp4-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=~total-ether4-isp4-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=#lan owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
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
add dont-require-permissions=no name="!  isp1   OFF" owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    interface disable vpn1\r\
    \n/interface disable vpn2\r\
    \n\r\
    \n/tool netwatch set disabled=yes [find comment=\"     1\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"z 1 NOTIF\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1\"]\r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]\r\
    \n/ip route rule disable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp1\"]\r\
    \n/ip route disable [find comment=\"iiisp1\"]\r\
    \n/ip route disable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp2>isp1\"]\r\
    \n/ip route disable [find comment=\"isp3>isp1\"]\r\
    \n/ip route disable [find comment=\"isp4>isp1\"]\r\
    \n/ip route disable [find comment=\"isp5>isp1\"]\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN 1\"]\r\
    \n\r\
    \n/ip dns cache flush"
add dont-require-permissions=no name="!   isp1    ON ( AKTIF )" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/interface disable vpn1\r\
    \n/interface disable vpn2\r\
    \n\r\
    \n/tool netwatch set disabled=no [find comment=\"     1\"]\r\
    \n/tool netwatch set disabled=yes [find comment=\"z 1 NOTIF\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]\r\
    \n/ip route rule enable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp1\"]\r\
    \n/ip route enable [find comment=\"iiisp1\"]\r\
    \n/ip route enable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp2>isp1\"]\r\
    \n/ip route enable [find comment=\"isp3>isp1\"]\r\
    \n/ip route enable [find comment=\"isp4>isp1\"]\r\
    \n/ip route enable [find comment=\"isp5>isp1\"]\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN 1\"]\r\
    \n\r\
    \n/ip dns cache flush"
add dont-require-permissions=no name=#ether5 owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chatID \"-1001184386305\";\r\
    \n:local namaINT \"ether5-isp5\";\r\
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
    \n:local totalDOWN [/system script get [find name=\$upscript] source];\r\
    \n:local totalUP [/system script get [find name=\$dlscript] source];\r\
    \n:local total (\$totalUP + \$totalDOWN);\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendmessage\\\?chat_\
    id=\$chatID&text=\\E2\\9C\\85 Pemakaian \$namaINT%0A DOWNLOAD  : \$totalUP\
    \_GB %0A UPLOAD          : \$totalDOWN GB %0A TOTAL              : \$total\
    \_GB\" keep-result=no;\r\
    \n"
add dont-require-permissions=no name="!   isp2    ON ( AKTIF )" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/interface disable vpn1\r\
    \n/interface disable vpn2\r\
    \n\r\
    \n/tool netwatch set disabled=no [find comment=\"     2\"]\r\
    \n/tool netwatch set disabled=yes [find comment=\"z 2 NOTIF\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]\r\
    \n/ip route rule enable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp2\"]\r\
    \n/ip route enable [find comment=\"iiisp2\"]\r\
    \n/ip route enable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1>isp2\"]\r\
    \n/ip route enable [find comment=\"isp3>isp2\"]\r\
    \n/ip route enable [find comment=\"isp4>isp2\"]\r\
    \n/ip route enable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN 1\"]\r\
    \n\r\
    \n/ip dns cache flush"
add dont-require-permissions=no name="!  isp2   OFF" owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    interface disable vpn1\r\
    \n/interface disable vpn2\r\
    \n\r\
    \n/tool netwatch set disabled=yes [find comment=\"     2\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"z 2 NOTIF\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp2\"]\r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]\r\
    \n/ip route rule disable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp2\"]\r\
    \n/ip route disable [find comment=\"iiisp2\"]\r\
    \n/ip route disable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1>isp2\"]\r\
    \n/ip route disable [find comment=\"isp3>isp2\"]\r\
    \n/ip route disable [find comment=\"isp4>isp2\"]\r\
    \n/ip route disable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n/interface enable vpn1\r\
    \n/interface enable vpn2\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN 1\"]\r\
    \n\r\
    \n/ip dns cache flush"
add dont-require-permissions=no name=~total-ether5-isp5-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=~total-ether5-isp5-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=0
add dont-require-permissions=no name=###romon owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    tool romon set enabled=no secrets=45\r\
    \n:delay 500ms;\r\
    \n/tool romon set enabled=yes secrets=45"
add dont-require-permissions=no name=####cek-kabel owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local server ([/system identity get name])\r\
    \n:local botid \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\"\r\
    \n:local chatid \"-1001184386305\";\r\
    \n\r\
    \n/interface ethernet monitor [find] once do={\r\
    \n\r\
    \n:if (\$\"rate\" = \"10Mbps\") do={\r\
    \n/tool fetch \"https://api.telegram.org/bot\$botid/sendmessage\?chat_id=\
    \$chatid&text=\$server%0APort \$name Rate is \$rate\" keep-result=no;};\r\
    \n}"
add dont-require-permissions=no name=##pemakaian-bw owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system script run #ether1\r\
    \n:delay 500ms;\r\
    \n/system script run #ether2\r\
    \n:delay 500ms;\r\
    \n/system script run #lan\r\
    \n\r\
    \n:delay 5s;\r\
    \n/interface reset-counters ether1-isp1\r\
    \n/interface reset-counters ether2-isp2\r\
    \n/interface reset-counters ether3-isp3\r\
    \n/interface reset-counters ether4-isp4\r\
    \n/interface reset-counters ether5-isp5\r\
    \n/interface reset-counters lan\r\
    \n/queue simple reset-counters-all\r\
    \n/queue tree reset-counters-all"
add dont-require-permissions=no name=##clear-dns&log owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip dns cache flush\r\
    \n/system logging action set memory memory-lines=1\r\
    \n/system logging action set memory memory-lines=1000\r\
    \n/queue simple remove [ find name ~\"hs-<\" ]"
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-12:24:52-|\
    -pbx796-|-1000-|-172.16.1.107-|-B2:98:6B:B4:28:6B-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-12:32:49-|\
    -jcn437-|-1000-|-172.16.1.108-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-13:08:05-|\
    -pvn553-|-1000-|-172.16.0.219-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-13:20:48-|\
    -ytv258-|-1000-|-172.16.2.35-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-16:13:19-|\
    -zcw299-|-1000-|-172.16.0.122-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/20/2023-|-16:50:22-|\
    -vzn938-|-1000-|-172.16.0.105-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/20/2023
add comment=mikhmon dont-require-permissions=no name="may/21/2023-|-14:43:17-|\
    -hne977-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/21/2023
add comment=mikhmon dont-require-permissions=no name="may/21/2023-|-16:52:57-|\
    -xji556-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/21/2023
add comment=mikhmon dont-require-permissions=no name="may/21/2023-|-18:05:02-|\
    -zwp352-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/21/2023
add comment=mikhmon dont-require-permissions=no name="may/21/2023-|-18:52:48-|\
    -ech482-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/21/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-08:59:19-|\
    -awu288-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-09:12:23-|\
    -dkt377-|-1000-|-172.16.0.58-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-12:56:13-|\
    -deu722-|-1000-|-172.16.0.61-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-12:56:30-|\
    -uyi795-|-1000-|-172.16.0.205-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-16:42:15-|\
    -cva567-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-18:56:44-|\
    -jjn959-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/22/2023-|-19:42:09-|\
    -kpw456-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/22/2023
add comment=mikhmon dont-require-permissions=no name="may/23/2023-|-16:58:53-|\
    -ehv788-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/23/2023
add comment=mikhmon dont-require-permissions=no name="may/23/2023-|-17:15:43-|\
    -hdv736-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/23/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-10:36:09-|\
    -jas465-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-12:20:43-|\
    -gbx856-|-1000-|-172.16.1.119-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-12:21:06-|\
    -bhf757-|-1000-|-172.16.1.120-|-84:6F:CE:2D:A5:E5-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-17:18:07-|\
    -zgg274-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-18:33:56-|\
    -ity428-|-1000-|-172.16.0.58-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-19:38:39-|\
    -ccx739-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-19:52:17-|\
    -ujm954-|-1000-|-172.16.0.205-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-20:00:21-|\
    -gia885-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-20:52:11-|\
    -shp855-|-1000-|-172.16.1.157-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/24/2023-|-21:17:20-|\
    -jsu762-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/24/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-07:09:06-|\
    -vun689-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-16:37:52-|\
    -mbw365-|-1000-|-172.16.0.90-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-16:57:10-|\
    -ekx428-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-16:59:12-|\
    -fme942-|-1000-|-172.16.0.61-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-18:29:39-|\
    -fut899-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-18:45:16-|\
    -xes894-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-20:11:12-|\
    -wts557-|-1000-|-172.16.1.237-|-94:87:E0:7A:DD:A5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/25/2023-|-21:05:06-|\
    -gyf586-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/25/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-10:19:54-|\
    -fyu874-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-10:50:40-|\
    -tgz694-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-13:03:23-|\
    -tcr454-|-1000-|-172.16.1.208-|-86:8F:E5:EF:A0:50-|-31d-|-nazim-|-vc-195-0\
    5.10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-13:03:58-|\
    -ktr777-|-1000-|-172.16.0.47-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-13:49:26-|\
    -ggp342-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-13:57:53-|\
    -aku983-|-1000-|-172.16.0.66-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-15:26:56-|\
    -whk593-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-17:23:51-|\
    -uvh333-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-195-05\
    .10.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-18:31:00-|\
    -rmg283-|-1000-|-172.16.1.237-|-94:87:E0:7A:DD:A5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-18:47:09-|\
    -etc539-|-1000-|-172.16.0.90-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-19:35:21-|\
    -hbs889-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-20:18:40-|\
    -van976-|-1000-|-172.16.2.63-|-9A:58:A6:E3:85:BD-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/26/2023-|-21:56:24-|\
    -szn758-|-1000-|-172.16.1.182-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/26/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-11:02:32-|\
    -kmh532-|-1000-|-172.16.0.58-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-12:24:32-|\
    -dvg266-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-14:07:57-|\
    -sag557-|-1000-|-172.16.0.43-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-14:09:00-|\
    -atd258-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-16:32:11-|\
    -cri848-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-17:17:26-|\
    -zim889-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-18:33:54-|\
    -bgt368-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-19:33:11-|\
    -dab663-|-1000-|-172.16.2.140-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-19:43:13-|\
    -wad265-|-1000-|-172.16.2.141-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-19:45:26-|\
    -emd864-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-20:02:24-|\
    -hab562-|-1000-|-172.16.0.251-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-20:35:40-|\
    -jrx289-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-22:09:20-|\
    -vue799-|-1000-|-172.16.2.161-|-0C:98:38:CE:CA:81-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-23:49:36-|\
    -tsg769-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/27/2023-|-23:49:46-|\
    -zkj828-|-1000-|-172.16.2.164-|-08:7F:98:DB:EE:EB-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/27/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-07:48:25-|\
    -jrp494-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-08:47:44-|\
    -tpk342-|-1000-|-172.16.0.94-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-11:08:36-|\
    -eyj555-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-13:39:27-|\
    -wnp444-|-1000-|-172.16.0.205-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-13:45:53-|\
    -yjc743-|-1000-|-172.16.0.126-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-16:01:03-|\
    -zja924-|-1000-|-172.16.0.43-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-16:23:37-|\
    -ghs836-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-16:40:53-|\
    -nbp847-|-1000-|-172.16.0.61-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-16:53:57-|\
    -pfu544-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-18:00:47-|\
    -ecf582-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/28/2023-|-18:08:29-|\
    -zjr367-|-1000-|-172.16.0.90-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/28/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-09:29:16-|\
    -dwb729-|-1000-|-172.16.2.122-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-11:20:46-|\
    -err447-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-13:52:37-|\
    -tyi627-|-1000-|-172.16.2.126-|-48:FD:A3:EA:39:65-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-14:41:44-|\
    -vmw795-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-17:01:39-|\
    -xbu437-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-17:18:33-|\
    -epr764-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-17:21:00-|\
    -tiw898-|-1000-|-172.16.3.47-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-17:58:25-|\
    -twh698-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-18:26:05-|\
    -ush488-|-1000-|-172.16.0.87-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-18:33:35-|\
    -pjk459-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-18:39:45-|\
    -jnt585-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/29/2023-|-19:49:40-|\
    -jbb429-|-1000-|-172.16.0.43-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/29/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-01:58:31-|\
    -eps475-|-1000-|-172.16.3.96-|-C0:47:54:BB:5A:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-09:25:07-|\
    -bpz298-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-09:49:37-|\
    -ads879-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-16:08:58-|\
    -cdg397-|-1000-|-172.16.3.136-|-02:F6:9D:98:6A:40-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-16:57:11-|\
    -kfd359-|-1000-|-172.16.0.61-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-18:38:17-|\
    -jip379-|-1000-|-172.16.0.94-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-19:53:06-|\
    -mep777-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-20:12:30-|\
    -rnw393-|-1000-|-172.16.3.73-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-21:35:32-|\
    -bmt562-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-21:36:31-|\
    -wna388-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-21:47:05-|\
    -dbv243-|-1000-|-172.16.3.170-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/30/2023-|-22:38:39-|\
    -mbz645-|-1000-|-172.16.3.95-|-0C:98:38:CE:CA:81-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/30/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-09:30:24-|\
    -bzb247-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-10:21:09-|\
    -vkm547-|-1000-|-172.16.2.122-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-11:55:16-|\
    -suc835-|-1000-|-172.16.3.189-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-12:15:18-|\
    -mjz866-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-13:51:01-|\
    -rje543-|-1000-|-172.16.3.199-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-16:05:05-|\
    -kti773-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-16:10:21-|\
    -eds625-|-1000-|-172.16.3.215-|-46:B2:E1:E8:73:99-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-17:09:42-|\
    -vym633-|-1000-|-172.16.3.146-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-17:21:15-|\
    -vpd982-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-17:41:46-|\
    -rsr349-|-1000-|-172.16.3.226-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-18:30:37-|\
    -zsi384-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-18:54:24-|\
    -zut897-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-18:54:37-|\
    -ibf525-|-1000-|-172.16.0.43-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-19:12:16-|\
    -xjn896-|-1000-|-172.16.0.87-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-20:16:21-|\
    -efu688-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-21:41:18-|\
    -cjn785-|-1000-|-172.16.0.205-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="may/31/2023-|-23:42:56-|\
    -fjz628-|-1000-|-172.16.0.62-|-96:7F:62:FE:06:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=may2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    may/31/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-01:12:37-|\
    -rrr733-|-1000-|-172.16.0.65-|-DC:B7:2E:D8:29:20-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-01:15:03-|\
    -wng753-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-08:00:04-|\
    -fni876-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-08:34:51-|\
    -iph979-|-1000-|-172.16.0.77-|-2E:FA:2C:8D:AE:6C-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-08:37:17-|\
    -vxe457-|-1000-|-172.16.0.79-|-FA:74:E0:60:5D:19-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-08:38:11-|\
    -zxh597-|-1000-|-172.16.0.81-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-09:50:47-|\
    -jdg346-|-1000-|-172.16.0.94-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-10:07:43-|\
    -usf623-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-10:11:30-|\
    -izz383-|-1000-|-172.16.3.231-|-86:8F:E5:EF:A0:50-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-12:26:36-|\
    -nfx533-|-1000-|-172.16.3.136-|-02:F6:9D:98:6A:40-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-14:12:54-|\
    -kvf637-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-15:32:02-|\
    -gjb749-|-1000-|-172.16.3.189-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-16:08:40-|\
    -ysc288-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-16:31:23-|\
    -pwf529-|-1000-|-172.16.2.126-|-48:FD:A3:EA:39:65-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-18:44:40-|\
    -rnb738-|-1000-|-172.16.0.115-|-9A:3A:AA:94:BD:79-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-19:20:57-|\
    -fky324-|-1000-|-172.16.0.43-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-19:30:10-|\
    -bst879-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/01/2023-|-19:46:24-|\
    -apk847-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/01/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-01:16:27-|\
    -kun542-|-1000-|-172.16.3.73-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-07:00:26-|\
    -yma262-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-08:17:57-|\
    -nmh249-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-09:01:52-|\
    -kxb877-|-1000-|-172.16.3.146-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-09:32:18-|\
    -wav556-|-1000-|-172.16.2.122-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-10:20:09-|\
    -egz338-|-1000-|-172.16.0.162-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-10:37:21-|\
    -jsg993-|-1000-|-172.16.3.218-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-10:44:24-|\
    -brw823-|-1000-|-172.16.0.94-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-11:12:33-|\
    -rxx436-|-1000-|-172.16.2.140-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-12:21:16-|\
    -pxz788-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-12:58:34-|\
    -pab473-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-14:02:44-|\
    -ucr988-|-1000-|-172.16.0.87-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-14:19:56-|\
    -nmb643-|-1000-|-172.16.0.190-|-8C:AA:CE:39:35:BA-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-15:05:29-|\
    -sfg495-|-1000-|-172.16.0.188-|-8E:5C:E8:51:47:8A-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-18:12:28-|\
    -gev395-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-18:26:54-|\
    -iwd989-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-19:27:38-|\
    -bfg922-|-1000-|-172.16.0.139-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-19:36:53-|\
    -fmn958-|-1000-|-172.16.0.216-|-B6:4C:70:A6:E5:30-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-19:52:27-|\
    -ydi665-|-1000-|-172.16.0.214-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/02/2023-|-21:18:19-|\
    -njc756-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/02/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-06:31:07-|\
    -zgw255-|-1000-|-172.16.0.63-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:07:30-|\
    -anx868-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:15:20-|\
    -zgp448-|-1000-|-172.16.1.0-|-3C:F5:91:15:C3:8E-|-31d-|-wati-|-vc-749-05.0\
    2.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:16:06-|\
    -zpk434-|-1000-|-172.16.3.136-|-02:F6:9D:98:6A:40-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:18:01-|\
    -awm875-|-1000-|-172.16.1.1-|-7E:84:E4:19:0B:99-|-31d-|-nazim-|-vc-814-05.\
    26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:40:30-|\
    -sia558-|-1000-|-172.16.0.37-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-11:56:30-|\
    -eie284-|-1000-|-172.16.3.146-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-20:12:48-|\
    -uxn643-|-1000-|-172.16.1.33-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-20:15:46-|\
    -weg635-|-1000-|-172.16.1.37-|-9A:58:A6:E3:85:BD-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/03/2023-|-20:45:14-|\
    -wja557-|-1000-|-172.16.3.73-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/03/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-01:20:16-|\
    -cie667-|-1000-|-172.16.0.104-|-28:31:66:74:A9:E5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-10:15:51-|\
    -wip998-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-12:18:08-|\
    -kxp423-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-12:36:56-|\
    -fgf675-|-1000-|-172.16.1.96-|-90:63:3B:C2:12:1D-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-14:10:18-|\
    -rbm926-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-15:45:07-|\
    -zfn329-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-16:50:15-|\
    -jfh774-|-1000-|-172.16.3.146-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-19:33:03-|\
    -vfm356-|-1000-|-172.16.1.135-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-19:33:10-|\
    -mzu783-|-1000-|-172.16.3.231-|-86:8F:E5:EF:A0:50-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-21:00:40-|\
    -ibp355-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-22:41:52-|\
    -mzn353-|-1000-|-172.16.1.148-|-22:D8:EA:17:CC:82-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/04/2023-|-23:29:43-|\
    -bzb445-|-1000-|-172.16.3.73-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/04/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-00:20:59-|\
    -vvg349-|-1000-|-172.16.1.147-|-0C:98:38:CE:CA:81-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-11:21:38-|\
    -yhw575-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-11:59:48-|\
    -acb987-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-15:36:46-|\
    -avg698-|-1000-|-172.16.0.94-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-19:28:50-|\
    -gmc885-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-20:33:27-|\
    -jsp524-|-1000-|-172.16.0.205-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-21:30:52-|\
    -hfx992-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/05/2023-|-21:58:58-|\
    -pmw796-|-1000-|-172.16.1.135-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/05/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-03:46:20-|\
    -epw555-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-11:06:26-|\
    -emp327-|-1000-|-172.16.1.251-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-11:24:48-|\
    -szc566-|-1000-|-172.16.1.180-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-12:09:45-|\
    -stk562-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-12:47:04-|\
    -yey797-|-1000-|-172.16.3.146-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-14:01:20-|\
    -ndz297-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-18:59:22-|\
    -mxs378-|-1000-|-172.16.2.27-|-92:F3:B9:F1:CE:F0-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-19:43:51-|\
    -rwy827-|-1000-|-172.16.2.31-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-21:29:35-|\
    -anu548-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/06/2023-|-22:19:08-|\
    -mmd596-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/06/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-03:21:36-|\
    -rrk257-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-08:49:57-|\
    -ngu862-|-1000-|-172.16.2.62-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-10:02:24-|\
    -dth888-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-12:05:35-|\
    -cba648-|-1000-|-172.16.2.18-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-12:16:53-|\
    -ysf837-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-13:54:15-|\
    -tuw353-|-1000-|-172.16.2.84-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-14:17:08-|\
    -cxb697-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-16:28:06-|\
    -zkg833-|-1000-|-172.16.2.92-|-F4:60:E2:25:F5:52-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-16:49:48-|\
    -ixv297-|-1000-|-172.16.2.7-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-05.\
    26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-18:56:29-|\
    -pru876-|-1000-|-172.16.1.135-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-19:50:31-|\
    -xrx828-|-1000-|-172.16.1.180-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-20:04:07-|\
    -yga382-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-20:05:11-|\
    -mha435-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/07/2023-|-20:55:51-|\
    -gbu796-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/07/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-01:34:56-|\
    -vge585-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-09:48:44-|\
    -gsj375-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-10:51:42-|\
    -dii629-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-11:24:02-|\
    -kdf944-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-12:15:20-|\
    -rci974-|-1000-|-172.16.2.141-|-84:6F:CE:2D:A5:E5-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-12:16:44-|\
    -jyp386-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-13:24:39-|\
    -fvu454-|-1000-|-172.16.1.251-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-13:29:24-|\
    -hwd279-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-18:11:48-|\
    -dhw426-|-1000-|-172.16.2.18-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-20:37:17-|\
    -ysu589-|-1000-|-172.16.2.70-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/08/2023-|-21:33:57-|\
    -hbu688-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/08/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-09:08:36-|\
    -tyj473-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-10:04:02-|\
    -tac458-|-1000-|-172.16.2.7-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-814-05.\
    26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-11:47:06-|\
    -hef599-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-13:42:20-|\
    -yky966-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-13:50:01-|\
    -kwz999-|-1000-|-172.16.2.153-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-14:44:08-|\
    -uyh868-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-16:44:36-|\
    -zur558-|-1000-|-172.16.2.84-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-17:14:44-|\
    -mbg582-|-1000-|-172.16.1.180-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-18:22:01-|\
    -dny868-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-18:37:24-|\
    -rys778-|-1000-|-172.16.2.92-|-F4:60:E2:25:F5:52-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-19:35:09-|\
    -jsz352-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-19:59:08-|\
    -ipp787-|-1000-|-172.16.2.245-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-21:23:47-|\
    -gbj332-|-1000-|-172.16.2.253-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/09/2023-|-22:43:03-|\
    -aev483-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/09/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-07:22:14-|\
    -www827-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-13:02:51-|\
    -jdr293-|-1000-|-172.16.3.44-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-14:13:13-|\
    -uch528-|-1000-|-172.16.2.235-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-17:01:13-|\
    -yue622-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-18:13:11-|\
    -npr566-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-814-05\
    .26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-18:18:45-|\
    -yyt664-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-814-0\
    5.26.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-18:29:40-|\
    -uuh947-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-19:36:11-|\
    -pxu769-|-1000-|-172.16.2.161-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-20:36:43-|\
    -saw488-|-1000-|-172.16.3.77-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/10/2023-|-21:35:50-|\
    -tea233-|-1000-|-172.16.1.64-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/10/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-02:02:25-|\
    -xkb638-|-1000-|-172.16.3.95-|-28:31:66:74:A9:E5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-02:49:12-|\
    -xmt739-|-1000-|-172.16.3.97-|-DC:B7:2E:D8:29:20-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-05:39:07-|\
    -djv954-|-1000-|-172.16.2.7-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-780-06.\
    10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-06:40:11-|\
    -evm353-|-1000-|-172.16.3.50-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-08:43:56-|\
    -sek623-|-1000-|-172.16.1.44-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-09:02:34-|\
    -wdd797-|-1000-|-172.16.2.84-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-12:01:23-|\
    -bye546-|-1000-|-172.16.2.92-|-F4:60:E2:25:F5:52-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-15:33:07-|\
    -dgr799-|-1000-|-172.16.1.251-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-16:04:23-|\
    -ivr288-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-16:30:06-|\
    -hrm892-|-1000-|-172.16.3.57-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-16:59:53-|\
    -wvb495-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-17:04:38-|\
    -prr356-|-1000-|-172.16.2.70-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-19:19:23-|\
    -nzv635-|-1000-|-172.16.3.143-|-9A:3A:AA:94:BD:79-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-19:25:14-|\
    -esw827-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-20:17:58-|\
    -sxc733-|-1000-|-172.16.2.253-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/11/2023-|-20:25:07-|\
    -hcb388-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/11/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-00:18:51-|\
    -dpc572-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-10:52:48-|\
    -cnj228-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-11:21:42-|\
    -efa857-|-1000-|-172.16.3.50-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-11:42:58-|\
    -njh277-|-1000-|-172.16.2.161-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-12:49:23-|\
    -nyv929-|-1000-|-172.16.2.84-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-14:41:05-|\
    -rwj429-|-1000-|-172.16.3.215-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-19:48:02-|\
    -zzj552-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-20:23:38-|\
    -ppr574-|-1000-|-172.16.0.33-|-14:47:2D:9B:F7:E7-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-20:41:40-|\
    -rei259-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-20:47:44-|\
    -zfh564-|-1000-|-172.16.3.57-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/12/2023-|-21:12:29-|\
    -fhw998-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/12/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-02:52:08-|\
    -xxj555-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-09:12:50-|\
    -vmx993-|-1000-|-172.16.0.57-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-10:52:14-|\
    -vmv548-|-1000-|-172.16.0.92-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-11:15:17-|\
    -wua744-|-1000-|-172.16.2.153-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-11:30:46-|\
    -him637-|-1000-|-172.16.0.38-|-9A:9F:DC:03:D8:F2-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-12:07:22-|\
    -trr875-|-1000-|-172.16.3.154-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-12:15:31-|\
    -vzf884-|-1000-|-172.16.3.228-|-3A:34:15:D5:DC:4D-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-13:26:35-|\
    -cjt382-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-15:32:49-|\
    -ffu972-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-15:59:20-|\
    -jiv536-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-16:45:11-|\
    -ezy294-|-1000-|-172.16.2.70-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-18:53:35-|\
    -bfg337-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-19:29:50-|\
    -bby687-|-1000-|-172.16.2.253-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-22:26:15-|\
    -vhm648-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-22:48:27-|\
    -puy738-|-1000-|-172.16.0.130-|-22:D8:EA:17:CC:82-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/13/2023-|-22:49:22-|\
    -izt429-|-1000-|-172.16.2.245-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/13/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-02:57:50-|\
    -hxd587-|-1000-|-172.16.3.215-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-09:45:13-|\
    -axg672-|-1000-|-172.16.0.75-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-10:48:30-|\
    -che929-|-1000-|-172.16.3.50-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-15:12:51-|\
    -zaj646-|-1000-|-172.16.0.169-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-16:51:33-|\
    -rbd629-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-17:02:00-|\
    -scg632-|-1000-|-172.16.0.178-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-20:34:16-|\
    -khs334-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-21:07:37-|\
    -umx959-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-21:09:19-|\
    -vmd694-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-21:29:50-|\
    -twc683-|-1000-|-172.16.3.57-|-5A:6E:46:99:3D:4B-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/14/2023-|-22:42:52-|\
    -tzs698-|-1000-|-172.16.0.195-|-0C:98:38:CE:CA:81-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/14/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-07:14:00-|\
    -emw337-|-1000-|-172.16.0.57-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-10:31:37-|\
    -cen722-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-12:36:37-|\
    -cya544-|-1000-|-172.16.3.215-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-15:02:39-|\
    -wzr526-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-17:01:30-|\
    -zuc999-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-18:26:28-|\
    -ttz772-|-1000-|-172.16.0.229-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/15/2023-|-21:15:31-|\
    -sht496-|-1000-|-172.16.2.253-|-DA:AF:F5:C9:48:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/15/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-07:43:59-|\
    -tdb333-|-1000-|-172.16.0.230-|-20:47:DA:63:F5:C3-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-08:38:23-|\
    -rwj937-|-1000-|-172.16.2.153-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-10:45:18-|\
    -czk389-|-1000-|-172.16.1.40-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-11:13:45-|\
    -mus273-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-11:21:24-|\
    -syi722-|-1000-|-172.16.0.152-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-11:41:00-|\
    -etz337-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-12:10:41-|\
    -jmr355-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-12:21:57-|\
    -bhv653-|-1000-|-172.16.0.205-|-48:13:7E:27:77:19-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-13:24:33-|\
    -jyj272-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-18:09:30-|\
    -rcr888-|-1000-|-172.16.1.66-|-46:B2:E1:E8:73:99-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-19:54:55-|\
    -xik648-|-1000-|-172.16.0.91-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/16/2023-|-22:47:02-|\
    -wkt839-|-1000-|-172.16.0.78-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/16/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-02:40:09-|\
    -mwb823-|-1000-|-172.16.3.215-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-05:49:59-|\
    -cie683-|-1000-|-172.16.0.57-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-09:51:29-|\
    -vaw439-|-1000-|-172.16.1.99-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-10:45:56-|\
    -pei366-|-1000-|-172.16.1.103-|-8C:AA:CE:2C:9D:48-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-10:49:23-|\
    -rzj895-|-1000-|-172.16.1.105-|-FC:A5:D0:90:B0:67-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-11:02:10-|\
    -axh452-|-1000-|-172.16.3.154-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-11:27:50-|\
    -bib639-|-1000-|-172.16.2.137-|-4A:F2:5B:30:F9:A6-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-11:45:41-|\
    -fpk964-|-1000-|-172.16.0.229-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-12:09:20-|\
    -vuk867-|-1000-|-172.16.1.109-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-13:07:52-|\
    -hiz759-|-1000-|-172.16.2.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-13:08:09-|\
    -bpv898-|-1000-|-172.16.1.90-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-13:24:23-|\
    -ywv559-|-1000-|-172.16.1.114-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-14:24:12-|\
    -dxd964-|-1000-|-172.16.1.53-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-20:14:29-|\
    -btp393-|-1000-|-172.16.2.70-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-21:07:57-|\
    -etm365-|-1000-|-172.16.2.236-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/17/2023-|-23:19:17-|\
    -bbx962-|-1000-|-172.16.0.195-|-0C:98:38:CE:CA:81-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/17/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-00:04:55-|\
    -xvi324-|-1000-|-172.16.1.155-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-07:33:47-|\
    -thn979-|-1000-|-172.16.1.127-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-07:59:28-|\
    -hpv623-|-1000-|-172.16.0.177-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-08:56:22-|\
    -twc599-|-1000-|-172.16.1.121-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-09:11:50-|\
    -yyf487-|-1000-|-172.16.0.160-|-66:C2:A3:D1:EB:37-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-12:13:15-|\
    -nkp763-|-1000-|-172.16.0.205-|-48:13:7E:27:77:19-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-12:27:10-|\
    -kwd246-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-12:29:11-|\
    -jni425-|-1000-|-172.16.1.123-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-13:12:47-|\
    -gbz353-|-1000-|-172.16.0.104-|-3A:34:15:D5:DC:4D-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-16:36:28-|\
    -fva278-|-1000-|-172.16.0.82-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-18:41:10-|\
    -utr327-|-1000-|-172.16.0.66-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-19:06:09-|\
    -cnk626-|-1000-|-172.16.0.176-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-19:41:00-|\
    -kuf384-|-1000-|-172.16.0.60-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-20:57:23-|\
    -nzk964-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/18/2023-|-23:41:47-|\
    -zjb254-|-1000-|-172.16.0.183-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/18/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-11:24:18-|\
    -hks539-|-1000-|-172.16.1.112-|-FC:A5:D0:90:B0:67-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-11:50:44-|\
    -ads585-|-1000-|-172.16.0.177-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-11:53:24-|\
    -cbb896-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-12:19:59-|\
    -nab342-|-1000-|-172.16.1.127-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-16:29:35-|\
    -zhp964-|-1000-|-172.16.0.82-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-17:02:56-|\
    -ufw788-|-1000-|-172.16.1.120-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-18:10:03-|\
    -ifs694-|-1000-|-172.16.1.111-|-8C:AA:CE:2C:9D:48-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-18:37:02-|\
    -wnc368-|-1000-|-172.16.0.232-|-F4:60:E2:25:F5:52-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-19:13:10-|\
    -gxd589-|-1000-|-172.16.0.183-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-19:45:34-|\
    -rui593-|-1000-|-172.16.0.41-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/19/2023-|-22:59:28-|\
    -gjc996-|-1000-|-172.16.0.45-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/19/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-11:03:30-|\
    -fak584-|-1000-|-172.16.1.127-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-11:12:58-|\
    -gcn234-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-11:27:30-|\
    -cxu974-|-1000-|-172.16.0.174-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-16:50:25-|\
    -iur682-|-1000-|-172.16.0.106-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:15:49-|\
    -zkc459-|-1000-|-172.16.0.180-|-F4:F5:DB:F5:E5:71-|-31d-|-witno-12jam-|-vc\
    -911-06.10.23-witno" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:18:58-|\
    -grv773-|-1000-|-172.16.0.183-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:23:20-|\
    -yan589-|-1000-|-172.16.1.45-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:42:24-|\
    -gwa353-|-1000-|-172.16.1.51-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:53:12-|\
    -ghc725-|-1000-|-172.16.0.38-|-30:94:35:6C:F5:B9-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:54:35-|\
    -dpn485-|-1000-|-172.16.1.53-|-B6:C1:F0:D9:9B:0C-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-18:58:33-|\
    -wne599-|-1000-|-172.16.1.54-|-2C:D0:66:16:2C:18-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:19:27-|\
    -kss892-|-1000-|-172.16.1.56-|-92:F3:B9:F1:CE:F0-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:20:57-|\
    -dht863-|-1000-|-172.16.1.127-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:41:20-|\
    -jsi846-|-1000-|-172.16.1.61-|-36:77:74:0F:73:0D-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:41:31-|\
    -tmf249-|-1000-|-172.16.1.62-|-7C:2A:DB:B7:22:6E-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:42:35-|\
    -bdf424-|-1000-|-172.16.1.64-|-1E:72:A8:F4:71:BB-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-19:51:42-|\
    -xsg243-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-20:05:48-|\
    -rhk539-|-1000-|-172.16.1.58-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-749-05.\
    02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-20:38:39-|\
    -vix364-|-1000-|-172.16.1.57-|-00:EC:0A:BE:1E:1D-|-31d-|-wawan-|-vc-226-06\
    .18.23-wawan" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/20/2023-|-20:50:53-|\
    -kfm634-|-1000-|-172.16.1.117-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/20/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-07:22:17-|\
    -mac645-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-07:45:47-|\
    -upz767-|-1000-|-172.16.1.123-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-08:47:30-|\
    -kcn456-|-1000-|-172.16.0.251-|-10:89:FB:93:0F:6E-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-09:49:38-|\
    -zfk362-|-1000-|-172.16.1.104-|-66:07:EC:4E:EE:DB-|-31d-|-witno-12jam-|-vc\
    -911-06.10.23-witno" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-10:12:27-|\
    -xig347-|-1000-|-172.16.1.106-|-08:7F:98:C9:79:77-|-31d-|-evi-|-vc-743-04.\
    12.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-10:27:02-|\
    -utg663-|-1000-|-172.16.1.108-|-38:29:5A:6F:0A:29-|-31d-|-evi-|-vc-743-04.\
    12.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-10:37:09-|\
    -ucv673-|-1000-|-172.16.0.162-|-F0:79:E8:1E:C6:1D-|-31d-|-witno-12jam-|-vc\
    -911-06.10.23-witno" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-11:18:01-|\
    -yvm593-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -911-06.10.23-witno" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-12:43:14-|\
    -tzg359-|-1000-|-172.16.1.134-|-9A:A8:56:62:CA:DC-|-31d-|-witno-12jam-|-vc\
    -911-06.10.23-witno" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-13:09:44-|\
    -rsn368-|-1000-|-172.16.1.120-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-13:44:15-|\
    -jxd948-|-1000-|-172.16.0.170-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-743-04.\
    12.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-14:12:40-|\
    -tut987-|-1000-|-172.16.1.136-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-743-04.\
    12.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-14:30:00-|\
    -vze736-|-1000-|-172.16.0.104-|-3A:34:15:D5:DC:4D-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-17:05:14-|\
    -wjg288-|-1000-|-172.16.0.183-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-17:21:48-|\
    -ttn687-|-1000-|-172.16.1.110-|-6A:89:A1:0C:F9:77-|-31d-|-evi-|-vc-743-04.\
    12.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-18:22:47-|\
    -fzi546-|-1000-|-172.16.0.35-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-19:32:45-|\
    -uci585-|-1000-|-172.16.1.127-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-19:50:06-|\
    -rzs358-|-1000-|-172.16.0.176-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-20:08:40-|\
    -jxa799-|-1000-|-172.16.0.177-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-749-05\
    .02.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-20:10:43-|\
    -mmm992-|-1000-|-172.16.1.52-|-8C:AA:CE:44:AA:64-|-31d-|-evi-|-vc-743-04.1\
    2.23-evi" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-21:08:58-|\
    -wus635-|-1000-|-172.16.0.41-|-56:74:88:BC:EF:83-|-31d-|-nazim-|-vc-780-06\
    .10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-22:56:09-|\
    -fmb253-|-1000-|-172.16.0.126-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-780-0\
    6.10.23-nazim" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
add comment=mikhmon dont-require-permissions=no name="jun/21/2023-|-23:49:28-|\
    -wax343-|-1000-|-172.16.1.178-|-DC:B7:2E:D8:29:20-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jun2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jun/21/2023
/tool bandwidth-server
set enabled=no
/tool e-mail
set address=smtp.gmail.com from="MikroTik MNET" password=vixxfwnuqexwaocz \
    port=587 start-tls=yes user=mirza@poltektegal.ac.id
/tool graphing interface
add interface=ether1-isp1
add interface=ether2-isp2
add interface=ether3-isp3
add interface=ether4-isp4
add interface=ether5-isp5
/tool graphing queue
add simple-queue=rtrw-muksin
add simple-queue=bebek
add simple-queue=merpati
add simple-queue=syukur
/tool graphing resource
add
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
/tool mac-server ping
set enabled=no
/tool netwatch
add comment="AP 02 evi warung" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher evi warung\" keep-resul\
    t=no;\r\
    \n}" host=172.16.0.2 timeout=2s up-script="/tool fetch url=\"https://api.t\
    elegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher evi warung\" keep-r\
    esult=no;\r\
    \n}"
add comment="002 PTP BEBEK" down-script="/tool fetch url=\"https://api.telegra\
    m.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?cha\
    t_id=-1001266583133&text=\\E2\\9D\\8C = AP BEBEK\" keep-result=no;\r\
    \n}" host=192.168.55.2 interval=10s timeout=2s up-script="/tool fetch url=\
    \"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew\
    04/sendmessage\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = AP BEBEK\" ke\
    ep-result=no;\r\
    \n}\r\
    \n"
add comment="003 BEBEK BTS*************" down-script="/tool fetch url=\"https:\
    //api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendm\
    essage\\\?chat_id=-1001266583133&text=\\E2\\9D\\8C = PENERIMA BEBEK\" keep\
    -result=no;\r\
    \n}" host=192.168.55.3 interval=30s timeout=2s up-script="/tool fetch url=\
    \"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew\
    04/sendmessage\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = PENERIMA BEBE\
    K\" keep-result=no;\r\
    \n}"
add comment="004 PTP AMIN" down-script="/tool fetch url=\"https://api.telegram\
    .org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat\
    _id=-1001247315859&text=\\E2\\9D\\8C = PTP KE AMIN\" keep-result=no;\r\
    \n}" host=192.168.55.4 interval=30s timeout=2s up-script="/tool fetch url=\
    \"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew\
    04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = PTP KE AMIN\"\
    \_keep-result=no;\r\
    \n}"
add comment="005 C-AMIN" down-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_i\
    d=-1001247315859&text=\\E2\\9D\\8C = ptp penerima - amin\" keep-result=no;\
    \r\
    \n}" host=192.168.55.5 timeout=2s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima - amin\" keep\
    -result=no;\r\
    \n}"
add comment="AP 22 wawan cafe" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher wawan cafe\" keep-resul\
    t=no;\r\
    \n}" host=172.16.0.22 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher wawan cafe\" keep-r\
    esult=no;\r\
    \n}"
add comment="006 JTB OMNITIK" down-script="/tool fetch url=\"https://api.teleg\
    ram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?c\
    hat_id=-1001247315859&text=\\E2\\9D\\8C = OMNITIK PUSAT BEBEK\" keep-resul\
    t=no;\r\
    \n}" host=192.168.55.6 interval=30s timeout=2s up-script="/tool fetch url=\
    \"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew\
    04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = OMNITIK PUSAT\
    \_BEBEK\" keep-result=no;\r\
    \n}"
add comment="007 C-IRHAM" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_\
    id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - irham\" keep-result=\
    no;\r\
    \n}" host=192.168.55.7 timeout=2s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - irham\" ke\
    ep-result=no;\r\
    \n}"
add comment="008 C-OZI" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id\
    =-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - ozi\" keep-result=no;\
    \r\
    \n}" host=192.168.55.8 timeout=2s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - ozi\" keep\
    -result=no;\r\
    \n}"
add comment="009 C-WAWAN CAFE" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - cafe wawan\" ke\
    ep-result=no;\r\
    \n}" host=192.168.55.9 timeout=2s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - cafe wawan\
    \" keep-result=no;\r\
    \n}"
add comment="AP 24 witno rumah" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher witno rumah\" keep-re\
    sult=no;\r\
    \n}" host=172.16.0.24 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher witno rumah\" keep-\
    result=no;\r\
    \n}"
add comment="019 PTP MUKSIN" down-script="/tool fetch url=\"https://api.telegr\
    am.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?ch\
    at_id=-1001266583133&text=\\E2\\9D\\8C = AP MUKSIN\" keep-result=no;\r\
    \n}" host=192.168.55.19 interval=10s timeout=2s up-script="/tool fetch url\
    =\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xIne\
    w04/sendmessage\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = AP MUKSIN\" \
    keep-result=no;\r\
    \n}"
add comment="201 PTP SLAMET PUSAT" down-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9D\\8C = PTP UBIQUITI KE SLAMET\" ke\
    ep-result=no;\r\
    \n}" host=192.168.55.201 timeout=2s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = PTP UBIQUITI KE SLAMET\"\
    \_keep-result=no;\r\
    \n}"
add comment="202 C-SLAMET" down-script="/tool fetch url=\"https://api.telegram\
    .org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat\
    _id=-1001247315859&text=\\E2\\9D\\8C = ptp penerima - slamet\" keep-result\
    =no;\r\
    \n}" host=192.168.55.202 timeout=2s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima - slamet\" \
    keep-result=no;\r\
    \n}"
add comment="AP 21 wawan rumah" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher wawan rumah\" keep-re\
    sult=no;\r\
    \n}" host=172.16.0.21 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher wawan rumah\" keep-\
    result=no;\r\
    \n}"
add comment="010 C-BAYU" down-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_i\
    d=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - bayu\" keep-result=no\
    ;\r\
    \n}" host=192.168.55.10 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - bayu\" ke\
    ep-result=no;\r\
    \n}"
add comment="017 PTP WITNO" down-script="/tool fetch url=\"https://api.telegra\
    m.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?cha\
    t_id=-1001247315859&text=\\E2\\9D\\8C = PTP KE WITNO\" keep-result=no;\r\
    \n}" host=192.168.55.17 interval=30s timeout=2s up-script="/tool fetch url\
    =\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xIne\
    w04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = PTP KE WITNO\
    \" keep-result=no;\r\
    \n}"
add comment="018 C-WITNO" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_\
    id=-1001247315859&text=\\E2\\9D\\8C = ptp penerima - witno\" keep-result=n\
    o;\r\
    \n}" host=192.168.55.18 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima - witno\" ke\
    ep-result=no;\r\
    \n}"
add comment="011 C-SD SK 1" down-script="/tool fetch url=\"https://api.telegra\
    m.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?cha\
    t_id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - sd surokidul 1\" k\
    eep-result=no;\r\
    \n}" host=192.168.55.11 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - sd suroki\
    dul 1\" keep-result=no;\r\
    \n}"
add comment="AP 03 agus warung" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher agus warung\" keep-re\
    sult=no;\r\
    \n}" host=172.16.0.3 timeout=2s up-script="/tool fetch url=\"https://api.t\
    elegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher agus warung\" keep-\
    result=no;\r\
    \n}"
add comment="020 MUHSIN BTS***********" down-script="/tool fetch url=\"https:/\
    /api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendme\
    ssage\\\?chat_id=-1001266583133&text=\\E2\\9D\\8C = PENERIMA MUKSIN\" keep\
    -result=no;\r\
    \n}" host=192.168.55.20 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = PENERIMA MUKSIN\" keep-re\
    sult=no;\r\
    \n}"
add comment="021 PTP SD PAGER 03" disabled=yes down-script="/tool fetch url=\"\
    https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\
    /sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9D\\8C = AP SD PAGER 03\
    \" keep-result=no;\r\
    \n}" host=192.168.55.21 interval=30s timeout=2s up-script="/tool fetch url\
    =\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xIne\
    w04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = AP SD PAGER \
    03\" keep-result=no;\r\
    \n}"
add comment="022 C-SD PAGER 03" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = PENERIMA SD PAGER 03\" keep-r\
    esult=no;\r\
    \n}" host=192.168.55.22 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = PENERIMA SD PAGER 03\" ke\
    ep-result=no;\r\
    \n}"
add comment="012 C-BAYU RUMAH" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - bayu rumah\" ke\
    ep-result=no;\r\
    \n}" host=192.168.55.12 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - bayu ruma\
    h\" keep-result=no;\r\
    \n}"
add comment="023 OMNITIK MERPATI" down-script="/tool fetch url=\"https://api.t\
    elegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001266583133&text=\\E2\\9D\\8C = OMNITIK TEGAL\" keep-result\
    =no;\r\
    \n}" host=192.168.55.23 interval=10s timeout=2s up-script="/tool fetch url\
    =\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xIne\
    w04/sendmessage\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = OMNITIK TEGA\
    L\" keep-result=no;\r\
    \n}"
add comment="024 C-FUAD" down-script="/tool fetch url=\"https://api.telegram.o\
    rg/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_i\
    d=-1001247315859&text=\\E2\\9D\\8C = ptp penerima - fuad\" keep-result=no;\
    \r\
    \n}" host=192.168.55.24 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima - fuad\" kee\
    p-result=no;\r\
    \n}"
add comment="025 C-ALI GEPREK" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = ptp penerima -ali geprek\" keep\
    -result=no;\r\
    \n}" host=192.168.55.25 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima -ali geprek\
    \" keep-result=no;\r\
    \n}"
add comment="026 C-MUL" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id\
    =-1001247315859&text=\\E2\\9D\\8C = ptp penerima - mul\" keep-result=no;\r\
    \n}" host=192.168.55.26 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptp penerima - mul\" keep\
    -result=no;\r\
    \n}"
add comment="AP 15 wati warung" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher warung wati\" keep-re\
    sult=no;\r\
    \n}" host=172.16.0.15 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher warung wati\" keep-\
    result=no;\r\
    \n}"
add comment="AP 23 nazim warung" down-script="/tool fetch url=\"https://api.te\
    legram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher naz warung\" keep-res\
    ult=no;\r\
    \n}" host=172.16.0.23 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher naz warung\" keep-r\
    esult=no;\r\
    \n}"
add comment="013 C-AAN" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id\
    =-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - aan rumah\" keep-resul\
    t=no;\r\
    \n}" host=192.168.55.13 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - aan rumah\
    \" keep-result=no;\r\
    \n}"
add comment="014 C-SRI" down-script="/tool fetch url=\"https://api.telegram.or\
    g/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id\
    =-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - sri rumah\" keep-resul\
    t=no;\r\
    \n}" host=192.168.55.14 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - sri rumah\
    \" keep-result=no;\r\
    \n}"
add comment="AP 09 kukuh rumah" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher bebek\" keep-result=n\
    o;\r\
    \n}" host=172.16.0.9 timeout=2s up-script="/tool fetch url=\"https://api.t\
    elegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher bebek\" keep-result\
    =no;\r\
    \n}"
add comment="AP 16 dian rumah" down-script="/tool fetch url=\"https://api.tele\
    gram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?\
    chat_id=-1001247315859&text=\\E2\\9D\\8C = voucher dian\" keep-result=no;\
    \r\
    \n}" host=172.16.0.16 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = voucher dian\" keep-result=\
    no;\r\
    \n}"
add comment="015 C-DIKROM" down-script="/tool fetch url=\"https://api.telegram\
    .org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat\
    _id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - dikrom\" keep-resul\
    t=no;\r\
    \n}" host=192.168.55.15 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - dikrom\" \
    keep-result=no;\r\
    \n}"
add comment="016 C-NAZIM" down-script="/tool fetch url=\"https://api.telegram.\
    org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?chat_\
    id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - ozzzi\" keep-result=\
    no;\r\
    \n}" host=192.168.55.16 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - ozzzi\" k\
    eep-result=no;\r\
    \n}"
add comment="     1" down-script="\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1\"]\r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]\r\
    \n/ip route rule disable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp1\"]\r\
    \n/ip route disable [find comment=\"iiisp1\"]\r\
    \n/ip route disable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp2>isp1\"]\r\
    \n/ip route disable [find comment=\"isp3>isp1\"]\r\
    \n/ip route disable [find comment=\"isp4>isp1\"]\r\
    \n/ip route disable [find comment=\"isp5>isp1\"]\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog error (\"isp1 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1\" keep-result=no;" host=8.8.4.4 interval=5s up-script="/tool netwa\
    tch set disabled=yes [find comment=\"z 1 NOTIF\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]\r\
    \n/ip route rule enable [find comment=\"isp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp1\"]\r\
    \n/ip route enable [find comment=\"iiisp1\"]\r\
    \n/ip route enable [find comment=\"iiiisp1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp2>isp1\"]\r\
    \n/ip route enable [find comment=\"isp3>isp1\"]\r\
    \n/ip route enable [find comment=\"isp4>isp1\"]\r\
    \n/ip route enable [find comment=\"isp5>isp1\"]\r\
    \n\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1\" keep-result=no;"
add comment="     2         quad4" disabled=yes down-script="\r\
    \n\r\
    \n/ip route disable [find comment=\"isp2\"]\r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]\r\
    \n/ip route rule disable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp2\"]\r\
    \n/ip route disable [find comment=\"iiisp2\"]\r\
    \n/ip route disable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1>isp2\"]\r\
    \n/ip route disable [find comment=\"isp3>isp2\"]\r\
    \n/ip route disable [find comment=\"isp4>isp2\"]\r\
    \n/ip route disable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n\r\
    \nlog error (\"isp2 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2\" keep-result=no;" host=149.112.112.112 interval=5s timeout=2s \
    up-script="/tool netwatch set disabled=yes [find comment=\"z 2 NOTIF\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]\r\
    \n/ip route rule enable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp2\"]\r\
    \n/ip route enable [find comment=\"iiisp2\"]\r\
    \n/ip route enable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1>isp2\"]\r\
    \n/ip route enable [find comment=\"isp3>isp2\"]\r\
    \n/ip route enable [find comment=\"isp4>isp2\"]\r\
    \n/ip route enable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2\" keep-result=no;"
add comment="254 MIRZA RUMAH" down-script="/tool fetch url=\"https://api.teleg\
    ram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\?c\
    hat_id=-1001247315859&text=\\E2\\9D\\8C = mirza rumah\" keep-result=no;\r\
    \n}" host=192.168.55.254 timeout=2s up-script="/tool fetch url=\"https://a\
    pi.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmess\
    age\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = mirza rumah\" keep-resul\
    t=no;\r\
    \n}"
add comment="z 1 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp1 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 notif\" keep-result=no;" host=8.8.4.4 interval=3s timeout=100ms \
    up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 notif\" keep-result=no;"
add comment="z 2 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp2 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2 notif\" keep-result=no;" host=149.112.112.112 interval=3s \
    timeout=100ms up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2 notif\" keep-result=no;"
add comment="     VPN2 REMOTE" down-script="/interface enable vpn2\r\
    \n/interface enable vpn2\r\
    \n\r\
    \n/ip route disable [find comment=\"vpn2\"]\r\
    \n/ip route rule disable [find comment=\"vpn2\"]\r\
    \n/ip firewall nat disable [find comment=\"vpn2\"]\r\
    \n/ip firewall mangle disable [find comment=\"vpn2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"vvpn2\"]\r\
    \n/ip route disable [find comment=\"vvvpn2\"]\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"server vpn2\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C server vpn2\" keep-result=no;" host=10.123.22.1 interval=5s timeout=2s \
    up-script="/ip route enable [find comment=\"vpn2\"]\r\
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
    \nlog warning (\"server vpn2\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 server vpn2\" keep-result=no;"
add comment="     VPN1 DNS" down-script="/interface enable vpn1\r\
    \n/interface enable vpn1\r\
    \n\r\
    \n/ip route disable [find comment=\"vpn1\"]\r\
    \n/ip route rule disable [find comment=\"vpn1\"]\r\
    \n/ip firewall nat disable [find comment=\"vpn1\"]\r\
    \n/ip firewall mangle disable [find comment=\"vpn1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"vvpn1\"]\r\
    \n/ip route disable [find comment=\"vvvpn1\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1>vpn1\"]\r\
    \n/ip route disable [find comment=\"isp4>vpn1\"]\r\
    \n/ip route disable [find comment=\"isp2>vpn1\"]\r\
    \n\r\
    \nip dns set servers=192.168.18.1\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"server vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C server vpn1\" keep-result=no;" host=10.123.22.7 interval=5s timeout=2s \
    up-script="/ip route enable [find comment=\"vpn1\"]\r\
    \n/ip route rule enable [find comment=\"vpn1\"]\r\
    \n/ip firewall nat enable [find comment=\"vpn1\"]\r\
    \n/ip firewall mangle enable [find comment=\"vpn1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"vvpn1\"]\r\
    \n/ip route enable [find comment=\"vvvpn1\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1>vpn1\"]\r\
    \n/ip route enable [find comment=\"isp4>vpn1\"]\r\
    \n/ip route enable [find comment=\"isp2>vpn1\"]\r\
    \n\r\
    \nip dns set servers=10.123.22.7\r\
    \n\r\
    \n/ip dns cache flush\r\
    \n:delay 500ms;\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog warning (\"server vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 server vpn1\" keep-result=no;"
add comment="     2         cloudflare" down-script="\r\
    \n\r\
    \n/ip route disable [find comment=\"isp2\"]\r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]\r\
    \n/ip route rule disable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"iisp2\"]\r\
    \n/ip route disable [find comment=\"iiisp2\"]\r\
    \n/ip route disable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route disable [find comment=\"isp1>isp2\"]\r\
    \n/ip route disable [find comment=\"isp3>isp2\"]\r\
    \n/ip route disable [find comment=\"isp4>isp2\"]\r\
    \n/ip route disable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n\r\
    \nlog error (\"isp2 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2\" keep-result=no;" host=1.1.1.2 interval=5s timeout=2s up-script="\
    /tool netwatch set disabled=yes [find comment=\"z 2 NOTIF\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]\r\
    \n/ip route rule enable [find comment=\"isp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"iisp2\"]\r\
    \n/ip route enable [find comment=\"iiisp2\"]\r\
    \n/ip route enable [find comment=\"iiiisp2\"]\r\
    \n\r\
    \n/ip route enable [find comment=\"isp1>isp2\"]\r\
    \n/ip route enable [find comment=\"isp3>isp2\"]\r\
    \n/ip route enable [find comment=\"isp4>isp2\"]\r\
    \n/ip route enable [find comment=\"isp5>isp2\"]\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2\" keep-result=no;"
/tool romon
set enabled=yes secrets=45
