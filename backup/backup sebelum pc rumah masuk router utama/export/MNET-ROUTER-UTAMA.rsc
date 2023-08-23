# aug/16/2023 04:23:18 by RouterOS 6.48.6
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
add comment="172.16.0.0/12       |    172.16.0.1 - 172.16.15.254" name=\
    1_dhcp_/22 ranges=172.16.0.31-172.16.3.100
/ip hotspot
add address-pool=1_dhcp_/22 addresses-per-mac=unlimited disabled=no \
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
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+\$nama+\
    \$remote\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+\$nama+\
    \$remote\" keep-result=no;" only-one=yes
add address-list=ip-local local-address=10.10.2.1 name=area-tegal on-down=":lo\
    cal nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9D\\8C \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+\$nama+\
    \$remote\" keep-result=no;" on-up=":local nama \"\$user\";\r\
    \n:local remote [/ppp secret get [find name=\$nama] remote];\r\
    \n:local bot \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\";\r\
    \n:local chat \"-1001351938959\";\r\
    \n:delay 2000ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot\$bot/sendMessage\?chat_id\
    =\$chat&text=\\E2\\9C\\85 \$nama | \$remote\" mode=http keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+\$nama+\
    \$remote\" keep-result=no;" only-one=yes
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
add disabled=yes max-limit=100M/100M name="~~~    BYPASS     ~~~" priority=\
    1/1 target=192.168.55.0/24
add max-limit=100M/100M name="~~~ VIP & LOKAL ~~~" packet-marks=vip,lokal \
    priority=1/1 target=10.0.0.0/8,172.16.0.0/12
add max-limit=100M/100M name="~~~       GAME      ~~~" packet-marks=\
    game-ml,game-ff priority=2/2 target=10.0.0.0/8,172.16.0.0/12
/queue type
add kind=pcq name=pcq-download pcq-classifier=dst-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pcq name=pcq-upload pcq-classifier=src-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pfifo name=default-100 pfifo-limit=100
add kind=sfq name=FULL-SPEED
/queue simple
add max-limit=21M/21M name="~~~ SPEEDTEST ~~~" packet-marks=speedtest \
    priority=1/1 queue=FULL-SPEED/FULL-SPEED target=\
    10.10.0.0/21,10.10.12.3/32
add name="--------ALL TRAFIK--------" queue=default/default target=\
    10.0.0.0/8,172.16.0.0/12
add disabled=yes max-limit=100M/100M name=rtrw-muksin-LOSS parent=\
    "--------ALL TRAFIK--------" target=10.10.12.2/32
add burst-limit=0/7M burst-threshold=0/5M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/5M name="==warung-evi" parent="--------ALL TRAFIK--------" \
    target=172.16.3.251/32,172.16.3.252/32,172.16.3.253/32
add max-limit=1G/1G name=~~MIRZA parent="--------ALL TRAFIK--------" target=\
    10.20.254.2/32,10.10.2.254/32
add max-limit=50M/50M name=rtrw-muksin parent="--------ALL TRAFIK--------" \
    target=10.10.12.2/32
add max-limit=80M/80M name=rumahan parent="--------ALL TRAFIK--------" \
    target=10.10.0.0/21,10.10.12.3/32
/ip dhcp-server
add add-arp=yes address-pool=1_dhcp_/22 disabled=no insert-queue-before=\
    "==warung-evi" interface=vlan-hotspot lease-script=\
    "/queue simple remove [ find name ~\"hs-<\" ]" name=dhcp1 parent-queue=\
    "--------ALL TRAFIK--------"
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=no address-list=ip-local-to-isp1 \
    insert-queue-before="==warung-evi" keepalive-timeout=4m name=-default \
    on-login=":put (\",,0,,,noexp,Disable,\")\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "2M/5M 0/0 0/0 0/0 8 0/0" shared-users=unlimited
add address-list=ip-local-to-isp1 insert-queue-before="==warung-evi" \
    keepalive-timeout=4m name=-default-1-hp on-login=":put (\",rem,0,31d,0,,Di\
    sable,\"); {:local date [ /system clock get date ];:local year [ :pick \$d\
    ate 7 11 ];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot \
    user get [/ip hotspot user find where name=\"\$user\"] comment]; :local uc\
    ode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$c\
    omment = \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$d\
    ate interval=\"31d\"; :delay 2s; :local exp [ /sys sch get [ /sys sch find\
    \_where name=\"\$user\" ] next-run]; :local getxp [len \$exp]; :if (\$getx\
    p = 15) do={ :local d [:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local\
    \_s (\"/\"); :local exp (\"\$d\$s\$year \$t\"); /ip hotspot user set comme\
    nt=\$exp [find where name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip hotspo\
    t user set comment=\"\$date \$exp\" [find where name=\"\$user\"];}; :if (\
    \$getxp > 15) do={ /ip hotspot user set comment=\$exp [find where name=\"\
    \$user\"];}; /sys sch remove [find where name=\"\$user\"]}}\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/1500K 0/0 0/0 0/0 8 0/0"
add address-list=ip-local-to-isp1 insert-queue-before="==warung-evi" \
    keepalive-timeout=4m name=evi on-login=":put (\",remc,1000,31d,2000,,Disab\
    le,\"); {:local date [ /system clock get date ];:local year [ :pick \$date\
    \_7 11 ];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot us\
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
    er\"];}; /sys sch remove [find where name=\"\$user\"]; :local mac \$\"mac-\
    address\"; :local time [/system clock get time ]; /system script add name=\
    \"\$date-|-\$time-|-\$user-|-1000-|-\$address-|-\$mac-|-31d-|-evi-|-\$comm\
    ent\" owner=\"\$month\$year\" source=\$date comment=mikhmon}}\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "4M/6M 0/0 0/0 0/0 8 0/0"
add address-list=ip-local-to-isp1 insert-queue-before="==warung-evi" \
    keepalive-timeout=4m mac-cookie-timeout=2d name=agus on-login=":put (\",re\
    m,1000,31d,2000,,Disable,\"); {:local date [ /system clock get date ];:loc\
    al year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ];:local com\
    ment [ /ip hotspot user get [/ip hotspot user find where name=\"\$user\"] \
    comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$uc\
    ode = \"up\" or \$comment = \"\") do={ /sys sch add name=\"\$user\" disabl\
    e=no start-date=\$date interval=\"31d\"; :delay 2s; :local exp [ /sys sch \
    get [ /sys sch find where name=\"\$user\" ] next-run]; :local getxp [len \
    \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6]; :local t [:pic \
    \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year \$t\"); /ip hots\
    pot user set comment=\$exp [find where name=\"\$user\"];}; :if (\$getxp = \
    8) do={ /ip hotspot user set comment=\"\$date \$exp\" [find where name=\"\
    \$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set comment=\$exp [f\
    ind where name=\"\$user\"];}; /sys sch remove [find where name=\"\$user\"]\
    }}\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "4M/6M 0/0 0/0 0/0 8 0/0"
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0"
add add-mac-cookie=no address-list=ip-local-to-isp1 insert-queue-before=\
    "==warung-evi" keepalive-timeout=4m !mac-cookie-timeout name=\
    -default-trial on-login=":put (\",,0,,,noexp,Disable,\")\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/3M 0/0 0/0 0/0 8 0/0" shared-users=unlimited
add add-mac-cookie=no address-list=ip-local-to-isp1 insert-queue-before=\
    "==warung-evi" keepalive-timeout=4m !mac-cookie-timeout name=-rajelas \
    on-login=":put (\",rem,0,31d,0,,Disable,\"); {:local date [ /system clock \
    get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0\
    \_3 ];:local comment [ /ip hotspot user get [/ip hotspot user find where n\
    ame=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode \
    = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add name=\
    \"\$user\" disable=no start-date=\$date interval=\"31d\"; :delay 2s; :loca\
    l exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]; :l\
    ocal getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6];\
    \_:local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year\
    \_\$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\"];\
    }; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [f\
    ind where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set\
    \_comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find wher\
    e name=\"\$user\"]}}\r\
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
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%F0%9F%9F%A2+AKTI\
    F+=+\$nama%0A-+pada+:+\$date+%2d+\$time2%0A-+paket+:+\$profile%2d3mb%0A-+m\
    ac+:+\$mac%0A-+hp+:+\$host3%0A-+ping+ke+hp+:+\$avgRtt+ms\" keep-result=no;\
    \r\
    \n}\r\
    \n};" parent-queue="--------ALL TRAFIK--------" rate-limit=\
    "1M/2M 0/0 0/0 0/0 8 0/0"
/queue simple
add disabled=yes max-limit=20M/40M name="Merpati PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.2.0/24
add disabled=yes max-limit=20M/40M name="Bebek PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.1.0/24,10.10.12.3/32
add max-limit=40M/50M name=merpati parent=rumahan target=10.10.2.0/24
add max-limit=25M/50M name=bebek parent=rumahan target=\
    10.10.1.0/24,10.10.12.3/32
add limit-at=1k/1k max-limit=150k/200k name="~~blm bayar" parent=bebek \
    target=10.10.1.0/24,10.10.12.3/32
add limit-at=1k/1k max-limit=150k/200k name="~~blm bayar " parent=merpati \
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
add limit-at=1M/2M max-limit=3M/6M name=fuad parent=merpati target=\
    10.10.2.17/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=wati parent=merpati target=10.10.2.18/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/9M name=ali-geprek parent=merpati target=10.10.2.19/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=dian parent=merpati target=10.10.2.23/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=rokhim parent=merpati target=10.10.2.24/32
add burst-limit=0/11M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/9M name=mul parent=merpati target=10.10.2.14/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=laeli parent=merpati target=10.10.2.26/32
add burst-limit=0/9M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/7M name=kukuh parent=bebek target=10.10.1.11/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=amin parent=bebek target=10.10.1.12/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/8M name=wawan parent=bebek target=10.10.1.13/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1k/1k \
    max-limit=3M/6M name=irham parent=bebek target=10.10.1.14/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=ozi parent=bebek target=10.10.1.16/32
add limit-at=1M/2M max-limit=4M/10M name=slamet parent=bebek target=\
    10.10.1.15/32,10.10.12.3/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/9s limit-at=1M/2M \
    max-limit=3M/8M name=wawan-cafe parent=bebek target=10.10.1.17/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/8M name=bayu-kantor parent=bebek target=10.10.1.18/32
add limit-at=1M/2M max-limit=3M/6M name=sd-suro1 parent=bebek target=\
    10.10.1.19/32
add limit-at=1M/2M max-limit=5M/10M name=sd-pager3 parent=bebek target=\
    10.10.1.28/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=bayu-rumah parent=bebek target=10.10.1.20/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=witno parent=bebek target=10.10.1.21/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=sri parent=bebek target=10.10.1.22/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=aan parent=bebek target=10.10.1.23/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=turino parent=bebek target=10.10.1.24/32
add burst-limit=0/8M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/6M name=dikrom parent=bebek target=10.10.1.25/32
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
add address=172.16.0.1/12 interface=vlan-hotspot network=172.16.0.0
add address=192.168.55.1/24 interface=lan network=192.168.55.0
add address=192.168.18.2/24 interface=ether1-isp1 network=192.168.18.0
add address=10.20.254.1/30 interface=lan network=10.20.254.0
add address=192.168.23.4/24 interface=ether2-isp2 network=192.168.23.0
/ip arp
add address=10.10.12.2 comment=muksin interface=lan mac-address=\
    6C:3B:6B:C2:46:3B
add address=10.10.12.3 comment=slamet interface=lan mac-address=\
    18:E8:29:D6:9E:DA
/ip cloud
set update-time=no
/ip dhcp-client
add add-default-route=no interface=ether1-isp1 use-peer-dns=no
add add-default-route=no interface=ether2-isp2 use-peer-dns=no
/ip dhcp-server lease
add address=172.16.3.251 address-lists=ip-local-to-isp1 client-id=\
    1:ee:9d:a9:bb:3c:ce comment=T-evi-warung-ALI mac-address=\
    EE:9D:A9:BB:3C:CE server=dhcp1
add address=172.16.3.252 address-lists=ip-local-to-isp1 client-id=\
    1:fa:c0:92:a4:5f:ba comment=T-evi-warung-EVI mac-address=\
    FA:C0:92:A4:5F:BA server=dhcp1
add address=172.16.3.253 address-lists=ip-local-to-isp1 client-id=\
    1:a4:cc:b9:1c:20:6f comment="T-evi-warung-ALI anyar" mac-address=\
    A4:CC:B9:1C:20:6F server=dhcp1
/ip dhcp-server network
add address=172.16.0.0/22 gateway=172.16.0.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=5m cache-size=51200KiB servers=\
    192.168.18.1,192.168.23.1
/ip dns static
add address=172.16.0.1 name=hotspot.com ttl=5m
/ip firewall address-list
add address=172.16.0.0/12 comment=hotspot-voucher/12 list=ip-local
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
add address=172.16.0.0/12 comment="    172.16.0.1   -   172.31.255.254" list=\
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
add address=10.123.22.1 list=ip-vpn-lokal
add address=103.143.170.11 comment=vpn-idnix list=ip-vpn-publik
add address=10.20.254.2 comment="admin-mirza rumah" list=ip-local-to-isp2
add address=10.10.2.24 comment=merpati-rohkim disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.26 comment=merpati-laeli disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.16 comment=merpati-dinang disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.23 comment=merpati-dian disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.19 comment=merpati-ali-geprek disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.22 comment=bebek-sri disabled=yes list=ip-local-to-isp1
add address=10.10.1.15 comment=bebek-slamet list=ip-local-to-isp1
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
add address=10.10.1.21 comment=bebek-witno list=ip-local-to-isp1
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
add address=10.10.1.23 comment=bebek-aan list=ip-local-to-isp1
add address=10.10.2.14 comment=merpati-mul list=ip-local-to-isp1
add address=10.10.12.2 comment=rtrw-muksin list=ip-local-to-isp2
add address=fm1.firstmedia.com list=z-list-ip-web-blokir
add address=firstmedia.com list=z-list-ip-web-blokir
add address=internetsehat.firstmedia.com list=z-list-ip-web-blokir
add address=10.10.2.0/24 comment=merpati/24 list=ip-local-to-isp2
add address=10.10.1.0/24 comment=bebek/24 list=ip-local-to-isp2
add address=172.16.0.0/12 comment=hotspot-voucher/12 list=ip-local-to-isp2
add address=vpn.mnet.my.id list=ip-vpn-publik
add address=10.10.1.28 comment=bebek-sd-pager-3 disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.254 comment=merpati-belakangrumah list=ip-local-to-isp1
add address=172.16.0.0/12 comment=@@hotspot-voucher/12 list=ip-local-to-isp1
add address=www.uzone.id list=z-list-ip-web-blokir
add address=mercusuar.uzone.id list=z-list-ip-web-blokir
add address=172.16.0.0/12 comment=hotspot-voucher/12 disabled=yes list=\
    ip-local-game
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
add address=10.10.1.21 comment=bebek-witno disabled=yes list=ip-local-game
add address=10.10.1.22 comment=bebek-sri disabled=yes list=ip-local-game
add address=10.10.1.23 comment=bebek-aan list=ip-local-game
add address=10.10.1.24 comment=bebek-turino list=ip-local-game
add address=10.10.1.25 comment=bebek-dikrom list=ip-local-game
add address=10.10.1.26 comment=bebek-nazim disabled=yes list=ip-local-game
add address=10.10.1.28 comment=bebek-sdpager3 disabled=yes list=ip-local-game
add address=10.10.2.11 comment=tegal-topik list=ip-local-game
add address=10.10.2.13 comment=tegal-bunasir disabled=yes list=ip-local-game
add address=10.10.2.14 comment=tegal-mul list=ip-local-game
add address=10.10.2.16 comment=tegal-dinang list=ip-local-game
add address=10.10.2.17 comment=tegal-fuad list=ip-local-game
add address=10.10.2.18 comment=tegal-wati disabled=yes list=ip-local-game
add address=10.10.2.19 comment=tegal-aligeprek list=ip-local-game
add address=10.10.2.23 comment=tegal-dian disabled=yes list=ip-local-game
add address=10.10.2.24 comment=tegal-rokhim list=ip-local-game
add address=10.10.2.26 comment=tegal-laeli list=ip-local-game
add address=10.10.2.27 comment=tegal-syukur disabled=yes list=ip-local-game
add address=10.10.2.254 comment=tegal-rumahbelakang list=ip-local-game
add address=192.168.55.0/24 comment=PTP disabled=yes list=ip-local
add address=10.10.0.0/21 comment="rumahan bebek & tegal" list=\
    ip-local-speedtest
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local-speedtest
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local-to-isp1
add address=ip-local-game-2 comment="slamet statik" list=ip-local-to-isp2
add address=10.10.12.3 comment=bebek-slamet-STATIK disabled=yes list=\
    ip-local-game
add address=jsc.mgid.com list=z-list-ip-web-blokir
add address=10.10.2.24 comment=merpati-rohkim list=ip-local-to-route-isp1
add address=10.10.2.26 comment=merpati-laeli list=ip-local-to-route-isp1
add address=10.10.2.16 comment=merpati-dinang list=ip-local-to-route-isp1
add address=10.10.2.23 comment=merpati-dian list=ip-local-to-route-isp1
add address=10.10.2.19 comment=merpati-ali-geprek list=ip-local-to-route-isp1
add address=10.10.1.22 comment=bebek-sri list=ip-local-to-route-isp1
add address=10.10.1.15 comment=bebek-slamet list=ip-local-to-route-isp1
add address=10.10.1.26 comment=bebek-nazim list=ip-local-to-route-isp1
add address=10.10.1.11 comment=bebek-kukuh list=ip-local-to-route-isp1
add address=10.10.1.20 comment=bebek-bayu-rumah list=ip-local-to-route-isp1
add address=10.10.1.18 comment=bebek-bayu-kantor list=ip-local-to-route-isp1
add address=10.10.2.18 comment="merpati-wati @ TGL 4 NOV" list=\
    ip-local-to-route-isp1
add address=10.10.2.11 comment=merpati-topik list=ip-local-to-route-isp1
add address=10.10.2.27 comment="merpati-syukur @FIX RTO" list=\
    ip-local-to-route-isp1
add address=10.10.2.17 comment="merpati-fuad @FIX RTO" list=\
    ip-local-to-route-isp1
add address=10.10.2.13 comment=merpati-bunasir list=ip-local-to-route-isp1
add address=10.10.1.21 comment=bebek-witno list=ip-local-to-route-isp1
add address=10.10.1.13 comment=bebek-wawan-rumah list=ip-local-to-route-isp1
add address=10.10.1.17 comment=bebek-wawan-cafe list=ip-local-to-route-isp1
add address=10.10.1.24 comment=bebek-turino list=ip-local-to-route-isp1
add address=10.10.1.19 comment=bebek-sd-suro-1 list=ip-local-to-route-isp1
add address=10.10.1.16 comment=bebek-ozi list=ip-local-to-route-isp1
add address=10.10.1.14 comment=bebek-irham list=ip-local-to-route-isp1
add address=10.10.1.25 comment=bebek-dikrom list=ip-local-to-route-isp1
add address=10.10.1.12 comment=bebek-amin list=ip-local-to-route-isp1
add address=10.10.1.23 comment=bebek-aan list=ip-local-to-route-isp1
add address=10.10.2.14 comment=merpati-mul list=ip-local-to-route-isp1
add address=10.10.1.28 comment=bebek-sd-pager-3 list=ip-local-to-route-isp1
add address=10.10.2.254 comment=merpati-belakangrumah list=\
    ip-local-to-route-isp1
add address=10.10.12.3 comment=bebek-slamet-STATIK list=\
    ip-local-to-route-isp1
add address=172.16.0.0/12 comment=hotspot-voucher/12 list=\
    ip-local-to-route-isp1
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-private
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-private
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-private
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-private
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE disabled=yes list=\
    ip-private
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-private
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-private
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-private
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-private
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-private
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-private
add address=192.168.55.0/24 comment="ip private PTP MNET" list=ip-private
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
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=forward comment=DROP disabled=yes src-address=\
    10.10.12.3
add action=drop chain=forward comment="FF TOPIK MATI" disabled=yes dst-port="6\
    006,6008,6674,7000-7999,8001-8012,9006,9137,10000-10015,11000-11019,12006,\
    12008" protocol=tcp src-address=10.10.2.11
add action=drop chain=forward disabled=yes dst-port=\
    13006,15006,20561,39003,39006,39698,39779,39800 protocol=tcp src-address=\
    10.10.2.11
add action=drop chain=forward disabled=yes dst-port="6006,6008,6674,7000-7999,\
    8001-8012,8130,8443,9008,9120,10000-10015,10100,12008" protocol=udp \
    src-address=10.10.2.11
add action=drop chain=forward disabled=yes dst-port=11000-11019,13008 \
    protocol=udp src-address=10.10.2.11
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
    "                Routing IP VPN > ISP 2" dst-address-list=ip-vpn-publik \
    new-routing-mark=ether1 passthrough=no src-address=10.10.12.2
add action=mark-routing chain=prerouting comment=\
    "                BYPASS speedtest" dst-address-list=\
    z-list-ip-speedtest-statik dst-port=80,443,5060 new-routing-mark=vpn \
    passthrough=no protocol=tcp src-address-list=ip-local
add action=mark-packet chain=forward dst-address-list=!ip-private dst-port=\
    8080 new-packet-mark=speedtest passthrough=no protocol=tcp \
    src-address-list=ip-local-speedtest
add action=mark-packet chain=forward dst-address-list=ip-local-speedtest \
    new-packet-mark=speedtest passthrough=no protocol=tcp src-address-list=\
    !ip-private src-port=8080
add action=jump chain=prerouting comment=\
    "                BYPASS bbrp koneksi" dst-address-list=ip-private \
    jump-target=lokal src-address-list=ip-private
add action=jump chain=input dst-address-list=ip-private jump-target=lokal \
    src-address-list=ip-private
add action=jump chain=forward dst-address-list=ip-private jump-target=lokal \
    src-address-list=ip-private
add action=jump chain=output dst-address-list=ip-private jump-target=lokal \
    src-address-list=ip-private
add action=jump chain=postrouting dst-address-list=ip-private jump-target=\
    lokal src-address-list=ip-private
add action=mark-packet chain=lokal new-packet-mark=lokal passthrough=no
add action=jump chain=prerouting jump-target=vip protocol=icmp
add action=jump chain=input jump-target=vip protocol=icmp
add action=jump chain=forward jump-target=vip protocol=icmp
add action=jump chain=output jump-target=vip protocol=icmp
add action=jump chain=postrouting jump-target=vip protocol=icmp
add action=jump chain=prerouting jump-target=vip port=53,5353,853 protocol=\
    udp
add action=jump chain=prerouting jump-target=vip port=53,5353,853 protocol=\
    tcp
add action=mark-packet chain=vip new-packet-mark=vip passthrough=no
add action=jump chain=forward comment="                BYPASS game" \
    dst-address-list=!ip-private-2-local&dns dst-port="6006,6008,6674,7000-799\
    9,8001-8012,9006,9137,10000-10015,11000-11019,12006,12008" jump-target=\
    game-ff protocol=tcp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=tcp src-address-list=!ip-private-2-local&dns src-port="60\
    06,6008,6674,7000-7999,8001-8012,9006,9137,10000-10015,11000-11019,12006,1\
    2008"
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port=13006,15006,20561,39003,39006,39698,39779,39800 jump-target=\
    game-ff protocol=tcp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=tcp src-address-list=!ip-private-2-local&dns src-port=\
    13006,15006,20561,39003,39006,39698,39779,39800
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port="6006,6008,6674,7000-7999,8001-8012,8130,8443,9008,9120,10000-100\
    15,10100,12008" jump-target=game-ff protocol=udp src-address-list=\
    ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=udp src-address-list=!ip-private-2-local&dns src-port="60\
    06,6008,6674,7000-7999,8001-8012,8130,8443,9008,9120,10000-10015,10100,120\
    08"
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port=11000-11019,13008 jump-target=game-ff protocol=udp \
    src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ff protocol=udp src-address-list=!ip-private-2-local&dns src-port=\
    11000-11019,13008
add action=mark-packet chain=game-ff new-packet-mark=game-ff passthrough=no
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port=5520-5529,10003,30000-30900,8443,5289-5352,5354-5509,5517 \
    jump-target=game-ml protocol=tcp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=tcp src-address-list=!ip-private-2-local&dns src-port=\
    5520-5529,10003,30000-30900,8443,5289-5352,5354-5509,5517
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port="5000-5221,5224-5227,5229-5241,5243-5287,5551-5559,5601-5700,9000\
    -9010,9443" jump-target=game-ml protocol=tcp src-address-list=\
    ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=tcp src-address-list=!ip-private-2-local&dns src-port="50\
    00-5221,5224-5227,5229-5241,5243-5287,5551-5559,5601-5700,9000-9010,9443"
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port="4001-4009,5000-5221,5224-5241,5243-5509,5551-5559,5601-5700,8130\
    ,8443,9120" jump-target=game-ml protocol=udp src-address-list=\
    ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=udp src-address-list=!ip-private-2-local&dns src-port="40\
    01-4009,5000-5221,5224-5241,5243-5509,5551-5559,5601-5700,8130,8443,9120"
add action=jump chain=forward dst-address-list=!ip-private-2-local&dns \
    dst-port=\
    2702,3702,5517-5529,8001,9000-9010,9992,10003,30000-30900,5289-5352 \
    jump-target=game-ml protocol=udp src-address-list=ip-local-game
add action=jump chain=forward dst-address-list=ip-local-game jump-target=\
    game-ml protocol=udp src-address-list=!ip-private-2-local&dns src-port=\
    2702,3702,5517-5529,8001,9000-9010,9992,10003,30000-30900,5289-5352
add action=mark-packet chain=game-ml new-packet-mark=game-ml passthrough=no
add action=mark-routing chain=prerouting comment=\
    "                ROUTING Tiktok" dst-address-list=zz-list-raw-ip-tiktok \
    new-routing-mark=ether1 passthrough=no src-address-list=\
    ip-local-to-route-isp1
add action=mark-routing chain=prerouting comment=\
    "                ROUTING Youtube" disabled=yes dst-address-list=\
    zz-list-raw-ip-youtube new-routing-mark=ether1 passthrough=no \
    src-address-list=ip-local-to-route-isp1
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
add action=passthrough chain=10.123.22.7 comment=10.123.22.7 disabled=yes
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.7 \
    to-ports=53
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.7 \
    to-ports=53
add action=dst-nat chain=dstnat comment=vpn2 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.1 \
    to-ports=53
add action=dst-nat chain=dstnat comment=vpn2 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.1 \
    to-ports=53
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
add action=dst-nat chain=dstnat dst-address-list=z-list-ip-web-blokir \
    dst-port=80,443 protocol=tcp src-address-list=z-list-ip-redirect \
    to-addresses=149.154.167.99
add action=masquerade chain=srcnat comment="                KE INTERNET" \
    src-address=10.20.254.2
add action=masquerade chain=srcnat dst-address-list=ip-private-dns \
    out-interface-list=ISP src-address=192.168.55.0/24
add action=masquerade chain=srcnat out-interface-list=ISP+VPN \
    src-address-list=ip-local
/ip firewall raw
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Tiktok" content=.tiktokcdn.com dst-address-list=\
    !ip-private-2-local&dns src-address-list=ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktokv.com \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktok.com \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-youtube \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Youtube" content=.googlevideo.com disabled=yes \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-youtube \
    address-list-timeout=none-dynamic chain=prerouting content=.youtube.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-youtube \
    address-list-timeout=none-dynamic chain=prerouting content=.ytimg.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-snack \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Snack" content=.snackvideo.in disabled=yes \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-snack \
    address-list-timeout=none-dynamic chain=prerouting content=.myqcloud.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-snack \
    address-list-timeout=none-dynamic chain=prerouting content=\
    .snackvideo.com disabled=yes dst-address-list=!ip-private-2-local&dns \
    src-address-list=ip-local-to-route-isp1
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
add comment=~~ABAH disabled=yes mac-address=04:B1:67:99:69:80 type=bypassed
add comment="~~TV BELAKANG" disabled=yes mac-address=04:95:73:F9:96:D7 type=\
    bypassed
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
add comment=SLAMET disabled=yes mac-address=18:E8:29:D6:9E:DA to-address=\
    172.16.3.240
/ip hotspot user
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ggp353 password=ggp353 \
    profile=-default-1-hp
add comment="jun/01/2055 19:51:55" name=cobawifidulu password=cobawifidulu
add comment="jun/01/2055 19:51:55" name=cobawifidisit password=cobawifidisit
add comment="jun/01/2055 19:51:55" name=cobawifidelet password=cobawifidelet
add comment="jun/01/2055 19:51:55" name=mnet889 password=mnet889 profile=\
    -rajelas
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xus758 password=xus758 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=kxk372 password=kxk372 \
    profile=-default-1-hp
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
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=bpx999 password=bpx999 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=frd986 password=frd986 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=msv538 password=msv538 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ujp553 password=ujp553 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ubc547 password=ubc547 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ddf254 password=ddf254 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=kdg427 password=kdg427 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=zmw545 password=zmw545 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ade745 password=ade745 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=udy229 password=udy229 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yzz892 password=yzz892 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dsh465 password=dsh465 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=wgv995 password=wgv995 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ney844 password=ney844 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hhs266 password=hhs266 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bnm953 password=bnm953 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=cwc978 password=cwc978 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=vvn264 password=vvn264 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yed449 password=yed449 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rbu335 password=rbu335 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=crj758 password=crj758 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ppb528 password=ppb528 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=frj484 password=frj484 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=kng598 password=kng598 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=gpc934 password=gpc934 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xtw986 password=xtw986 \
    profile=-default-1-hp
add comment="aug/16/2023 10:21:49" limit-uptime=8h name=rna575 password=\
    rna575 profile=wati
add comment="aug/18/2023 18:14:59" limit-uptime=8h name=jwi742 password=\
    jwi742 profile=wati
add comment="aug/20/2023 13:05:06" limit-uptime=8h name=yst856 password=\
    yst856 profile=wati
add comment="aug/25/2023 02:16:09" limit-uptime=8h name=xgp985 password=\
    xgp985 profile=wati
add comment="aug/19/2023 17:07:29" limit-uptime=8h name=khv637 password=\
    khv637 profile=wati
add comment="aug/22/2023 19:09:30" limit-uptime=8h name=zbz795 password=\
    zbz795 profile=wati
add comment="aug/19/2023 19:26:05" limit-uptime=8h name=kym644 password=\
    kym644 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dwp342 password=dwp342 \
    profile=-default-1-hp
add comment="aug/21/2023 10:59:14" limit-uptime=8h name=jkz969 password=\
    jkz969 profile=wati
add comment="aug/18/2023 11:15:15" limit-uptime=8h name=sfd582 password=\
    sfd582 profile=wati
add comment="aug/23/2023 10:47:14" limit-uptime=8h name=hke494 password=\
    hke494 profile=wati
add comment="aug/22/2023 21:13:14" limit-uptime=8h name=fbx565 password=\
    fbx565 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=vus824 password=vus824 \
    profile=-default-1-hp
add comment="aug/23/2023 18:10:40" limit-uptime=8h name=jfv569 password=\
    jfv569 profile=wati
add comment="aug/23/2023 09:12:05" limit-uptime=8h name=chc235 password=\
    chc235 profile=wati
add comment="aug/19/2023 19:21:43" limit-uptime=8h name=xxi486 password=\
    xxi486 profile=wati
add comment="aug/20/2023 11:41:48" limit-uptime=8h name=hvx463 password=\
    hvx463 profile=wati
add comment="aug/25/2023 21:17:52" limit-uptime=8h name=vxr752 password=\
    vxr752 profile=-default-1-hp
add comment="aug/19/2023 09:27:41" limit-uptime=8h name=ezu738 password=\
    ezu738 profile=wati
add comment="aug/25/2023 19:27:42" limit-uptime=8h name=huf274 password=\
    huf274 profile=-default-1-hp
add comment="aug/21/2023 20:21:11" limit-uptime=8h name=vvg735 password=\
    vvg735 profile=wati
add comment="aug/18/2023 20:39:47" limit-uptime=8h name=xmd889 password=\
    xmd889 profile=wati
add comment="aug/17/2023 11:01:31" limit-uptime=8h name=hty656 password=\
    hty656 profile=wati
add comment="aug/16/2023 19:35:32" limit-uptime=8h name=ydr994 password=\
    ydr994 profile=wati
add comment="aug/18/2023 12:01:35" limit-uptime=8h name=vgw698 password=\
    vgw698 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bai335 password=bai335 \
    profile=-default-1-hp
add comment="aug/22/2023 13:10:26" limit-uptime=8h name=hmy367 password=\
    hmy367 profile=wati
add comment="aug/19/2023 08:01:56" limit-uptime=8h name=htf738 password=\
    htf738 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rwe695 password=rwe695 \
    profile=-default-1-hp
add comment="aug/16/2023 20:18:45" limit-uptime=8h name=gvv369 password=\
    gvv369 profile=wati
add comment="aug/16/2023 20:34:21" limit-uptime=8h name=uch388 password=\
    uch388 profile=wati
add comment="aug/22/2023 13:13:48" limit-uptime=8h name=zbg344 password=\
    zbg344 profile=wati
add comment="aug/17/2023 18:23:09" limit-uptime=8h name=jrk668 password=\
    jrk668 profile=wati
add comment="aug/16/2023 06:50:38" limit-uptime=8h name=csb374 password=\
    csb374 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=uye237 password=uye237 \
    profile=-default-1-hp
add comment="aug/21/2023 13:44:24" limit-uptime=8h name=suc253 password=\
    suc253 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hca292 password=hca292 \
    profile=-default-1-hp
add comment="aug/20/2023 01:35:59" limit-uptime=8h name=gtz948 password=\
    gtz948 profile=wati
add comment="aug/21/2023 07:54:01" limit-uptime=8h name=cyr939 password=\
    cyr939 profile=wati
add comment="aug/24/2023 17:36:55" limit-uptime=8h name=wpt294 password=\
    wpt294 profile=wati
add comment="aug/17/2023 11:06:35" limit-uptime=8h name=uyg586 password=\
    uyg586 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=nxh244 password=nxh244 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yrh254 password=yrh254 \
    profile=-default-1-hp
add comment="aug/22/2023 21:18:34" limit-uptime=8h name=rcv758 password=\
    rcv758 profile=wati
add comment="aug/24/2023 16:03:31" limit-uptime=8h name=nfv829 password=\
    nfv829 profile=wati
add comment="aug/22/2023 15:23:53" limit-uptime=8h name=hmn478 password=\
    hmn478 profile=wati
add comment="aug/23/2023 21:35:13" limit-uptime=8h name=hku486 password=\
    hku486 profile=wati
add comment="aug/23/2023 12:23:56" limit-uptime=8h name=xni934 password=\
    xni934 profile=wati
add comment="aug/23/2023 12:12:32" limit-uptime=8h name=hyb595 password=\
    hyb595 profile=wati
add comment="aug/17/2023 12:43:18" limit-uptime=8h name=jhv574 password=\
    jhv574 profile=wati
add comment="aug/21/2023 10:33:07" limit-uptime=8h name=phu522 password=\
    phu522 profile=wati
add comment="aug/25/2023 01:48:00" limit-uptime=8h name=byg464 password=\
    byg464 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=jzf455 password=jzf455 \
    profile=-default-1-hp
add comment="aug/25/2023 15:04:52" limit-uptime=8h name=uch854 password=\
    uch854 profile=wati
add comment="aug/16/2023 11:15:21" limit-uptime=8h name=mux959 password=\
    mux959 profile=wati
add comment="aug/21/2023 19:01:03" limit-uptime=8h name=bss857 password=\
    bss857 profile=wati
add comment="aug/23/2023 18:23:59" limit-uptime=8h name=wdm647 password=\
    wdm647 profile=wati
add comment="aug/25/2023 18:39:14" limit-uptime=8h name=ztf422 password=\
    ztf422 profile=wati
add comment="aug/24/2023 18:05:11" limit-uptime=8h name=xgg977 password=\
    xgg977 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rpr984 password=rpr984 \
    profile=-default-1-hp
add comment="aug/20/2023 18:26:12" limit-uptime=8h name=ycb774 password=\
    ycb774 profile=wati
add comment="aug/22/2023 18:44:51" limit-uptime=8h name=edd627 password=\
    edd627 profile=wati
add comment="aug/23/2023 08:41:17" limit-uptime=8h name=ucb678 password=\
    ucb678 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=mcn246 password=mcn246 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=kry554 password=kry554 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=svc762 password=svc762 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=pvy483 password=pvy483 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=iyw577 password=iyw577 \
    profile=-default-1-hp
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
add comment="aug/31/2023 20:57:11" limit-uptime=12h mac-address=\
    7E:5C:B0:99:7D:9D name=bee672 password=bee672 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=ggx525 password=\
    ggx525 profile=wawan
add comment="sep/14/2023 17:46:30" limit-uptime=12h mac-address=\
    20:74:54:C2:01:A9 name=tyj485 password=tyj485 profile=wawan
add comment="sep/14/2023 16:55:59" limit-uptime=12h mac-address=\
    00:0A:F5:CE:67:14 name=ekr872 password=ekr872 profile=wawan
add comment="sep/10/2023 12:26:47" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=dfa546 password=dfa546 profile=wawan
add comment="sep/09/2023 10:17:24" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=xre694 password=xre694 profile=wawan
add comment="sep/08/2023 06:01:53" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=mep598 password=mep598 profile=wawan
add comment="aug/16/2023 20:26:40" limit-uptime=12h mac-address=\
    DE:E4:4B:BE:63:ED name=xfk925 password=xfk925 profile=wawan
add comment="aug/17/2023 07:08:29" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=hax637 password=hax637 profile=wawan
add comment="aug/18/2023 17:33:46" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=txw387 password=txw387 profile=wawan
add comment="aug/20/2023 13:10:44" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=xyr223 password=xyr223 profile=wawan
add comment="aug/22/2023 07:56:04" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=hnb745 password=hnb745 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=sfc932 password=\
    sfc932 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=pue698 password=\
    pue698 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=bpr768 password=\
    bpr768 profile=wawan
add comment=vc-226-06.18.23-wawan limit-uptime=12h name=vgf287 password=\
    vgf287 profile=wawan
add comment="aug/17/2023 17:17:10" limit-uptime=8h name=ebe232 password=\
    ebe232 profile=dian
add comment="aug/17/2023 19:21:51" limit-uptime=8h name=isn869 password=\
    isn869 profile=dian
add comment="aug/17/2023 06:51:42" limit-uptime=8h name=cdz894 password=\
    cdz894 profile=dian
add comment="aug/17/2023 14:33:14" limit-uptime=8h name=yzb592 password=\
    yzb592 profile=dian
add comment="aug/17/2023 19:54:39" limit-uptime=8h name=aeg469 password=\
    aeg469 profile=dian
add comment="aug/16/2023 09:08:44" limit-uptime=8h name=cyt946 password=\
    cyt946 profile=dian
add comment="aug/16/2023 10:42:55" limit-uptime=8h name=peu688 password=\
    peu688 profile=dian
add comment="aug/16/2023 16:32:12" limit-uptime=8h name=hwt263 password=\
    hwt263 profile=dian
add comment="aug/17/2023 11:05:12" limit-uptime=8h name=mnr528 password=\
    mnr528 profile=dian
add comment="aug/17/2023 14:15:52" limit-uptime=8h name=reg223 password=\
    reg223 profile=dian
add comment="aug/16/2023 08:24:26" limit-uptime=8h name=eti794 password=\
    eti794 profile=dian
add comment="aug/16/2023 14:51:55" limit-uptime=8h name=vsh722 password=\
    vsh722 profile=dian
add comment="aug/16/2023 20:19:45" limit-uptime=8h name=wnw222 password=\
    wnw222 profile=dian
add comment="aug/16/2023 13:51:08" limit-uptime=8h name=ypb624 password=\
    ypb624 profile=dian
add comment="aug/16/2023 22:00:56" limit-uptime=8h name=ubp227 password=\
    ubp227 profile=dian
add comment="aug/16/2023 14:52:16" limit-uptime=8h name=hmb368 password=\
    hmb368 profile=dian
add comment="aug/17/2023 11:11:30" limit-uptime=8h name=ibm433 password=\
    ibm433 profile=dian
add comment="aug/17/2023 01:11:32" limit-uptime=8h name=psh439 password=\
    psh439 profile=dian
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=czv534 password=czv534 \
    profile=-default-1-hp
add comment="aug/19/2023 01:35:49" limit-uptime=8h name=hby254 password=\
    hby254 profile=dian
add comment="aug/18/2023 09:05:34" limit-uptime=8h name=fyj478 password=\
    fyj478 profile=dian
add comment="aug/19/2023 11:07:30" limit-uptime=8h name=kcm722 password=\
    kcm722 profile=dian
add comment="aug/18/2023 11:04:01" limit-uptime=8h name=tdf337 password=\
    tdf337 profile=dian
add comment="aug/18/2023 17:32:03" limit-uptime=8h name=jsa847 password=\
    jsa847 profile=dian
add comment="aug/18/2023 21:50:43" limit-uptime=8h name=msn322 password=\
    msn322 profile=dian
add comment="aug/18/2023 17:58:23" limit-uptime=8h name=dnn367 password=\
    dnn367 profile=dian
add comment="aug/18/2023 22:31:47" limit-uptime=8h name=rwv567 password=\
    rwv567 profile=dian
add comment="aug/19/2023 11:59:15" limit-uptime=8h name=esn499 password=\
    esn499 profile=dian
add comment="aug/19/2023 14:09:18" limit-uptime=8h name=xja586 password=\
    xja586 profile=dian
add comment="aug/19/2023 16:48:00" limit-uptime=8h name=wvt944 password=\
    wvt944 profile=dian
add comment="aug/19/2023 16:47:33" limit-uptime=8h name=din329 password=\
    din329 profile=dian
add comment="aug/20/2023 07:07:07" limit-uptime=8h name=cxb875 password=\
    cxb875 profile=dian
add comment="aug/19/2023 20:18:15" limit-uptime=8h name=dsa633 password=\
    dsa633 profile=dian
add comment="aug/20/2023 18:48:38" limit-uptime=8h name=ebz825 password=\
    ebz825 profile=dian
add comment="aug/20/2023 07:06:51" limit-uptime=8h name=suy625 password=\
    suy625 profile=dian
add comment="aug/20/2023 19:30:09" limit-uptime=8h name=wdr455 password=\
    wdr455 profile=dian
add comment="aug/20/2023 14:49:05" limit-uptime=8h name=csb436 password=\
    csb436 profile=dian
add comment="aug/20/2023 14:39:08" limit-uptime=8h name=cym939 password=\
    cym939 profile=dian
add comment="aug/20/2023 11:39:46" limit-uptime=8h name=dkz654 password=\
    dkz654 profile=dian
add comment="aug/20/2023 19:46:37" limit-uptime=8h name=kmi977 password=\
    kmi977 profile=dian
add comment="aug/20/2023 19:54:18" limit-uptime=8h name=tna532 password=\
    tna532 profile=dian
add comment="aug/20/2023 22:25:50" limit-uptime=8h name=zfr648 password=\
    zfr648 profile=dian
add comment="aug/20/2023 22:22:02" limit-uptime=8h name=uwy992 password=\
    uwy992 profile=dian
add comment="aug/20/2023 21:14:56" limit-uptime=8h name=tey855 password=\
    tey855 profile=dian
add comment="aug/22/2023 12:20:24" limit-uptime=8h name=uhy668 password=\
    uhy668 profile=dian
add comment="aug/21/2023 17:16:58" limit-uptime=8h name=sve424 password=\
    sve424 profile=dian
add comment="aug/21/2023 17:28:18" limit-uptime=8h name=xdu929 password=\
    xdu929 profile=dian
add comment="aug/21/2023 18:57:48" limit-uptime=8h name=ike437 password=\
    ike437 profile=dian
add comment="aug/21/2023 23:30:20" limit-uptime=8h name=nep277 password=\
    nep277 profile=dian
add comment="aug/22/2023 19:41:58" limit-uptime=8h name=hne369 password=\
    hne369 profile=dian
add comment="aug/22/2023 19:49:34" limit-uptime=8h name=zws437 password=\
    zws437 profile=dian
add comment="aug/22/2023 20:58:26" limit-uptime=8h name=aba892 password=\
    aba892 profile=dian
add comment="aug/22/2023 22:36:24" limit-uptime=8h name=tyu555 password=\
    tyu555 profile=dian
add comment="aug/22/2023 14:06:04" limit-uptime=8h name=wzi728 password=\
    wzi728 profile=dian
add comment="aug/23/2023 08:43:36" limit-uptime=8h name=sdc756 password=\
    sdc756 profile=dian
add comment="aug/24/2023 07:38:42" limit-uptime=8h name=vhz968 password=\
    vhz968 profile=dian
add comment="aug/22/2023 13:38:33" limit-uptime=8h name=hku426 password=\
    hku426 profile=dian
add comment="aug/22/2023 20:56:53" limit-uptime=8h name=zzp768 password=\
    zzp768 profile=dian
add comment="aug/22/2023 12:59:41" limit-uptime=8h name=ffn694 password=\
    ffn694 profile=dian
add comment="aug/23/2023 06:18:36" limit-uptime=8h name=ekg652 password=\
    ekg652 profile=dian
add comment="aug/23/2023 11:30:20" limit-uptime=8h name=rje757 password=\
    rje757 profile=dian
add comment="aug/22/2023 13:30:22" limit-uptime=8h name=ebh936 password=\
    ebh936 profile=dian
add comment="aug/23/2023 10:04:16" limit-uptime=8h name=asw424 password=\
    asw424 profile=dian
add comment="aug/22/2023 06:58:41" limit-uptime=8h name=hjk828 password=\
    hjk828 profile=dian
add comment="aug/16/2023 18:53:01" limit-uptime=8h name=vkf586 password=\
    vkf586 profile=-default-1-hp
add comment=vc-347-06.26.23-agus limit-uptime=8h name=kdu394 password=kdu394 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=jwi433 password=jwi433 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=zmt689 password=zmt689 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=hcr554 password=hcr554 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=dst673 password=dst673 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=giv529 password=giv529 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=yag544 password=yag544 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=gsy555 password=gsy555 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=uuh795 password=uuh795 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=mmd296 password=mmd296 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=sjd859 password=sjd859 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=krw235 password=krw235 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=utk795 password=utk795 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=nid993 password=nid993 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=dui994 password=dui994 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=kbc298 password=kbc298 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=wbd855 password=wbd855 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=wmw973 password=wmw973 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=cap549 password=cap549 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=jsi475 password=jsi475 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=suc857 password=suc857 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=bcn322 password=bcn322 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=wdj655 password=wdj655 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=vfw758 password=vfw758 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=rtr463 password=rtr463 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=zfg777 password=zfg777 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=bft252 password=bft252 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=hmh865 password=hmh865 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=wpe795 password=wpe795 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=fyw587 password=fyw587 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=ucw769 password=ucw769 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=jpv874 password=jpv874 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=uyk458 password=uyk458 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=inz762 password=inz762 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=ize675 password=ize675 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=rdm623 password=rdm623 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=wfr586 password=wfr586 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=iam434 password=iam434 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=byp259 password=byp259 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=rea733 password=rea733 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=vgh668 password=vgh668 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=jgr892 password=jgr892 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=eya983 password=eya983 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=crh376 password=crh376 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=cfx696 password=cfx696 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=uat638 password=uat638 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=cbx462 password=cbx462 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=iht935 password=iht935 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=bmy695 password=bmy695 \
    profile=agus
add comment=vc-347-06.26.23-agus limit-uptime=8h name=uht382 password=uht382 \
    profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=aah359 password=aah359 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hzu967 password=hzu967 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=mnk258 password=mnk258 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ire362 password=ire362 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hrd997 password=hrd997 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dks529 password=dks529 \
    profile=-default-1-hp
add comment="aug/16/2023 23:30:33" limit-uptime=12h name=uzn428 password=\
    uzn428 profile=witno-12jam
add comment="aug/16/2023 10:02:19" limit-uptime=12h name=ihf967 password=\
    ihf967 profile=witno-12jam
add comment="aug/16/2023 14:30:04" limit-uptime=12h name=fjn536 password=\
    fjn536 profile=witno-12jam
add comment="aug/17/2023 11:16:24" limit-uptime=12h name=vfy873 password=\
    vfy873 profile=witno-12jam
add comment="aug/21/2023 23:10:39" limit-uptime=12h name=cjd878 password=\
    cjd878 profile=witno-12jam
add comment="aug/17/2023 14:10:50" limit-uptime=12h name=eyr375 password=\
    eyr375 profile=witno-12jam
add comment="aug/16/2023 19:12:44" limit-uptime=12h name=bzg936 password=\
    bzg936 profile=witno-12jam
add comment="aug/16/2023 19:48:42" limit-uptime=12h name=ifj587 password=\
    ifj587 profile=witno-12jam
add comment="aug/17/2023 18:46:44" limit-uptime=12h name=ect253 password=\
    ect253 profile=witno-12jam
add comment="aug/17/2023 20:22:32" limit-uptime=12h name=yne323 password=\
    yne323 profile=witno-12jam
add comment="aug/18/2023 09:47:31" limit-uptime=12h name=mpw338 password=\
    mpw338 profile=witno-12jam
add comment="aug/18/2023 10:45:58" limit-uptime=12h name=zpm989 password=\
    zpm989 profile=witno-12jam
add comment="aug/18/2023 10:46:05" limit-uptime=12h name=jia393 password=\
    jia393 profile=witno-12jam
add comment="aug/19/2023 00:12:17" limit-uptime=12h name=vhc784 password=\
    vhc784 profile=witno-12jam
add comment="aug/18/2023 19:42:59" limit-uptime=12h name=myj652 password=\
    myj652 profile=witno-12jam
add comment="aug/20/2023 09:47:55" limit-uptime=12h name=pve698 password=\
    pve698 profile=witno-12jam
add comment="aug/20/2023 11:27:47" limit-uptime=12h name=dzb899 password=\
    dzb899 profile=witno-12jam
add comment="aug/20/2023 19:12:59" limit-uptime=12h name=bsv768 password=\
    bsv768 profile=witno-12jam
add comment="aug/20/2023 19:19:25" limit-uptime=12h name=fzv595 password=\
    fzv595 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=cib744 password=cib744 \
    profile=-default-1-hp
add comment="aug/22/2023 08:26:00" limit-uptime=12h name=ykm744 password=\
    ykm744 profile=witno-12jam
add comment="aug/22/2023 18:29:10" limit-uptime=12h name=syn334 password=\
    syn334 profile=witno-12jam
add comment="aug/23/2023 12:31:55" limit-uptime=12h name=vuf859 password=\
    vuf859 profile=witno-12jam
add comment="aug/23/2023 09:45:24" limit-uptime=12h name=trz642 password=\
    trz642 profile=witno-12jam
add comment="aug/23/2023 09:43:05" limit-uptime=12h name=enb933 password=\
    enb933 profile=witno-12jam
add comment="aug/27/2023 18:07:04" limit-uptime=12h name=rwm874 password=\
    rwm874 profile=witno-12jam
add comment="aug/24/2023 12:25:18" limit-uptime=12h name=xjx996 password=\
    xjx996 profile=witno-12jam
add comment="aug/24/2023 18:30:21" limit-uptime=12h name=chm789 password=\
    chm789 profile=witno-12jam
add comment="aug/25/2023 09:17:31" limit-uptime=12h name=chn776 password=\
    chn776 profile=witno-12jam
add comment="aug/25/2023 09:20:30" limit-uptime=12h name=ccy672 password=\
    ccy672 profile=witno-12jam
add comment="aug/25/2023 09:55:55" limit-uptime=12h name=uji473 password=\
    uji473 profile=witno-12jam
add comment="aug/27/2023 20:48:39" limit-uptime=12h name=wam565 password=\
    wam565 profile=witno-12jam
add comment="aug/25/2023 12:23:28" limit-uptime=12h name=znx674 password=\
    znx674 profile=witno-12jam
add comment="aug/25/2023 20:47:23" limit-uptime=12h name=fbf439 password=\
    fbf439 profile=witno-12jam
add comment="aug/25/2023 18:13:35" limit-uptime=12h name=vyy268 password=\
    vyy268 profile=witno-12jam
add comment="aug/26/2023 13:53:14" limit-uptime=12h name=ccp597 password=\
    ccp597 profile=witno-12jam
add comment="aug/26/2023 11:13:33" limit-uptime=12h name=pia553 password=\
    pia553 profile=witno-12jam
add comment="aug/26/2023 20:20:26" limit-uptime=12h name=gck976 password=\
    gck976 profile=witno-12jam
add comment="aug/27/2023 17:20:43" limit-uptime=12h name=pna648 password=\
    pna648 profile=witno-12jam
add comment="aug/27/2023 20:20:55" limit-uptime=12h name=zdv352 password=\
    zdv352 profile=witno-12jam
add comment="aug/28/2023 10:29:46" limit-uptime=12h name=mad479 password=\
    mad479 profile=witno-12jam
add comment="aug/28/2023 11:04:37" limit-uptime=12h name=gxz464 password=\
    gxz464 profile=witno-12jam
add comment="aug/29/2023 20:13:34" limit-uptime=12h name=hpv848 password=\
    hpv848 profile=witno-12jam
add comment="aug/29/2023 16:16:46" limit-uptime=12h name=xuw849 password=\
    xuw849 profile=witno-12jam
add comment="aug/29/2023 18:15:42" limit-uptime=12h name=nsz565 password=\
    nsz565 profile=witno-12jam
add comment="aug/29/2023 18:25:54" limit-uptime=12h name=uwg589 password=\
    uwg589 profile=witno-12jam
add comment="aug/29/2023 18:55:35" limit-uptime=12h name=ing749 password=\
    ing749 profile=witno-12jam
add comment="aug/30/2023 10:44:29" limit-uptime=12h name=dfp556 password=\
    dfp556 profile=witno-12jam
add comment="aug/29/2023 20:42:26" limit-uptime=12h name=dgp669 password=\
    dgp669 profile=witno-12jam
add comment="aug/31/2023 21:32:46" limit-uptime=12h name=cth858 password=\
    cth858 profile=witno-12jam
add comment="aug/30/2023 09:16:41" limit-uptime=12h name=why863 password=\
    why863 profile=witno-12jam
add comment="sep/02/2023 17:08:21" limit-uptime=12h name=wcs298 password=\
    wcs298 profile=witno-12jam
add comment="aug/31/2023 14:43:55" limit-uptime=12h name=htk352 password=\
    htk352 profile=witno-12jam
add comment="aug/30/2023 18:29:09" limit-uptime=12h name=jyp875 password=\
    jyp875 profile=witno-12jam
add comment="aug/30/2023 23:27:57" limit-uptime=12h name=gge395 password=\
    gge395 profile=witno-12jam
add comment="aug/31/2023 12:27:47" limit-uptime=12h name=iuk965 password=\
    iuk965 profile=witno-12jam
add comment="aug/31/2023 18:15:14" limit-uptime=12h name=rpd539 password=\
    rpd539 profile=witno-12jam
add comment="aug/29/2023 14:06:25" limit-uptime=12h name=dcr473 password=\
    dcr473 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ebe796 password=ebe796 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=zfr285 password=zfr285 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=zva499 password=zva499 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bus566 password=bus566 \
    profile=-default-1-hp
add comment="aug/16/2023 08:03:37" limit-uptime=8h name=msc783 password=\
    msc783 profile=nazim
add comment="aug/16/2023 07:35:51" limit-uptime=8h name=nuk273 password=\
    nuk273 profile=nazim
add comment="aug/16/2023 08:01:09" limit-uptime=8h name=umj759 password=\
    umj759 profile=nazim
add comment="aug/16/2023 13:59:16" limit-uptime=8h name=xvs578 password=\
    xvs578 profile=nazim
add comment="aug/16/2023 22:01:25" limit-uptime=8h name=mxc923 password=\
    mxc923 profile=nazim
add comment="aug/17/2023 17:27:59" limit-uptime=8h name=jkv433 password=\
    jkv433 profile=nazim
add comment="aug/17/2023 09:12:01" limit-uptime=8h name=nxs764 password=\
    nxs764 profile=nazim
add comment="aug/18/2023 14:02:45" limit-uptime=8h name=egs668 password=\
    egs668 profile=nazim
add comment="aug/23/2023 18:36:10" limit-uptime=8h name=mrc329 password=\
    mrc329 profile=nazim
add comment="aug/23/2023 17:34:15" limit-uptime=8h name=ddu839 password=\
    ddu839 profile=nazim
add comment="aug/19/2023 11:05:28" limit-uptime=8h name=iae592 password=\
    iae592 profile=nazim
add comment="aug/17/2023 18:19:33" limit-uptime=8h name=rmk844 password=\
    rmk844 profile=nazim
add comment="aug/18/2023 17:11:19" limit-uptime=8h name=aea928 password=\
    aea928 profile=nazim
add comment="aug/23/2023 19:25:24" limit-uptime=8h name=usk423 password=\
    usk423 profile=nazim
add comment="aug/24/2023 11:22:04" limit-uptime=8h name=svy293 password=\
    svy293 profile=nazim
add comment="aug/20/2023 19:32:52" limit-uptime=8h name=zbz583 password=\
    zbz583 profile=nazim
add comment="aug/19/2023 10:27:44" limit-uptime=8h name=zzn879 password=\
    zzn879 profile=nazim
add comment="aug/18/2023 18:49:27" limit-uptime=8h name=kyd638 password=\
    kyd638 profile=nazim
add comment="aug/21/2023 10:46:21" limit-uptime=8h name=afi227 password=\
    afi227 profile=nazim
add comment="aug/19/2023 10:27:41" limit-uptime=8h name=azu424 password=\
    azu424 profile=nazim
add comment="aug/19/2023 03:23:10" limit-uptime=8h name=bcr456 password=\
    bcr456 profile=nazim
add comment="aug/23/2023 22:04:33" limit-uptime=8h name=srn454 password=\
    srn454 profile=nazim
add comment="aug/21/2023 01:53:06" limit-uptime=8h name=nah493 password=\
    nah493 profile=nazim
add comment="aug/21/2023 15:45:03" limit-uptime=8h name=tmm579 password=\
    tmm579 profile=nazim
add comment="aug/20/2023 14:15:29" limit-uptime=8h name=efw684 password=\
    efw684 profile=nazim
add comment="aug/25/2023 12:34:07" limit-uptime=8h name=nvj258 password=\
    nvj258 profile=nazim
add comment="aug/22/2023 14:42:33" limit-uptime=8h name=jvz392 password=\
    jvz392 profile=nazim
add comment="aug/26/2023 16:46:52" limit-uptime=8h name=bhz796 password=\
    bhz796 profile=-default-1-hp
add comment="aug/20/2023 19:16:03" limit-uptime=8h name=vzk749 password=\
    vzk749 profile=nazim
add comment="aug/20/2023 19:13:09" limit-uptime=8h name=tuv834 password=\
    tuv834 profile=nazim
add comment="aug/25/2023 11:35:44" limit-uptime=8h name=jis735 password=\
    jis735 profile=nazim
add comment="aug/24/2023 13:54:22" limit-uptime=8h name=msu948 password=\
    msu948 profile=nazim
add comment="aug/21/2023 14:58:25" limit-uptime=8h name=sff725 password=\
    sff725 profile=nazim
add comment="aug/21/2023 09:56:59" limit-uptime=8h name=man724 password=\
    man724 profile=nazim
add comment="aug/20/2023 17:44:51" limit-uptime=8h name=mud664 password=\
    mud664 profile=nazim
add comment="aug/24/2023 22:30:35" limit-uptime=8h name=ymv526 password=\
    ymv526 profile=nazim
add comment="aug/22/2023 14:54:10" limit-uptime=8h name=vsm957 password=\
    vsm957 profile=nazim
add comment="aug/21/2023 23:45:54" limit-uptime=8h name=aww737 password=\
    aww737 profile=nazim
add comment="aug/21/2023 13:10:55" limit-uptime=8h name=spx237 password=\
    spx237 profile=nazim
add comment="aug/25/2023 14:39:59" limit-uptime=8h name=vij499 password=\
    vij499 profile=nazim
add comment="aug/25/2023 14:57:14" limit-uptime=8h name=tek696 password=\
    tek696 profile=nazim
add comment="aug/22/2023 13:35:44" limit-uptime=8h name=tak697 password=\
    tak697 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=atr753 password=atr753 \
    profile=-default-1-hp
add comment="aug/19/2023 16:55:17" limit-uptime=8h name=mkz457 password=\
    mkz457 profile=nazim
add comment="aug/20/2023 00:56:06" limit-uptime=8h name=pth428 password=\
    pth428 profile=nazim
add comment="aug/18/2023 11:57:33" limit-uptime=8h name=ywj537 password=\
    ywj537 profile=nazim
add comment="aug/18/2023 01:29:18" limit-uptime=8h name=reg596 password=\
    reg596 profile=nazim
add comment="aug/17/2023 18:19:37" limit-uptime=8h name=jty957 password=\
    jty957 profile=nazim
add comment="aug/17/2023 18:24:24" limit-uptime=8h name=udm465 password=\
    udm465 profile=nazim
add comment="aug/17/2023 18:21:26" limit-uptime=8h name=rkb627 password=\
    rkb627 profile=nazim
add comment="aug/17/2023 19:17:38" limit-uptime=8h name=anr334 password=\
    anr334 profile=evi
add comment="aug/18/2023 19:46:06" limit-uptime=8h name=rwh372 password=\
    rwh372 profile=evi
add comment="aug/17/2023 11:17:19" limit-uptime=8h name=zaf257 password=\
    zaf257 profile=evi
add comment="aug/17/2023 13:07:49" limit-uptime=8h name=cbu485 password=\
    cbu485 profile=evi
add comment="aug/17/2023 19:18:02" limit-uptime=8h name=zxd487 password=\
    zxd487 profile=evi
add comment="aug/17/2023 20:00:55" limit-uptime=8h name=ncr942 password=\
    ncr942 profile=evi
add comment="aug/18/2023 11:11:09" limit-uptime=8h name=nua357 password=\
    nua357 profile=evi
add comment="aug/18/2023 20:38:13" limit-uptime=8h name=trd475 password=\
    trd475 profile=evi
add comment="aug/18/2023 21:51:58" limit-uptime=8h name=mys465 password=\
    mys465 profile=evi
add comment="aug/18/2023 21:47:44" limit-uptime=8h name=upb229 password=\
    upb229 profile=evi
add comment="aug/18/2023 21:47:58" limit-uptime=8h name=ete892 password=\
    ete892 profile=evi
add comment="aug/19/2023 10:40:53" limit-uptime=8h name=ama972 password=\
    ama972 profile=evi
add comment="aug/19/2023 10:53:50" limit-uptime=8h name=ppd738 password=\
    ppd738 profile=evi
add comment="aug/22/2023 18:58:52" limit-uptime=8h name=rja929 password=\
    rja929 profile=evi
add comment="aug/20/2023 13:01:47" limit-uptime=8h name=phs385 password=\
    phs385 profile=evi
add comment="aug/19/2023 11:44:34" limit-uptime=8h name=ggt978 password=\
    ggt978 profile=evi
add comment="aug/19/2023 20:51:10" limit-uptime=8h name=vpc848 password=\
    vpc848 profile=evi
add comment="aug/19/2023 11:07:09" limit-uptime=8h name=hts485 password=\
    hts485 profile=evi
add comment="aug/20/2023 14:06:52" limit-uptime=8h name=esm924 password=\
    esm924 profile=evi
add comment="aug/24/2023 22:13:10" limit-uptime=8h name=kwm866 password=\
    kwm866 profile=evi
add comment="aug/23/2023 12:08:28" limit-uptime=8h name=iip985 password=\
    iip985 profile=evi
add comment="aug/25/2023 12:53:15" limit-uptime=8h name=nbi926 password=\
    nbi926 profile=evi
add comment="aug/25/2023 12:54:43" limit-uptime=8h name=ust363 password=\
    ust363 profile=evi
add comment="aug/23/2023 18:51:12" limit-uptime=8h name=ksx966 password=\
    ksx966 profile=evi
add comment="aug/23/2023 19:00:01" limit-uptime=8h name=ezz638 password=\
    ezz638 profile=evi
add comment="aug/23/2023 14:06:29" limit-uptime=8h name=age264 password=\
    age264 profile=evi
add comment="aug/24/2023 13:37:41" limit-uptime=8h name=psd248 password=\
    psd248 profile=evi
add comment="aug/24/2023 21:13:11" limit-uptime=8h name=nvw966 password=\
    nvw966 profile=evi
add comment="aug/22/2023 20:15:39" limit-uptime=8h name=tnw896 password=\
    tnw896 profile=evi
add comment="aug/22/2023 21:09:41" limit-uptime=8h name=fke448 password=\
    fke448 profile=evi
add comment="aug/22/2023 13:22:55" limit-uptime=8h name=mud782 password=\
    mud782 profile=evi
add comment="aug/22/2023 22:07:27" limit-uptime=8h name=iha326 password=\
    iha326 profile=evi
add comment="aug/23/2023 11:59:46" limit-uptime=8h name=asm534 password=\
    asm534 profile=evi
add comment="aug/22/2023 19:42:15" limit-uptime=8h name=ecy892 password=\
    ecy892 profile=evi
add comment="aug/22/2023 14:10:01" limit-uptime=8h name=bjj528 password=\
    bjj528 profile=evi
add comment="aug/22/2023 11:58:48" limit-uptime=8h name=fvd969 password=\
    fvd969 profile=evi
add comment="aug/21/2023 14:17:29" limit-uptime=8h name=xaw229 password=\
    xaw229 profile=evi
add comment="aug/20/2023 18:05:01" limit-uptime=8h name=vac334 password=\
    vac334 profile=evi
add comment="aug/26/2023 16:55:12" limit-uptime=8h name=abf726 password=\
    abf726 profile=evi
add comment="aug/26/2023 14:28:51" limit-uptime=8h name=vvg233 password=\
    vvg233 profile=evi
add comment="aug/25/2023 20:00:44" limit-uptime=8h name=ccp328 password=\
    ccp328 profile=evi
add comment="aug/27/2023 11:18:49" limit-uptime=8h name=ppt576 password=\
    ppt576 profile=evi
add comment="aug/26/2023 19:27:54" limit-uptime=8h name=nph223 password=\
    nph223 profile=evi
add comment="aug/30/2023 16:48:56" limit-uptime=8h name=wsa949 password=\
    wsa949 profile=evi
add comment="aug/30/2023 16:49:19" limit-uptime=8h name=mzb687 password=\
    mzb687 profile=evi
add comment="aug/30/2023 19:40:23" limit-uptime=8h name=zvu365 password=\
    zvu365 profile=evi
add comment="aug/26/2023 18:38:19" limit-uptime=8h name=axi725 password=\
    axi725 profile=evi
add comment="aug/26/2023 19:02:13" limit-uptime=8h name=hbm684 password=\
    hbm684 profile=evi
add comment="aug/30/2023 08:34:29" limit-uptime=8h name=xkf464 password=\
    xkf464 profile=evi
add comment="aug/29/2023 20:23:26" limit-uptime=8h name=jrg863 password=\
    jrg863 profile=evi
add comment="aug/29/2023 18:31:00" limit-uptime=8h name=hxp546 password=\
    hxp546 profile=evi
add comment="aug/31/2023 19:53:59" limit-uptime=8h name=kbj592 password=\
    kbj592 profile=evi
add comment="aug/29/2023 14:01:23" limit-uptime=8h name=unt482 password=\
    unt482 profile=evi
add comment="aug/28/2023 12:45:50" limit-uptime=8h name=sjf879 password=\
    sjf879 profile=evi
add comment="aug/28/2023 13:11:48" limit-uptime=8h name=ycp244 password=\
    ycp244 profile=evi
add comment="aug/28/2023 15:45:05" limit-uptime=8h name=dtx373 password=\
    dtx373 profile=evi
add comment="aug/28/2023 18:21:11" limit-uptime=8h name=kby496 password=\
    kby496 profile=evi
add comment="aug/29/2023 14:01:31" limit-uptime=8h name=unu845 password=\
    unu845 profile=evi
add comment="aug/27/2023 18:46:58" limit-uptime=8h name=ekm957 password=\
    ekm957 profile=evi
add comment="aug/27/2023 18:53:31" limit-uptime=8h name=csf667 password=\
    csf667 profile=evi
add comment="aug/27/2023 18:57:05" limit-uptime=8h name=dfv358 password=\
    dfv358 profile=evi
add comment="aug/27/2023 19:32:26" limit-uptime=8h name=fsf772 password=\
    fsf772 profile=evi
add comment="aug/28/2023 20:16:33" limit-uptime=8h name=zag997 password=\
    zag997 profile=evi
add comment="sep/02/2023 14:16:32" limit-uptime=8h name=kfw698 password=\
    kfw698 profile=evi
add comment="sep/02/2023 17:49:11" limit-uptime=8h name=xkf682 password=\
    xkf682 profile=evi
add comment="sep/02/2023 20:16:53" limit-uptime=8h name=hfi573 password=\
    hfi573 profile=evi
add comment="sep/02/2023 19:01:00" limit-uptime=8h name=pnm288 password=\
    pnm288 profile=evi
add comment="sep/03/2023 11:08:36" limit-uptime=8h name=tnr934 password=\
    tnr934 profile=evi
add comment="sep/01/2023 11:11:12" limit-uptime=8h name=avt876 password=\
    avt876 profile=evi
add comment="sep/01/2023 11:58:20" limit-uptime=8h name=nzi436 password=\
    nzi436 profile=evi
add comment="sep/01/2023 13:36:55" limit-uptime=8h name=nca344 password=\
    nca344 profile=evi
add comment="sep/01/2023 14:09:51" limit-uptime=8h name=hpy982 password=\
    hpy982 profile=evi
add comment="sep/02/2023 10:54:44" limit-uptime=8h name=yhv343 password=\
    yhv343 profile=evi
add comment="aug/31/2023 13:02:35" limit-uptime=8h name=uxt667 password=\
    uxt667 profile=evi
add comment="aug/31/2023 18:57:45" limit-uptime=8h name=dgs574 password=\
    dgs574 profile=evi
add comment="sep/05/2023 19:57:00" limit-uptime=8h name=vrx667 password=\
    vrx667 profile=evi
add comment="sep/03/2023 20:47:40" limit-uptime=8h name=wnj729 password=\
    wnj729 profile=evi
add comment="sep/01/2023 17:29:52" limit-uptime=8h name=pvg665 password=\
    pvg665 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=mzx326 password=mzx326 \
    profile=evi
add comment="sep/10/2023 17:12:16" limit-uptime=8h name=wgu648 password=\
    wgu648 profile=evi
add comment="sep/13/2023 18:51:14" limit-uptime=8h name=dtj528 password=\
    dtj528 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=jpk727 password=jpk727 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=mrj392 password=mrj392 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=fbs839 password=fbs839 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=msg546 password=msg546 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pvh962 password=pvh962 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pfc967 password=pfc967 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=vvk286 password=vvk286 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=rtd745 password=rtd745 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=nyr397 password=nyr397 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=bch699 password=bch699 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=dff379 password=dff379 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ckt333 password=ckt333 \
    profile=evi
add comment="sep/06/2023 09:33:10" limit-uptime=8h name=jaa422 password=\
    jaa422 profile=evi
add comment="sep/07/2023 09:18:57" limit-uptime=8h name=pjy347 password=\
    pjy347 profile=evi
add comment="sep/07/2023 12:21:28" limit-uptime=8h name=rty624 password=\
    rty624 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=hxp993 password=hxp993 \
    profile=evi
add comment="sep/08/2023 14:35:47" limit-uptime=8h name=zge364 password=\
    zge364 profile=evi
add comment="sep/03/2023 18:41:34" limit-uptime=8h name=avw286 password=\
    avw286 profile=evi
add comment="sep/04/2023 18:31:51" limit-uptime=8h name=rwg486 password=\
    rwg486 profile=evi
add comment="sep/13/2023 18:32:01" limit-uptime=8h name=rmm548 password=\
    rmm548 profile=evi
add comment="sep/10/2023 11:36:30" limit-uptime=8h name=nvu936 password=\
    nvu936 profile=evi
add comment="sep/09/2023 11:34:44" limit-uptime=8h name=yds486 password=\
    yds486 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=yjh974 password=yjh974 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=jfz738 password=jfz738 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=nsf454 password=nsf454 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ezj458 password=ezj458 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=xfb429 password=xfb429 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=cdb937 password=cdb937 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pez525 password=pez525 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ukt326 password=ukt326 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=uui924 password=uui924 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=mbg429 password=mbg429 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=fbp296 password=fbp296 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=wks223 password=wks223 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=abh839 password=abh839 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=zfi438 password=zfi438 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ymy652 password=ymy652 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=psh958 password=psh958 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=bny348 password=bny348 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ttj422 password=ttj422 \
    profile=evi
add comment="sep/03/2023 15:31:53" limit-uptime=8h name=yce227 password=\
    yce227 profile=evi
add comment="sep/03/2023 13:22:32" limit-uptime=8h name=hyg689 password=\
    hyg689 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=yuf745 password=yuf745 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=icd884 password=icd884 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=rgf285 password=rgf285 \
    profile=evi
add comment="sep/13/2023 20:49:59" limit-uptime=8h name=dte679 password=\
    dte679 profile=evi
add comment="sep/14/2023 17:06:12" limit-uptime=8h name=xtp468 password=\
    xtp468 profile=evi
add comment="sep/05/2023 19:34:35" limit-uptime=8h name=adg288 password=\
    adg288 profile=evi
add comment="sep/06/2023 09:17:38" limit-uptime=8h name=kxk997 password=\
    kxk997 profile=evi
add comment="sep/06/2023 09:24:01" limit-uptime=8h name=wwh958 password=\
    wwh958 profile=evi
add comment="sep/07/2023 17:36:45" limit-uptime=8h name=idc285 password=\
    idc285 profile=evi
add comment="sep/05/2023 11:51:05" limit-uptime=8h name=bix946 password=\
    bix946 profile=evi
add comment="sep/09/2023 13:13:48" limit-uptime=8h name=sdz372 password=\
    sdz372 profile=evi
add comment="sep/11/2023 13:12:42" limit-uptime=8h name=fni966 password=\
    fni966 profile=evi
add comment="sep/14/2023 12:15:18" limit-uptime=8h name=jem484 password=\
    jem484 profile=evi
add comment="sep/08/2023 15:43:13" limit-uptime=8h name=dkn439 password=\
    dkn439 profile=evi
add comment="sep/04/2023 19:15:41" limit-uptime=8h name=ekf537 password=\
    ekf537 profile=evi
add comment="sep/09/2023 11:37:32" limit-uptime=8h name=pmp738 password=\
    pmp738 profile=evi
add comment="sep/03/2023 18:24:26" limit-uptime=8h name=bfe628 password=\
    bfe628 profile=evi
add comment="sep/09/2023 19:05:38" limit-uptime=8h name=prh266 password=\
    prh266 profile=evi
add comment="sep/09/2023 18:41:47" limit-uptime=8h name=itp963 password=\
    itp963 profile=evi
add comment="sep/09/2023 17:05:59" limit-uptime=8h name=exp984 password=\
    exp984 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=khd684 password=khd684 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=chh368 password=chh368 \
    profile=evi
add comment="sep/10/2023 16:43:02" limit-uptime=8h name=bes349 password=\
    bes349 profile=evi
add comment="sep/10/2023 17:08:30" limit-uptime=8h name=ifx359 password=\
    ifx359 profile=evi
add comment="sep/08/2023 16:43:45" limit-uptime=8h name=zhk524 password=\
    zhk524 profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=yjp622 password=yjp622 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=jzp376 password=jzp376 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=xfp837 password=xfp837 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=hzn398 password=hzn398 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=bpv588 password=bpv588 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=kii736 password=kii736 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=aia962 password=aia962 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=iaj545 password=iaj545 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pbm547 password=pbm547 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=tgs829 password=tgs829 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=xwc557 password=xwc557 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=apf839 password=apf839 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=npd559 password=npd559 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=jgy264 password=jgy264 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=asw547 password=asw547 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=yjf638 password=yjf638 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pdn878 password=pdn878 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=afm473 password=afm473 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=hkx855 password=hkx855 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=fbw979 password=fbw979 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ces673 password=ces673 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=rmg459 password=rmg459 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=cgu469 password=cgu469 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=ejx326 password=ejx326 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=bbe956 password=bbe956 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=gjp973 password=gjp973 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=skj565 password=skj565 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=gfz796 password=gfz796 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=kwr658 password=kwr658 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=yus599 password=yus599 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=pfe547 password=pfe547 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=hnp698 password=hnp698 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=hzd372 password=hzd372 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=zyi879 password=zyi879 \
    profile=evi
add comment=vc-929-07.10.23-evi limit-uptime=8h name=gyh486 password=gyh486 \
    profile=evi
add comment=vc-521-07.10.23-wati limit-uptime=8h name=wdr722 password=wdr722 \
    profile=wati
add comment="aug/28/2023 13:43:09" limit-uptime=8h name=bhh529 password=\
    bhh529 profile=wati
add comment="sep/04/2023 11:15:02" limit-uptime=8h name=yep498 password=\
    yep498 profile=wati
add comment="aug/30/2023 07:55:41" limit-uptime=8h name=aee759 password=\
    aee759 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ttg237 password=ttg237 \
    profile=wati
add comment="sep/01/2023 01:40:40" limit-uptime=8h name=dce945 password=\
    dce945 profile=wati
add comment="aug/30/2023 19:39:06" limit-uptime=8h name=jzv922 password=\
    jzv922 profile=wati
add comment="aug/29/2023 19:29:41" limit-uptime=8h name=afc229 password=\
    afc229 profile=wati
add comment="aug/28/2023 23:47:14" limit-uptime=8h name=hgi937 password=\
    hgi937 profile=wati
add comment="aug/28/2023 15:16:13" limit-uptime=8h name=whz778 password=\
    whz778 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ifp546 password=ifp546 \
    profile=wati
add comment="sep/09/2023 19:46:55" limit-uptime=8h name=jfx734 password=\
    jfx734 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=gkp592 password=gkp592 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vvw632 password=vvw632 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=uys465 password=uys465 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=yru638 password=yru638 \
    profile=wati
add comment="sep/07/2023 19:04:13" limit-uptime=8h name=kkm822 password=\
    kkm822 profile=wati
add comment="sep/05/2023 12:41:23" limit-uptime=8h name=rvw264 password=\
    rvw264 profile=wati
add comment="sep/03/2023 18:29:24" limit-uptime=8h name=ubc489 password=\
    ubc489 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=gxe559 password=gxe559 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=bib828 password=bib828 \
    profile=wati
add comment="sep/02/2023 19:02:07" limit-uptime=8h name=vnu966 password=\
    vnu966 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=dmn437 password=dmn437 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ibd458 password=ibd458 \
    profile=wati
add comment="sep/03/2023 12:47:51" limit-uptime=8h name=tzv526 password=\
    tzv526 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=hck877 password=hck877 \
    profile=wati
add comment="sep/04/2023 11:38:35" limit-uptime=8h name=xxk475 password=\
    xxk475 profile=wati
add comment="sep/03/2023 18:32:28" limit-uptime=8h name=jzx892 password=\
    jzx892 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=hzj999 password=hzj999 \
    profile=wati
add comment="sep/01/2023 12:36:27" limit-uptime=8h name=dfh539 password=\
    dfh539 profile=wati
add comment="sep/09/2023 23:18:25" limit-uptime=8h name=smb879 password=\
    smb879 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ivg358 password=ivg358 \
    profile=wati
add comment="aug/29/2023 18:45:03" limit-uptime=8h name=vkf945 password=\
    vkf945 profile=wati
add comment="sep/06/2023 23:49:17" limit-uptime=8h name=ecj256 password=\
    ecj256 profile=wati
add comment="sep/05/2023 19:22:14" limit-uptime=8h name=ukn524 password=\
    ukn524 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=fcg894 password=fcg894 \
    profile=wati
add comment="sep/10/2023 19:15:35" limit-uptime=8h name=nzv658 password=\
    nzv658 profile=wati
add comment="aug/29/2023 11:45:46" limit-uptime=8h name=bys798 password=\
    bys798 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=jyg333 password=jyg333 \
    profile=wati
add comment="aug/29/2023 13:13:29" limit-uptime=8h name=ebd242 password=\
    ebd242 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ski969 password=ski969 \
    profile=wati
add comment="sep/05/2023 10:31:20" limit-uptime=8h name=feg497 password=\
    feg497 profile=wati
add comment="sep/01/2023 11:09:25" limit-uptime=8h name=atw288 password=\
    atw288 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=mvv762 password=mvv762 \
    profile=wati
add comment="sep/12/2023 16:38:20" limit-uptime=8h name=ikf336 password=\
    ikf336 profile=wati
add comment="sep/08/2023 14:54:03" limit-uptime=8h name=cxs997 password=\
    cxs997 profile=wati
add comment="aug/30/2023 11:49:28" limit-uptime=8h name=yyn967 password=\
    yyn967 profile=wati
add comment="sep/06/2023 00:14:05" limit-uptime=8h name=tbj865 password=\
    tbj865 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ckb864 password=ckb864 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vsg545 password=vsg545 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ifp946 password=ifp946 \
    profile=wati
add comment="sep/08/2023 21:31:20" limit-uptime=8h name=twx983 password=\
    twx983 profile=wati
add comment="aug/30/2023 09:39:58" limit-uptime=8h name=rue943 password=\
    rue943 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=pyj799 password=pyj799 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=htu934 password=htu934 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=nts824 password=nts824 \
    profile=wati
add comment="aug/29/2023 10:46:49" limit-uptime=8h name=esk364 password=\
    esk364 profile=wati
add comment="aug/29/2023 20:27:41" limit-uptime=8h name=kmb875 password=\
    kmb875 profile=wati
add comment="sep/02/2023 11:45:00" limit-uptime=8h name=pat945 password=\
    pat945 profile=wati
add comment="sep/01/2023 16:21:29" limit-uptime=8h name=fsb398 password=\
    fsb398 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rcc777 password=rcc777 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tua454 password=tua454 \
    profile=wati
add comment="sep/10/2023 21:57:34" limit-uptime=8h name=svw328 password=\
    svw328 profile=wati
add comment="sep/09/2023 15:27:41" limit-uptime=8h name=cxw422 password=\
    cxw422 profile=wati
add comment="sep/09/2023 07:10:36" limit-uptime=8h name=tke788 password=\
    tke788 profile=wati
add comment="sep/07/2023 09:13:25" limit-uptime=8h name=uzm857 password=\
    uzm857 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=pcs777 password=pcs777 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=wcf633 password=wcf633 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=xbe847 password=xbe847 \
    profile=wati
add comment="sep/06/2023 00:02:35" limit-uptime=8h name=eei559 password=\
    eei559 profile=wati
add comment="aug/27/2023 18:11:35" limit-uptime=8h name=rgs978 password=\
    rgs978 profile=wati
add comment="aug/27/2023 19:20:53" limit-uptime=8h name=bvx677 password=\
    bvx677 profile=wati
add comment="aug/30/2023 14:27:53" limit-uptime=8h name=bhh994 password=\
    bhh994 profile=wati
add comment="aug/27/2023 19:43:27" limit-uptime=8h name=ujm567 password=\
    ujm567 profile=wati
add comment="aug/29/2023 10:33:22" limit-uptime=8h name=pbv348 password=\
    pbv348 profile=wati
add comment="sep/15/2023 18:35:10" limit-uptime=8h name=gyw366 password=\
    gyw366 profile=wati
add comment="sep/01/2023 16:00:53" limit-uptime=8h name=dsr992 password=\
    dsr992 profile=wati
add comment="aug/30/2023 09:28:56" limit-uptime=8h name=suk895 password=\
    suk895 profile=wati
add comment="aug/31/2023 10:58:00" limit-uptime=8h name=pjb867 password=\
    pjb867 profile=wati
add comment="sep/11/2023 12:40:13" limit-uptime=8h name=ran282 password=\
    ran282 profile=wati
add comment="aug/31/2023 23:12:47" limit-uptime=8h name=kun599 password=\
    kun599 profile=wati
add comment="aug/29/2023 18:29:29" limit-uptime=8h name=hdz276 password=\
    hdz276 profile=wati
add comment="sep/12/2023 10:50:50" limit-uptime=8h name=rce263 password=\
    rce263 profile=wati
add comment="aug/27/2023 19:04:39" limit-uptime=8h name=dnu638 password=\
    dnu638 profile=wati
add comment="aug/27/2023 20:04:32" limit-uptime=8h name=thb783 password=\
    thb783 profile=wati
add comment="aug/29/2023 00:19:30" limit-uptime=8h name=swa949 password=\
    swa949 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=bib295 password=bib295 \
    profile=wati
add comment="sep/01/2023 00:34:50" limit-uptime=8h name=pwr582 password=\
    pwr582 profile=wati
add comment="aug/27/2023 13:43:08" limit-uptime=8h name=vjh522 password=\
    vjh522 profile=wati
add comment="sep/02/2023 18:25:41" limit-uptime=8h name=wdt938 password=\
    wdt938 profile=wati
add comment="sep/08/2023 08:07:48" limit-uptime=8h name=fdx565 password=\
    fdx565 profile=wati
add comment="sep/14/2023 23:15:51" limit-uptime=8h name=xfz778 password=\
    xfz778 profile=wati
add comment="aug/26/2023 11:35:43" limit-uptime=8h name=pxt924 password=\
    pxt924 profile=wati
add comment="aug/27/2023 16:33:17" limit-uptime=8h name=yjw297 password=\
    yjw297 profile=wati
add comment="sep/04/2023 08:46:39" limit-uptime=8h name=bft933 password=\
    bft933 profile=wati
add comment="sep/10/2023 08:10:23" limit-uptime=8h name=dmp269 password=\
    dmp269 profile=wati
add comment="sep/10/2023 11:29:43" limit-uptime=8h name=mti864 password=\
    mti864 profile=wati
add comment="sep/13/2023 16:44:33" limit-uptime=8h name=uax372 password=\
    uax372 profile=wati
add comment="sep/12/2023 15:28:00" limit-uptime=8h name=vja456 password=\
    vja456 profile=wati
add comment="sep/11/2023 23:28:11" limit-uptime=8h name=unt952 password=\
    unt952 profile=wati
add comment="sep/11/2023 10:21:18" limit-uptime=8h name=asd252 password=\
    asd252 profile=wati
add comment="aug/26/2023 12:01:52" limit-uptime=8h name=uni947 password=\
    uni947 profile=wati
add comment="sep/14/2023 09:49:15" limit-uptime=8h name=uvz529 password=\
    uvz529 profile=wati
add comment="aug/28/2023 20:45:36" limit-uptime=8h name=mts299 password=\
    mts299 profile=wati
add comment="sep/03/2023 21:46:42" limit-uptime=8h name=zbf925 password=\
    zbf925 profile=wati
add comment="sep/05/2023 09:00:23" limit-uptime=8h name=htd446 password=\
    htd446 profile=wati
add comment="aug/26/2023 12:37:22" limit-uptime=8h name=kfp568 password=\
    kfp568 profile=wati
add comment="sep/02/2023 16:01:53" limit-uptime=8h name=fdv269 password=\
    fdv269 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=nee853 password=nee853 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rmc966 password=rmc966 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tnz339 password=tnz339 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=mwi634 password=mwi634 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zws274 password=zws274 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rys352 password=rys352 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rku838 password=rku838 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=sxu863 password=sxu863 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ptb827 password=ptb827 \
    profile=wati
add comment="sep/10/2023 14:42:38" limit-uptime=8h name=rsx886 password=\
    rsx886 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=cnc875 password=cnc875 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=syr699 password=syr699 \
    profile=wati
add comment="sep/01/2023 19:39:54" limit-uptime=8h name=kxd943 password=\
    kxd943 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=srp883 password=srp883 \
    profile=wati
add comment="sep/11/2023 22:27:48" limit-uptime=8h name=jbk722 password=\
    jbk722 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ijz762 password=ijz762 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=txe836 password=txe836 \
    profile=wati
add comment="sep/02/2023 00:36:19" limit-uptime=8h name=vpt489 password=\
    vpt489 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=xbr832 password=xbr832 \
    profile=wati
add comment="sep/13/2023 00:44:16" limit-uptime=8h name=vhp355 password=\
    vhp355 profile=wati
add comment="sep/04/2023 11:07:41" limit-uptime=8h name=tdn768 password=\
    tdn768 profile=wati
add comment="sep/14/2023 13:33:14" limit-uptime=8h name=rtp798 password=\
    rtp798 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vej546 password=vej546 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=mti779 password=mti779 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=xwc896 password=xwc896 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=hef743 password=hef743 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=kya475 password=kya475 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=huc996 password=huc996 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ddh496 password=ddh496 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ijh559 password=ijh559 \
    profile=wati
add comment="sep/03/2023 16:10:16" limit-uptime=8h name=fkp337 password=\
    fkp337 profile=wati
add comment="sep/08/2023 05:31:18" limit-uptime=8h name=ckn973 password=\
    ckn973 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=djp756 password=djp756 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zue492 password=zue492 \
    profile=wati
add comment="sep/03/2023 21:21:07" limit-uptime=8h name=kbc653 password=\
    kbc653 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ryp347 password=ryp347 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zkv472 password=zkv472 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rtn294 password=rtn294 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=yee258 password=yee258 \
    profile=wati
add comment="sep/11/2023 12:40:32" limit-uptime=8h name=wja422 password=\
    wja422 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=fjc788 password=fjc788 \
    profile=wati
add comment="sep/08/2023 14:09:13" limit-uptime=8h name=beu442 password=\
    beu442 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=twe567 password=twe567 \
    profile=wati
add comment="sep/06/2023 12:15:52" limit-uptime=8h name=sih524 password=\
    sih524 profile=wati
add comment="sep/06/2023 12:31:31" limit-uptime=8h name=thv876 password=\
    thv876 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zsj764 password=zsj764 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=fpm753 password=fpm753 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=mpu523 password=mpu523 \
    profile=wati
add comment="sep/08/2023 12:54:07" limit-uptime=8h name=jrk467 password=\
    jrk467 profile=wati
add comment="sep/13/2023 14:51:40" limit-uptime=8h name=thg875 password=\
    thg875 profile=wati
add comment="sep/06/2023 12:02:12" limit-uptime=8h name=nvy784 password=\
    nvy784 profile=wati
add comment="sep/06/2023 11:55:39" limit-uptime=8h name=nsn565 password=\
    nsn565 profile=wati
add comment="sep/06/2023 21:58:40" limit-uptime=8h name=ghb549 password=\
    ghb549 profile=wati
add comment="sep/04/2023 14:25:38" limit-uptime=8h name=rfm942 password=\
    rfm942 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=erm764 password=erm764 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=uag544 password=uag544 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=byh248 password=byh248 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=hcw976 password=hcw976 \
    profile=wati
add comment="sep/14/2023 18:25:24" limit-uptime=8h name=bsc263 password=\
    bsc263 profile=wati
add comment="sep/13/2023 11:29:49" limit-uptime=8h name=mze935 password=\
    mze935 profile=wati
add comment="sep/14/2023 21:11:28" limit-uptime=8h name=abd873 password=\
    abd873 profile=wati
add comment="sep/05/2023 13:02:59" limit-uptime=8h name=xfx295 password=\
    xfx295 profile=wati
add comment="sep/12/2023 11:22:11" limit-uptime=8h name=fkm388 password=\
    fkm388 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=bnh333 password=bnh333 \
    profile=wati
add comment="sep/12/2023 11:40:58" limit-uptime=8h name=vet938 password=\
    vet938 profile=wati
add comment="sep/12/2023 12:41:56" limit-uptime=8h name=ixc594 password=\
    ixc594 profile=wati
add comment="sep/05/2023 12:57:59" limit-uptime=8h name=vnz757 password=\
    vnz757 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vsd823 password=vsd823 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tbe378 password=tbe378 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=yya247 password=yya247 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=sis962 password=sis962 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=efy589 password=efy589 \
    profile=wati
add comment="sep/14/2023 15:21:00" limit-uptime=8h name=udf939 password=\
    udf939 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ymz598 password=ymz598 \
    profile=wati
add comment="sep/13/2023 18:06:46" limit-uptime=8h name=gii757 password=\
    gii757 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=kti294 password=kti294 \
    profile=wati
add comment="sep/05/2023 18:26:48" limit-uptime=8h name=ibd625 password=\
    ibd625 profile=wati
add comment="sep/15/2023 11:42:22" limit-uptime=8h name=dvh672 password=\
    dvh672 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ujc882 password=ujc882 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=mrd525 password=mrd525 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ncf295 password=ncf295 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=pss634 password=pss634 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=gjw539 password=gjw539 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=bsy522 password=bsy522 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vmh284 password=vmh284 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=fga252 password=fga252 \
    profile=wati
add comment="sep/15/2023 17:13:16" limit-uptime=8h name=why562 password=\
    why562 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=njh943 password=njh943 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zfd972 password=zfd972 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=wbs557 password=wbs557 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=emv239 password=emv239 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zue865 password=zue865 \
    profile=wati
add comment="sep/14/2023 13:21:30" limit-uptime=8h name=xwt457 password=\
    xwt457 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=jwz453 password=jwz453 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=wds552 password=wds552 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=nxb355 password=nxb355 \
    profile=wati
add comment="sep/13/2023 10:59:49" limit-uptime=8h name=fhy669 password=\
    fhy669 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=psv389 password=psv389 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rhe467 password=rhe467 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vvn358 password=vvn358 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=xnr484 password=xnr484 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zsr526 password=zsr526 \
    profile=wati
add comment="sep/13/2023 11:43:25" limit-uptime=8h name=xkt525 password=\
    xkt525 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ffe475 password=ffe475 \
    profile=wati
add comment="sep/12/2023 18:54:44" limit-uptime=8h name=auf658 password=\
    auf658 profile=wati
add comment="sep/13/2023 13:07:41" limit-uptime=8h name=rvw287 password=\
    rvw287 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ifa563 password=ifa563 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=sjj497 password=sjj497 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=idp679 password=idp679 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=urj778 password=urj778 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=dji273 password=dji273 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=zty924 password=zty924 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vbi325 password=vbi325 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=fty472 password=fty472 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tnx886 password=tnx886 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=nnk949 password=nnk949 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=bfj925 password=bfj925 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=vtm552 password=vtm552 \
    profile=wati
add comment="sep/10/2023 21:58:22" limit-uptime=8h name=uge753 password=\
    uge753 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=psm695 password=psm695 \
    profile=wati
add comment="sep/10/2023 18:36:30" limit-uptime=8h name=tga453 password=\
    tga453 profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=cjg723 password=cjg723 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ymb638 password=ymb638 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=jzc735 password=jzc735 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=afa832 password=afa832 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=xyt366 password=xyt366 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=uzk793 password=uzk793 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=frc292 password=frc292 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=imt949 password=imt949 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tka539 password=tka539 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=khd956 password=khd956 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tvb455 password=tvb455 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=dgn468 password=dgn468 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=ayc255 password=ayc255 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=jra335 password=jra335 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=wuw697 password=wuw697 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=pwb889 password=pwb889 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=cjf942 password=cjf942 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=tzp953 password=tzp953 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rsb989 password=rsb989 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=dig279 password=dig279 \
    profile=wati
add comment=vc-521-07.10.23-wati limit-uptime=8h name=rfx652 password=rfx652 \
    profile=wati
add comment="aug/24/2023 20:04:13" limit-uptime=8h name=kib628 password=\
    kib628 profile=agus
add comment="aug/17/2023 13:28:08" limit-uptime=8h name=hjv628 password=\
    hjv628 profile=agus
add comment="aug/23/2023 19:52:37" limit-uptime=8h name=huy633 password=\
    huy633 profile=agus
add comment="aug/22/2023 08:08:10" limit-uptime=8h name=dts229 password=\
    dts229 profile=agus
add comment="aug/23/2023 14:22:24" limit-uptime=8h name=epg788 password=\
    epg788 profile=agus
add comment="aug/29/2023 19:13:37" limit-uptime=8h name=gbj243 password=\
    gbj243 profile=-default-1-hp
add comment="aug/17/2023 18:35:46" limit-uptime=8h name=tbz538 password=\
    tbz538 profile=agus
add comment="aug/22/2023 20:04:19" limit-uptime=8h name=pud849 password=\
    pud849 profile=agus
add comment="aug/19/2023 13:21:45" limit-uptime=8h name=hdz227 password=\
    hdz227 profile=agus
add comment="aug/22/2023 22:19:05" limit-uptime=8h name=bhu435 password=\
    bhu435 profile=agus
add comment="aug/21/2023 13:22:10" limit-uptime=8h name=fej973 password=\
    fej973 profile=agus
add comment="aug/21/2023 14:09:49" limit-uptime=8h name=csf973 password=\
    csf973 profile=agus
add comment="aug/20/2023 20:02:22" limit-uptime=8h name=hfa536 password=\
    hfa536 profile=agus
add comment="aug/25/2023 18:33:25" limit-uptime=8h name=zpw956 password=\
    zpw956 profile=-default-1-hp
add comment="aug/19/2023 02:11:09" limit-uptime=8h name=yyb474 password=\
    yyb474 profile=agus
add comment="aug/21/2023 09:57:16" limit-uptime=8h name=xba493 password=\
    xba493 profile=agus
add comment="aug/16/2023 06:40:07" limit-uptime=8h name=grb953 password=\
    grb953 profile=agus
add comment="aug/24/2023 11:27:25" limit-uptime=8h name=hne746 password=\
    hne746 profile=agus
add comment="aug/22/2023 01:07:17" limit-uptime=8h name=hdy937 password=\
    hdy937 profile=agus
add comment="aug/21/2023 18:58:23" limit-uptime=8h name=syp242 password=\
    syp242 profile=agus
add comment="aug/26/2023 16:02:45" limit-uptime=8h name=txk748 password=\
    txk748 profile=-default-1-hp
add comment="aug/16/2023 21:10:48" limit-uptime=8h name=fhw894 password=\
    fhw894 profile=agus
add comment="aug/16/2023 21:06:16" limit-uptime=8h name=xfe787 password=\
    xfe787 profile=agus
add comment="aug/23/2023 17:54:27" limit-uptime=8h name=bim924 password=\
    bim924 profile=agus
add comment="aug/27/2023 05:44:40" limit-uptime=8h name=ndg665 password=\
    ndg665 profile=-default-1-hp
add comment="aug/18/2023 12:09:35" limit-uptime=8h name=xhx849 password=\
    xhx849 profile=agus
add comment="aug/23/2023 19:56:50" limit-uptime=8h name=ipw667 password=\
    ipw667 profile=agus
add comment="aug/18/2023 21:39:04" limit-uptime=8h name=kyi638 password=\
    kyi638 profile=agus
add comment="aug/19/2023 20:11:22" limit-uptime=8h name=tmm294 password=\
    tmm294 profile=agus
add comment="aug/19/2023 00:20:18" limit-uptime=8h name=vwb444 password=\
    vwb444 profile=agus
add comment="aug/22/2023 23:28:27" limit-uptime=8h name=fev376 password=\
    fev376 profile=agus
add comment="aug/17/2023 03:16:06" limit-uptime=8h name=imd967 password=\
    imd967 profile=agus
add comment="aug/16/2023 23:43:18" limit-uptime=8h name=pye622 password=\
    pye622 profile=agus
add comment="aug/20/2023 20:39:18" limit-uptime=8h name=ekw466 password=\
    ekw466 profile=agus
add comment="aug/20/2023 16:35:18" limit-uptime=8h name=nwg792 password=\
    nwg792 profile=agus
add comment="aug/17/2023 20:20:12" limit-uptime=8h name=zin654 password=\
    zin654 profile=agus
add comment="aug/19/2023 01:14:40" limit-uptime=8h name=ryf747 password=\
    ryf747 profile=agus
add comment="aug/17/2023 08:32:52" limit-uptime=8h name=ixs642 password=\
    ixs642 profile=agus
add comment="aug/19/2023 11:12:37" limit-uptime=8h name=rms872 password=\
    rms872 profile=agus
add comment="aug/19/2023 22:59:19" limit-uptime=8h name=ryg462 password=\
    ryg462 profile=agus
add comment="aug/20/2023 22:32:10" limit-uptime=8h name=kfy247 password=\
    kfy247 profile=agus
add comment="aug/19/2023 21:17:43" limit-uptime=8h name=nmi433 password=\
    nmi433 profile=agus
add comment="aug/23/2023 19:51:35" limit-uptime=8h name=sam463 password=\
    sam463 profile=agus
add comment="aug/23/2023 19:09:55" limit-uptime=8h name=fvx549 password=\
    fvx549 profile=agus
add comment="aug/19/2023 10:08:56" limit-uptime=8h name=cvp783 password=\
    cvp783 profile=agus
add comment="aug/24/2023 11:29:16" limit-uptime=8h name=zep852 password=\
    zep852 profile=agus
add comment="aug/24/2023 11:26:35" limit-uptime=8h name=fyp944 password=\
    fyp944 profile=agus
add comment="aug/16/2023 14:06:44" limit-uptime=8h name=evb448 password=\
    evb448 profile=agus
add comment="aug/17/2023 23:45:47" limit-uptime=8h name=cvp762 password=\
    cvp762 profile=agus
add comment="aug/19/2023 09:13:32" limit-uptime=8h name=vjf634 password=\
    vjf634 profile=agus
add comment="aug/16/2023 16:41:23" limit-uptime=8h name=iut956 password=\
    iut956 profile=agus
add comment="aug/27/2023 16:29:24" limit-uptime=8h name=vby893 password=\
    vby893 profile=agus
add comment="aug/24/2023 18:38:46" limit-uptime=8h name=dvm578 password=\
    dvm578 profile=agus
add comment="aug/24/2023 19:29:52" limit-uptime=8h name=uwd277 password=\
    uwd277 profile=agus
add comment="aug/24/2023 19:00:17" limit-uptime=8h name=kyb666 password=\
    kyb666 profile=agus
add comment="aug/24/2023 18:32:41" limit-uptime=8h name=fzm637 password=\
    fzm637 profile=agus
add comment="aug/26/2023 12:39:58" limit-uptime=8h name=vrr629 password=\
    vrr629 profile=agus
add comment="aug/30/2023 15:05:25" limit-uptime=8h name=eja946 password=\
    eja946 profile=agus
add comment="aug/27/2023 19:09:12" limit-uptime=8h name=cns276 password=\
    cns276 profile=agus
add comment="aug/31/2023 19:27:02" limit-uptime=8h name=zmx669 password=\
    zmx669 profile=agus
add comment="aug/30/2023 16:18:01" limit-uptime=8h name=kkj597 password=\
    kkj597 profile=agus
add comment="aug/30/2023 20:04:21" limit-uptime=8h name=fbb253 password=\
    fbb253 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xwa455 password=xwa455 \
    profile=-default-1-hp
add comment="aug/26/2023 10:40:17" limit-uptime=8h name=cab949 password=\
    cab949 profile=agus
add comment="aug/30/2023 07:54:41" limit-uptime=8h name=iga896 password=\
    iga896 profile=agus
add comment="aug/26/2023 13:52:14" limit-uptime=8h name=hbu832 password=\
    hbu832 profile=agus
add comment="aug/28/2023 11:10:00" limit-uptime=8h name=any394 password=\
    any394 profile=agus
add comment="aug/28/2023 11:36:31" limit-uptime=8h name=vsy739 password=\
    vsy739 profile=agus
add comment="aug/29/2023 16:15:20" limit-uptime=8h name=bth285 password=\
    bth285 profile=agus
add comment="aug/28/2023 11:08:31" limit-uptime=8h name=ccj788 password=\
    ccj788 profile=agus
add comment="aug/29/2023 20:02:31" limit-uptime=8h name=pkb632 password=\
    pkb632 profile=agus
add comment="aug/27/2023 23:48:43" limit-uptime=8h name=xmx625 password=\
    xmx625 profile=agus
add comment="aug/24/2023 20:24:48" limit-uptime=8h name=dmv742 password=\
    dmv742 profile=agus
add comment="aug/26/2023 15:13:03" limit-uptime=8h name=hhj426 password=\
    hhj426 profile=agus
add comment="aug/27/2023 17:58:53" limit-uptime=8h name=kvr898 password=\
    kvr898 profile=agus
add comment="aug/25/2023 21:08:51" limit-uptime=8h name=rzx276 password=\
    rzx276 profile=agus
add comment="aug/27/2023 07:17:20" limit-uptime=8h name=zck395 password=\
    zck395 profile=agus
add comment="aug/27/2023 13:13:51" limit-uptime=8h name=ipp976 password=\
    ipp976 profile=agus
add comment="aug/24/2023 18:26:12" limit-uptime=8h name=rsx438 password=\
    rsx438 profile=agus
add comment="aug/29/2023 00:31:46" limit-uptime=8h name=xaw363 password=\
    xaw363 profile=agus
add comment="aug/27/2023 08:15:17" limit-uptime=8h name=tri885 password=\
    tri885 profile=agus
add comment="aug/27/2023 05:00:50" limit-uptime=8h name=xzm222 password=\
    xzm222 profile=agus
add comment="aug/28/2023 23:22:29" limit-uptime=8h name=ngs376 password=\
    ngs376 profile=agus
add comment="aug/26/2023 22:59:34" limit-uptime=8h name=dkg642 password=\
    dkg642 profile=agus
add comment="aug/27/2023 20:01:53" limit-uptime=8h name=cia768 password=\
    cia768 profile=agus
add comment="aug/28/2023 17:24:24" limit-uptime=8h name=gch782 password=\
    gch782 profile=agus
add comment="aug/28/2023 19:43:21" limit-uptime=8h name=cwb273 password=\
    cwb273 profile=agus
add comment="aug/29/2023 11:36:01" limit-uptime=8h name=svw782 password=\
    svw782 profile=agus
add comment="aug/28/2023 18:49:10" limit-uptime=8h name=rcb923 password=\
    rcb923 profile=agus
add comment="aug/30/2023 16:42:29" limit-uptime=8h name=mty296 password=\
    mty296 profile=agus
add comment="aug/28/2023 20:48:08" limit-uptime=8h name=wzx244 password=\
    wzx244 profile=agus
add comment="aug/26/2023 18:04:04" limit-uptime=8h name=skv244 password=\
    skv244 profile=agus
add comment="aug/25/2023 13:34:38" limit-uptime=8h name=ubw379 password=\
    ubw379 profile=agus
add comment="aug/27/2023 19:26:21" limit-uptime=8h name=dvr345 password=\
    dvr345 profile=agus
add comment="aug/26/2023 17:34:18" limit-uptime=8h name=nrd378 password=\
    nrd378 profile=agus
add comment="aug/25/2023 20:08:10" limit-uptime=8h name=mkp549 password=\
    mkp549 profile=agus
add comment="aug/31/2023 13:35:34" limit-uptime=8h name=txb656 password=\
    txb656 profile=agus
add comment="aug/30/2023 11:58:43" limit-uptime=8h name=ddm554 password=\
    ddm554 profile=agus
add comment="aug/30/2023 21:45:59" limit-uptime=8h name=nmj593 password=\
    nmj593 profile=agus
add comment="aug/24/2023 20:34:13" limit-uptime=8h name=hmr359 password=\
    hmr359 profile=agus
add comment="aug/25/2023 13:30:29" limit-uptime=8h name=kvi365 password=\
    kvi365 profile=agus
add comment="aug/29/2023 19:22:54" limit-uptime=8h name=bxn997 password=\
    bxn997 profile=agus
add comment="aug/30/2023 09:43:12" limit-uptime=8h name=xuk453 password=\
    xuk453 profile=agus
add comment="aug/30/2023 11:24:15" limit-uptime=8h name=giu832 password=\
    giu832 profile=agus
add comment="aug/29/2023 00:46:58" limit-uptime=8h name=wun625 password=\
    wun625 profile=agus
add comment="aug/28/2023 02:45:05" limit-uptime=8h name=zgz476 password=\
    zgz476 profile=agus
add comment="aug/30/2023 12:00:49" limit-uptime=8h name=sbe874 password=\
    sbe874 profile=dian
add comment="aug/30/2023 12:46:40" limit-uptime=8h name=unj573 password=\
    unj573 profile=dian
add comment="aug/30/2023 18:10:35" limit-uptime=8h name=tke849 password=\
    tke849 profile=dian
add comment="aug/30/2023 18:24:17" limit-uptime=8h name=rns662 password=\
    rns662 profile=dian
add comment="aug/30/2023 18:25:16" limit-uptime=8h name=skc965 password=\
    skc965 profile=dian
add comment="sep/01/2023 13:44:23" limit-uptime=8h name=nxt469 password=\
    nxt469 profile=dian
add comment="aug/31/2023 20:16:04" limit-uptime=8h name=ygs635 password=\
    ygs635 profile=dian
add comment="aug/31/2023 16:07:41" limit-uptime=8h name=kze687 password=\
    kze687 profile=dian
add comment="aug/31/2023 21:35:40" limit-uptime=8h name=bvz695 password=\
    bvz695 profile=dian
add comment="aug/30/2023 20:13:56" limit-uptime=8h name=zkt856 password=\
    zkt856 profile=dian
add comment="sep/02/2023 17:46:52" limit-uptime=8h name=epk335 password=\
    epk335 profile=dian
add comment="aug/31/2023 11:59:59" limit-uptime=8h name=dwf982 password=\
    dwf982 profile=dian
add comment="aug/31/2023 07:31:03" limit-uptime=8h name=ezd224 password=\
    ezd224 profile=dian
add comment="aug/31/2023 19:13:02" limit-uptime=8h name=xpe842 password=\
    xpe842 profile=dian
add comment="aug/31/2023 15:10:44" limit-uptime=8h name=syr722 password=\
    syr722 profile=dian
add comment="aug/31/2023 22:26:17" limit-uptime=8h name=uyu526 password=\
    uyu526 profile=dian
add comment="sep/01/2023 09:01:01" limit-uptime=8h name=xav653 password=\
    xav653 profile=dian
add comment="sep/01/2023 11:53:44" limit-uptime=8h name=uzk339 password=\
    uzk339 profile=dian
add comment="sep/01/2023 17:04:58" limit-uptime=8h name=huj273 password=\
    huj273 profile=dian
add comment="sep/01/2023 21:16:35" limit-uptime=8h name=dsx633 password=\
    dsx633 profile=dian
add comment="sep/02/2023 23:48:49" limit-uptime=8h name=ezr846 password=\
    ezr846 profile=dian
add comment="sep/02/2023 17:32:30" limit-uptime=8h name=azs594 password=\
    azs594 profile=dian
add comment="sep/02/2023 16:50:19" limit-uptime=8h name=rvn272 password=\
    rvn272 profile=dian
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=mjp644 password=mjp644 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dpc492 password=dpc492 \
    profile=-default-1-hp
add comment="sep/02/2023 20:25:34" limit-uptime=8h name=ytx946 password=\
    ytx946 profile=dian
add comment="sep/02/2023 20:50:35" limit-uptime=8h name=ptp394 password=\
    ptp394 profile=dian
add comment="sep/03/2023 20:52:36" limit-uptime=8h name=unt237 password=\
    unt237 profile=dian
add comment="sep/04/2023 19:04:23" limit-uptime=8h name=dju354 password=\
    dju354 profile=dian
add comment="sep/04/2023 10:54:28" limit-uptime=8h name=fnj989 password=\
    fnj989 profile=dian
add comment="sep/03/2023 13:33:23" limit-uptime=8h name=wnv885 password=\
    wnv885 profile=dian
add comment="sep/03/2023 18:21:12" limit-uptime=8h name=ufr495 password=\
    ufr495 profile=dian
add comment="sep/03/2023 18:27:56" limit-uptime=8h name=pca735 password=\
    pca735 profile=dian
add comment="sep/04/2023 20:07:52" limit-uptime=8h name=wky262 password=\
    wky262 profile=dian
add comment="sep/04/2023 19:20:54" limit-uptime=8h name=nhc573 password=\
    nhc573 profile=dian
add comment="sep/04/2023 18:44:45" limit-uptime=8h name=wnm392 password=\
    wnm392 profile=dian
add comment="sep/03/2023 21:45:27" limit-uptime=8h name=bpz275 password=\
    bpz275 profile=dian
add comment="sep/04/2023 09:16:27" limit-uptime=8h name=kdh293 password=\
    kdh293 profile=dian
add comment="sep/04/2023 15:46:40" limit-uptime=8h name=tin747 password=\
    tin747 profile=dian
add comment="sep/04/2023 12:55:06" limit-uptime=8h name=kur746 password=\
    kur746 profile=dian
add comment="sep/05/2023 09:49:26" limit-uptime=8h name=xcb645 password=\
    xcb645 profile=dian
add comment="sep/05/2023 18:33:34" limit-uptime=8h name=agy872 password=\
    agy872 profile=dian
add comment="sep/06/2023 12:21:07" limit-uptime=8h name=ufn398 password=\
    ufn398 profile=-default-1-hp
add comment="sep/06/2023 09:24:42" limit-uptime=8h name=gzd423 password=\
    gzd423 profile=-default-1-hp
add comment="sep/05/2023 18:50:21" limit-uptime=8h name=bnt789 password=\
    bnt789 profile=dian
add comment="sep/05/2023 09:43:28" limit-uptime=8h name=evx599 password=\
    evx599 profile=dian
add comment="sep/06/2023 08:49:23" limit-uptime=8h name=cri436 password=\
    cri436 profile=dian
add comment="sep/05/2023 22:22:48" limit-uptime=8h name=utb335 password=\
    utb335 profile=dian
add comment="sep/05/2023 22:24:07" limit-uptime=8h name=hjp884 password=\
    hjp884 profile=dian
add comment="sep/05/2023 22:14:23" limit-uptime=8h name=afi632 password=\
    afi632 profile=dian
add comment="aug/23/2023 19:59:23" limit-uptime=8h name=wbs367 password=\
    wbs367 profile=dian
add comment="aug/24/2023 22:03:59" limit-uptime=8h name=snw284 password=\
    snw284 profile=dian
add comment="aug/23/2023 20:06:06" limit-uptime=8h name=nyc562 password=\
    nyc562 profile=dian
add comment="aug/24/2023 19:08:35" limit-uptime=8h name=fir396 password=\
    fir396 profile=dian
add comment="aug/24/2023 14:51:28" limit-uptime=8h name=xwx235 password=\
    xwx235 profile=dian
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xwt638 password=xwt638 \
    profile=-default-1-hp
add comment="aug/23/2023 22:50:02" limit-uptime=8h name=zcs592 password=\
    zcs592 profile=dian
add comment="aug/24/2023 18:36:55" limit-uptime=8h name=wty845 password=\
    wty845 profile=dian
add comment="aug/24/2023 10:16:54" limit-uptime=8h name=dny774 password=\
    dny774 profile=dian
add comment="aug/24/2023 18:16:07" limit-uptime=8h name=ptd243 password=\
    ptd243 profile=dian
add comment="aug/25/2023 07:51:23" limit-uptime=8h name=wei388 password=\
    wei388 profile=dian
add comment="aug/26/2023 21:06:22" limit-uptime=8h name=fxd368 password=\
    fxd368 profile=dian
add comment="aug/26/2023 22:56:01" limit-uptime=8h name=gkd276 password=\
    gkd276 profile=dian
add comment="aug/26/2023 21:13:53" limit-uptime=8h name=rds575 password=\
    rds575 profile=dian
add comment="aug/26/2023 14:53:08" limit-uptime=8h name=ykm755 password=\
    ykm755 profile=dian
add comment="aug/26/2023 07:58:19" limit-uptime=8h name=xrz922 password=\
    xrz922 profile=dian
add comment="aug/26/2023 08:01:15" limit-uptime=8h name=zxf747 password=\
    zxf747 profile=dian
add comment="aug/26/2023 12:44:40" limit-uptime=8h name=fhh748 password=\
    fhh748 profile=dian
add comment="aug/26/2023 12:40:23" limit-uptime=8h name=egn282 password=\
    egn282 profile=dian
add comment="aug/26/2023 13:21:09" limit-uptime=8h name=udn843 password=\
    udn843 profile=dian
add comment="aug/26/2023 20:48:02" limit-uptime=8h name=rrz285 password=\
    rrz285 profile=dian
add comment="aug/25/2023 14:17:09" limit-uptime=8h name=ewu364 password=\
    ewu364 profile=dian
add comment="aug/25/2023 15:34:29" limit-uptime=8h name=kmh569 password=\
    kmh569 profile=dian
add comment="aug/25/2023 17:45:44" limit-uptime=8h name=aad634 password=\
    aad634 profile=dian
add comment="aug/25/2023 21:46:13" limit-uptime=8h name=ehu488 password=\
    ehu488 profile=dian
add comment="aug/27/2023 19:29:23" limit-uptime=8h name=css744 password=\
    css744 profile=dian
add comment="aug/28/2023 05:46:02" limit-uptime=8h name=umz377 password=\
    umz377 profile=dian
add comment="aug/27/2023 17:53:30" limit-uptime=8h name=ttt322 password=\
    ttt322 profile=dian
add comment="aug/28/2023 18:15:44" limit-uptime=8h name=zwn553 password=\
    zwn553 profile=dian
add comment="aug/28/2023 15:29:00" limit-uptime=8h name=vay856 password=\
    vay856 profile=dian
add comment="aug/27/2023 13:44:46" limit-uptime=8h name=drp278 password=\
    drp278 profile=dian
add comment="aug/27/2023 18:16:36" limit-uptime=8h name=pwy798 password=\
    pwy798 profile=dian
add comment="aug/27/2023 22:17:36" limit-uptime=8h name=czw247 password=\
    czw247 profile=dian
add comment="aug/27/2023 20:54:30" limit-uptime=8h name=cyj357 password=\
    cyj357 profile=dian
add comment="aug/28/2023 17:04:39" limit-uptime=8h name=xda787 password=\
    xda787 profile=dian
add comment="aug/29/2023 19:24:50" limit-uptime=8h name=ugk687 password=\
    ugk687 profile=dian
add comment="aug/28/2023 20:39:14" limit-uptime=8h name=vnd493 password=\
    vnd493 profile=dian
add comment="aug/28/2023 20:08:31" limit-uptime=8h name=szz993 password=\
    szz993 profile=dian
add comment="aug/30/2023 09:54:01" limit-uptime=8h name=vmg375 password=\
    vmg375 profile=dian
add comment="aug/28/2023 22:36:00" limit-uptime=8h name=kpv959 password=\
    kpv959 profile=dian
add comment="aug/29/2023 22:38:43" limit-uptime=8h name=wnt855 password=\
    wnt855 profile=dian
add comment="aug/29/2023 06:07:52" limit-uptime=8h name=bde744 password=\
    bde744 profile=dian
add comment="aug/30/2023 02:02:47" limit-uptime=8h name=rre465 password=\
    rre465 profile=dian
add comment="aug/29/2023 06:22:20" limit-uptime=8h name=udx239 password=\
    udx239 profile=dian
add comment="aug/30/2023 08:39:32" limit-uptime=8h name=rrw744 password=\
    rrw744 profile=dian
add comment="aug/29/2023 22:24:31" limit-uptime=8h name=ymx875 password=\
    ymx875 profile=dian
add comment="aug/30/2023 13:07:46" limit-uptime=8h name=jkj578 password=\
    jkj578 profile=dian
add comment="aug/29/2023 11:30:10" limit-uptime=8h name=vcs357 password=\
    vcs357 profile=dian
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=cbw264 password=cbw264 \
    profile=-default-1-hp
add comment="sep/01/2023 18:01:03" limit-uptime=8h name=kwh272 password=\
    kwh272 profile=dian
add comment="sep/15/2023 14:36:41" limit-uptime=8h name=wuw225 password=\
    wuw225 profile=dian
add comment="sep/15/2023 09:33:47" limit-uptime=8h name=urg454 password=\
    urg454 profile=dian
add comment="sep/14/2023 13:10:41" limit-uptime=8h name=rsv358 password=\
    rsv358 profile=dian
add comment="sep/13/2023 20:53:14" limit-uptime=8h name=tyu453 password=\
    tyu453 profile=dian
add comment="sep/13/2023 22:01:16" limit-uptime=8h name=adv849 password=\
    adv849 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=ppb725 password=ppb725 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=yxp233 password=yxp233 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=zwz289 password=zwz289 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=dty936 password=dty936 \
    profile=dian
add comment="sep/15/2023 21:14:55" limit-uptime=8h name=igm743 password=\
    igm743 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=zmy954 password=zmy954 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=smt364 password=smt364 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=bna487 password=bna487 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=jhx472 password=jhx472 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=mks665 password=mks665 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=vtv468 password=vtv468 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=sns683 password=sns683 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=ezc545 password=ezc545 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=aui268 password=aui268 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=fyg967 password=fyg967 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=smr982 password=smr982 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=jrm379 password=jrm379 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=uyp447 password=uyp447 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=nrm972 password=nrm972 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=xik927 password=xik927 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=sbe533 password=sbe533 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=bdn939 password=bdn939 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=srm696 password=srm696 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=mri639 password=mri639 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=djx642 password=djx642 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=zjv847 password=zjv847 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=nzm385 password=nzm385 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=xmg464 password=xmg464 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=whi872 password=whi872 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=vut922 password=vut922 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=bus992 password=bus992 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=kfx286 password=kfx286 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=ctb465 password=ctb465 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=saf847 password=saf847 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=atc789 password=atc789 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=kuh453 password=kuh453 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=mat355 password=mat355 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=ksx756 password=ksx756 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=eck268 password=eck268 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=fci769 password=fci769 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=aks332 password=aks332 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=emb284 password=emb284 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=fdi497 password=fdi497 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=tjr367 password=tjr367 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=pji777 password=pji777 \
    profile=dian
add comment="sep/06/2023 18:30:20" limit-uptime=8h name=tfs556 password=\
    tfs556 profile=dian
add comment="sep/06/2023 18:31:02" limit-uptime=8h name=jua584 password=\
    jua584 profile=dian
add comment="sep/07/2023 14:24:05" limit-uptime=8h name=diw322 password=\
    diw322 profile=dian
add comment="sep/07/2023 08:45:41" limit-uptime=8h name=bcc659 password=\
    bcc659 profile=dian
add comment="sep/06/2023 20:58:19" limit-uptime=8h name=fku267 password=\
    fku267 profile=dian
add comment="sep/06/2023 21:12:02" limit-uptime=8h name=ppa443 password=\
    ppa443 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=jsh985 password=jsh985 \
    profile=dian
add comment="sep/07/2023 11:41:15" limit-uptime=8h name=ppc445 password=\
    ppc445 profile=dian
add comment="sep/09/2023 17:12:28" limit-uptime=8h name=mef753 password=\
    mef753 profile=dian
add comment="sep/07/2023 12:38:47" limit-uptime=8h name=nhe395 password=\
    nhe395 profile=dian
add comment="sep/07/2023 20:27:38" limit-uptime=8h name=mxm784 password=\
    mxm784 profile=dian
add comment="sep/08/2023 17:44:21" limit-uptime=8h name=zin273 password=\
    zin273 profile=dian
add comment="sep/08/2023 14:00:40" limit-uptime=8h name=jrj942 password=\
    jrj942 profile=dian
add comment="sep/09/2023 14:14:24" limit-uptime=8h name=zff439 password=\
    zff439 profile=dian
add comment="sep/08/2023 21:10:02" limit-uptime=8h name=sct434 password=\
    sct434 profile=dian
add comment="sep/09/2023 20:36:47" limit-uptime=8h name=wue999 password=\
    wue999 profile=dian
add comment="sep/09/2023 19:01:47" limit-uptime=8h name=tha874 password=\
    tha874 profile=dian
add comment="sep/09/2023 20:42:39" limit-uptime=8h name=ksc294 password=\
    ksc294 profile=dian
add comment="sep/09/2023 16:19:47" limit-uptime=8h name=krr946 password=\
    krr946 profile=dian
add comment="sep/09/2023 16:05:05" limit-uptime=8h name=iay592 password=\
    iay592 profile=dian
add comment="sep/10/2023 11:30:48" limit-uptime=8h name=zdh822 password=\
    zdh822 profile=dian
add comment="sep/12/2023 00:56:57" limit-uptime=8h name=xis934 password=\
    xis934 profile=dian
add comment="sep/10/2023 18:17:29" limit-uptime=8h name=wfm789 password=\
    wfm789 profile=dian
add comment="sep/11/2023 17:51:06" limit-uptime=8h name=ijg835 password=\
    ijg835 profile=dian
add comment="sep/10/2023 14:46:17" limit-uptime=8h name=nfi797 password=\
    nfi797 profile=dian
add comment="sep/10/2023 20:36:32" limit-uptime=8h name=jyp962 password=\
    jyp962 profile=dian
add comment="sep/11/2023 06:57:08" limit-uptime=8h name=xaa873 password=\
    xaa873 profile=dian
add comment="sep/11/2023 07:35:10" limit-uptime=8h name=hux587 password=\
    hux587 profile=dian
add comment="sep/11/2023 19:47:45" limit-uptime=8h name=kzi772 password=\
    kzi772 profile=dian
add comment="sep/14/2023 10:40:17" limit-uptime=8h name=emk935 password=\
    emk935 profile=dian
add comment="sep/12/2023 14:09:59" limit-uptime=8h name=xmc356 password=\
    xmc356 profile=dian
add comment="sep/12/2023 18:24:16" limit-uptime=8h name=jhu955 password=\
    jhu955 profile=dian
add comment="sep/12/2023 18:34:01" limit-uptime=8h name=uxa959 password=\
    uxa959 profile=dian
add comment="sep/13/2023 07:38:04" limit-uptime=8h name=ryf825 password=\
    ryf825 profile=dian
add comment="sep/13/2023 07:16:28" limit-uptime=8h name=mxn225 password=\
    mxn225 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=zbr529 password=zbr529 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=zik539 password=zik539 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=xwu579 password=xwu579 \
    profile=dian
add comment="sep/13/2023 20:30:10" limit-uptime=8h name=zhy442 password=\
    zhy442 profile=dian
add comment="sep/13/2023 10:21:26" limit-uptime=8h name=zwa496 password=\
    zwa496 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=ngb363 password=ngb363 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=hmt555 password=hmt555 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=xdy346 password=xdy346 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=eps673 password=eps673 \
    profile=dian
add comment="sep/14/2023 14:15:38" limit-uptime=8h name=iny524 password=\
    iny524 profile=dian
add comment="sep/10/2023 17:07:11" limit-uptime=8h name=zgh255 password=\
    zgh255 profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=fvn665 password=fvn665 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=bdb863 password=bdb863 \
    profile=dian
add comment=vc-231-07.25.23-dian limit-uptime=8h name=dtw583 password=dtw583 \
    profile=dian
add comment="sep/15/2023 12:48:38" limit-uptime=8h name=xhn372 password=\
    xhn372 profile=dian
add comment="sep/01/2023 22:25:42" limit-uptime=8h name=dek944 password=\
    dek944 profile=agus
add comment="sep/05/2023 18:51:55" limit-uptime=8h name=kdy975 password=\
    kdy975 profile=agus
add comment="aug/30/2023 22:37:54" limit-uptime=8h name=pzz528 password=\
    pzz528 profile=agus
add comment="sep/02/2023 11:02:17" limit-uptime=8h name=urr899 password=\
    urr899 profile=agus
add comment="sep/04/2023 09:25:09" limit-uptime=8h name=xzy729 password=\
    xzy729 profile=agus
add comment="sep/07/2023 10:35:03" limit-uptime=8h name=ecy867 password=\
    ecy867 profile=agus
add comment="sep/07/2023 06:32:15" limit-uptime=8h name=kbt482 password=\
    kbt482 profile=agus
add comment="sep/09/2023 14:06:42" limit-uptime=8h name=gfs459 password=\
    gfs459 profile=agus
add comment="sep/07/2023 17:54:14" limit-uptime=8h name=eki879 password=\
    eki879 profile=agus
add comment="sep/01/2023 10:41:08" limit-uptime=8h name=eyu243 password=\
    eyu243 profile=agus
add comment="sep/04/2023 01:22:30" limit-uptime=8h name=ukw969 password=\
    ukw969 profile=agus
add comment="sep/04/2023 17:26:32" limit-uptime=8h name=txj965 password=\
    txj965 profile=agus
add comment="sep/05/2023 17:00:24" limit-uptime=8h name=hpy664 password=\
    hpy664 profile=agus
add comment="sep/06/2023 16:25:18" limit-uptime=8h name=vty444 password=\
    vty444 profile=agus
add comment="sep/01/2023 19:10:00" limit-uptime=8h name=ner758 password=\
    ner758 profile=agus
add comment="sep/04/2023 05:22:39" limit-uptime=8h name=kfr289 password=\
    kfr289 profile=agus
add comment="sep/02/2023 21:18:18" limit-uptime=8h name=sdd625 password=\
    sdd625 profile=agus
add comment="sep/04/2023 18:24:04" limit-uptime=8h name=ydk545 password=\
    ydk545 profile=agus
add comment="sep/05/2023 08:31:38" limit-uptime=8h name=itf239 password=\
    itf239 profile=agus
add comment="sep/03/2023 18:48:07" limit-uptime=8h name=kuc666 password=\
    kuc666 profile=agus
add comment="sep/06/2023 19:04:07" limit-uptime=8h name=ifb377 password=\
    ifb377 profile=agus
add comment="sep/03/2023 18:55:52" limit-uptime=8h name=nfa668 password=\
    nfa668 profile=agus
add comment="sep/03/2023 12:00:56" limit-uptime=8h name=jjx233 password=\
    jjx233 profile=agus
add comment="sep/02/2023 16:29:57" limit-uptime=8h name=upv453 password=\
    upv453 profile=agus
add comment="sep/05/2023 01:27:22" limit-uptime=8h name=ggj355 password=\
    ggj355 profile=agus
add comment="sep/02/2023 21:10:56" limit-uptime=8h name=rjk656 password=\
    rjk656 profile=agus
add comment="aug/31/2023 21:00:56" limit-uptime=8h name=rjt552 password=\
    rjt552 profile=agus
add comment="sep/01/2023 05:37:22" limit-uptime=8h name=rsw334 password=\
    rsw334 profile=agus
add comment="sep/01/2023 21:25:17" limit-uptime=8h name=dtg558 password=\
    dtg558 profile=agus
add comment="sep/02/2023 21:40:55" limit-uptime=8h name=dzu382 password=\
    dzu382 profile=agus
add comment="sep/07/2023 23:33:38" limit-uptime=8h name=tac665 password=\
    tac665 profile=agus
add comment="sep/07/2023 17:18:57" limit-uptime=8h name=fpk329 password=\
    fpk329 profile=agus
add comment="sep/06/2023 19:05:18" limit-uptime=8h name=wew854 password=\
    wew854 profile=agus
add comment="sep/06/2023 22:11:52" limit-uptime=8h name=xyy539 password=\
    xyy539 profile=agus
add comment="sep/03/2023 17:27:04" limit-uptime=8h name=icm694 password=\
    icm694 profile=agus
add comment="sep/06/2023 16:59:53" limit-uptime=8h name=zfe863 password=\
    zfe863 profile=agus
add comment="sep/08/2023 00:54:36" limit-uptime=8h name=ffv356 password=\
    ffv356 profile=agus
add comment="aug/31/2023 18:39:50" limit-uptime=8h name=ajb362 password=\
    ajb362 profile=agus
add comment="sep/01/2023 10:00:14" limit-uptime=8h name=yfe335 password=\
    yfe335 profile=agus
add comment="aug/31/2023 22:47:16" limit-uptime=8h name=gbi553 password=\
    gbi553 profile=agus
add comment="sep/02/2023 23:23:58" limit-uptime=8h name=hjh285 password=\
    hjh285 profile=agus
add comment="sep/01/2023 22:32:00" limit-uptime=8h name=xhp593 password=\
    xhp593 profile=agus
add comment="sep/01/2023 22:51:21" limit-uptime=8h name=avj763 password=\
    avj763 profile=agus
add comment="sep/06/2023 23:22:54" limit-uptime=8h name=zpy527 password=\
    zpy527 profile=agus
add comment="sep/01/2023 16:44:22" limit-uptime=8h name=ybh576 password=\
    ybh576 profile=agus
add comment="sep/05/2023 21:59:04" limit-uptime=8h name=ute957 password=\
    ute957 profile=agus
add comment="sep/06/2023 00:03:55" limit-uptime=8h name=adw372 password=\
    adw372 profile=agus
add comment="sep/03/2023 17:49:11" limit-uptime=8h name=jpd272 password=\
    jpd272 profile=agus
add comment="sep/06/2023 21:40:23" limit-uptime=8h name=ray275 password=\
    ray275 profile=agus
add comment="sep/04/2023 21:24:43" limit-uptime=8h name=usf898 password=\
    usf898 profile=agus
add comment="sep/04/2023 17:27:42" limit-uptime=8h name=fsb637 password=\
    fsb637 profile=agus
add comment="sep/06/2023 01:35:57" limit-uptime=8h name=wcx469 password=\
    wcx469 profile=agus
add comment="aug/31/2023 16:01:41" limit-uptime=8h name=dii469 password=\
    dii469 profile=agus
add comment="aug/31/2023 09:08:06" limit-uptime=8h name=ndb797 password=\
    ndb797 profile=agus
add comment="sep/03/2023 10:17:31" limit-uptime=8h name=vgu992 password=\
    vgu992 profile=agus
add comment="aug/27/2023 19:38:35" limit-uptime=8h name=vbd878 password=\
    vbd878 profile=nazim
add comment="aug/27/2023 06:15:43" limit-uptime=8h name=fzr843 password=\
    fzr843 profile=nazim
add comment="aug/26/2023 19:07:19" limit-uptime=8h name=mfm875 password=\
    mfm875 profile=nazim
add comment="aug/27/2023 18:04:13" limit-uptime=8h name=iee983 password=\
    iee983 profile=nazim
add comment="aug/27/2023 15:05:33" limit-uptime=8h name=gwd679 password=\
    gwd679 profile=nazim
add comment="aug/27/2023 10:51:56" limit-uptime=8h name=emg754 password=\
    emg754 profile=nazim
add comment="aug/27/2023 15:20:08" limit-uptime=8h name=ixf836 password=\
    ixf836 profile=nazim
add comment="aug/27/2023 19:18:17" limit-uptime=8h name=zcm567 password=\
    zcm567 profile=nazim
add comment="aug/28/2023 19:15:03" limit-uptime=8h name=azj427 password=\
    azj427 profile=nazim
add comment="aug/28/2023 09:40:48" limit-uptime=8h name=uis256 password=\
    uis256 profile=nazim
add comment="aug/27/2023 19:42:37" limit-uptime=8h name=buk535 password=\
    buk535 profile=nazim
add comment="aug/28/2023 10:49:54" limit-uptime=8h name=dht484 password=\
    dht484 profile=nazim
add comment="aug/28/2023 11:00:02" limit-uptime=8h name=ngv872 password=\
    ngv872 profile=nazim
add comment="aug/28/2023 11:45:30" limit-uptime=8h name=spc365 password=\
    spc365 profile=nazim
add comment="aug/29/2023 14:10:06" limit-uptime=8h name=uzx378 password=\
    uzx378 profile=nazim
add comment="aug/30/2023 21:03:22" limit-uptime=8h name=rfn433 password=\
    rfn433 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=bkn326 password=bkn326 \
    profile=nazim
add comment="aug/30/2023 09:44:41" limit-uptime=8h name=inz254 password=\
    inz254 profile=nazim
add comment="aug/30/2023 16:47:43" limit-uptime=8h name=wew965 password=\
    wew965 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=rhc565 password=rhc565 \
    profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=guv867 password=guv867 \
    profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=gin687 password=gin687 \
    profile=nazim
add comment="aug/29/2023 18:30:22" limit-uptime=8h name=csn968 password=\
    csn968 profile=nazim
add comment="aug/31/2023 02:57:32" limit-uptime=8h name=ayh475 password=\
    ayh475 profile=nazim
add comment="aug/30/2023 18:55:52" limit-uptime=8h name=uau978 password=\
    uau978 profile=nazim
add comment="aug/30/2023 20:12:07" limit-uptime=8h name=ywc638 password=\
    ywc638 profile=nazim
add comment="sep/01/2023 11:55:37" limit-uptime=8h name=xfx339 password=\
    xfx339 profile=nazim
add comment="sep/06/2023 09:43:14" limit-uptime=8h name=tnd223 password=\
    tnd223 profile=nazim
add comment="aug/31/2023 19:22:32" limit-uptime=8h name=ane984 password=\
    ane984 profile=nazim
add comment="sep/01/2023 11:54:07" limit-uptime=8h name=sfc449 password=\
    sfc449 profile=nazim
add comment="sep/06/2023 08:26:54" limit-uptime=8h name=aup872 password=\
    aup872 profile=nazim
add comment="sep/01/2023 22:15:22" limit-uptime=8h name=ajs759 password=\
    ajs759 profile=nazim
add comment="sep/02/2023 10:40:37" limit-uptime=8h name=vsf595 password=\
    vsf595 profile=nazim
add comment="sep/02/2023 11:30:58" limit-uptime=8h name=rkw677 password=\
    rkw677 profile=nazim
add comment="sep/02/2023 17:17:31" limit-uptime=8h name=uew479 password=\
    uew479 profile=nazim
add comment="sep/01/2023 15:29:53" limit-uptime=8h name=mff625 password=\
    mff625 profile=nazim
add comment="sep/02/2023 16:59:53" limit-uptime=8h name=dmd568 password=\
    dmd568 profile=nazim
add comment="sep/04/2023 12:18:27" limit-uptime=8h name=dwf742 password=\
    dwf742 profile=nazim
add comment="sep/04/2023 12:14:58" limit-uptime=8h name=pyp856 password=\
    pyp856 profile=nazim
add comment="sep/04/2023 18:10:13" limit-uptime=8h name=nbp367 password=\
    nbp367 profile=nazim
add comment="sep/02/2023 21:34:51" limit-uptime=8h name=esd624 password=\
    esd624 profile=nazim
add comment="sep/03/2023 17:43:20" limit-uptime=8h name=jip327 password=\
    jip327 profile=nazim
add comment="sep/04/2023 12:39:51" limit-uptime=8h name=brb389 password=\
    brb389 profile=nazim
add comment="sep/04/2023 13:44:49" limit-uptime=8h name=ckg782 password=\
    ckg782 profile=nazim
add comment="sep/04/2023 20:51:38" limit-uptime=8h name=pur585 password=\
    pur585 profile=nazim
add comment="sep/02/2023 21:49:49" limit-uptime=8h name=tbg635 password=\
    tbg635 profile=nazim
add comment="sep/04/2023 12:43:39" limit-uptime=8h name=bdk732 password=\
    bdk732 profile=nazim
add comment="sep/04/2023 12:56:52" limit-uptime=8h name=mga754 password=\
    mga754 profile=nazim
add comment="sep/05/2023 08:43:21" limit-uptime=8h name=ndv425 password=\
    ndv425 profile=nazim
add comment="sep/05/2023 19:54:29" limit-uptime=8h name=kvm277 password=\
    kvm277 profile=nazim
add comment="sep/05/2023 17:22:14" limit-uptime=8h name=xrr858 password=\
    xrr858 profile=nazim
add comment="sep/05/2023 21:15:41" limit-uptime=8h name=snt583 password=\
    snt583 profile=nazim
add comment="sep/06/2023 10:10:57" limit-uptime=8h name=niu775 password=\
    niu775 profile=nazim
add comment="sep/06/2023 12:38:47" limit-uptime=8h name=ncr892 password=\
    ncr892 profile=nazim
add comment="sep/06/2023 17:15:11" limit-uptime=8h name=bew685 password=\
    bew685 profile=nazim
add comment="sep/07/2023 12:12:01" limit-uptime=8h name=tzh345 password=\
    tzh345 profile=nazim
add comment="sep/07/2023 18:37:07" limit-uptime=8h name=akj959 password=\
    akj959 profile=nazim
add comment="sep/08/2023 08:53:41" limit-uptime=8h name=chg438 password=\
    chg438 profile=nazim
add comment="sep/07/2023 18:30:32" limit-uptime=8h name=izu423 password=\
    izu423 profile=nazim
add comment="sep/06/2023 19:14:14" limit-uptime=8h name=tic998 password=\
    tic998 profile=nazim
add comment="sep/08/2023 13:47:44" limit-uptime=8h name=ikj946 password=\
    ikj946 profile=nazim
add comment="sep/08/2023 13:40:56" limit-uptime=8h name=drg355 password=\
    drg355 profile=nazim
add comment="sep/08/2023 16:57:29" limit-uptime=8h name=uag767 password=\
    uag767 profile=nazim
add comment="sep/08/2023 19:13:09" limit-uptime=8h name=ctu682 password=\
    ctu682 profile=nazim
add comment="sep/09/2023 11:40:18" limit-uptime=8h name=cfk533 password=\
    cfk533 profile=nazim
add comment="sep/08/2023 19:55:42" limit-uptime=8h name=mbi878 password=\
    mbi878 profile=nazim
add comment="sep/09/2023 16:49:30" limit-uptime=8h name=mxv838 password=\
    mxv838 profile=nazim
add comment="sep/09/2023 22:22:11" limit-uptime=8h name=hgx546 password=\
    hgx546 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=xwm436 password=xwm436 \
    profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=hum874 password=hum874 \
    profile=nazim
add comment="sep/10/2023 16:01:46" limit-uptime=8h name=zys437 password=\
    zys437 profile=nazim
add comment="sep/11/2023 00:06:00" limit-uptime=8h name=mij998 password=\
    mij998 profile=nazim
add comment="sep/10/2023 17:14:06" limit-uptime=8h name=kru473 password=\
    kru473 profile=nazim
add comment="sep/10/2023 16:24:07" limit-uptime=8h name=ywk658 password=\
    ywk658 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=sad994 password=sad994 \
    profile=nazim
add comment="sep/11/2023 11:02:47" limit-uptime=8h name=gbw758 password=\
    gbw758 profile=nazim
add comment="sep/11/2023 19:55:58" limit-uptime=8h name=kec282 password=\
    kec282 profile=nazim
add comment="sep/12/2023 18:08:21" limit-uptime=8h name=kkz987 password=\
    kkz987 profile=nazim
add comment="sep/13/2023 00:16:20" limit-uptime=8h name=mhb286 password=\
    mhb286 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=hfw873 password=hfw873 \
    profile=nazim
add comment="sep/11/2023 13:16:53" limit-uptime=8h name=wxt884 password=\
    wxt884 profile=nazim
add comment="sep/13/2023 07:17:30" limit-uptime=8h name=sik757 password=\
    sik757 profile=nazim
add comment="sep/13/2023 07:40:05" limit-uptime=8h name=mvj972 password=\
    mvj972 profile=nazim
add comment="sep/13/2023 08:58:41" limit-uptime=8h name=zxs338 password=\
    zxs338 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=eac547 password=eac547 \
    profile=nazim
add comment="sep/13/2023 09:08:35" limit-uptime=8h name=ffp784 password=\
    ffp784 profile=nazim
add comment="sep/13/2023 15:26:44" limit-uptime=8h name=hcs365 password=\
    hcs365 profile=nazim
add comment="sep/13/2023 23:34:34" limit-uptime=8h name=wss993 password=\
    wss993 profile=nazim
add comment="sep/14/2023 12:38:13" limit-uptime=8h name=but542 password=\
    but542 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=eun956 password=eun956 \
    profile=nazim
add comment="sep/13/2023 10:51:12" limit-uptime=8h name=nnu639 password=\
    nnu639 profile=nazim
add comment="sep/14/2023 12:43:25" limit-uptime=8h name=xxx563 password=\
    xxx563 profile=nazim
add comment="sep/14/2023 12:42:27" limit-uptime=8h name=brw447 password=\
    brw447 profile=nazim
add comment="sep/14/2023 14:17:39" limit-uptime=8h name=bdz435 password=\
    bdz435 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=end987 password=end987 \
    profile=nazim
add comment="sep/14/2023 14:44:24" limit-uptime=8h name=ths547 password=\
    ths547 profile=nazim
add comment="sep/14/2023 19:19:02" limit-uptime=8h name=gra965 password=\
    gra965 profile=nazim
add comment="sep/15/2023 17:04:34" limit-uptime=8h name=kyx265 password=\
    kyx265 profile=nazim
add comment="sep/15/2023 17:16:07" limit-uptime=8h name=bay926 password=\
    bay926 profile=nazim
add comment=vc-618-07.25.23-nazim limit-uptime=8h name=idv698 password=idv698 \
    profile=nazim
add comment="sep/01/2023 18:57:44" limit-uptime=12h name=dfv836 password=\
    dfv836 profile=witno-12jam
add comment="sep/02/2023 07:04:28" limit-uptime=12h name=tki696 password=\
    tki696 profile=witno-12jam
add comment="sep/02/2023 13:11:16" limit-uptime=12h name=pab686 password=\
    pab686 profile=witno-12jam
add comment="sep/02/2023 14:58:21" limit-uptime=12h name=hut729 password=\
    hut729 profile=witno-12jam
add comment="sep/02/2023 16:19:36" limit-uptime=12h name=ubz687 password=\
    ubz687 profile=witno-12jam
add comment="sep/02/2023 23:43:32" limit-uptime=12h name=kid328 password=\
    kid328 profile=witno-12jam
add comment="sep/03/2023 09:47:05" limit-uptime=12h name=bss369 password=\
    bss369 profile=witno-12jam
add comment="sep/03/2023 10:22:03" limit-uptime=12h name=ugw827 password=\
    ugw827 profile=witno-12jam
add comment="sep/03/2023 18:51:56" limit-uptime=12h name=zxp782 password=\
    zxp782 profile=witno-12jam
add comment="sep/05/2023 20:11:18" limit-uptime=12h name=hiw944 password=\
    hiw944 profile=witno-12jam
add comment="sep/04/2023 12:06:13" limit-uptime=12h name=kcz364 password=\
    kcz364 profile=witno-12jam
add comment="sep/04/2023 18:18:09" limit-uptime=12h name=vfz278 password=\
    vfz278 profile=witno-12jam
add comment="sep/04/2023 18:21:01" limit-uptime=12h name=cnn637 password=\
    cnn637 profile=witno-12jam
add comment="sep/04/2023 20:14:29" limit-uptime=12h name=zuw799 password=\
    zuw799 profile=witno-12jam
add comment="sep/05/2023 19:06:13" limit-uptime=12h name=gwk449 password=\
    gwk449 profile=witno-12jam
add comment="sep/06/2023 07:30:38" limit-uptime=12h name=dhg472 password=\
    dhg472 profile=witno-12jam
add comment="sep/09/2023 16:04:44" limit-uptime=12h name=hrj244 password=\
    hrj244 profile=witno-12jam
add comment="sep/07/2023 10:08:59" limit-uptime=12h name=fky855 password=\
    fky855 profile=witno-12jam
add comment="sep/07/2023 18:30:00" limit-uptime=12h name=ues634 password=\
    ues634 profile=witno-12jam
add comment="sep/10/2023 12:46:08" limit-uptime=12h name=awp678 password=\
    awp678 profile=witno-12jam
add comment="sep/08/2023 15:15:56" limit-uptime=12h name=jpu672 password=\
    jpu672 profile=witno-12jam
add comment="sep/08/2023 22:40:49" limit-uptime=12h name=hik523 password=\
    hik523 profile=witno-12jam
add comment="sep/09/2023 10:09:45" limit-uptime=12h name=cxh334 password=\
    cxh334 profile=witno-12jam
add comment="sep/09/2023 10:09:18" limit-uptime=12h name=jyy879 password=\
    jyy879 profile=witno-12jam
add comment="sep/09/2023 14:55:38" limit-uptime=12h name=khe233 password=\
    khe233 profile=witno-12jam
add comment="sep/09/2023 16:39:58" limit-uptime=12h name=sim844 password=\
    sim844 profile=witno-12jam
add comment="sep/11/2023 18:28:11" limit-uptime=12h name=ypg869 password=\
    ypg869 profile=witno-12jam
add comment="sep/09/2023 19:37:28" limit-uptime=12h name=gsd943 password=\
    gsd943 profile=witno-12jam
add comment="sep/10/2023 10:21:29" limit-uptime=12h name=ugz272 password=\
    ugz272 profile=witno-12jam
add comment="sep/11/2023 17:50:20" limit-uptime=12h name=udi922 password=\
    udi922 profile=witno-12jam
add comment="sep/14/2023 18:06:20" limit-uptime=12h name=zfg469 password=\
    zfg469 profile=witno-12jam
add comment="sep/12/2023 18:31:22" limit-uptime=12h name=mrt797 password=\
    mrt797 profile=witno-12jam
add comment="sep/12/2023 18:50:33" limit-uptime=12h name=edb528 password=\
    edb528 profile=witno-12jam
add comment="sep/14/2023 17:31:14" limit-uptime=12h name=rvj856 password=\
    rvj856 profile=witno-12jam
add comment="sep/13/2023 13:53:42" limit-uptime=12h name=bru453 password=\
    bru453 profile=witno-12jam
add comment="sep/14/2023 18:18:28" limit-uptime=12h name=wix972 password=\
    wix972 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ayg345 password=\
    ayg345 profile=witno-12jam
add comment="sep/15/2023 09:53:15" limit-uptime=12h name=zam269 password=\
    zam269 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=nyk499 password=\
    nyk499 profile=witno-12jam
add comment="sep/15/2023 14:37:21" limit-uptime=12h name=tzd442 password=\
    tzd442 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ksw848 password=\
    ksw848 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=zwi848 password=\
    zwi848 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=giz657 password=\
    giz657 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=fzu277 password=\
    fzu277 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=sme497 password=\
    sme497 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=jgv449 password=\
    jgv449 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=apc848 password=\
    apc848 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=cbe569 password=\
    cbe569 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=vkw975 password=\
    vkw975 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=snz723 password=\
    snz723 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=nxw897 password=\
    nxw897 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=vtc777 password=\
    vtc777 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=jdg898 password=\
    jdg898 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=yvf699 password=\
    yvf699 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ngu683 password=\
    ngu683 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=aay948 password=\
    aay948 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=iwj544 password=\
    iwj544 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=rsu449 password=\
    rsu449 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ghv963 password=\
    ghv963 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=usd877 password=\
    usd877 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=eni772 password=\
    eni772 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=bmp384 password=\
    bmp384 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ggb655 password=\
    ggb655 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=isv728 password=\
    isv728 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=has957 password=\
    has957 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=fbp742 password=\
    fbp742 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=gvh663 password=\
    gvh663 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ibv566 password=\
    ibv566 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=ysf529 password=\
    ysf529 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=hhe964 password=\
    hhe964 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=cjm449 password=\
    cjm449 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=cde262 password=\
    cde262 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=fkh483 password=\
    fkh483 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=jym334 password=\
    jym334 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=xyg893 password=\
    xyg893 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=etj723 password=\
    etj723 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=bkc888 password=\
    bkc888 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=tcd873 password=\
    tcd873 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=gmt595 password=\
    gmt595 profile=witno-12jam
add comment=vc-364-08.01.23-kukuh limit-uptime=12h name=gpw784 password=\
    gpw784 profile=witno-12jam
add comment="sep/09/2023 22:38:40" limit-uptime=8h name=bik993 password=\
    bik993 profile=agus
add comment="sep/14/2023 16:00:12" limit-uptime=8h name=xns852 password=\
    xns852 profile=agus
add comment="sep/15/2023 17:03:30" limit-uptime=8h name=jdn558 password=\
    jdn558 profile=agus
add comment="sep/09/2023 21:39:46" limit-uptime=8h name=era968 password=\
    era968 profile=agus
add comment="sep/10/2023 16:29:48" limit-uptime=8h name=xii983 password=\
    xii983 profile=agus
add comment="sep/14/2023 02:02:38" limit-uptime=8h name=cwn454 password=\
    cwn454 profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=kix479 password=kix479 \
    profile=agus
add comment="sep/15/2023 16:42:53" limit-uptime=8h name=wsd955 password=\
    wsd955 profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=svf323 password=svf323 \
    profile=agus
add comment="sep/13/2023 21:08:32" limit-uptime=8h name=jhz648 password=\
    jhz648 profile=agus
add comment="sep/10/2023 17:44:45" limit-uptime=8h name=fxp645 password=\
    fxp645 profile=agus
add comment="sep/14/2023 23:48:22" limit-uptime=8h name=mhk845 password=\
    mhk845 profile=agus
add comment="sep/12/2023 06:47:03" limit-uptime=8h name=src659 password=\
    src659 profile=agus
add comment="sep/15/2023 11:26:14" limit-uptime=8h name=ycr726 password=\
    ycr726 profile=agus
add comment="sep/10/2023 21:48:06" limit-uptime=8h name=bnw483 password=\
    bnw483 profile=agus
add comment="sep/15/2023 23:53:13" limit-uptime=8h name=reg986 password=\
    reg986 profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=sxd928 password=sxd928 \
    profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=vyx396 password=vyx396 \
    profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=skv598 password=skv598 \
    profile=agus
add comment="sep/14/2023 01:38:58" limit-uptime=8h name=swc399 password=\
    swc399 profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=aai594 password=aai594 \
    profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=bsb354 password=bsb354 \
    profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=dma568 password=dma568 \
    profile=agus
add comment="sep/08/2023 18:46:10" limit-uptime=8h name=ahw726 password=\
    ahw726 profile=agus
add comment="sep/16/2023 00:32:02" limit-uptime=8h name=idb752 password=\
    idb752 profile=agus
add comment="sep/10/2023 03:23:25" limit-uptime=8h name=sim834 password=\
    sim834 profile=agus
add comment="sep/12/2023 03:03:45" limit-uptime=8h name=fru698 password=\
    fru698 profile=agus
add comment="sep/09/2023 09:03:58" limit-uptime=8h name=czu597 password=\
    czu597 profile=agus
add comment="sep/09/2023 13:30:20" limit-uptime=8h name=vwa975 password=\
    vwa975 profile=agus
add comment="sep/09/2023 01:35:41" limit-uptime=8h name=kac286 password=\
    kac286 profile=agus
add comment="sep/12/2023 17:42:52" limit-uptime=8h name=nky958 password=\
    nky958 profile=agus
add comment="sep/11/2023 16:46:13" limit-uptime=8h name=zjp877 password=\
    zjp877 profile=agus
add comment="sep/08/2023 16:51:45" limit-uptime=8h name=wcx787 password=\
    wcx787 profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=izr728 password=izr728 \
    profile=agus
add comment=vc-578-08.01.23-agus limit-uptime=8h name=kdm452 password=kdm452 \
    profile=agus
add comment="sep/10/2023 18:36:15" limit-uptime=8h name=hte785 password=\
    hte785 profile=agus
add comment="sep/14/2023 09:55:12" limit-uptime=8h name=kgv484 password=\
    kgv484 profile=agus
add comment="sep/15/2023 10:37:09" limit-uptime=8h name=mvt766 password=\
    mvt766 profile=agus
add comment="sep/10/2023 11:26:49" limit-uptime=8h name=wbd455 password=\
    wbd455 profile=agus
add comment="sep/08/2023 22:38:08" limit-uptime=8h name=hem794 password=\
    hem794 profile=agus
add comment="sep/12/2023 23:40:29" limit-uptime=8h name=wgm922 password=\
    wgm922 profile=agus
add comment="sep/14/2023 23:30:57" limit-uptime=8h name=ygx867 password=\
    ygx867 profile=agus
add comment="sep/12/2023 09:02:38" limit-uptime=8h name=hcd856 password=\
    hcd856 profile=agus
add comment="sep/14/2023 23:35:13" limit-uptime=8h name=gry674 password=\
    gry674 profile=agus
add comment="sep/11/2023 19:55:21" limit-uptime=8h name=ryr366 password=\
    ryr366 profile=agus
add comment="sep/08/2023 19:06:46" limit-uptime=8h name=bkd384 password=\
    bkd384 profile=agus
add comment="sep/11/2023 03:54:09" limit-uptime=8h name=jzc974 password=\
    jzc974 profile=agus
add comment="sep/11/2023 05:52:11" limit-uptime=8h name=pud654 password=\
    pud654 profile=agus
add comment="sep/07/2023 22:31:04" limit-uptime=8h name=vdc487 password=\
    vdc487 profile=agus
add comment="sep/08/2023 13:55:28" limit-uptime=8h name=eii989 password=\
    eii989 profile=agus
add comment="sep/13/2023 09:05:14" limit-uptime=8h name=dcb664 password=\
    dcb664 profile=agus
add comment="sep/10/2023 21:32:35" limit-uptime=8h name=zdd968 password=\
    zdd968 profile=agus
add comment="sep/12/2023 10:37:31" limit-uptime=8h name=iek559 password=\
    iek559 profile=agus
add comment="sep/11/2023 19:58:20" limit-uptime=8h name=pwc987 password=\
    pwc987 profile=agus
add comment="sep/13/2023 23:21:02" limit-uptime=8h name=nuj753 password=\
    nuj753 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=hku265 password=hku265 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=jab346 password=jab346 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=gjz624 password=gjz624 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=exi292 password=exi292 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=uym728 password=uym728 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=icz374 password=icz374 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=ujv565 password=ujv565 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=gra386 password=gra386 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=vtx427 password=vtx427 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=rhz624 password=rhz624 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=nwt576 password=nwt576 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=der496 password=der496 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=afv734 password=afv734 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=kzg948 password=kzg948 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pgf366 password=pgf366 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=cid235 password=cid235 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=yde892 password=yde892 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pvj224 password=pvj224 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=fuk924 password=fuk924 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=ctw848 password=ctw848 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=zxu679 password=zxu679 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=eid363 password=eid363 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=rtf544 password=rtf544 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pse928 password=pse928 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=hyj367 password=hyj367 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=uvk857 password=uvk857 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=feg775 password=feg775 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=bmr446 password=bmr446 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=jgf852 password=jgf852 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=nfb747 password=nfb747 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=tvk325 password=tvk325 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=bcv783 password=bcv783 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=csk377 password=csk377 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=dzf726 password=dzf726 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=jep945 password=jep945 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=usx832 password=usx832 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=cuj649 password=cuj649 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=uwn333 password=uwn333 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=auy476 password=auy476 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=vsi629 password=vsi629 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=jxf646 password=jxf646 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=wcu553 password=wcu553 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=yri578 password=yri578 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=xvw667 password=xvw667 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=gtj355 password=gtj355 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=adv364 password=adv364 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=xyb973 password=xyb973 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=dxd793 password=dxd793 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=tfk498 password=tfk498 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=myu425 password=myu425 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=hpw779 password=hpw779 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=xvy383 password=xvy383 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=apx495 password=apx495 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=kxz933 password=kxz933 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=sfs597 password=sfs597 \
    profile=agus
add comment=vc-122-08.07.23-dian limit-uptime=8h name=jbf624 password=jbf624 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=sxh885 password=sxh885 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=pap652 password=pap652 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kun772 password=kun772 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=egm245 password=egm245 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=sni243 password=sni243 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=fsw343 password=fsw343 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kvx436 password=kvx436 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=usr676 password=usr676 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=ymc557 password=ymc557 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=rtk865 password=rtk865 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=cts924 password=cts924 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=scf966 password=scf966 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=stb995 password=stb995 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=pet643 password=pet643 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kvn779 password=kvn779 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=ubu543 password=ubu543 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kzc394 password=kzc394 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=hvg764 password=hvg764 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xet399 password=xet399 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wbv997 password=wbv997 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=mms782 password=mms782 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=vix236 password=vix236 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=rcw888 password=rcw888 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=tip363 password=tip363 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=khp755 password=khp755 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=haw344 password=haw344 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=nmj837 password=nmj837 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=sbj282 password=sbj282 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=rbj799 password=rbj799 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=bja645 password=bja645 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=dip694 password=dip694 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=trn632 password=trn632 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=shi237 password=shi237 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=gyy445 password=gyy445 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xpr942 password=xpr942 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wuc424 password=wuc424 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xis384 password=xis384 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=ytt595 password=ytt595 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=inw466 password=inw466 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=cza376 password=cza376 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wks477 password=wks477 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=sax573 password=sax573 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=euu643 password=euu643 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wgm455 password=wgm455 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=ndv395 password=ndv395 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=bjy696 password=bjy696 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=sgb993 password=sgb993 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=fpe659 password=fpe659 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wab865 password=wab865 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wmy634 password=wmy634 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=utr579 password=utr579 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=adf364 password=adf364 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=yyz978 password=yyz978 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=ucg694 password=ucg694 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=iyp739 password=iyp739 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wja787 password=wja787 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=tbj458 password=tbj458 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=rur786 password=rur786 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=hzp537 password=hzp537 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xkz767 password=xkz767 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kjw388 password=kjw388 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=nwm927 password=nwm927 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=acz782 password=acz782 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=mwb769 password=mwb769 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=hpn972 password=hpn972 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=tfi673 password=tfi673 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=yrs235 password=yrs235 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=fzy986 password=fzy986 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=jhv449 password=jhv449 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=adf499 password=adf499 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=hgb663 password=hgb663 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=udk425 password=udk425 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=fpf447 password=fpf447 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xau992 password=xau992 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=kdw529 password=kdw529 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wtd329 password=wtd329 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wai886 password=wai886 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=nei732 password=nei732 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=mce268 password=mce268 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=chk429 password=chk429 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=unm528 password=unm528 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=umi269 password=umi269 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=amw597 password=amw597 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=hgn946 password=hgn946 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=yfe769 password=yfe769 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=mhi556 password=mhi556 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=zrf999 password=zrf999 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=twp365 password=twp365 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wsg949 password=wsg949 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=spx694 password=spx694 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=baf393 password=baf393 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=xhf846 password=xhf846 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=msm432 password=msm432 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=jrh666 password=jrh666 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=jvg935 password=jvg935 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=gyh348 password=gyh348 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=pjs947 password=pjs947 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=pau252 password=pau252 \
    profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=wru653 password=wru653 \
    profile=dian
add comment=vc-303-08.07.23-evi limit-uptime=8h name=suf768 password=suf768 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hbf744 password=hbf744 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hrv843 password=hrv843 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=psv422 password=psv422 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jau993 password=jau993 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gpy335 password=gpy335 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ixe573 password=ixe573 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=niu229 password=niu229 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=swt337 password=swt337 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vaz955 password=vaz955 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mcj999 password=mcj999 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zxd779 password=zxd779 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vvc886 password=vvc886 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ddb833 password=ddb833 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=exk365 password=exk365 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ckv738 password=ckv738 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fhc883 password=fhc883 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=sry486 password=sry486 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=sjy694 password=sjy694 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xts638 password=xts638 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=bda554 password=bda554 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=esv356 password=esv356 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=sfs928 password=sfs928 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mnj927 password=mnj927 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=erp375 password=erp375 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=pvh999 password=pvh999 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ibc579 password=ibc579 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=whu893 password=whu893 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xgj228 password=xgj228 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jnm338 password=jnm338 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fdv456 password=fdv456 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ajn886 password=ajn886 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dni238 password=dni238 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hbt449 password=hbt449 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zgt967 password=zgt967 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ebx742 password=ebx742 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hdu985 password=hdu985 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ixi426 password=ixi426 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=usr787 password=usr787 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=svp685 password=svp685 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=izb362 password=izb362 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ieu347 password=ieu347 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cxv329 password=cxv329 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=utn633 password=utn633 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=anb429 password=anb429 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=imh852 password=imh852 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=knr724 password=knr724 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=imj375 password=imj375 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kva563 password=kva563 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cpc456 password=cpc456 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zrr277 password=zrr277 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=eed555 password=eed555 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=skc267 password=skc267 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fag354 password=fag354 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jts928 password=jts928 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=tkf942 password=tkf942 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=nub445 password=nub445 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rxv987 password=rxv987 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=puf462 password=puf462 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kzc623 password=kzc623 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mex293 password=mex293 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=bbw965 password=bbw965 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vnu586 password=vnu586 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=grk577 password=grk577 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rkz656 password=rkz656 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=eza338 password=eza338 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jdi352 password=jdi352 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=tat626 password=tat626 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=npa525 password=npa525 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kfn497 password=kfn497 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kde349 password=kde349 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cbv466 password=cbv466 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ghj224 password=ghj224 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=siy697 password=siy697 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cpc799 password=cpc799 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fjy994 password=fjy994 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=myf743 password=myf743 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ejx788 password=ejx788 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fpi657 password=fpi657 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kns945 password=kns945 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=wjf877 password=wjf877 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fjj843 password=fjj843 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gdy553 password=gdy553 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=irw886 password=irw886 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zhu777 password=zhu777 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xvk343 password=xvk343 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ucj534 password=ucj534 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=iwg767 password=iwg767 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xxg277 password=xxg277 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cys674 password=cys674 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cnd979 password=cnd979 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=iaj734 password=iaj734 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=evg565 password=evg565 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zyk396 password=zyk396 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=guu268 password=guu268 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=pgz999 password=pgz999 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dmj254 password=dmj254 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hwr943 password=hwr943 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=tza427 password=tza427 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=pry776 password=pry776 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=imu684 password=imu684 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jwz796 password=jwz796 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=phx744 password=phx744 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rpe282 password=rpe282 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ykc539 password=ykc539 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jiz932 password=jiz932 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rie642 password=rie642 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=tpt273 password=tpt273 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xce254 password=xce254 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ntk963 password=ntk963 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hdk886 password=hdk886 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=uah343 password=uah343 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cyd843 password=cyd843 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zid268 password=zid268 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vdn738 password=vdn738 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zta382 password=zta382 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=wmn922 password=wmn922 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=eka968 password=eka968 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hws328 password=hws328 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gth845 password=gth845 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ini992 password=ini992 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rwp672 password=rwp672 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jkf668 password=jkf668 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=iup435 password=iup435 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=sym466 password=sym466 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=eaw954 password=eaw954 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=smt286 password=smt286 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=pcz369 password=pcz369 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hiu632 password=hiu632 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=siy266 password=siy266 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ndp844 password=ndp844 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mss962 password=mss962 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ikx444 password=ikx444 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rzx728 password=rzx728 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jrn977 password=jrn977 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rug592 password=rug592 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=pxs326 password=pxs326 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=yzv786 password=yzv786 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=enn644 password=enn644 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dvk342 password=dvk342 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ywc756 password=ywc756 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fzs498 password=fzs498 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fyk283 password=fyk283 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ztf966 password=ztf966 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mnr693 password=mnr693 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vjw799 password=vjw799 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=uwi855 password=uwi855 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dsj548 password=dsj548 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jgn497 password=jgn497 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=khe868 password=khe868 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ksn754 password=ksn754 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=maj859 password=maj859 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ppd775 password=ppd775 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fka749 password=fka749 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jbh992 password=jbh992 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=wwm883 password=wwm883 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kiw862 password=kiw862 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=eir778 password=eir778 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dhg366 password=dhg366 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dht576 password=dht576 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dzk438 password=dzk438 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=yud838 password=yud838 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gmm934 password=gmm934 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dwt297 password=dwt297 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=kkm227 password=kkm227 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=nwz298 password=nwz298 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=jms842 password=jms842 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mut987 password=mut987 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=frc222 password=frc222 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dsm575 password=dsm575 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=asx962 password=asx962 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=vxn892 password=vxn892 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gpz324 password=gpz324 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=axt752 password=axt752 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=yxk643 password=yxk643 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=sbm438 password=sbm438 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dht248 password=dht248 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ddr992 password=ddr992 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mmm587 password=mmm587 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=zhz692 password=zhz692 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=bbj837 password=bbj837 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=ydm743 password=ydm743 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=dfz847 password=dfz847 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=xbi263 password=xbi263 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=uav462 password=uav462 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=cdv996 password=cdv996 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=nib422 password=nib422 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=iwv979 password=iwv979 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=utt362 password=utt362 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=akt497 password=akt497 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=tht327 password=tht327 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gbj558 password=gbj558 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=fcj748 password=fcj748 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=gpv499 password=gpv499 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=unp636 password=unp636 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=wbz365 password=wbz365 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=hbv367 password=hbv367 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mxh399 password=mxh399 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=mfn725 password=mfn725 \
    profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=rzp643 password=rzp643 \
    profile=evi
add comment=vc-262-08.13.23-agus limit-uptime=8h name=mui453 password=mui453 \
    profile=agus
add comment=vc-262-08.13.23-agus limit-uptime=8h name=tve768 password=tve768 \
    profile=agus
add comment=vc-262-08.13.23-agus limit-uptime=8h name=uzh998 password=uzh998 \
    profile=agus
add comment=vc-262-08.13.23-agus limit-uptime=8h name=tfj885 password=tfj885 \
    profile=agus
add comment=vc-262-08.13.23-agus limit-uptime=8h name=acs977 password=acs977 \
    profile=agus
/ip route
add comment=isp1 distance=1 gateway=192.168.18.1 routing-mark=ether1
add comment=isp1>isp2 distance=2 gateway=192.168.23.1 routing-mark=ether1
add comment=isp1>vpn1 distance=3 gateway=10.123.22.7 routing-mark=ether1
add comment=vpn1 distance=1 gateway=10.123.22.7 routing-mark=vpn
add comment=vpn1 distance=2 gateway=10.123.22.1 routing-mark=vpn
add comment=iiisp1 distance=3 gateway=192.168.18.1 routing-mark=vpn
add comment=iiisp2 distance=6 gateway=192.168.23.1 routing-mark=vpn
add comment=isp2 distance=1 gateway=192.168.23.1 routing-mark=ether2
add comment=isp2>isp1 distance=2 gateway=192.168.18.1 routing-mark=ether2
add comment=isp2>vpn1 distance=4 gateway=10.123.22.7 routing-mark=ether2
add comment=iisp1 distance=1 gateway=192.168.18.1
add comment=iisp2 distance=20 gateway=192.168.23.1
add comment="     cek ISP1" distance=1 dst-address=1.1.1.3/32 gateway=\
    192.168.18.1
add comment="     cek ISP1" distance=1 dst-address=4.2.2.4/32 gateway=\
    192.168.18.1
add comment="     cek ISP1" distance=1 dst-address=8.8.4.4/32 gateway=\
    192.168.18.1
add comment="     cek ISP2" distance=1 dst-address=8.8.8.8/32 gateway=\
    192.168.23.1
add comment="     cek ISP2" distance=1 dst-address=9.9.9.9/32 gateway=\
    192.168.23.1
add comment="     cek ISP1" distance=1 dst-address=94.140.14.14/32 gateway=\
    192.168.18.1
add comment=iiiisp2 distance=12 dst-address=103.143.170.11/32 gateway=\
    192.168.23.1
add comment=iiiisp1 distance=13 dst-address=103.143.170.11/32 gateway=\
    192.168.18.1
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
add comment=bebek-slamet disabled=yes name=slamet@mnet.com password=123 \
    profile=area-bebek remote-address=10.10.1.15 service=pppoe
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
    342
add dont-require-permissions=no name=~total-lan-UP owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    32
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
    source=9
add dont-require-permissions=no name=~total-ether1-isp1-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=132
add dont-require-permissions=no name=~total-ether2-isp2-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=22
add dont-require-permissions=no name=~total-ether2-isp2-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=263
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
add comment=mikhmon dont-require-permissions=no name="jul/20/2023-|-14:15:32-|\
    -efw684-|-1000-|-172.16.0.104-|-70:DD:A8:52:1A:98-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/20/2023
add comment=mikhmon dont-require-permissions=no name="jul/20/2023-|-17:44:53-|\
    -mud664-|-1000-|-172.16.0.48-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/20/2023
add comment=mikhmon dont-require-permissions=no name="jul/20/2023-|-19:13:11-|\
    -tuv834-|-1000-|-172.16.2.13-|-CA:BE:E5:26:3F:F8-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/20/2023
add comment=mikhmon dont-require-permissions=no name="jul/20/2023-|-19:16:05-|\
    -vzk749-|-1000-|-172.16.2.6-|-9A:9F:DC:03:D8:F2-|-31d-|-nazim-|-vc-579-07.\
    09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/20/2023
add comment=mikhmon dont-require-permissions=no name="jul/20/2023-|-19:32:55-|\
    -zbz583-|-1000-|-172.16.0.113-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/20/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-01:53:08-|\
    -nah493-|-1000-|-172.16.0.48-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-09:57:01-|\
    -man724-|-1000-|-172.16.0.129-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-10:46:23-|\
    -afi227-|-1000-|-172.16.2.65-|-7E:84:E4:19:0B:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-13:10:58-|\
    -spx237-|-1000-|-172.16.0.231-|-02:F6:9D:98:6A:40-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-14:17:31-|\
    -xaw229-|-1000-|-172.16.1.229-|-6A:89:A1:0C:F9:77-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-14:58:28-|\
    -sff725-|-1000-|-172.16.1.99-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-15:45:05-|\
    -tmm579-|-1000-|-172.16.0.48-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/21/2023-|-23:45:56-|\
    -aww737-|-1000-|-172.16.0.48-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/21/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-11:58:51-|\
    -fvd969-|-1000-|-172.16.0.62-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-13:22:58-|\
    -mud782-|-1000-|-172.16.1.160-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-13:35:47-|\
    -tak697-|-1000-|-172.16.0.104-|-70:DD:A8:52:1A:98-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-14:10:03-|\
    -bjj528-|-1000-|-172.16.1.49-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-14:42:35-|\
    -jvz392-|-1000-|-172.16.2.4-|-88:D5:0C:07:21:EA-|-31d-|-nazim-|-vc-579-07.\
    09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-14:54:12-|\
    -vsm957-|-1000-|-172.16.2.171-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-18:58:55-|\
    -rja929-|-1000-|-172.16.0.46-|-D8:32:E3:02:7B:D7-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-19:42:18-|\
    -ecy892-|-1000-|-172.16.2.209-|-B6:C1:F0:D9:9B:0C-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-20:15:41-|\
    -tnw896-|-1000-|-172.16.2.170-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-21:09:43-|\
    -fke448-|-1000-|-172.16.0.136-|-BE:0E:29:01:9F:C1-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/22/2023-|-22:07:29-|\
    -iha326-|-1000-|-172.16.2.206-|-C4:FE:5B:73:81:91-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/22/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-11:59:48-|\
    -asm534-|-1000-|-172.16.3.2-|-30:CB:F8:FA:56:F9-|-31d-|-evi-|-vc-929-07.10\
    .23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-12:08:31-|\
    -iip985-|-1000-|-172.16.2.198-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-14:06:32-|\
    -age264-|-1000-|-172.16.3.11-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-17:34:18-|\
    -ddu839-|-1000-|-172.16.0.129-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-18:36:12-|\
    -mrc329-|-1000-|-172.16.3.35-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-18:51:14-|\
    -ksx966-|-1000-|-172.16.1.161-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-19:00:04-|\
    -ezz638-|-1000-|-172.16.1.161-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-19:25:26-|\
    -usk423-|-1000-|-172.16.3.43-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/23/2023-|-22:04:35-|\
    -srn454-|-1000-|-172.16.3.62-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-11:22:06-|\
    -svy293-|-1000-|-172.16.3.35-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-13:37:43-|\
    -psd248-|-1000-|-172.16.2.198-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-13:54:24-|\
    -msu948-|-1000-|-172.16.1.99-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-21:13:13-|\
    -nvw966-|-1000-|-172.16.3.138-|-FA:7E:AD:56:65:37-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-22:13:13-|\
    -kwm866-|-1000-|-172.16.3.11-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/24/2023-|-22:30:37-|\
    -ymv526-|-1000-|-172.16.3.35-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/24/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-11:35:46-|\
    -jis735-|-1000-|-172.16.3.167-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-12:34:09-|\
    -nvj258-|-1000-|-172.16.0.113-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-12:53:17-|\
    -nbi926-|-1000-|-172.16.1.160-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-12:54:45-|\
    -ust363-|-1000-|-172.16.3.183-|-CA:CB:9A:78:45:69-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-14:40:01-|\
    -vij499-|-1000-|-172.16.3.190-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-579-0\
    7.09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-14:57:17-|\
    -tek696-|-1000-|-172.16.3.35-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-579-07\
    .09.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-15:04:55-|\
    -uch854-|-1000-|-172.16.0.117-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-673-06\
    .05.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-18:39:17-|\
    -ztf422-|-1000-|-172.16.0.68-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-673-06.\
    05.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-20:00:46-|\
    -ccp328-|-1000-|-172.16.0.62-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/25/2023-|-20:47:25-|\
    -fbf439-|-1000-|-172.16.2.236-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/25/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-11:13:36-|\
    -pia553-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-11:35:46-|\
    -pxt924-|-1000-|-172.16.0.117-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-12:01:54-|\
    -uni947-|-1000-|-172.16.1.240-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-12:37:24-|\
    -kfp568-|-1000-|-172.16.0.105-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-13:53:16-|\
    -ccp597-|-1000-|-172.16.3.116-|-74:C1:7D:98:0B:EC-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-14:28:54-|\
    -vvg233-|-1000-|-172.16.3.11-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-16:55:15-|\
    -abf726-|-1000-|-172.16.0.70-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-18:38:21-|\
    -axi725-|-1000-|-172.16.0.86-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-19:02:15-|\
    -hbm684-|-1000-|-172.16.3.128-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-19:07:22-|\
    -mfm875-|-1000-|-172.16.3.35-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-19:27:56-|\
    -nph223-|-1000-|-172.16.2.189-|-8C:AA:CE:44:AA:64-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/26/2023-|-20:20:29-|\
    -gck976-|-1000-|-172.16.2.197-|-F0:79:E8:1E:C6:1D-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/26/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-06:15:45-|\
    -fzr843-|-1000-|-172.16.3.129-|-9A:9F:DC:03:D8:F2-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-10:51:58-|\
    -emg754-|-1000-|-172.16.0.144-|-5E:77:A0:30:9F:A0-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-11:18:51-|\
    -ppt576-|-1000-|-172.16.0.148-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-13:43:10-|\
    -vjh522-|-1000-|-172.16.1.92-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-15:05:35-|\
    -gwd679-|-1000-|-172.16.0.65-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-15:20:10-|\
    -ixf836-|-1000-|-172.16.0.45-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-16:33:19-|\
    -yjw297-|-1000-|-172.16.0.176-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-17:20:45-|\
    -pna648-|-1000-|-172.16.2.236-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:04:15-|\
    -iee983-|-1000-|-172.16.0.132-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:07:06-|\
    -rwm874-|-1000-|-172.16.0.112-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:11:37-|\
    -rgs978-|-1000-|-172.16.0.105-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:47:01-|\
    -ekm957-|-1000-|-172.16.0.86-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:53:33-|\
    -csf667-|-1000-|-172.16.0.222-|-E6:52:39:C8:7D:C6-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-18:57:08-|\
    -dfv358-|-1000-|-172.16.0.223-|-8C:AA:CE:46:C6:E6-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:04:41-|\
    -dnu638-|-1000-|-172.16.0.42-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:18:19-|\
    -zcm567-|-1000-|-172.16.0.221-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:20:55-|\
    -bvx677-|-1000-|-172.16.0.57-|-46:B2:E1:E8:73:99-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:32:29-|\
    -fsf772-|-1000-|-172.16.0.61-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:38:37-|\
    -vbd878-|-1000-|-172.16.0.113-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:42:40-|\
    -buk535-|-1000-|-172.16.0.77-|-F4:60:E2:25:F5:52-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-19:43:30-|\
    -ujm567-|-1000-|-172.16.0.68-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-20:04:34-|\
    -thb783-|-1000-|-172.16.0.95-|-92:F3:B9:F1:CE:F0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-20:20:58-|\
    -zdv352-|-1000-|-172.16.0.134-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/27/2023-|-20:48:41-|\
    -wam565-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/27/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-09:40:51-|\
    -uis256-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-10:29:48-|\
    -mad479-|-1000-|-172.16.0.87-|-C4:E1:A1:F9:80:11-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-10:49:57-|\
    -dht484-|-1000-|-172.16.0.94-|-84:6F:CE:2D:A5:E5-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-11:00:04-|\
    -ngv872-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-11:04:40-|\
    -gxz464-|-1000-|-172.16.0.99-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-11:45:32-|\
    -spc365-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-12:45:52-|\
    -sjf879-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-13:11:50-|\
    -ycp244-|-1000-|-172.16.0.125-|-B6:C1:F0:D9:9B:0C-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-13:43:12-|\
    -bhh529-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-15:16:15-|\
    -whz778-|-1000-|-172.16.0.38-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-15:45:08-|\
    -dtx373-|-1000-|-172.16.0.148-|-34:E9:11:3B:B6:9B-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-18:21:13-|\
    -kby496-|-1000-|-172.16.0.171-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-19:15:05-|\
    -azj427-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-20:16:36-|\
    -zag997-|-1000-|-172.16.0.136-|-BE:0E:29:01:9F:C1-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-20:45:38-|\
    -mts299-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/28/2023-|-23:47:16-|\
    -hgi937-|-1000-|-172.16.0.81-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/28/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-00:19:32-|\
    -swa949-|-1000-|-172.16.0.213-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-10:33:25-|\
    -pbv348-|-1000-|-172.16.0.121-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-10:46:52-|\
    -esk364-|-1000-|-172.16.0.183-|-CA:8F:1F:CF:F6:E2-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-11:45:48-|\
    -bys798-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-13:13:31-|\
    -ebd242-|-1000-|-172.16.0.45-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-14:01:26-|\
    -unt482-|-1000-|-172.16.0.114-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-14:01:34-|\
    -unu845-|-1000-|-172.16.0.134-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-14:06:27-|\
    -dcr473-|-1000-|-172.16.0.248-|-9A:7C:74:3E:74:77-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-14:10:08-|\
    -uzx378-|-1000-|-172.16.0.40-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-16:16:48-|\
    -xuw849-|-1000-|-172.16.1.6-|-58:C6:F0:48:5B:C1-|-31d-|-witno-12jam-|-vc-3\
    45-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:15:44-|\
    -nsz565-|-1000-|-172.16.0.99-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:25:57-|\
    -uwg589-|-1000-|-172.16.0.118-|-DA:0A:39:44:0C:89-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:29:31-|\
    -hdz276-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:30:24-|\
    -csn968-|-1000-|-172.16.1.19-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:31:02-|\
    -hxp546-|-1000-|-172.16.1.21-|-4E:0F:00:CF:16:24-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:45:06-|\
    -vkf945-|-1000-|-172.16.0.152-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-18:55:37-|\
    -ing749-|-1000-|-172.16.1.24-|-82:25:C8:90:16:19-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-19:29:43-|\
    -afc229-|-1000-|-172.16.1.31-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-20:13:36-|\
    -hpv848-|-1000-|-172.16.0.62-|-74:C1:7D:98:0B:EC-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-20:23:28-|\
    -jrg863-|-1000-|-172.16.0.136-|-BE:0E:29:01:9F:C1-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-20:27:43-|\
    -kmb875-|-1000-|-172.16.1.41-|-14:47:2D:9B:F7:E7-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/29/2023-|-20:42:29-|\
    -dgp669-|-1000-|-172.16.0.251-|-E6:B6:01:DC:5C:F2-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/29/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-07:55:43-|\
    -aee759-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-08:34:32-|\
    -xkf464-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-09:16:43-|\
    -why863-|-1000-|-172.16.1.75-|-28:31:66:8E:F1:A1-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-09:28:59-|\
    -suk895-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-09:40:00-|\
    -rue943-|-1000-|-172.16.1.72-|-8C:AA:CE:2C:9D:48-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-09:44:44-|\
    -inz254-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-10:44:32-|\
    -dfp556-|-1000-|-172.16.1.22-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-11:49:30-|\
    -yyn967-|-1000-|-172.16.0.38-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-14:27:55-|\
    -bhh994-|-1000-|-172.16.0.213-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-16:47:46-|\
    -wew965-|-1000-|-172.16.0.104-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-16:48:58-|\
    -wsa949-|-1000-|-172.16.1.107-|-7A:AE:2D:4F:6D:26-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-16:49:21-|\
    -mzb687-|-1000-|-172.16.1.108-|-BE:65:40:10:2D:43-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-18:29:11-|\
    -jyp875-|-1000-|-172.16.0.87-|-C4:E1:A1:F9:80:11-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-18:55:54-|\
    -uau978-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-19:39:09-|\
    -jzv922-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-19:40:25-|\
    -zvu365-|-1000-|-172.16.0.114-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-20:12:10-|\
    -ywc638-|-1000-|-172.16.1.133-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-21:03:25-|\
    -rfn433-|-1000-|-172.16.0.106-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/30/2023-|-23:28:00-|\
    -gge395-|-1000-|-172.16.0.149-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/30/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-02:57:35-|\
    -ayh475-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-10:58:02-|\
    -pjb867-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-12:27:49-|\
    -iuk965-|-1000-|-172.16.0.42-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-13:02:37-|\
    -uxt667-|-1000-|-172.16.0.134-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-14:43:58-|\
    -htk352-|-1000-|-172.16.0.62-|-74:C1:7D:98:0B:EC-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-18:15:17-|\
    -rpd539-|-1000-|-172.16.0.84-|-4E:00:A2:FD:07:23-|-31d-|-witno-12jam-|-vc-\
    345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-18:57:48-|\
    -dgs574-|-1000-|-172.16.1.126-|-C2:9E:9C:33:A3:D8-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-19:22:35-|\
    -ane984-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-19:54:01-|\
    -kbj592-|-1000-|-172.16.1.223-|-E6:2A:79:24:7F:A6-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-20:57:14-|\
    -bee672-|-1000-|-172.16.1.234-|-7E:5C:B0:99:7D:9D-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-21:32:49-|\
    -cth858-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="jul/31/2023-|-23:12:50-|\
    -kun599-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=jul2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-00:34:52-|\
    -pwr582-|-1000-|-172.16.0.81-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-01:40:42-|\
    -dce945-|-1000-|-172.16.0.213-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-11:09:27-|\
    -atw288-|-1000-|-172.16.2.10-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-11:11:14-|\
    -avt876-|-1000-|-172.16.0.175-|-D0:37:42:AB:36:C5-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-11:54:09-|\
    -sfc449-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-11:55:39-|\
    -xfx339-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-11:58:22-|\
    -nzi436-|-1000-|-172.16.0.114-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-12:36:29-|\
    -dfh539-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-13:36:57-|\
    -nca344-|-1000-|-172.16.2.19-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-14:09:53-|\
    -hpy982-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-15:29:56-|\
    -mff625-|-1000-|-172.16.2.36-|-70:DD:A8:52:1A:98-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-16:00:55-|\
    -dsr992-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-16:21:31-|\
    -fsb398-|-1000-|-172.16.0.45-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-17:29:54-|\
    -pvg665-|-1000-|-172.16.0.202-|-9A:74:A7:00:F0:F8-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-18:57:47-|\
    -dfv836-|-1000-|-172.16.2.55-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-19:39:56-|\
    -kxd943-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/01/2023-|-22:15:24-|\
    -ajs759-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/01/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-00:36:22-|\
    -vpt489-|-1000-|-172.16.0.57-|-28:31:66:74:A9:E5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-07:04:30-|\
    -tki696-|-1000-|-172.16.2.91-|-7C:03:AB:BF:31:AD-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-10:40:39-|\
    -vsf595-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-10:54:47-|\
    -yhv343-|-1000-|-172.16.2.103-|-6A:89:A1:0C:F9:77-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-11:31:00-|\
    -rkw677-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-11:45:03-|\
    -pat945-|-1000-|-172.16.2.0-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-13:11:19-|\
    -pab686-|-1000-|-172.16.2.107-|-1A:49:3A:90:54:8C-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-14:16:34-|\
    -kfw698-|-1000-|-172.16.0.114-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-14:58:23-|\
    -hut729-|-1000-|-172.16.1.22-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-16:01:55-|\
    -fdv269-|-1000-|-172.16.0.152-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-16:19:39-|\
    -ubz687-|-1000-|-172.16.1.75-|-28:31:66:8E:F1:A1-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-16:59:56-|\
    -dmd568-|-1000-|-172.16.0.104-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-17:08:23-|\
    -wcs298-|-1000-|-172.16.0.149-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -345-07.06.23-witno" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-17:17:34-|\
    -uew479-|-1000-|-172.16.0.40-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-17:49:14-|\
    -xkf682-|-1000-|-172.16.2.102-|-4A:A2:A6:BC:05:53-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-18:25:44-|\
    -wdt938-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-19:01:02-|\
    -pnm288-|-1000-|-172.16.0.171-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-19:02:10-|\
    -vnu966-|-1000-|-172.16.0.90-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-20:16:55-|\
    -hfi573-|-1000-|-172.16.2.151-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-21:34:53-|\
    -esd624-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-21:49:51-|\
    -tbg635-|-1000-|-172.16.1.133-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/02/2023-|-23:43:34-|\
    -kid328-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/02/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-09:47:08-|\
    -bss369-|-1000-|-172.16.2.55-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-10:22:05-|\
    -ugw827-|-1000-|-172.16.0.42-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-11:08:38-|\
    -tnr934-|-1000-|-172.16.2.181-|-FA:7E:AD:56:65:37-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-12:47:54-|\
    -tzv526-|-1000-|-172.16.2.185-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-13:22:34-|\
    -hyg689-|-1000-|-172.16.0.134-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-15:31:56-|\
    -yce227-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-16:10:18-|\
    -fkp337-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-17:43:22-|\
    -jip327-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-18:24:29-|\
    -bfe628-|-1000-|-172.16.2.201-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-18:29:26-|\
    -ubc489-|-1000-|-172.16.2.95-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-18:32:30-|\
    -jzx892-|-1000-|-172.16.2.205-|-04:E5:98:17:3B:E2-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-18:41:36-|\
    -avw286-|-1000-|-172.16.2.206-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-18:51:58-|\
    -zxp782-|-1000-|-172.16.2.204-|-74:C1:7D:98:0B:EC-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-20:47:42-|\
    -wnj729-|-1000-|-172.16.2.6-|-88:D5:0C:46:C3:4E-|-31d-|-evi-|-vc-929-07.10\
    .23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-21:21:09-|\
    -kbc653-|-1000-|-172.16.0.213-|-6A:3E:FA:10:BD:93-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/03/2023-|-21:46:45-|\
    -zbf925-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/03/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-08:46:42-|\
    -bft933-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-11:07:44-|\
    -tdn768-|-1000-|-172.16.2.254-|-3A:50:5C:A7:68:27-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-11:15:05-|\
    -yep498-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-11:38:37-|\
    -xxk475-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:06:16-|\
    -kcz364-|-1000-|-172.16.3.6-|-8A:DD:30:E9:A9:0E-|-31d-|-witno-12jam-|-vc-3\
    64-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:15:01-|\
    -pyp856-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:18:29-|\
    -dwf742-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:39:53-|\
    -brb389-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:43:41-|\
    -bdk732-|-1000-|-172.16.0.40-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-12:56:55-|\
    -mga754-|-1000-|-172.16.2.36-|-70:DD:A8:52:1A:98-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-13:44:51-|\
    -ckg782-|-1000-|-172.16.2.121-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-14:25:40-|\
    -rfm942-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-18:10:16-|\
    -nbp367-|-1000-|-172.16.0.104-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-18:18:12-|\
    -vfz278-|-1000-|-172.16.3.30-|-E2:24:AA:4B:8A:42-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-18:21:04-|\
    -cnn637-|-1000-|-172.16.0.84-|-4E:00:A2:FD:07:23-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-18:31:54-|\
    -rwg486-|-1000-|-172.16.3.33-|-36:7C:C2:E8:2E:D9-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-19:15:44-|\
    -ekf537-|-1000-|-172.16.0.114-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-20:14:31-|\
    -zuw799-|-1000-|-172.16.2.17-|-DA:0A:39:44:0C:89-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/04/2023-|-20:51:40-|\
    -pur585-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/04/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-08:43:23-|\
    -ndv425-|-1000-|-172.16.3.59-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-09:00:26-|\
    -htd446-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-10:31:23-|\
    -feg497-|-1000-|-172.16.3.65-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-11:51:08-|\
    -bix946-|-1000-|-172.16.2.19-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-12:41:25-|\
    -rvw264-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-12:58:01-|\
    -vnz757-|-1000-|-172.16.0.45-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-13:03:01-|\
    -xfx295-|-1000-|-172.16.3.77-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-17:22:17-|\
    -xrr858-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-18:26:51-|\
    -ibd625-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-19:06:16-|\
    -gwk449-|-1000-|-172.16.1.22-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-19:22:16-|\
    -ukn524-|-1000-|-172.16.3.65-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-19:34:37-|\
    -adg288-|-1000-|-172.16.0.32-|-1E:72:A8:F4:71:BB-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-19:54:31-|\
    -kvm277-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-19:57:03-|\
    -vrx667-|-1000-|-172.16.0.182-|-2C:D0:66:16:2C:18-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-20:11:21-|\
    -hiw944-|-1000-|-172.16.0.149-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/05/2023-|-21:15:44-|\
    -snt583-|-1000-|-172.16.1.133-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/05/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-00:02:38-|\
    -eei559-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-00:14:08-|\
    -tbj865-|-1000-|-172.16.2.188-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-07:30:40-|\
    -dhg472-|-1000-|-172.16.0.73-|-9C:F5:31:88:DE:A1-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-08:26:57-|\
    -aup872-|-1000-|-172.16.3.48-|-9A:9F:DC:03:D8:F2-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-09:17:41-|\
    -kxk997-|-1000-|-172.16.0.171-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-09:24:04-|\
    -wwh958-|-1000-|-172.16.2.201-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-09:33:13-|\
    -jaa422-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-09:43:16-|\
    -tnd223-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-10:10:59-|\
    -niu775-|-1000-|-172.16.0.94-|-5E:77:A0:30:9F:A0-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-11:55:42-|\
    -nsn565-|-1000-|-172.16.2.185-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-12:02:14-|\
    -nvy784-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-12:15:55-|\
    -sih524-|-1000-|-172.16.3.69-|-FC:A5:D0:90:B0:67-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-12:31:33-|\
    -thv876-|-1000-|-172.16.0.152-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-12:38:50-|\
    -ncr892-|-1000-|-172.16.0.112-|-9A:3A:AA:94:BD:79-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-17:15:13-|\
    -bew685-|-1000-|-172.16.0.40-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-19:14:16-|\
    -tic998-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-21:58:42-|\
    -ghb549-|-1000-|-172.16.2.188-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/06/2023-|-23:49:19-|\
    -ecj256-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/06/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-09:13:28-|\
    -uzm857-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-09:18:59-|\
    -pjy347-|-1000-|-172.16.0.134-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-10:09:02-|\
    -fky855-|-1000-|-172.16.0.42-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-12:12:04-|\
    -tzh345-|-1000-|-172.16.0.98-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-12:21:31-|\
    -rty624-|-1000-|-172.16.0.207-|-38:29:5A:6F:0A:29-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-17:36:47-|\
    -idc285-|-1000-|-172.16.0.231-|-24:79:F3:FF:09:15-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-18:30:02-|\
    -ues634-|-1000-|-172.16.2.17-|-DA:0A:39:44:0C:89-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-18:30:35-|\
    -izu423-|-1000-|-172.16.0.104-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-18:37:09-|\
    -akj959-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/07/2023-|-19:04:15-|\
    -kkm822-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/07/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-05:31:20-|\
    -ckn973-|-1000-|-172.16.0.45-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-06:01:55-|\
    -mep598-|-1000-|-172.16.1.26-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-226-06\
    .18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-08:07:51-|\
    -fdx565-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-08:53:44-|\
    -chg438-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-12:54:09-|\
    -jrk467-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-13:40:59-|\
    -drg355-|-1000-|-172.16.0.106-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-13:47:47-|\
    -ikj946-|-1000-|-172.16.1.54-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-14:09:15-|\
    -beu442-|-1000-|-172.16.0.152-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-14:35:49-|\
    -zge364-|-1000-|-172.16.1.57-|-9C:6B:72:A5:7D:4B-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-14:54:06-|\
    -cxs997-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-15:15:58-|\
    -jpu672-|-1000-|-172.16.1.40-|-28:31:66:8E:F1:A1-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-15:43:15-|\
    -dkn439-|-1000-|-172.16.0.116-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-16:43:47-|\
    -zhk524-|-1000-|-172.16.1.44-|-4A:A2:A6:BC:05:53-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-16:57:31-|\
    -uag767-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-19:13:11-|\
    -ctu682-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-19:55:45-|\
    -mbi878-|-1000-|-172.16.1.133-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-21:31:23-|\
    -twx983-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/08/2023-|-22:40:52-|\
    -hik523-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/08/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-07:10:38-|\
    -tke788-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-10:09:20-|\
    -jyy879-|-1000-|-172.16.1.114-|-1A:49:3A:90:54:8C-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-10:09:47-|\
    -cxh334-|-1000-|-172.16.1.41-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-10:17:26-|\
    -xre694-|-1000-|-172.16.1.26-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-226-06\
    .18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-11:34:46-|\
    -yds486-|-1000-|-172.16.1.125-|-FA:7E:AD:56:65:37-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-11:37:34-|\
    -pmp738-|-1000-|-172.16.0.129-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-11:40:21-|\
    -cfk533-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-13:13:50-|\
    -sdz372-|-1000-|-172.16.0.134-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-14:55:40-|\
    -khe233-|-1000-|-172.16.0.73-|-9C:F5:31:88:DE:A1-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-15:27:43-|\
    -cxw422-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-16:04:47-|\
    -hrj244-|-1000-|-172.16.0.149-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-16:40:01-|\
    -sim844-|-1000-|-172.16.1.22-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-16:49:33-|\
    -mxv838-|-1000-|-172.16.1.154-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-17:06:02-|\
    -exp984-|-1000-|-172.16.1.155-|-9A:9C:C5:97:B4:65-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-18:41:49-|\
    -itp963-|-1000-|-172.16.1.75-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-19:05:41-|\
    -prh266-|-1000-|-172.16.1.169-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-19:37:30-|\
    -gsd943-|-1000-|-172.16.0.42-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-19:46:57-|\
    -jfx734-|-1000-|-172.16.1.172-|-16:25:6D:D5:FD:70-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-22:22:14-|\
    -hgx546-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/09/2023-|-23:18:27-|\
    -smb879-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/09/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-08:10:25-|\
    -dmp269-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-10:21:32-|\
    -ugz272-|-1000-|-172.16.1.203-|-F0:79:E8:1E:C6:1D-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-11:29:46-|\
    -mti864-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-11:36:32-|\
    -nvu936-|-1000-|-172.16.1.208-|-20:47:DA:2E:05:A3-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-12:26:49-|\
    -dfa546-|-1000-|-172.16.1.26-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-226-06\
    .18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-12:46:11-|\
    -awp678-|-1000-|-172.16.0.249-|-74:C1:7D:98:0B:EC-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-14:42:40-|\
    -rsx886-|-1000-|-172.16.0.57-|-28:31:66:74:A9:E5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-16:01:48-|\
    -zys437-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-16:24:09-|\
    -ywk658-|-1000-|-172.16.1.227-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-16:43:04-|\
    -bes349-|-1000-|-172.16.1.91-|-00:EC:0A:EA:7F:5D-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-17:08:33-|\
    -ifx359-|-1000-|-172.16.1.233-|-AE:2C:B5:19:43:0F-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-17:12:19-|\
    -wgu648-|-1000-|-172.16.1.231-|-38:29:5A:6F:0A:29-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-17:14:09-|\
    -kru473-|-1000-|-172.16.0.93-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-18:36:32-|\
    -tga453-|-1000-|-172.16.0.156-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-19:15:37-|\
    -nzv658-|-1000-|-172.16.1.246-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-21:57:37-|\
    -svw328-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/10/2023-|-21:58:24-|\
    -uge753-|-1000-|-172.16.1.129-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/10/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-00:06:02-|\
    -mij998-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-10:21:20-|\
    -asd252-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-11:02:50-|\
    -gbw758-|-1000-|-172.16.0.104-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-12:40:15-|\
    -ran282-|-1000-|-172.16.1.214-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-12:40:35-|\
    -wja422-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-13:12:44-|\
    -fni966-|-1000-|-172.16.2.40-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-13:16:56-|\
    -wxt884-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-17:50:23-|\
    -udi922-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-18:28:14-|\
    -ypg869-|-1000-|-172.16.0.149-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-19:56:01-|\
    -kec282-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-22:27:50-|\
    -jbk722-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/11/2023-|-23:28:13-|\
    -unt952-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/11/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-10:50:52-|\
    -rce263-|-1000-|-172.16.2.120-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-11:22:13-|\
    -fkm388-|-1000-|-172.16.0.45-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-11:41:01-|\
    -vet938-|-1000-|-172.16.2.125-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-12:41:58-|\
    -ixc594-|-1000-|-172.16.2.95-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-15:28:02-|\
    -vja456-|-1000-|-172.16.0.50-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-16:38:22-|\
    -ikf336-|-1000-|-172.16.0.108-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-18:08:24-|\
    -kkz987-|-1000-|-172.16.0.76-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-18:31:24-|\
    -mrt797-|-1000-|-172.16.2.17-|-DA:0A:39:44:0C:89-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-18:50:36-|\
    -edb528-|-1000-|-172.16.0.42-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/12/2023-|-18:54:47-|\
    -auf658-|-1000-|-172.16.2.65-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/12/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-00:16:23-|\
    -mhb286-|-1000-|-172.16.1.133-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-00:44:18-|\
    -vhp355-|-1000-|-172.16.3.4-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07.1\
    0.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-07:17:33-|\
    -sik757-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-07:40:08-|\
    -mvj972-|-1000-|-172.16.0.140-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-08:58:44-|\
    -zxs338-|-1000-|-172.16.0.115-|-5A:1A:F3:1C:81:B9-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-09:08:38-|\
    -ffp784-|-1000-|-172.16.0.111-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-10:51:15-|\
    -nnu639-|-1000-|-172.16.0.89-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-10:59:51-|\
    -fhy669-|-1000-|-172.16.0.135-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-11:29:51-|\
    -mze935-|-1000-|-172.16.0.81-|-4E:06:BC:1C:A1:62-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-11:43:27-|\
    -xkt525-|-1000-|-172.16.0.103-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-13:07:44-|\
    -rvw287-|-1000-|-172.16.0.75-|-9A:58:A6:E3:85:BD-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-13:53:44-|\
    -bru453-|-1000-|-172.16.0.83-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-14:51:43-|\
    -thg875-|-1000-|-172.16.0.138-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-15:26:46-|\
    -hcs365-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-16:44:35-|\
    -uax372-|-1000-|-172.16.0.123-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-18:06:48-|\
    -gii757-|-1000-|-172.16.0.121-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-18:32:03-|\
    -rmm548-|-1000-|-172.16.0.42-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-18:51:17-|\
    -dtj528-|-1000-|-172.16.0.34-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-20:50:01-|\
    -dte679-|-1000-|-172.16.0.178-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/13/2023-|-23:34:37-|\
    -wss993-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/13/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-09:49:17-|\
    -uvz529-|-1000-|-172.16.0.123-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-12:15:20-|\
    -jem484-|-1000-|-172.16.0.209-|-FA:7E:AD:56:65:37-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-12:38:16-|\
    -but542-|-1000-|-172.16.0.134-|-E8:50:8B:1A:E3:81-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-12:42:30-|\
    -brw447-|-1000-|-172.16.0.140-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-12:43:27-|\
    -xxx563-|-1000-|-172.16.0.89-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-13:21:33-|\
    -xwt457-|-1000-|-172.16.0.135-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-13:33:17-|\
    -rtp798-|-1000-|-172.16.0.216-|-8C:AA:CE:2C:9D:48-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-14:17:41-|\
    -bdz435-|-1000-|-172.16.0.218-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-14:44:26-|\
    -ths547-|-1000-|-172.16.0.111-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-618-0\
    7.25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-15:21:03-|\
    -udf939-|-1000-|-172.16.0.116-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-16:56:01-|\
    -ekr872-|-1000-|-172.16.0.39-|-00:0A:F5:CE:67:14-|-31d-|-wawan-|-vc-226-06\
    .18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-17:06:14-|\
    -xtp468-|-1000-|-172.16.0.233-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-17:31:17-|\
    -rvj856-|-1000-|-172.16.0.137-|-20:5E:F7:7E:E9:58-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-17:46:32-|\
    -tyj485-|-1000-|-172.16.0.239-|-20:74:54:C2:01:A9-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-18:06:23-|\
    -zfg469-|-1000-|-172.16.0.49-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-18:18:30-|\
    -wix972-|-1000-|-172.16.0.41-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-18:25:27-|\
    -bsc263-|-1000-|-172.16.0.44-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-19:19:05-|\
    -gra965-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-21:11:31-|\
    -abd873-|-1000-|-172.16.0.179-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/14/2023-|-23:15:53-|\
    -xfz778-|-1000-|-172.16.0.123-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/14/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-09:53:18-|\
    -zam269-|-1000-|-172.16.0.156-|-0C:98:38:42:5D:C5-|-31d-|-witno-12jam-|-vc\
    -364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-11:42:24-|\
    -dvh672-|-1000-|-172.16.0.121-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-14:37:23-|\
    -tzd442-|-1000-|-172.16.0.83-|-62:51:74:99:57:14-|-31d-|-witno-12jam-|-vc-\
    364-08.01.23-kukuh" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-17:04:37-|\
    -kyx265-|-1000-|-172.16.1.78-|-88:D5:0C:07:21:EA-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-17:13:18-|\
    -why562-|-1000-|-172.16.0.135-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-17:16:09-|\
    -bay926-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-618-07\
    .25.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
add comment=mikhmon dont-require-permissions=no name="aug/15/2023-|-18:35:12-|\
    -gyw366-|-1000-|-172.16.0.123-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/15/2023
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
add simple-queue=slamet
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
    \n" host=192.168.55.2 interval=10s timeout=2s up-script="/tool fetch url=\
    \"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew\
    04/sendmessage\\\?chat_id=-1001266583133&text=\\E2\\9C\\85 = AP BEBEK\" ke\
    ep-result=no;"
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
    \n" host=192.168.55.11 timeout=2s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - sd surokid\
    ul 1\" keep-result=no;"
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
    id=-1001247315859&text=\\E2\\9D\\8C = ptmp penerima - nazim\" keep-result=\
    no;\r\
    \n}" host=192.168.55.16 timeout=2s up-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = ptmp penerima - nazim\" k\
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
    8C isp1\" keep-result=no;" host=8.8.4.4 interval=12s up-script="/tool netw\
    atch set disabled=yes [find comment=\"z 1 NOTIF\"]\r\
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
    8C server vpn2\" keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+server+\
    vpn2\" keep-result=no;\r\
    \n" host=10.123.22.1 interval=5s timeout=2s up-script="/ip route enable [f\
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
    \nlog warning (\"server vpn2\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 server vpn2\" keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+server+\
    vpn2\" keep-result=no;\r\
    \n"
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
    \n\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"server vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C server vpn1\" keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9D%8C+server+\
    vpn1\" keep-result=no;\r\
    \n" host=10.123.22.7 interval=5s timeout=2s up-script="/ip route enable [f\
    ind comment=\"vpn1\"]\r\
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
    \n/ip dns cache flush\r\
    \n:delay 500ms;\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog warning (\"server vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 server vpn1\" keep-result=no;\r\
    \n\r\
    \n/tool fetch http-method=get mode=https url=\"https://api.callmebot.com/w\
    hatsapp.php\\\?&apikey=8988152&phone=+6282138082138&text=%E2%9C%85+server+\
    vpn1\" keep-result=no;\r\
    \n"
add comment="     2" down-script="\r\
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
    8C isp2\" keep-result=no;" host=8.8.8.8 interval=7s timeout=3s up-script="\
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
add comment="203 TPLINK SLAMET" down-script="/tool fetch url=\"https://api.tel\
    egram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\\\
    \?chat_id=-1001351938959&text=\\E2\\9D\\8C = slamet\" keep-result=no;\r\
    \n}" host=10.10.12.3 interval=30s up-script="/tool fetch url=\"https://api\
    .telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessag\
    e\\\?chat_id=-1001351938959&text=\\E2\\9C\\85 = slamet\" keep-result=no;\r\
    \n}"
add comment="z 1 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp1 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 notif\" keep-result=no;" host=4.2.2.2 interval=3s timeout=100ms \
    up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 notif\" keep-result=no;"
/tool romon
set enabled=yes secrets=45