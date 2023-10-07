# sep/02/2023 04:23:17 by RouterOS 6.49.8
# software id = 1ULD-5FDY
#
# model = RouterBOARD 3011UiAS
# serial number = 8EED0A011100
/interface bridge
add name=lan
/interface ethernet
set [ find default-name=ether1 ] comment=b-valen mac-address=\
    74:DF:BF:88:37:11 name=ether1-isp1
set [ find default-name=ether2 ] comment=i-mirza mac-address=\
    74:DF:BF:88:37:22 name=ether2-isp2
set [ find default-name=ether3 ] comment=192.168.18.1 disabled=yes \
    mac-address=74:DF:BF:88:37:33 name=ether3-isp3
set [ find default-name=ether4 ] comment=192.168.23.1 disabled=yes \
    mac-address=74:DF:BF:88:37:44 name=ether4-isp4
set [ find default-name=ether5 ] disabled=yes mac-address=74:DF:BF:88:37:55 \
    name=ether5-isp5
set [ find default-name=ether6 ] name=ether6-tower
set [ find default-name=ether7 ] name=ether7-mirza
set [ find default-name=ether8 ] name=ether8-belakang
set [ find default-name=ether9 ] name=ether9-rumah
set [ find default-name=ether10 ] disabled=yes
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
    keepalive-timeout=10 name=vpn1 password=456awasadawewe456 profile=default \
    user=mnet-router-dns
/interface pptp-client
add connect-to=103.143.170.11 keepalive-timeout=10 name=vpn1123213213213 \
    password=456awasadawewe456 profile=default user=mnet-router-dns
/queue simple
add name="--------ALL TRAFIK--------" target=10.0.0.0/8,172.16.0.0/12
add max-limit=30M/30M name="~~MIRZA WIFI BELAKANG" parent=\
    "--------ALL TRAFIK--------" target=10.10.2.254/32
add max-limit=35M/35M name="~~MIRZA TV KAMAR" parent=\
    "--------ALL TRAFIK--------" target=\
    10.20.254.4/32,10.20.254.5/32,10.20.254.6/32
add max-limit=100M/100M name=~rtrw-muksin parent="--------ALL TRAFIK--------" \
    target=10.10.12.2/32
add name=rumahan parent="--------ALL TRAFIK--------" target=\
    10.10.0.0/21,10.10.12.3/32
add name=hotspotan parent="--------ALL TRAFIK--------" target=172.16.0.0/12
add burst-limit=0/7M burst-threshold=0/5M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/5M name="==warung-evi" parent=hotspotan target=\
    172.16.3.251/32,172.16.3.252/32,172.16.3.253/32
add max-limit=40M/60M name=merpati parent=rumahan target=10.10.2.0/24
add max-limit=25M/55M name=bebek parent=rumahan target=\
    10.10.1.0/24,10.10.12.3/32
add limit-at=1k/1k max-limit=150k/200k name="~~blm bayar" parent=bebek \
    target=10.10.1.0/24,10.10.12.3/32
add limit-at=1k/1k max-limit=150k/200k name="~~blm bayar " parent=merpati \
    target=10.10.2.0/24
/ip dhcp-server
add add-arp=yes address-pool=1_dhcp_/22 disabled=no insert-queue-before=\
    "==warung-evi" interface=vlan-hotspot lease-script=\
    "/queue simple remove [ find name ~\"hs-<\" ]" name=dhcp1 parent-queue=\
    hotspotan
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001184386305&text=\\F0\\9F\\9F\
    \\A2 <b>TRIAL</b>%0A- pada : \$date %2d \$time2%0A- mac : \$mac%0A- hp : \
    \$host3%0A- ping ke hp : \$avgRtt%0Dms&parse_mode=html\" mode=http keep-re\
    sult=no;\r\
    \n\r\
    \n};" parent-queue=hotspotan rate-limit="2M/5M 0/0 0/0 0/0 8 0/0" \
    shared-users=unlimited
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/3M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/4M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d1mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/2M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="4M/7M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="4M/7M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/3M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/3M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/3M 0/0 0/0 0/0 8 0/0"
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001184386305&text=\\F0\\9F\\9F\
    \\A2 <b>TRIAL</b>%0A- pada : \$date %2d \$time2%0A- mac : \$mac%0A- hp : \
    \$host3%0A- ping ke hp : \$avgRtt%0Dms&parse_mode=html\" mode=http keep-re\
    sult=no;\r\
    \n\r\
    \n};" parent-queue=hotspotan rate-limit="1M/4M 0/0 0/0 0/0 8 0/0" \
    shared-users=unlimited
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
    \n/tool flood-ping \$ips count=3 do={\r\
    \n  :if (\$sent = 3) do={\r\
    \n    :set avgRtt \$\"avg-rtt\"\r\
    \n}}\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendMessage\?chat_id=-1001410368279&text=\\F0\\9F\\9F\
    \\A2 <b>AKTIF = <code>\$nama</code></b>%0A- pada : \$date %2d \$time2%0A- \
    paket : \$profile%2d3mb%0A- mac : \$mac%0A- hp : \$host3%0A- ping ke hp : \
    \$avgRtt%0Dms&parse_mode=html\" mode=http keep-result=no;\r\
    \n\r\
    \n}\r\
    \n};" parent-queue=hotspotan rate-limit="1M/2M 0/0 0/0 0/0 8 0/0"
/queue simple
add burst-limit=0/9M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=7M/7M name=l-topik parent=merpati target=10.10.2.11/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=6M/7M name=l-bunasir parent=merpati target=10.10.2.13/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=8M/9M name=l-syukur parent=merpati target=10.10.2.27/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=8M/9M name=l-andi parent=merpati target=10.10.2.32/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=8M/9M name=l-rini parent=merpati target=10.10.2.31/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=8M/9M name=l-anis parent=merpati target=10.10.2.30/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=8M/9M name=l-agus parent=merpati target=10.10.2.29/32
add burst-limit=0/7M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=6M/6M name=l-sekar parent=merpati target=10.10.2.28/32
add burst-limit=0/7M burst-threshold=0/6M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/6M name=w-fuad parent=merpati target=10.10.2.17/32
add burst-limit=0/9M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/8M name=w-wati parent=merpati target=10.10.2.18/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/9M name=w-ali-geprek parent=merpati target=10.10.2.19/32
add burst-limit=0/9M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/8M name=w-dian parent=merpati target=10.10.2.23/32
add burst-limit=0/9M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/8M name=w-rokhim parent=merpati target=10.10.2.24/32
add burst-limit=0/10M burst-threshold=0/9M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/9M name=w-mul parent=merpati target=10.10.2.14/32
add burst-limit=0/9M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/8M name=w-laeli parent=merpati target=10.10.2.26/32
add burst-limit=0/10M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/7M name=kukuh parent=bebek target=10.10.1.11/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/7M name=amin parent=bebek target=10.10.1.12/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/8M name=wawan parent=bebek target=10.10.1.13/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1k/1k \
    max-limit=3M/7M name=irham parent=bebek target=10.10.1.14/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=ozi parent=bebek target=10.10.1.16/32
add limit-at=1M/2M max-limit=4M/10M name=slamet parent=bebek target=\
    10.10.1.15/32,10.10.12.3/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/8M name=wawan-cafe parent=bebek target=10.10.1.17/32
add burst-limit=0/10M burst-threshold=0/8M burst-time=0s/7s limit-at=1M/2M \
    max-limit=5M/8M name=bayu-kantor parent=bebek target=10.10.1.18/32
add limit-at=1M/2M max-limit=3M/7M name=k-sd-suro1 parent=bebek target=\
    10.10.1.19/32
add limit-at=1M/2M max-limit=5M/10M name=k-sd-pager3 parent=bebek target=\
    10.10.1.28/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=bayu-rumah parent=bebek target=10.10.1.20/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=4M/7M name=k-witno parent=bebek target=10.10.1.21/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=sri parent=bebek target=10.10.1.22/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=aan parent=bebek target=10.10.1.23/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=turino parent=bebek target=10.10.1.24/32
add burst-limit=0/8M burst-threshold=0/7M burst-time=0s/7s limit-at=1M/2M \
    max-limit=3M/7M name=dikrom parent=bebek target=10.10.1.25/32
add limit-at=1M/2M max-limit=3M/7M name=nazim parent=bebek target=\
    10.10.1.26/32
/queue type
add kind=pcq name=pcq-download pcq-classifier=dst-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pcq name=pcq-upload pcq-classifier=src-address \
    pcq-dst-address6-mask=64 pcq-src-address6-mask=64
add kind=pfifo name=default-100 pfifo-limit=100
add kind=sfq name=FULL-SPEED
add kind=pfifo name=default-500 pfifo-limit=500
add kind=pfifo name="default-small ORIGINAL" pfifo-limit=10
set 15 kind=sfq
/queue simple
add disabled=yes max-limit=10M/10M name="~~~~PC MIRZA TEST" queue=\
    FULL-SPEED/FULL-SPEED target=10.20.254.3/32
add disabled=yes max-limit=100M/100M name="~~~~  BYPASS  ~~~~" priority=1/1 \
    queue=FULL-SPEED/FULL-SPEED target=192.168.55.0/24
add max-limit=100M/100M name="-            LOKAL           -" packet-marks=\
    lokal priority=1/1 queue=FULL-SPEED/FULL-SPEED target=\
    10.0.0.0/8,172.16.0.0/12
add max-limit=100M/100M name="--             VIP              --" \
    packet-marks=vip priority=1/1 queue=FULL-SPEED/FULL-SPEED target=\
    10.0.0.0/8,172.16.0.0/12
add max-limit=100M/100M name="---          GAME          ---" packet-marks=\
    game-ml,game-ff priority=2/2 queue=FULL-SPEED/FULL-SPEED target=\
    10.0.0.0/8,172.16.0.0/12
add max-limit=21M/21M name="----   SPEEDTEST    ----" packet-marks=speedtest \
    priority=1/1 queue=default-500/default-500 target=\
    10.10.0.0/21,10.10.12.3/32
add disabled=yes max-limit=30M/60M name="~Merpati PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.2.0/24
add disabled=yes max-limit=30M/60M name="~Bebek PCQ" parent=rumahan queue=\
    pcq-upload/pcq-download target=10.10.1.0/24,10.10.12.3/32
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
add bridge=lan interface=ether7-mirza
add bridge=lan interface=ether8-belakang
add bridge=lan interface=ether9-rumah
add bridge=lan interface=ether10
/ip firewall connection tracking
set tcp-established-timeout=30m
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add interface=ether1-isp1 list=ISP
add interface=ether2-isp2 list=ISP
add interface=ether6-tower list=LAN
add interface=ether7-mirza list=LAN
add interface=ether8-belakang list=LAN
add interface=ether9-rumah list=LAN
add interface=ether10 list=LAN
add interface=vpn2 list=VPN
add interface=vpn1123213213213 list=VPN
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
add address=10.20.254.1/29 interface=lan network=10.20.254.0
add address=192.168.23.4/24 interface=ether2-isp2 network=192.168.23.0
/ip arp
add address=10.10.12.2 comment=rtrw-muksin-statik interface=lan mac-address=\
    6C:3B:6B:C2:46:3B
add address=10.10.12.3 comment=bebek-slamet-STATIK interface=lan mac-address=\
    18:E8:29:D6:9E:DA
add address=10.20.254.3 comment="MIRZA PC KAMAR" interface=lan mac-address=\
    A8:A1:59:20:DE:05
add address=10.20.254.4 comment="MIRZA TV KAMAR" interface=lan mac-address=\
    00:15:C0:85:14:FF
add address=10.20.254.2 comment="MIRZA ROUTER RUMAH" interface=lan \
    mac-address=6C:3B:6B:92:15:50
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
    10.123.22.7
/ip dns static
add address=172.16.0.1 name=hotspot.com ttl=5m
/ip firewall address-list
add address=172.16.0.0/12 comment=hotspot-voucher/12 list=ip-local
add address=10.10.12.2 comment=rtrw-muksin-statik list=ip-local
add address=www.biznetnetworks.com list=z-list-ip-web-blokir
add address=10.20.254.2 comment="MIRZA ROUTER RUMAH" list=ip-local
add address=192.168.15.1-192.168.29.254 comment=\
    "192.168.15.1   -   192.168.29.254" list=z-list-ip-redirect
add address=10.10.0.0/16 comment="      10.10.0.1   -   10.10.255.254" list=\
    z-list-ip-redirect
add address=172.16.0.0/12 comment="    172.16.0.1   -   172.31.255.254" list=\
    z-list-ip-redirect
add address=internetpositif.uzone.id list=z-list-ip-web-blokir
add address=192.168.15.1-192.168.29.254 comment=192.168.15.1-192.168.29.254 \
    list=ip-modem-isp
add address=www.indihome.co.id list=z-list-ip-web-blokir
add address=10.123.22.1 list=ip-vpn-lokal
add address=103.143.170.11 comment=vpn-idnix list=ip-vpn-publik
add address=10.10.2.24 comment=tegal-rohkim disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.26 comment=tegal-laeli disabled=yes list=ip-local-to-isp1
add address=10.10.2.23 comment=tegal-dian disabled=yes list=ip-local-to-isp1
add address=10.10.2.19 comment=tegal-ali-geprek disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.22 comment=bebek-sri list=ip-local-to-isp1
add address=10.10.1.26 comment=bebek-nazim list=ip-local-to-isp1
add address=10.10.1.11 comment=bebek-kukuh list=ip-local-to-isp1
add address=10.10.1.20 comment=bebek-bayu-rumah list=ip-local-to-isp1
add address=10.10.1.18 comment=bebek-bayu-kantor list=ip-local-to-isp1
add address=10.10.2.18 comment=tegal-wati disabled=yes list=ip-local-to-isp1
add address=10.10.2.11 comment=tegal-topik disabled=yes list=ip-local-to-isp1
add address=10.10.2.27 comment=tegal-syukur disabled=yes list=\
    ip-local-to-isp1
add address=10.10.2.17 comment=tegal-fuad disabled=yes list=ip-local-to-isp1
add address=10.10.2.13 comment=tegal-bunasir disabled=yes list=\
    ip-local-to-isp1
add address=10.10.1.21 comment=bebek-witno list=ip-local-to-isp1
add address=10.10.1.13 comment=bebek-wawan-rumah list=ip-local-to-isp1
add address=10.10.1.17 comment=bebek-wawan-cafe list=ip-local-to-isp1
add address=10.10.1.24 comment=bebek-turino list=ip-local-to-isp1
add address=10.10.1.19 comment=bebek-sd-suro-1 list=ip-local-to-isp1
add address=10.10.1.16 comment=bebek-ozi list=ip-local-to-isp1
add address=10.10.1.14 comment=bebek-irham list=ip-local-to-isp1
add address=10.10.1.25 comment=bebek-dikrom list=ip-local-to-isp1
add address=10.10.1.12 comment=bebek-amin list=ip-local-to-isp1
add address=10.10.1.23 comment=bebek-aan list=ip-local-to-isp1
add address=10.10.2.14 comment=tegal-mul disabled=yes list=ip-local-to-isp1
add address=10.10.12.2 comment=rtrw-muksin list=ip-local-to-isp2
add address=fm1.firstmedia.com list=z-list-ip-web-blokir
add address=firstmedia.com list=z-list-ip-web-blokir
add address=internetsehat.firstmedia.com list=z-list-ip-web-blokir
add address=10.10.2.0/24 comment=tegal/24 list=ip-local-to-isp2
add address=10.10.1.0/24 comment=bebek/24 list=ip-local-to-isp2
add address=172.16.0.0/12 comment=hotspot-voucher/12 list=ip-local-to-isp2
add address=vpn.mnet.my.id list=ip-vpn-publik
add address=10.10.1.28 comment=bebek-sd-pager-3 list=ip-local-to-isp1
add address=10.10.2.254 comment=tegal-belakangrumah disabled=yes list=\
    ip-local-to-isp1
add address=172.16.0.0/12 comment=@@hotspot-voucher/12 list=ip-local-to-isp1
add address=www.uzone.id list=z-list-ip-web-blokir
add address=mercusuar.uzone.id list=z-list-ip-web-blokir
add address=10.10.1.11 comment=bebek-kukuh disabled=yes list=ip-local-game
add address=10.10.1.12 comment=bebek-amin list=ip-local-game
add address=10.10.1.13 comment=bebek-wawan list=ip-local-game
add address=10.10.1.14 comment=bebek-irham disabled=yes list=ip-local-game
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
add address=10.10.2.17 comment=tegal-fuad list=ip-local-game
add address=10.10.2.18 comment=tegal-wati disabled=yes list=ip-local-game
add address=10.10.2.19 comment=tegal-aligeprek disabled=yes list=\
    ip-local-game
add address=10.10.2.23 comment=tegal-dian disabled=yes list=ip-local-game
add address=10.10.2.24 comment=tegal-rokhim list=ip-local-game
add address=10.10.2.26 comment=tegal-laeli list=ip-local-game
add address=10.10.2.27 comment=tegal-syukur disabled=yes list=ip-local-game
add address=10.10.2.254 comment=tegal-rumahbelakang disabled=yes list=\
    ip-local-game
add address=192.168.55.0/24 comment=PTP disabled=yes list=ip-local
add address=10.10.0.0/21 comment="rumahan bebek & tegal" list=\
    ip-local-speedtest
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local-speedtest
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local-to-isp1
add address=10.10.12.3 comment=bebek-slamet-STATIK list=ip-local-to-isp2
add address=10.10.12.3 comment=bebek-slamet-STATIK disabled=yes list=\
    ip-local-game
add address=jsc.mgid.com list=z-list-ip-web-blokir
add address=10.10.2.24 comment=tegal-rohkim list=ip-local-to-route-isp1
add address=10.10.2.26 comment=tegal-laeli list=ip-local-to-route-isp1
add address=10.10.2.23 comment=tegal-dian list=ip-local-to-route-isp1
add address=10.10.2.19 comment=tegal-ali-geprek list=ip-local-to-route-isp1
add address=10.10.1.22 comment=bebek-sri list=ip-local-to-route-isp1
add address=10.10.1.26 comment=bebek-nazim list=ip-local-to-route-isp1
add address=10.10.1.11 comment=bebek-kukuh list=ip-local-to-route-isp1
add address=10.10.1.20 comment=bebek-bayu-rumah list=ip-local-to-route-isp1
add address=10.10.1.18 comment=bebek-bayu-kantor list=ip-local-to-route-isp1
add address=10.10.2.18 comment=tegal-wati list=ip-local-to-route-isp1
add address=10.10.2.11 comment=tegal-topik list=ip-local-to-route-isp1
add address=10.10.2.27 comment=tegal-syukur list=ip-local-to-route-isp1
add address=10.10.2.17 comment=tegal-fuad list=ip-local-to-route-isp1
add address=10.10.2.13 comment=tegal-bunasir list=ip-local-to-route-isp1
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
add address=10.10.2.14 comment=tegal-mul list=ip-local-to-route-isp1
add address=10.10.1.28 comment=bebek-sd-pager-3 list=ip-local-to-route-isp1
add address=10.10.2.254 comment=tegal-belakangrumah list=\
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
add address=192.168.55.0/24 comment="IP PTP MNET" list=ip-private
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
add address=10.10.12.2 comment=rtrw-muksin disabled=yes list=ip-local-to-isp1
add address=10.10.2.28 comment=tegal-sekar disabled=yes list=ip-local-game
add address=10.10.2.29 comment=tegal-agus list=ip-local-game
add address=10.10.2.30 comment=tegal-anis disabled=yes list=ip-local-game
add address=10.10.2.31 comment=tegal-rini list=ip-local-game
add address=10.10.2.32 comment=tegal-andi list=ip-local-game
add address=10.10.2.28 comment=tegal-sekar disabled=yes list=ip-local-to-isp1
add address=10.10.2.29 comment=tegal-agus disabled=yes list=ip-local-to-isp1
add address=10.10.2.30 comment=tegal-anis disabled=yes list=ip-local-to-isp1
add address=10.10.2.31 comment=tegal-rini disabled=yes list=ip-local-to-isp1
add address=10.10.2.32 comment=tegal-andi disabled=yes list=ip-local-to-isp1
add address=10.10.2.28 comment=tegal-sekar list=ip-local-to-route-isp1
add address=10.10.2.29 comment=tegal-agus list=ip-local-to-route-isp1
add address=10.10.2.30 comment=tegal-anis list=ip-local-to-route-isp1
add address=10.10.2.31 comment=tegal-rini list=ip-local-to-route-isp1
add address=10.10.2.32 comment=tegal-andi list=ip-local-to-route-isp1
add address=10.20.254.3 comment="MIRZA KOMPUTER KAMAR" list=ip-local
add address=10.20.254.4 comment="MIRZA PC KAMAR" list=ip-local
add address=10.20.254.2 comment="MIRZA ROUTER RUMAH" list=ip-local-mirza
add address=10.20.254.3 comment="MIRZA KOMPUTER KAMAR" list=ip-local-mirza
add address=10.123.22.7 list=ip-vpn-lokal
add address=10.10.12.1-10.10.12.254 comment=\
    "    10.10.12.1   -   10.10.12.254" list=z-list-ip-redirect
add address=192.168.55.1-192.168.55.254 comment=\
    "192.168.55.1   -   192.168.55.254" list=z-list-ip-redirect
add address=23.37.192.0/20 list=z-list-ip-isp2
add address=61.247.0.0/18 list=z-list-ip-isp2
add address=61.247.0.0/19 list=z-list-ip-isp2
add address=61.247.32.0/19 list=z-list-ip-isp2
add address=96.7.60.0/22 list=z-list-ip-isp2
add address=111.94.0.0/15 list=z-list-ip-isp2
add address=111.94.0.0/16 list=z-list-ip-isp2
add address=111.94.0.0/19 list=z-list-ip-isp2
add address=111.94.32.0/19 list=z-list-ip-isp2
add address=111.94.64.0/19 list=z-list-ip-isp2
add address=111.94.96.0/19 list=z-list-ip-isp2
add address=111.94.128.0/19 list=z-list-ip-isp2
add address=111.94.160.0/19 list=z-list-ip-isp2
add address=111.94.192.0/19 list=z-list-ip-isp2
add address=111.94.224.0/19 list=z-list-ip-isp2
add address=111.94.252.0/22 list=z-list-ip-isp2
add address=111.95.0.0/16 list=z-list-ip-isp2
add address=111.95.0.0/19 list=z-list-ip-isp2
add address=111.95.32.0/19 list=z-list-ip-isp2
add address=111.95.64.0/19 list=z-list-ip-isp2
add address=111.95.96.0/19 list=z-list-ip-isp2
add address=111.95.128.0/19 list=z-list-ip-isp2
add address=111.95.160.0/19 list=z-list-ip-isp2
add address=111.95.192.0/19 list=z-list-ip-isp2
add address=111.95.224.0/19 list=z-list-ip-isp2
add address=111.95.242.0/24 list=z-list-ip-isp2
add address=111.95.252.0/22 list=z-list-ip-isp2
add address=118.136.0.0/15 list=z-list-ip-isp2
add address=118.136.0.0/16 list=z-list-ip-isp2
add address=118.136.0.0/19 list=z-list-ip-isp2
add address=118.136.32.0/19 list=z-list-ip-isp2
add address=118.136.64.0/19 list=z-list-ip-isp2
add address=118.136.96.0/19 list=z-list-ip-isp2
add address=118.136.128.0/19 list=z-list-ip-isp2
add address=118.136.160.0/19 list=z-list-ip-isp2
add address=118.136.192.0/19 list=z-list-ip-isp2
add address=118.136.224.0/19 list=z-list-ip-isp2
add address=118.137.0.0/16 list=z-list-ip-isp2
add address=118.137.0.0/19 list=z-list-ip-isp2
add address=118.137.32.0/19 list=z-list-ip-isp2
add address=118.137.64.0/19 list=z-list-ip-isp2
add address=118.137.96.0/19 list=z-list-ip-isp2
add address=118.137.128.0/19 list=z-list-ip-isp2
add address=118.137.160.0/19 list=z-list-ip-isp2
add address=118.137.192.0/19 list=z-list-ip-isp2
add address=118.137.224.0/19 list=z-list-ip-isp2
add address=139.0.32.0/19 list=z-list-ip-isp2
add address=139.0.64.0/19 list=z-list-ip-isp2
add address=139.0.96.0/19 list=z-list-ip-isp2
add address=139.0.128.0/19 list=z-list-ip-isp2
add address=139.0.160.0/19 list=z-list-ip-isp2
add address=139.0.192.0/19 list=z-list-ip-isp2
add address=139.0.224.0/19 list=z-list-ip-isp2
add address=139.192.0.0/14 list=z-list-ip-isp2
add address=139.192.0.0/16 list=z-list-ip-isp2
add address=139.192.0.0/19 list=z-list-ip-isp2
add address=139.192.32.0/19 list=z-list-ip-isp2
add address=139.192.64.0/19 list=z-list-ip-isp2
add address=139.192.96.0/19 list=z-list-ip-isp2
add address=139.192.128.0/19 list=z-list-ip-isp2
add address=139.192.160.0/19 list=z-list-ip-isp2
add address=139.192.192.0/19 list=z-list-ip-isp2
add address=139.192.224.0/19 list=z-list-ip-isp2
add address=139.193.0.0/16 list=z-list-ip-isp2
add address=139.193.0.0/19 list=z-list-ip-isp2
add address=139.193.32.0/19 list=z-list-ip-isp2
add address=139.193.64.0/19 list=z-list-ip-isp2
add address=139.193.96.0/19 list=z-list-ip-isp2
add address=139.193.128.0/19 list=z-list-ip-isp2
add address=139.193.160.0/19 list=z-list-ip-isp2
add address=139.193.192.0/19 list=z-list-ip-isp2
add address=139.193.224.0/19 list=z-list-ip-isp2
add address=139.194.0.0/16 list=z-list-ip-isp2
add address=139.194.0.0/19 list=z-list-ip-isp2
add address=139.194.32.0/19 list=z-list-ip-isp2
add address=139.194.64.0/19 list=z-list-ip-isp2
add address=139.194.96.0/19 list=z-list-ip-isp2
add address=139.194.128.0/19 list=z-list-ip-isp2
add address=139.194.160.0/19 list=z-list-ip-isp2
add address=139.194.192.0/19 list=z-list-ip-isp2
add address=139.194.224.0/19 list=z-list-ip-isp2
add address=139.195.32.0/19 list=z-list-ip-isp2
add address=139.195.64.0/19 list=z-list-ip-isp2
add address=139.195.96.0/19 list=z-list-ip-isp2
add address=139.195.128.0/19 list=z-list-ip-isp2
add address=139.195.160.0/19 list=z-list-ip-isp2
add address=139.195.192.0/19 list=z-list-ip-isp2
add address=139.195.224.0/19 list=z-list-ip-isp2
add address=139.228.0.0/16 list=z-list-ip-isp2
add address=139.228.0.0/19 list=z-list-ip-isp2
add address=139.228.32.0/19 list=z-list-ip-isp2
add address=139.228.64.0/19 list=z-list-ip-isp2
add address=139.228.96.0/19 list=z-list-ip-isp2
add address=139.228.128.0/19 list=z-list-ip-isp2
add address=139.228.160.0/19 list=z-list-ip-isp2
add address=139.228.192.0/19 list=z-list-ip-isp2
add address=139.228.224.0/19 list=z-list-ip-isp2
add address=139.255.128.0/19 list=z-list-ip-isp2
add address=139.255.160.0/19 list=z-list-ip-isp2
add address=140.0.0.0/16 list=z-list-ip-isp2
add address=140.0.0.0/19 list=z-list-ip-isp2
add address=140.0.32.0/19 list=z-list-ip-isp2
add address=140.0.64.0/19 list=z-list-ip-isp2
add address=140.0.96.0/19 list=z-list-ip-isp2
add address=140.0.128.0/19 list=z-list-ip-isp2
add address=140.0.160.0/19 list=z-list-ip-isp2
add address=140.0.192.0/19 list=z-list-ip-isp2
add address=140.0.224.0/19 list=z-list-ip-isp2
add address=45.126.184.0/22 list=z-list-ip-isp1
add address=45.126.184.0/24 list=z-list-ip-isp1
add address=45.126.185.0/24 list=z-list-ip-isp1
add address=45.126.186.0/24 list=z-list-ip-isp1
add address=45.126.187.0/24 list=z-list-ip-isp1
add address=103.101.67.0/24 list=z-list-ip-isp1
add address=103.101.228.0/22 list=z-list-ip-isp1
add address=103.105.80.0/22 list=z-list-ip-isp1
add address=103.105.80.0/24 list=z-list-ip-isp1
add address=103.105.81.0/24 list=z-list-ip-isp1
add address=103.105.82.0/24 list=z-list-ip-isp1
add address=103.105.83.0/24 list=z-list-ip-isp1
add address=103.195.56.0/24 list=z-list-ip-isp1
add address=103.195.57.0/24 list=z-list-ip-isp1
add address=103.195.58.0/24 list=z-list-ip-isp1
add address=103.195.59.0/24 list=z-list-ip-isp1
add address=103.208.136.0/24 list=z-list-ip-isp1
add address=103.233.152.0/22 list=z-list-ip-isp1
add address=103.233.152.0/24 list=z-list-ip-isp1
add address=103.233.153.0/24 list=z-list-ip-isp1
add address=103.233.154.0/24 list=z-list-ip-isp1
add address=103.233.155.0/24 list=z-list-ip-isp1
add address=112.78.128.0/24 list=z-list-ip-isp1
add address=112.78.129.0/24 list=z-list-ip-isp1
add address=112.78.130.0/24 list=z-list-ip-isp1
add address=112.78.131.0/24 list=z-list-ip-isp1
add address=112.78.132.0/24 list=z-list-ip-isp1
add address=112.78.133.0/24 list=z-list-ip-isp1
add address=112.78.134.0/24 list=z-list-ip-isp1
add address=112.78.138.0/24 list=z-list-ip-isp1
add address=112.78.139.0/24 list=z-list-ip-isp1
add address=112.78.140.0/24 list=z-list-ip-isp1
add address=112.78.142.0/24 list=z-list-ip-isp1
add address=112.78.143.0/24 list=z-list-ip-isp1
add address=112.78.145.0/24 list=z-list-ip-isp1
add address=112.78.147.0/24 list=z-list-ip-isp1
add address=112.78.148.0/24 list=z-list-ip-isp1
add address=112.78.150.0/24 list=z-list-ip-isp1
add address=112.78.151.0/24 list=z-list-ip-isp1
add address=112.78.152.0/24 list=z-list-ip-isp1
add address=112.78.153.0/24 list=z-list-ip-isp1
add address=112.78.154.0/24 list=z-list-ip-isp1
add address=112.78.155.0/24 list=z-list-ip-isp1
add address=112.78.156.0/24 list=z-list-ip-isp1
add address=112.78.157.0/24 list=z-list-ip-isp1
add address=112.78.158.0/24 list=z-list-ip-isp1
add address=112.78.159.0/24 list=z-list-ip-isp1
add address=112.78.160.0/21 list=z-list-ip-isp1
add address=112.78.168.0/24 list=z-list-ip-isp1
add address=112.78.169.0/24 list=z-list-ip-isp1
add address=112.78.170.0/24 list=z-list-ip-isp1
add address=112.78.171.0/24 list=z-list-ip-isp1
add address=112.78.172.0/24 list=z-list-ip-isp1
add address=112.78.173.0/24 list=z-list-ip-isp1
add address=112.78.174.0/24 list=z-list-ip-isp1
add address=112.78.175.0/24 list=z-list-ip-isp1
add address=112.78.177.0/24 list=z-list-ip-isp1
add address=112.78.178.0/24 list=z-list-ip-isp1
add address=112.78.179.0/24 list=z-list-ip-isp1
add address=112.78.180.0/24 list=z-list-ip-isp1
add address=112.78.181.0/24 list=z-list-ip-isp1
add address=112.78.182.0/24 list=z-list-ip-isp1
add address=112.78.183.0/24 list=z-list-ip-isp1
add address=112.78.184.0/24 list=z-list-ip-isp1
add address=112.78.185.0/24 list=z-list-ip-isp1
add address=112.78.187.0/24 list=z-list-ip-isp1
add address=112.78.188.0/24 list=z-list-ip-isp1
add address=112.78.189.0/24 list=z-list-ip-isp1
add address=112.78.190.0/24 list=z-list-ip-isp1
add address=112.78.191.0/24 list=z-list-ip-isp1
add address=113.11.176.0/24 list=z-list-ip-isp1
add address=113.11.177.0/24 list=z-list-ip-isp1
add address=113.11.178.0/24 list=z-list-ip-isp1
add address=113.11.179.0/24 list=z-list-ip-isp1
add address=113.11.180.0/24 list=z-list-ip-isp1
add address=113.11.181.0/24 list=z-list-ip-isp1
add address=113.11.183.0/24 list=z-list-ip-isp1
add address=117.102.64.0/24 list=z-list-ip-isp1
add address=117.102.66.0/24 list=z-list-ip-isp1
add address=117.102.67.0/24 list=z-list-ip-isp1
add address=117.102.68.0/24 list=z-list-ip-isp1
add address=117.102.69.0/24 list=z-list-ip-isp1
add address=117.102.71.0/24 list=z-list-ip-isp1
add address=117.102.72.0/24 list=z-list-ip-isp1
add address=117.102.74.0/24 list=z-list-ip-isp1
add address=117.102.75.0/24 list=z-list-ip-isp1
add address=117.102.76.0/24 list=z-list-ip-isp1
add address=117.102.77.0/24 list=z-list-ip-isp1
add address=117.102.78.0/24 list=z-list-ip-isp1
add address=117.102.79.0/24 list=z-list-ip-isp1
add address=117.102.81.0/24 list=z-list-ip-isp1
add address=117.102.87.0/24 list=z-list-ip-isp1
add address=117.102.89.0/24 list=z-list-ip-isp1
add address=117.102.91.0/24 list=z-list-ip-isp1
add address=117.102.93.0/24 list=z-list-ip-isp1
add address=117.102.96.0/24 list=z-list-ip-isp1
add address=117.102.97.0/24 list=z-list-ip-isp1
add address=117.102.99.0/24 list=z-list-ip-isp1
add address=117.102.100.0/24 list=z-list-ip-isp1
add address=117.102.105.0/24 list=z-list-ip-isp1
add address=117.102.106.0/24 list=z-list-ip-isp1
add address=117.102.108.0/24 list=z-list-ip-isp1
add address=117.102.109.0/24 list=z-list-ip-isp1
add address=117.102.111.0/24 list=z-list-ip-isp1
add address=117.102.112.0/24 list=z-list-ip-isp1
add address=117.102.115.0/24 list=z-list-ip-isp1
add address=117.102.117.0/24 list=z-list-ip-isp1
add address=117.102.119.0/24 list=z-list-ip-isp1
add address=117.102.121.0/24 list=z-list-ip-isp1
add address=117.102.123.0/24 list=z-list-ip-isp1
add address=117.102.124.0/24 list=z-list-ip-isp1
add address=117.102.125.0/24 list=z-list-ip-isp1
add address=117.102.126.0/24 list=z-list-ip-isp1
add address=117.102.127.0/24 list=z-list-ip-isp1
add address=118.99.64.0/18 list=z-list-ip-isp1
add address=118.99.64.0/24 list=z-list-ip-isp1
add address=118.99.65.0/24 list=z-list-ip-isp1
add address=118.99.66.0/24 list=z-list-ip-isp1
add address=118.99.67.0/24 list=z-list-ip-isp1
add address=118.99.68.0/24 list=z-list-ip-isp1
add address=118.99.69.0/24 list=z-list-ip-isp1
add address=118.99.70.0/24 list=z-list-ip-isp1
add address=118.99.71.0/24 list=z-list-ip-isp1
add address=118.99.72.0/24 list=z-list-ip-isp1
add address=118.99.73.0/24 list=z-list-ip-isp1
add address=118.99.74.0/24 list=z-list-ip-isp1
add address=118.99.75.0/24 list=z-list-ip-isp1
add address=118.99.76.0/24 list=z-list-ip-isp1
add address=118.99.77.0/24 list=z-list-ip-isp1
add address=118.99.78.0/24 list=z-list-ip-isp1
add address=118.99.80.0/24 list=z-list-ip-isp1
add address=118.99.81.0/24 list=z-list-ip-isp1
add address=118.99.82.0/24 list=z-list-ip-isp1
add address=118.99.83.0/24 list=z-list-ip-isp1
add address=118.99.84.0/24 list=z-list-ip-isp1
add address=118.99.87.0/24 list=z-list-ip-isp1
add address=118.99.88.0/24 list=z-list-ip-isp1
add address=118.99.91.0/24 list=z-list-ip-isp1
add address=118.99.92.0/24 list=z-list-ip-isp1
add address=118.99.93.0/24 list=z-list-ip-isp1
add address=118.99.94.0/24 list=z-list-ip-isp1
add address=118.99.95.0/24 list=z-list-ip-isp1
add address=118.99.97.0/24 list=z-list-ip-isp1
add address=118.99.98.0/23 list=z-list-ip-isp1
add address=118.99.100.0/24 list=z-list-ip-isp1
add address=118.99.101.0/24 list=z-list-ip-isp1
add address=118.99.102.0/23 list=z-list-ip-isp1
add address=118.99.104.0/24 list=z-list-ip-isp1
add address=118.99.105.0/24 list=z-list-ip-isp1
add address=118.99.106.0/24 list=z-list-ip-isp1
add address=118.99.107.0/24 list=z-list-ip-isp1
add address=118.99.108.0/24 list=z-list-ip-isp1
add address=118.99.109.0/24 list=z-list-ip-isp1
add address=118.99.110.0/24 list=z-list-ip-isp1
add address=118.99.111.0/24 list=z-list-ip-isp1
add address=118.99.112.0/24 list=z-list-ip-isp1
add address=118.99.114.0/23 list=z-list-ip-isp1
add address=118.99.116.0/24 list=z-list-ip-isp1
add address=118.99.117.0/24 list=z-list-ip-isp1
add address=118.99.118.0/24 list=z-list-ip-isp1
add address=118.99.119.0/24 list=z-list-ip-isp1
add address=118.99.120.0/24 list=z-list-ip-isp1
add address=118.99.121.0/24 list=z-list-ip-isp1
add address=118.99.122.0/24 list=z-list-ip-isp1
add address=118.99.123.0/24 list=z-list-ip-isp1
add address=118.99.124.0/24 list=z-list-ip-isp1
add address=118.99.125.0/24 list=z-list-ip-isp1
add address=118.99.126.0/23 list=z-list-ip-isp1
add address=118.99.126.0/24 list=z-list-ip-isp1
add address=118.99.127.0/24 list=z-list-ip-isp1
add address=180.87.86.0/24 list=z-list-ip-isp1
add address=182.253.2.0/24 list=z-list-ip-isp1
add address=182.253.4.0/24 list=z-list-ip-isp1
add address=182.253.6.0/24 list=z-list-ip-isp1
add address=182.253.7.0/24 list=z-list-ip-isp1
add address=182.253.8.0/24 list=z-list-ip-isp1
add address=182.253.9.0/24 list=z-list-ip-isp1
add address=182.253.10.0/24 list=z-list-ip-isp1
add address=182.253.12.0/24 list=z-list-ip-isp1
add address=182.253.13.0/24 list=z-list-ip-isp1
add address=182.253.14.0/24 list=z-list-ip-isp1
add address=182.253.16.0/24 list=z-list-ip-isp1
add address=182.253.20.0/24 list=z-list-ip-isp1
add address=182.253.21.0/24 list=z-list-ip-isp1
add address=182.253.22.0/24 list=z-list-ip-isp1
add address=182.253.24.0/24 list=z-list-ip-isp1
add address=182.253.25.0/24 list=z-list-ip-isp1
add address=182.253.26.0/24 list=z-list-ip-isp1
add address=182.253.31.0/24 list=z-list-ip-isp1
add address=182.253.33.0/24 list=z-list-ip-isp1
add address=182.253.35.0/24 list=z-list-ip-isp1
add address=182.253.37.0/24 list=z-list-ip-isp1
add address=182.253.38.0/24 list=z-list-ip-isp1
add address=182.253.39.0/24 list=z-list-ip-isp1
add address=182.253.42.0/24 list=z-list-ip-isp1
add address=182.253.43.0/24 list=z-list-ip-isp1
add address=182.253.44.0/24 list=z-list-ip-isp1
add address=182.253.47.0/24 list=z-list-ip-isp1
add address=182.253.48.0/23 list=z-list-ip-isp1
add address=182.253.48.0/24 list=z-list-ip-isp1
add address=182.253.49.0/24 list=z-list-ip-isp1
add address=182.253.50.0/24 list=z-list-ip-isp1
add address=182.253.51.0/24 list=z-list-ip-isp1
add address=182.253.52.0/24 list=z-list-ip-isp1
add address=182.253.53.0/24 list=z-list-ip-isp1
add address=182.253.54.0/24 list=z-list-ip-isp1
add address=182.253.57.0/24 list=z-list-ip-isp1
add address=182.253.58.0/24 list=z-list-ip-isp1
add address=182.253.59.0/24 list=z-list-ip-isp1
add address=182.253.61.0/24 list=z-list-ip-isp1
add address=182.253.62.0/24 list=z-list-ip-isp1
add address=182.253.63.0/24 list=z-list-ip-isp1
add address=182.253.64.0/24 list=z-list-ip-isp1
add address=182.253.65.0/24 list=z-list-ip-isp1
add address=182.253.66.0/24 list=z-list-ip-isp1
add address=182.253.67.0/24 list=z-list-ip-isp1
add address=182.253.69.0/24 list=z-list-ip-isp1
add address=182.253.70.0/24 list=z-list-ip-isp1
add address=182.253.72.0/24 list=z-list-ip-isp1
add address=182.253.73.0/24 list=z-list-ip-isp1
add address=182.253.74.0/24 list=z-list-ip-isp1
add address=182.253.75.0/24 list=z-list-ip-isp1
add address=182.253.76.0/24 list=z-list-ip-isp1
add address=182.253.77.0/24 list=z-list-ip-isp1
add address=182.253.78.0/24 list=z-list-ip-isp1
add address=182.253.79.0/24 list=z-list-ip-isp1
add address=182.253.80.0/24 list=z-list-ip-isp1
add address=182.253.81.0/24 list=z-list-ip-isp1
add address=182.253.82.0/24 list=z-list-ip-isp1
add address=182.253.83.0/24 list=z-list-ip-isp1
add address=182.253.84.0/24 list=z-list-ip-isp1
add address=182.253.86.0/24 list=z-list-ip-isp1
add address=182.253.88.0/23 list=z-list-ip-isp1
add address=182.253.89.0/24 list=z-list-ip-isp1
add address=182.253.90.0/24 list=z-list-ip-isp1
add address=182.253.92.0/24 list=z-list-ip-isp1
add address=182.253.93.0/24 list=z-list-ip-isp1
add address=182.253.94.0/24 list=z-list-ip-isp1
add address=182.253.95.0/24 list=z-list-ip-isp1
add address=182.253.96.0/24 list=z-list-ip-isp1
add address=182.253.97.0/24 list=z-list-ip-isp1
add address=182.253.98.0/24 list=z-list-ip-isp1
add address=182.253.99.0/24 list=z-list-ip-isp1
add address=182.253.100.0/24 list=z-list-ip-isp1
add address=182.253.102.0/24 list=z-list-ip-isp1
add address=182.253.103.0/24 list=z-list-ip-isp1
add address=182.253.104.0/24 list=z-list-ip-isp1
add address=182.253.105.0/24 list=z-list-ip-isp1
add address=182.253.106.0/24 list=z-list-ip-isp1
add address=182.253.107.0/24 list=z-list-ip-isp1
add address=182.253.108.0/24 list=z-list-ip-isp1
add address=182.253.109.0/24 list=z-list-ip-isp1
add address=182.253.110.0/24 list=z-list-ip-isp1
add address=182.253.111.0/24 list=z-list-ip-isp1
add address=182.253.112.0/24 list=z-list-ip-isp1
add address=182.253.113.0/24 list=z-list-ip-isp1
add address=182.253.114.0/24 list=z-list-ip-isp1
add address=182.253.115.0/24 list=z-list-ip-isp1
add address=182.253.116.0/24 list=z-list-ip-isp1
add address=182.253.117.0/24 list=z-list-ip-isp1
add address=182.253.118.0/24 list=z-list-ip-isp1
add address=182.253.119.0/24 list=z-list-ip-isp1
add address=182.253.120.0/24 list=z-list-ip-isp1
add address=182.253.121.0/24 list=z-list-ip-isp1
add address=182.253.122.0/24 list=z-list-ip-isp1
add address=182.253.123.0/24 list=z-list-ip-isp1
add address=182.253.124.0/24 list=z-list-ip-isp1
add address=182.253.125.0/24 list=z-list-ip-isp1
add address=182.253.126.0/24 list=z-list-ip-isp1
add address=182.253.127.0/24 list=z-list-ip-isp1
add address=182.253.128.0/24 list=z-list-ip-isp1
add address=182.253.129.0/24 list=z-list-ip-isp1
add address=182.253.130.0/24 list=z-list-ip-isp1
add address=182.253.131.0/24 list=z-list-ip-isp1
add address=182.253.132.0/24 list=z-list-ip-isp1
add address=182.253.133.0/24 list=z-list-ip-isp1
add address=182.253.134.0/24 list=z-list-ip-isp1
add address=182.253.135.0/24 list=z-list-ip-isp1
add address=182.253.136.0/24 list=z-list-ip-isp1
add address=182.253.137.0/24 list=z-list-ip-isp1
add address=182.253.139.0/24 list=z-list-ip-isp1
add address=182.253.140.0/24 list=z-list-ip-isp1
add address=182.253.141.0/24 list=z-list-ip-isp1
add address=182.253.142.0/24 list=z-list-ip-isp1
add address=182.253.143.0/24 list=z-list-ip-isp1
add address=182.253.145.0/24 list=z-list-ip-isp1
add address=182.253.146.0/24 list=z-list-ip-isp1
add address=182.253.147.0/24 list=z-list-ip-isp1
add address=182.253.148.0/24 list=z-list-ip-isp1
add address=182.253.149.0/24 list=z-list-ip-isp1
add address=182.253.150.0/24 list=z-list-ip-isp1
add address=182.253.151.0/24 list=z-list-ip-isp1
add address=182.253.152.0/22 list=z-list-ip-isp1
add address=182.253.156.0/24 list=z-list-ip-isp1
add address=182.253.157.0/24 list=z-list-ip-isp1
add address=182.253.158.0/23 list=z-list-ip-isp1
add address=182.253.160.0/23 list=z-list-ip-isp1
add address=182.253.162.0/24 list=z-list-ip-isp1
add address=182.253.163.0/24 list=z-list-ip-isp1
add address=182.253.164.0/23 list=z-list-ip-isp1
add address=182.253.164.0/24 list=z-list-ip-isp1
add address=182.253.165.0/24 list=z-list-ip-isp1
add address=182.253.166.0/24 list=z-list-ip-isp1
add address=182.253.167.0/24 list=z-list-ip-isp1
add address=182.253.168.0/22 list=z-list-ip-isp1
add address=182.253.172.0/22 list=z-list-ip-isp1
add address=182.253.176.0/22 list=z-list-ip-isp1
add address=182.253.180.0/24 list=z-list-ip-isp1
add address=182.253.181.0/24 list=z-list-ip-isp1
add address=182.253.182.0/24 list=z-list-ip-isp1
add address=182.253.183.0/24 list=z-list-ip-isp1
add address=182.253.184.0/24 list=z-list-ip-isp1
add address=182.253.185.0/24 list=z-list-ip-isp1
add address=182.253.186.0/24 list=z-list-ip-isp1
add address=182.253.187.0/24 list=z-list-ip-isp1
add address=182.253.188.0/24 list=z-list-ip-isp1
add address=182.253.189.0/24 list=z-list-ip-isp1
add address=182.253.191.0/24 list=z-list-ip-isp1
add address=182.253.192.0/24 list=z-list-ip-isp1
add address=182.253.193.0/24 list=z-list-ip-isp1
add address=182.253.194.0/24 list=z-list-ip-isp1
add address=182.253.195.0/24 list=z-list-ip-isp1
add address=182.253.196.0/24 list=z-list-ip-isp1
add address=182.253.197.0/24 list=z-list-ip-isp1
add address=182.253.198.0/24 list=z-list-ip-isp1
add address=182.253.199.0/24 list=z-list-ip-isp1
add address=182.253.200.0/24 list=z-list-ip-isp1
add address=182.253.202.0/24 list=z-list-ip-isp1
add address=182.253.203.0/24 list=z-list-ip-isp1
add address=182.253.206.0/24 list=z-list-ip-isp1
add address=182.253.207.0/24 list=z-list-ip-isp1
add address=182.253.208.0/24 list=z-list-ip-isp1
add address=182.253.209.0/24 list=z-list-ip-isp1
add address=182.253.211.0/24 list=z-list-ip-isp1
add address=182.253.212.0/24 list=z-list-ip-isp1
add address=182.253.213.0/24 list=z-list-ip-isp1
add address=182.253.214.0/24 list=z-list-ip-isp1
add address=182.253.215.0/24 list=z-list-ip-isp1
add address=182.253.216.0/24 list=z-list-ip-isp1
add address=182.253.217.0/24 list=z-list-ip-isp1
add address=182.253.218.0/24 list=z-list-ip-isp1
add address=182.253.219.0/24 list=z-list-ip-isp1
add address=182.253.220.0/24 list=z-list-ip-isp1
add address=182.253.223.0/24 list=z-list-ip-isp1
add address=182.253.224.0/24 list=z-list-ip-isp1
add address=182.253.225.0/24 list=z-list-ip-isp1
add address=182.253.227.0/24 list=z-list-ip-isp1
add address=182.253.228.0/24 list=z-list-ip-isp1
add address=182.253.229.0/24 list=z-list-ip-isp1
add address=182.253.230.0/23 list=z-list-ip-isp1
add address=182.253.232.0/22 list=z-list-ip-isp1
add address=182.253.237.0/24 list=z-list-ip-isp1
add address=182.253.239.0/24 list=z-list-ip-isp1
add address=182.253.241.0/24 list=z-list-ip-isp1
add address=182.253.242.0/24 list=z-list-ip-isp1
add address=182.253.243.0/24 list=z-list-ip-isp1
add address=182.253.244.0/24 list=z-list-ip-isp1
add address=182.253.245.0/24 list=z-list-ip-isp1
add address=182.253.246.0/23 list=z-list-ip-isp1
add address=182.253.248.0/24 list=z-list-ip-isp1
add address=182.253.249.0/24 list=z-list-ip-isp1
add address=182.253.250.0/24 list=z-list-ip-isp1
add address=182.253.251.0/24 list=z-list-ip-isp1
add address=182.253.252.0/24 list=z-list-ip-isp1
add address=182.253.253.0/24 list=z-list-ip-isp1
add address=182.253.254.0/24 list=z-list-ip-isp1
add address=182.253.255.0/24 list=z-list-ip-isp1
add address=202.169.32.0/24 list=z-list-ip-isp1
add address=202.169.33.0/24 list=z-list-ip-isp1
add address=202.169.34.0/24 list=z-list-ip-isp1
add address=202.169.35.0/24 list=z-list-ip-isp1
add address=202.169.36.0/24 list=z-list-ip-isp1
add address=202.169.37.0/24 list=z-list-ip-isp1
add address=202.169.38.0/24 list=z-list-ip-isp1
add address=202.169.40.0/24 list=z-list-ip-isp1
add address=202.169.41.0/24 list=z-list-ip-isp1
add address=202.169.42.0/24 list=z-list-ip-isp1
add address=202.169.44.0/24 list=z-list-ip-isp1
add address=202.169.45.0/24 list=z-list-ip-isp1
add address=202.169.46.0/24 list=z-list-ip-isp1
add address=202.169.47.0/24 list=z-list-ip-isp1
add address=202.169.48.0/24 list=z-list-ip-isp1
add address=202.169.50.0/24 list=z-list-ip-isp1
add address=202.169.52.0/24 list=z-list-ip-isp1
add address=202.169.53.0/24 list=z-list-ip-isp1
add address=202.169.54.0/24 list=z-list-ip-isp1
add address=202.169.56.0/24 list=z-list-ip-isp1
add address=202.169.57.0/24 list=z-list-ip-isp1
add address=202.169.59.0/24 list=z-list-ip-isp1
add address=202.169.60.0/24 list=z-list-ip-isp1
add address=202.169.61.0/24 list=z-list-ip-isp1
add address=202.169.63.0/24 list=z-list-ip-isp1
add address=203.142.64.0/24 list=z-list-ip-isp1
add address=203.142.65.0/24 list=z-list-ip-isp1
add address=203.142.66.0/24 list=z-list-ip-isp1
add address=203.142.67.0/24 list=z-list-ip-isp1
add address=203.142.68.0/24 list=z-list-ip-isp1
add address=203.142.71.0/24 list=z-list-ip-isp1
add address=203.142.72.0/24 list=z-list-ip-isp1
add address=203.142.73.0/24 list=z-list-ip-isp1
add address=203.142.74.0/24 list=z-list-ip-isp1
add address=203.142.75.0/24 list=z-list-ip-isp1
add address=203.142.76.0/24 list=z-list-ip-isp1
add address=203.142.77.0/24 list=z-list-ip-isp1
add address=203.142.78.0/24 list=z-list-ip-isp1
add address=203.142.79.0/24 list=z-list-ip-isp1
add address=203.142.82.0/24 list=z-list-ip-isp1
add address=203.142.83.0/24 list=z-list-ip-isp1
add address=203.142.84.0/24 list=z-list-ip-isp1
add address=203.142.86.0/24 list=z-list-ip-isp1
add address=203.142.87.0/24 list=z-list-ip-isp1
add address=8.34.208.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=8.35.192.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=23.236.48.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=23.251.128.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.0.0.0/15 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.2.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.0.0/23 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.3.0/24 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.4.0/24 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.8.0/21 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.16.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.32.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.64.0/18 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.3.128.0/17 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.4.0.0/14 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.8.0.0/13 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.16.0.0/12 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.32.0.0/11 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.64.0.0/10 comment=MNET-GOOGLE list=z-list-ip-google
add address=34.128.0.0/10 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.184.0.0/13 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.192.0.0/14 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.196.0.0/15 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.198.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.199.0.0/17 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.199.128.0/18 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.200.0.0/13 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.208.0.0/12 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.224.0.0/12 comment=MNET-GOOGLE list=z-list-ip-google
add address=35.240.0.0/13 comment=MNET-GOOGLE list=z-list-ip-google
add address=64.15.112.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=64.233.160.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=66.22.228.0/23 comment=MNET-GOOGLE list=z-list-ip-google
add address=66.102.0.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=66.249.64.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=70.32.128.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=72.14.192.0/18 comment=MNET-GOOGLE list=z-list-ip-google
add address=74.125.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=104.154.0.0/15 comment=MNET-GOOGLE list=z-list-ip-google
add address=104.196.0.0/14 comment=MNET-GOOGLE list=z-list-ip-google
add address=104.237.160.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=107.167.160.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=107.178.192.0/18 comment=MNET-GOOGLE list=z-list-ip-google
add address=108.59.80.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=108.170.192.0/18 comment=MNET-GOOGLE list=z-list-ip-google
add address=108.177.0.0/17 comment=MNET-GOOGLE list=z-list-ip-google
add address=130.211.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=142.250.0.0/15 comment=MNET-GOOGLE list=z-list-ip-google
add address=146.148.0.0/17 comment=MNET-GOOGLE list=z-list-ip-google
add address=162.216.148.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=162.222.176.0/21 comment=MNET-GOOGLE list=z-list-ip-google
add address=172.110.32.0/21 comment=MNET-GOOGLE list=z-list-ip-google
add address=172.217.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=172.253.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=173.194.0.0/16 comment=MNET-GOOGLE list=z-list-ip-google
add address=173.255.112.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=192.158.28.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=192.178.0.0/15 comment=MNET-GOOGLE list=z-list-ip-google
add address=193.186.4.0/24 comment=MNET-GOOGLE list=z-list-ip-google
add address=199.36.154.0/23 comment=MNET-GOOGLE list=z-list-ip-google
add address=199.36.156.0/24 comment=MNET-GOOGLE list=z-list-ip-google
add address=199.192.112.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=199.223.232.0/21 comment=MNET-GOOGLE list=z-list-ip-google
add address=207.223.160.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=208.65.152.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=208.68.108.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=208.81.188.0/22 comment=MNET-GOOGLE list=z-list-ip-google
add address=208.117.224.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=209.85.128.0/17 comment=MNET-GOOGLE list=z-list-ip-google
add address=216.58.192.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=216.73.80.0/20 comment=MNET-GOOGLE list=z-list-ip-google
add address=216.239.32.0/19 comment=MNET-GOOGLE list=z-list-ip-google
add address=10.20.254.4 comment="MIRZA PC KAMAR" disabled=yes list=\
    ip-local-dns-khusus
add address=10.20.254.3 comment="MIRZA KOMPUTER KAMAR" disabled=yes list=\
    ip-local-dns-khusus
add address=43.254.127.234 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=58.147.188.41 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=103.197.188.181 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=151.101.86.219 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=202.3.78.3 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=203.6.148.212 comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=account.hotspotshield.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=alleasyseo.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ambon.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=apac-sg-ookla1.offsitedatasync.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=api.fast.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.ip2location.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=api.mxtoolbox.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.speedspot.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.tunnelbear.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=astrill.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=att-services.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=balikpapan.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=bandung.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=banjarmasin.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=batam.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=bdg-speedtest.link.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=bearsmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=bgp.he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=bittrex.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=browserleaks.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=c.speedtest.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=c.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=cactusvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=cbn.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=cekipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=check-host.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=checkip.dyndns.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=checkip.perfect-privacy.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=co2speedtest1.starhub.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=corebdo1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=corebth4.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=corecgk1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=corecgk2.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=coredps1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=corepku1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=coreplm1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=coresoc1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=coresub1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=coreupg1.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=denpasar.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=dnschecker.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=dnsleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=dnsleaktest.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=dualstack.zd.map.fastly.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=encodable.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=expressvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=fast.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=fireprobe.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=goldenfrog.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=gurgle.speedtest.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=hide.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=id.wizcase.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ifconfig.co comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=income.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=inet-ip.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=inmotionhosting.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ip-adress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip-adress.eu comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip2location.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip4.host comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip.nf comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip.zscaler.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipaddress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipaddress.my comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipapi.co comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipburger.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipchicken.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipcost.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipcow.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iperf-1.ntt.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipinfo.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipinfo.io comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipku.in comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipleak.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplocation.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplocation.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iplogger.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipstack.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipv4.lookup.test-ipv6.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ipvanish.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ipvoid.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ispeedtest.bpk.go.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=jakarta.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=jayapura.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=jkt-speedtest.fast.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=jkt1.speedtest.tri.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=jkt1-speedtest.smartfren.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=kinsta.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=knrpc.olark.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=kuta.speedtest.gratis.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=locator.atlasvpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=m1speedtest1.m1net.com.sg comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=m.wolframalpha.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=mainspeedtest.nap.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=makasar.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=manado.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=mapi.clearlink.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=mataram.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=maxmind.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=medan.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=mm1.unnes.ac.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mw.ipburger.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mxtoolbox.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=my-ip-finder.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mybrowserinfo.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=myglobalip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=myip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=myipaddress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=namecheap.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=net.etrality.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=nms-bdg.neuviz.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=noc.kemdikbud.go.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=noc.unsrat.ac.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=nordvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ookla-id1.buana.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ookla.uii.ac.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ookla.usonyx.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ooklaspeed.axarva.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=overplay.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=padi.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=palembang.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=passwordsgenerator.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=pekanbaru.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=perfect-privacy.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=prd.nperf.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=privateinternetaccess.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=purevpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=realip.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=sby-speedtest.link.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sby1-speedtest.smartfren.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=semarang.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sg-speedtest.fast.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sgspeedtest.nap.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=showmyipaddress.eu comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=showmyisp.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=sin.speedtest.interoute.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sorong.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sp1.infotek.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sp1.jogjamedianet.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sp1.solnet.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=sp1.swin.co.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=sp1-jkt.wowrack.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sp1-sby.wowrack.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=sp.uny.ac.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=spd1.inti.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speed.cloudflare.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speed.mncplay.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speed.ui.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedcheckerapi.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedinternet.varnion.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedof.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedsmart.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest-1.wanxp.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-bali.biznetgiocloud.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-bali.hyper.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-bali.hypernet.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-bdg.hyper.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-btm.moratelindo.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-idc.hypernet.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-iix.xl.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-iix.xl.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-intl.xl.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-intl.xl.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-ix.idola.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-jkt1.skyline.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-jkt.hypernet.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-mdn.moratelindo.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-sby.hyper.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-sby.moratelindo.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest-smg.hypernet.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.bali.ldp.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.boltsuper4g.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.inet.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.jlm.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.moratelindo.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.oss.myrepublic.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest1.telkomsel.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest2.centrin.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest2.starnet.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest2.telkomsel.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest2.unud.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest07.fpt.vn comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest08.fpt.vn comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest10.vqbn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.angkasa.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.balifiber.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.bitek.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.biznetgiocloud.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.biznetnetworks.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.cbn.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.cbn.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.channel-11.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.cifo.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.circleone.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.citra.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.cni.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.com.sg comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.crypto.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.cyberplus.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.dash.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.dtp.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.googlefiber.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.houtos.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.iconpln.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.idola.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.indosat.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.jatengprov.go.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.jinom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.jogja.citra.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.kemsos.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.link.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.lungit.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.maxindo.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.mtmbali.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.mybroadband.co.za comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.myrepublic.com.sg comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.net1.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.net.in comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=speedtest.netpluz.asia comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.nusa.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.orion.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.padinet.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.pesat.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.powertel.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.primacom.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.qiandra.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.routelink.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sby.datautama.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sby.dnet.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sdi.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sg.bgp.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.singnet.com.sg comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sng01.softlayer.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.solo.citra.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.starnet.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.sti-group.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.super.net.sg comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.tachyon.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.telin.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.turbo.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.ub.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.ugm.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.uin-suka.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.unair.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.unsyiah.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.unud.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.upg.crypto.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.varnion.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.vodien.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtest.yam.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestdps1.gmedia.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestmlg1.gmedia.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestserver.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestsmg1.gmedia.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=speedtestyk1.gmedia.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=spyber.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=st1.unpad.ac.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=surabaya.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=surfshark.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ternate.speedtest.telkom.co.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=test-ipv6.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=test.ads.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=test.neuviz.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=testspeed.melsa.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=timika.speedtest.telkom.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=tools.ip2location.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=touch.whatsmyip.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ultratools.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=v4.myipstack.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=vermiip.es comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=vps5.vianet.com.np comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=vyprvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=what-is-my-ipv4.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismyasn.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismybrowser.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismycountry.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismyip4.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.host comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.li comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.live comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.network comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyipaddress.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatismypublicip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whatsmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyip.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatsmyrouterip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=whoer.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whoismyisp.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=wolframalpha.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ws-ipv4.nperf.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=wtfismyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.alleasyseo.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.astrill.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.att-services.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.bearsmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.bgp.he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.bittrex.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.browserleaks.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.c.speedtest.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.c.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.cactusvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.cbn.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.cekipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.check-host.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.dnschecker.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.dnsleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.dnsleaktest.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.encodable.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.expressvpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.fast.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.fireprobe.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.goldenfrog.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.gurgle.speedtest.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.he.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.hide.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.income.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.inmotionhosting.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ip-adress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ip-adress.eu comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ip2location.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ip4.host comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ip.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ip.nf comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipaddress.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipaddress.my comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipapi.co comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipburger.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipchicken.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipcost.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipcow.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipinfo.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipinfo.io comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipku.in comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipleak.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipleak.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.iplocation.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.iplocation.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.iplogger.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipsaya.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipstack.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipvanish.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ipvoid.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.kinsta.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.maxmind.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.mxtoolbox.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.my-ip-finder.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.mybrowserinfo.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.myglobalip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.myip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.myipaddress.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.namecheap.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.nordvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.ookla.uii.ac.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.overplay.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.padi.net.id comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.passwordsgenerator.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.perfect-privacy.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.privateinternetaccess.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.purevpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.realip.info comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.showmyipaddress.eu comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.showmyisp.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.sp1.jogjamedianet.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedcheckerapi.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedof.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.speedsmart.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest1.boltsuper4g.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.cbn.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.com.sg comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.houtos.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.idola.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.lungit.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.mybroadband.co.za comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.speedtest.net.cdn.cloudflare.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtest.net.in comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtestcustom.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.speedtestserver.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.spyber.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.surfshark.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.test-ipv6.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.test.ads.net.id comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.touch.whatsmyip.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.ultratools.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.vermiip.es comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.vyprvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.what-is-my-ipv4.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyasn.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismybrowser.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismycountry.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip4.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.host comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.li comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatismyip.live comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.net comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.network comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyip.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismyipaddress.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatismypublicip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whatsmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatsmyip.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatsmyip.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatsmyrouterip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.whoer.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whoismyisp.org comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.wolframalpha.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.wtfismyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.xmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.yougetsignal.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.zenmate.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=xmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=yougetsignal.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=zd.map.fastly.net comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=zenmate.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.whatismyip.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=pro.ip-api.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=iptools-4.top10vpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=www.showmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=showmyip.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=ip-info.ff.avast.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=myip.veepn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=zoogvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=whatismyip.uno comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.whatismyip-address.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=iplocation.io comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=app.uptrends.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api.ipify.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=api64.ipify.org comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=www.name.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=mylocationnow.io comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=proxylist.geonode.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=brightvpn.com comment=MNET-SPEEDTEST list=z-list-ip-speedtest
add address=check.privadovpn.com comment=MNET-SPEEDTEST list=\
    z-list-ip-speedtest
add address=ifconfig.me comment=MNET-SPEEDTEST list=z-list-ip-speedtest
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=fasttrack-connection chain=input comment=\
    "BYPASS KE ROUTER RUMAH & PC MIRZA" dst-address-list=!z-list-ip-speedtest \
    src-address-list=ip-local-mirza
add action=fasttrack-connection chain=forward dst-address-list=\
    !z-list-ip-speedtest src-address-list=ip-local-mirza
add action=fasttrack-connection chain=forward dst-address-list=ip-local-mirza \
    src-address-list=!z-list-ip-speedtest
add action=accept chain=forward comment="*****MIRZA ACCEPT**********MIRZA ACCE\
    PT**********MIRZA ACCEPT**********MIRZA ACCEPT**********MIRZA ACCEPT******\
    ****MIRZA ACCEPT**********MIRZA ACCEPT**********MIRZA ACCEPT**********MIRZ\
    A ACCEPT**********" src-address-list=ip-local-mirza
add action=drop chain=forward comment=\
    "                DROP ping ke modem isp" dst-address-list=ip-modem-isp \
    protocol=icmp src-address-list=ip-local
add action=accept chain=input comment="                ACCEPT  ping" limit=\
    5,6:packet protocol=icmp src-address=172.16.0.0/12
add action=drop chain=forward comment="                DROP ping" \
    dst-address-list=z-list-ip-redirect packet-size=!0-800 protocol=icmp
add action=drop chain=forward dst-address-list=z-list-ip-redirect fragment=\
    yes protocol=icmp
add action=drop chain=input packet-size=!0-800 protocol=icmp
add action=drop chain=input fragment=yes protocol=icmp
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
add action=accept chain=input comment="                DROP SYN Flood protect \
    | /ip settings set tcp-syncookies=yes" disabled=yes src-address-list=\
    ip-local-mirza
add action=jump chain=input connection-state=new disabled=yes jump-target=\
    SYN-input protocol=tcp tcp-flags=syn
add action=accept chain=SYN-input connection-state=new disabled=yes limit=\
    400,5:packet protocol=tcp tcp-flags=syn
add action=drop chain=SYN-input connection-state=new disabled=yes protocol=\
    tcp tcp-flags=syn
/ip firewall mangle
add action=mark-routing chain=prerouting comment=\
    "                Routing IP VPN > ISP 2" dst-address-list=ip-vpn-publik \
    new-routing-mark=ether1 passthrough=no src-address=10.10.12.2
add action=mark-routing chain=prerouting comment=\
    "                BYPASS speedtest" dst-address-list=z-list-ip-speedtest \
    dst-port=80,443,5060 new-routing-mark=vpn passthrough=no protocol=tcp \
    src-address-list=ip-local
add action=accept chain=prerouting comment="*****MIRZA ACCEPT**********MIRZA A\
    CCEPT**********MIRZA ACCEPT**********MIRZA ACCEPT**********MIRZA ACCEPT***\
    *******MIRZA ACCEPT**********MIRZA ACCEPT**********MIRZA ACCEPT**********M\
    IRZA ACCEPT**********" src-address-list=ip-local-mirza
add action=jump chain=forward dst-address-list=z-list-ip-speedtest dst-port=\
    80,443,5060 jump-target=vip protocol=tcp src-address-list=ip-local
add action=jump chain=forward dst-address-list=ip-local jump-target=vip \
    protocol=tcp src-address-list=z-list-ip-speedtest src-port=80,443,5060
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
    "                ROUTING bgp isp1 > isp1" disabled=yes dst-address-list=\
    z-list-ip-isp1 new-routing-mark=ether1 passthrough=no src-address-list=\
    ip-local-to-route-isp1
add action=mark-routing chain=prerouting comment=\
    "                ROUTING bgp isp2 > isp2" disabled=yes dst-address-list=\
    z-list-ip-isp2 new-routing-mark=ether2 passthrough=no src-address-list=\
    ip-local-to-route-isp1
add action=mark-routing chain=prerouting comment=\
    "                ROUTING Google" disabled=yes dst-address-list=\
    z-list-ip-google new-routing-mark=ether1 passthrough=no src-address-list=\
    ip-local-to-route-isp1
add action=mark-routing chain=prerouting comment=\
    "                ROUTING Tiktok" disabled=yes dst-address-list=\
    zz-list-raw-ip-tiktok new-routing-mark=ether1 passthrough=no \
    src-address-list=ip-local-to-route-isp1
add action=mark-routing chain=prerouting comment=\
    "                ROUTING koneksi" dst-address-list=!ip-modem-isp \
    new-routing-mark=ether1 passthrough=no src-address-list=ip-local-to-isp1
add action=mark-routing chain=prerouting dst-address-list=!ip-modem-isp \
    new-routing-mark=ether2 passthrough=no src-address-list=ip-local-to-isp2
add action=change-ttl chain=forward comment=\
    "                DISABLE hotspot tethering" dst-address=172.16.0.0/22 \
    new-ttl=set:1 passthrough=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.7 \
    to-ports=53
add action=dst-nat chain=dstnat comment=vpn1 dst-port=53,5353,853 protocol=\
    tcp src-address-list=ip-local-dns-khusus to-addresses=10.123.22.7 \
    to-ports=53
add action=redirect chain=dstnat comment=\
    "                REDIRECT dns > router ini" dst-port=53 protocol=udp \
    to-ports=53
add action=redirect chain=dstnat dst-port=53 protocol=tcp to-ports=53
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT port vpn > lokal / router ini" dst-address=\
    103.143.170.11 dst-port=8299 protocol=tcp to-addresses=10.20.254.1 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.143.170.11 dst-port=8399 \
    protocol=tcp to-addresses=10.20.254.2 to-ports=8291
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT vpn > router ini" dst-port=8291 protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=10.20.254.1 to-ports=8291
add action=dst-nat chain=dstnat dst-port=8728 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=10.20.254.1 to-ports=8728
add action=dst-nat chain=dstnat dst-port=8085 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=10.20.254.1 to-ports=8085
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT modem isp > vpn" dst-port=14561 protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=192.168.18.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14562 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.23.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14563 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.24.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14564 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.24.1 to-ports=80
add action=dst-nat chain=dstnat dst-port=14565 protocol=tcp src-address-list=\
    ip-vpn-lokal to-addresses=192.168.24.1 to-ports=80
add action=masquerade chain=srcnat dst-address-list=ip-modem-isp \
    src-address-list=ip-vpn-lokal
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT lokal > vpn | OMNITIK | vpn.mnet.my.id:14446" \
    dst-port=14446 protocol=tcp src-address-list=ip-vpn-lokal to-addresses=\
    192.168.55.6 to-ports=8291
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT vpn > pc mirza" disabled=yes protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=10.20.254.3
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT vpn > router rumah" dst-port=80 protocol=tcp \
    src-address-list=ip-vpn-lokal to-addresses=10.20.254.2 to-ports=81
add action=dst-nat chain=dstnat protocol=tcp src-address-list=ip-vpn-lokal \
    to-addresses=10.20.254.2
add action=masquerade chain=srcnat dst-address-list=ip-local-mirza \
    src-address-list=ip-vpn-lokal
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT backup ftp lokal > vps mnet" dst-address=\
    192.168.55.1 dst-port=21 protocol=tcp src-address=192.168.55.0/24 \
    to-addresses=103.143.170.11 to-ports=21
add action=dst-nat chain=dstnat comment=\
    "                REDIRECT login page:80 > vps mnet" dst-address-list=\
    z-list-ip-redirect dst-port=80,8080,443 protocol=tcp src-address-list=\
    z-list-ip-redirect to-addresses=103.143.170.11 to-ports=80
add action=dst-nat chain=dstnat dst-address-list=z-list-ip-web-blokir \
    dst-port=80,443 protocol=tcp src-address-list=z-list-ip-redirect \
    to-addresses=149.154.167.99
add action=masquerade chain=srcnat comment="                KE INTERNET" \
    src-address-list=ip-local-mirza
add action=masquerade chain=srcnat dst-address-list=ip-private-dns \
    out-interface-list=ISP src-address=192.168.55.0/24
add action=masquerade chain=srcnat out-interface-list=ISP+VPN \
    src-address-list=ip-local
/ip firewall raw
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Tiktok" content=.tiktokcdn.com disabled=yes \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktokv.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktok.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=z-list-ip-google \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Youtube" content=.googlevideo.com disabled=yes \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=z-list-ip-google \
    address-list-timeout=none-dynamic chain=prerouting content=.youtube.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=z-list-ip-google \
    address-list-timeout=none-dynamic chain=prerouting content=.ytimg.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting comment=\
    "                ROUTING Snack" content=.snackvideo.in disabled=yes \
    dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.myqcloud.com \
    disabled=yes dst-address-list=!ip-private-2-local&dns src-address-list=\
    ip-local-to-route-isp1
add action=add-dst-to-address-list address-list=zz-list-raw-ip-tiktok \
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
add comment="sep/26/2023 07:03:01" limit-uptime=8h name=kdg427 password=\
    kdg427 profile=-default-1-hp
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
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=dwp342 password=dwp342 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=vus824 password=vus824 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bai335 password=bai335 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rwe695 password=rwe695 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=uye237 password=uye237 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hca292 password=hca292 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=nxh244 password=nxh244 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=yrh254 password=yrh254 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=jzf455 password=jzf455 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rpr984 password=rpr984 \
    profile=-default-1-hp
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
add comment="sep/17/2023 05:48:15" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=cdf894 password=cdf894 profile=wawan
add comment="sep/16/2023 17:13:41" limit-uptime=12h mac-address=\
    00:0A:F5:CE:67:14 name=ixz577 password=ixz577 profile=wawan
add comment="sep/18/2023 15:17:56" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=npp953 password=npp953 profile=wawan
add comment="sep/21/2023 09:52:47" limit-uptime=12h mac-address=\
    0C:C6:FD:01:01:89 name=ekw788 password=ekw788 profile=wawan
add comment="sep/24/2023 10:00:13" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=vta792 password=vta792 profile=wawan
add comment="sep/25/2023 08:48:38" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=gah997 password=gah997 profile=wawan
add comment="sep/25/2023 22:20:13" limit-uptime=12h mac-address=\
    DE:E4:4B:BE:63:ED name=ggx525 password=ggx525 profile=wawan
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
add comment="sep/26/2023 10:58:34" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=sfc932 password=sfc932 profile=wawan
add comment="sep/26/2023 10:59:07" limit-uptime=12h mac-address=\
    DA:AC:07:3A:6D:7A name=pue698 password=pue698 profile=wawan
add comment="sep/26/2023 11:57:28" limit-uptime=12h mac-address=\
    D8:55:75:CF:9F:CD name=bpr768 password=bpr768 profile=wawan
add comment="sep/26/2023 19:25:54" limit-uptime=12h mac-address=\
    0C:98:38:3C:BF:9F name=vgf287 password=vgf287 profile=wawan
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=czv534 password=czv534 \
    profile=-default-1-hp
add comment="sep/23/2023 08:17:46" limit-uptime=8h name=kdu394 password=\
    kdu394 profile=agus
add comment="sep/21/2023 20:35:14" limit-uptime=8h name=jwi433 password=\
    jwi433 profile=agus
add comment="sep/18/2023 03:38:57" limit-uptime=8h name=zmt689 password=\
    zmt689 profile=agus
add comment="sep/24/2023 18:24:54" limit-uptime=8h name=hcr554 password=\
    hcr554 profile=agus
add comment="sep/18/2023 18:25:23" limit-uptime=8h name=dst673 password=\
    dst673 profile=agus
add comment="sep/23/2023 16:40:25" limit-uptime=8h name=giv529 password=\
    giv529 profile=agus
add comment="sep/25/2023 16:59:31" limit-uptime=8h name=yag544 password=\
    yag544 profile=agus
add comment="sep/22/2023 17:47:37" limit-uptime=8h name=gsy555 password=\
    gsy555 profile=agus
add comment="sep/23/2023 09:49:39" limit-uptime=8h name=uuh795 password=\
    uuh795 profile=agus
add comment="sep/21/2023 05:19:59" limit-uptime=8h name=mmd296 password=\
    mmd296 profile=agus
add comment="sep/23/2023 08:06:05" limit-uptime=8h name=sjd859 password=\
    sjd859 profile=agus
add comment="sep/26/2023 09:47:21" limit-uptime=8h name=krw235 password=\
    krw235 profile=-default-1-hp
add comment="sep/20/2023 20:07:30" limit-uptime=8h name=utk795 password=\
    utk795 profile=agus
add comment="sep/23/2023 01:23:08" limit-uptime=8h name=nid993 password=\
    nid993 profile=agus
add comment="sep/21/2023 04:51:49" limit-uptime=8h name=dui994 password=\
    dui994 profile=agus
add comment="oct/01/2023 15:33:46" limit-uptime=8h name=kbc298 password=\
    kbc298 profile=-default-1-hp
add comment="sep/22/2023 22:27:31" limit-uptime=8h name=wbd855 password=\
    wbd855 profile=agus
add comment="sep/20/2023 18:57:14" limit-uptime=8h name=wmw973 password=\
    wmw973 profile=agus
add comment="sep/23/2023 22:27:11" limit-uptime=8h name=cap549 password=\
    cap549 profile=agus
add comment="sep/23/2023 08:34:20" limit-uptime=8h name=jsi475 password=\
    jsi475 profile=agus
add comment="sep/28/2023 16:12:39" limit-uptime=8h name=suc857 password=\
    suc857 profile=-default-1-hp
add comment="sep/20/2023 22:40:57" limit-uptime=8h name=bcn322 password=\
    bcn322 profile=agus
add comment="sep/19/2023 21:20:42" limit-uptime=8h name=wdj655 password=\
    wdj655 profile=agus
add comment="sep/26/2023 22:42:05" limit-uptime=8h name=vfw758 password=\
    vfw758 profile=-default-1-hp
add comment="sep/20/2023 23:46:39" limit-uptime=8h name=rtr463 password=\
    rtr463 profile=agus
add comment="sep/23/2023 17:17:54" limit-uptime=8h name=zfg777 password=\
    zfg777 profile=agus
add comment="sep/24/2023 16:09:30" limit-uptime=8h name=bft252 password=\
    bft252 profile=agus
add comment="sep/20/2023 00:05:24" limit-uptime=8h name=hmh865 password=\
    hmh865 profile=agus
add comment="sep/24/2023 17:17:27" limit-uptime=8h name=wpe795 password=\
    wpe795 profile=agus
add comment="sep/24/2023 16:57:08" limit-uptime=8h name=fyw587 password=\
    fyw587 profile=agus
add comment="sep/22/2023 04:04:47" limit-uptime=8h name=ucw769 password=\
    ucw769 profile=agus
add comment="sep/26/2023 13:29:11" limit-uptime=8h name=jpv874 password=\
    jpv874 profile=-default-1-hp
add comment="sep/24/2023 20:07:34" limit-uptime=8h name=uyk458 password=\
    uyk458 profile=agus
add comment="sep/22/2023 09:46:05" limit-uptime=8h name=inz762 password=\
    inz762 profile=agus
add comment="sep/25/2023 20:42:41" limit-uptime=8h name=ize675 password=\
    ize675 profile=-default-1-hp
add comment="sep/21/2023 08:45:09" limit-uptime=8h name=rdm623 password=\
    rdm623 profile=agus
add comment="sep/19/2023 00:57:11" limit-uptime=8h name=wfr586 password=\
    wfr586 profile=agus
add comment="sep/25/2023 10:08:12" limit-uptime=8h name=iam434 password=\
    iam434 profile=agus
add comment="sep/22/2023 13:16:31" limit-uptime=8h name=byp259 password=\
    byp259 profile=agus
add comment="sep/19/2023 20:41:37" limit-uptime=8h name=rea733 password=\
    rea733 profile=agus
add comment="sep/21/2023 15:39:27" limit-uptime=8h name=vgh668 password=\
    vgh668 profile=agus
add comment="sep/25/2023 10:04:00" limit-uptime=8h name=jgr892 password=\
    jgr892 profile=agus
add comment="sep/25/2023 00:04:58" limit-uptime=8h name=eya983 password=\
    eya983 profile=agus
add comment="sep/20/2023 17:48:52" limit-uptime=8h name=crh376 password=\
    crh376 profile=agus
add comment="sep/21/2023 02:35:40" limit-uptime=8h name=cfx696 password=\
    cfx696 profile=agus
add comment="sep/24/2023 11:55:43" limit-uptime=8h name=uat638 password=\
    uat638 profile=agus
add comment="sep/24/2023 20:07:15" limit-uptime=8h name=cbx462 password=\
    cbx462 profile=agus
add comment="sep/21/2023 18:31:56" limit-uptime=8h name=iht935 password=\
    iht935 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bmy695 password=bmy695 \
    profile=-default-1-hp
add comment="sep/19/2023 18:51:41" limit-uptime=8h name=uht382 password=\
    uht382 profile=agus
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
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=cib744 password=cib744 \
    profile=-default-1-hp
add comment="sep/02/2023 17:08:21" limit-uptime=12h name=wcs298 password=\
    wcs298 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=ebe796 password=ebe796 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=zfr285 password=zfr285 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=zva499 password=zva499 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bus566 password=bus566 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=atr753 password=atr753 \
    profile=-default-1-hp
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
add comment="sep/02/2023 10:54:44" limit-uptime=8h name=yhv343 password=\
    yhv343 profile=evi
add comment="sep/05/2023 19:57:00" limit-uptime=8h name=vrx667 password=\
    vrx667 profile=evi
add comment="sep/03/2023 20:47:40" limit-uptime=8h name=wnj729 password=\
    wnj729 profile=evi
add comment="sep/19/2023 09:56:55" limit-uptime=8h name=mzx326 password=\
    mzx326 profile=evi
add comment="sep/10/2023 17:12:16" limit-uptime=8h name=wgu648 password=\
    wgu648 profile=evi
add comment="sep/13/2023 18:51:14" limit-uptime=8h name=dtj528 password=\
    dtj528 profile=evi
add comment="sep/19/2023 11:07:26" limit-uptime=8h name=jpk727 password=\
    jpk727 profile=evi
add comment="sep/21/2023 11:01:01" limit-uptime=8h name=mrj392 password=\
    mrj392 profile=evi
add comment="sep/19/2023 15:38:39" limit-uptime=8h name=fbs839 password=\
    fbs839 profile=evi
add comment="sep/21/2023 13:12:19" limit-uptime=8h name=msg546 password=\
    msg546 profile=evi
add comment="sep/19/2023 09:57:12" limit-uptime=8h name=pvh962 password=\
    pvh962 profile=evi
add comment="sep/21/2023 19:56:35" limit-uptime=8h name=pfc967 password=\
    pfc967 profile=evi
add comment="sep/22/2023 12:58:58" limit-uptime=8h name=vvk286 password=\
    vvk286 profile=evi
add comment="sep/22/2023 20:03:38" limit-uptime=8h name=rtd745 password=\
    rtd745 profile=evi
add comment="sep/17/2023 11:48:05" limit-uptime=8h name=nyr397 password=\
    nyr397 profile=evi
add comment="sep/18/2023 18:24:22" limit-uptime=8h name=bch699 password=\
    bch699 profile=evi
add comment="sep/18/2023 15:51:20" limit-uptime=8h name=dff379 password=\
    dff379 profile=evi
add comment="sep/18/2023 18:23:05" limit-uptime=8h name=ckt333 password=\
    ckt333 profile=evi
add comment="sep/06/2023 09:33:10" limit-uptime=8h name=jaa422 password=\
    jaa422 profile=evi
add comment="sep/07/2023 09:18:57" limit-uptime=8h name=pjy347 password=\
    pjy347 profile=evi
add comment="sep/07/2023 12:21:28" limit-uptime=8h name=rty624 password=\
    rty624 profile=evi
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
add comment="sep/27/2023 13:39:24" limit-uptime=8h name=yjh974 password=\
    yjh974 profile=evi
add comment="sep/27/2023 14:59:03" limit-uptime=8h name=nsf454 password=\
    nsf454 profile=evi
add comment="sep/27/2023 16:15:36" limit-uptime=8h name=ezj458 password=\
    ezj458 profile=evi
add comment="sep/26/2023 11:59:59" limit-uptime=8h name=cdb937 password=\
    cdb937 profile=evi
add comment="sep/26/2023 16:26:04" limit-uptime=8h name=pez525 password=\
    pez525 profile=evi
add comment="sep/26/2023 18:25:37" limit-uptime=8h name=ukt326 password=\
    ukt326 profile=evi
add comment="sep/26/2023 18:34:07" limit-uptime=8h name=uui924 password=\
    uui924 profile=evi
add comment="sep/26/2023 18:35:17" limit-uptime=8h name=mbg429 password=\
    mbg429 profile=evi
add comment="sep/24/2023 16:14:24" limit-uptime=8h name=fbp296 password=\
    fbp296 profile=evi
add comment="sep/24/2023 18:39:55" limit-uptime=8h name=wks223 password=\
    wks223 profile=evi
add comment="sep/24/2023 18:40:26" limit-uptime=8h name=abh839 password=\
    abh839 profile=evi
add comment="sep/25/2023 12:41:54" limit-uptime=8h name=zfi438 password=\
    zfi438 profile=evi
add comment="sep/23/2023 14:59:49" limit-uptime=8h name=psh958 password=\
    psh958 profile=evi
add comment="sep/23/2023 13:41:34" limit-uptime=8h name=bny348 password=\
    bny348 profile=evi
add comment="sep/24/2023 13:11:21" limit-uptime=8h name=ttj422 password=\
    ttj422 profile=evi
add comment="sep/03/2023 15:31:53" limit-uptime=8h name=yce227 password=\
    yce227 profile=evi
add comment="sep/03/2023 13:22:32" limit-uptime=8h name=hyg689 password=\
    hyg689 profile=evi
add comment="sep/23/2023 15:45:51" limit-uptime=8h name=yuf745 password=\
    yuf745 profile=evi
add comment="sep/24/2023 13:10:46" limit-uptime=8h name=icd884 password=\
    icd884 profile=evi
add comment="sep/24/2023 13:11:49" limit-uptime=8h name=rgf285 password=\
    rgf285 profile=evi
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
add comment="sep/18/2023 13:19:54" limit-uptime=8h name=khd684 password=\
    khd684 profile=evi
add comment="sep/17/2023 13:20:07" limit-uptime=8h name=chh368 password=\
    chh368 profile=evi
add comment="sep/10/2023 16:43:02" limit-uptime=8h name=bes349 password=\
    bes349 profile=evi
add comment="sep/10/2023 17:08:30" limit-uptime=8h name=ifx359 password=\
    ifx359 profile=evi
add comment="sep/08/2023 16:43:45" limit-uptime=8h name=zhk524 password=\
    zhk524 profile=evi
add comment="sep/28/2023 15:17:32" limit-uptime=8h name=kii736 password=\
    kii736 profile=evi
add comment="sep/27/2023 11:30:32" limit-uptime=8h name=wdr722 password=\
    wdr722 profile=wati
add comment="sep/04/2023 11:15:02" limit-uptime=8h name=yep498 password=\
    yep498 profile=wati
add comment="sep/20/2023 16:28:17" limit-uptime=8h name=ttg237 password=\
    ttg237 profile=wati
add comment="sep/19/2023 18:16:55" limit-uptime=8h name=ifp546 password=\
    ifp546 profile=wati
add comment="sep/09/2023 19:46:55" limit-uptime=8h name=jfx734 password=\
    jfx734 profile=wati
add comment="sep/25/2023 23:47:04" limit-uptime=8h name=gkp592 password=\
    gkp592 profile=wati
add comment="sep/26/2023 12:49:24" limit-uptime=8h name=vvw632 password=\
    vvw632 profile=wati
add comment="sep/19/2023 18:54:57" limit-uptime=8h name=uys465 password=\
    uys465 profile=wati
add comment="sep/17/2023 18:56:47" limit-uptime=8h name=yru638 password=\
    yru638 profile=wati
add comment="sep/07/2023 19:04:13" limit-uptime=8h name=kkm822 password=\
    kkm822 profile=wati
add comment="sep/05/2023 12:41:23" limit-uptime=8h name=rvw264 password=\
    rvw264 profile=wati
add comment="sep/03/2023 18:29:24" limit-uptime=8h name=ubc489 password=\
    ubc489 profile=wati
add comment="sep/17/2023 08:36:56" limit-uptime=8h name=bib828 password=\
    bib828 profile=wati
add comment="sep/02/2023 19:02:07" limit-uptime=8h name=vnu966 password=\
    vnu966 profile=wati
add comment="sep/03/2023 12:47:51" limit-uptime=8h name=tzv526 password=\
    tzv526 profile=wati
add comment="sep/04/2023 11:38:35" limit-uptime=8h name=xxk475 password=\
    xxk475 profile=wati
add comment="sep/03/2023 18:32:28" limit-uptime=8h name=jzx892 password=\
    jzx892 profile=wati
add comment="sep/25/2023 19:51:20" limit-uptime=8h name=hzj999 password=\
    hzj999 profile=wati
add comment="sep/09/2023 23:18:25" limit-uptime=8h name=smb879 password=\
    smb879 profile=wati
add comment="sep/23/2023 18:50:02" limit-uptime=8h name=ivg358 password=\
    ivg358 profile=wati
add comment="sep/06/2023 23:49:17" limit-uptime=8h name=ecj256 password=\
    ecj256 profile=wati
add comment="sep/05/2023 19:22:14" limit-uptime=8h name=ukn524 password=\
    ukn524 profile=wati
add comment="sep/20/2023 14:04:50" limit-uptime=8h name=fcg894 password=\
    fcg894 profile=wati
add comment="sep/10/2023 19:15:35" limit-uptime=8h name=nzv658 password=\
    nzv658 profile=wati
add comment="sep/18/2023 23:44:09" limit-uptime=8h name=jyg333 password=\
    jyg333 profile=wati
add comment="sep/18/2023 18:23:12" limit-uptime=8h name=ski969 password=\
    ski969 profile=wati
add comment="sep/05/2023 10:31:20" limit-uptime=8h name=feg497 password=\
    feg497 profile=wati
add comment="sep/28/2023 13:34:20" limit-uptime=8h name=mvv762 password=\
    mvv762 profile=wati
add comment="sep/12/2023 16:38:20" limit-uptime=8h name=ikf336 password=\
    ikf336 profile=wati
add comment="sep/08/2023 14:54:03" limit-uptime=8h name=cxs997 password=\
    cxs997 profile=wati
add comment="sep/06/2023 00:14:05" limit-uptime=8h name=tbj865 password=\
    tbj865 profile=wati
add comment="sep/20/2023 14:19:12" limit-uptime=8h name=ckb864 password=\
    ckb864 profile=wati
add comment="sep/08/2023 21:31:20" limit-uptime=8h name=twx983 password=\
    twx983 profile=wati
add comment="sep/17/2023 23:32:41" limit-uptime=8h name=pyj799 password=\
    pyj799 profile=wati
add comment="sep/26/2023 12:29:18" limit-uptime=8h name=nts824 password=\
    nts824 profile=wati
add comment="sep/02/2023 11:45:00" limit-uptime=8h name=pat945 password=\
    pat945 profile=wati
add comment="sep/10/2023 21:57:34" limit-uptime=8h name=svw328 password=\
    svw328 profile=wati
add comment="sep/09/2023 15:27:41" limit-uptime=8h name=cxw422 password=\
    cxw422 profile=wati
add comment="sep/09/2023 07:10:36" limit-uptime=8h name=tke788 password=\
    tke788 profile=wati
add comment="sep/07/2023 09:13:25" limit-uptime=8h name=uzm857 password=\
    uzm857 profile=wati
add comment="sep/17/2023 20:24:35" limit-uptime=8h name=wcf633 password=\
    wcf633 profile=wati
add comment="sep/06/2023 00:02:35" limit-uptime=8h name=eei559 password=\
    eei559 profile=wati
add comment="sep/15/2023 18:35:10" limit-uptime=8h name=gyw366 password=\
    gyw366 profile=wati
add comment="sep/11/2023 12:40:13" limit-uptime=8h name=ran282 password=\
    ran282 profile=wati
add comment="sep/12/2023 10:50:50" limit-uptime=8h name=rce263 password=\
    rce263 profile=wati
add comment="sep/20/2023 09:37:00" limit-uptime=8h name=bib295 password=\
    bib295 profile=wati
add comment="sep/02/2023 18:25:41" limit-uptime=8h name=wdt938 password=\
    wdt938 profile=wati
add comment="sep/08/2023 08:07:48" limit-uptime=8h name=fdx565 password=\
    fdx565 profile=wati
add comment="sep/14/2023 23:15:51" limit-uptime=8h name=xfz778 password=\
    xfz778 profile=wati
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
add comment="sep/14/2023 09:49:15" limit-uptime=8h name=uvz529 password=\
    uvz529 profile=wati
add comment="sep/03/2023 21:46:42" limit-uptime=8h name=zbf925 password=\
    zbf925 profile=wati
add comment="sep/05/2023 09:00:23" limit-uptime=8h name=htd446 password=\
    htd446 profile=wati
add comment="sep/02/2023 16:01:53" limit-uptime=8h name=fdv269 password=\
    fdv269 profile=wati
add comment="sep/20/2023 10:29:29" limit-uptime=8h name=rys352 password=\
    rys352 profile=wati
add comment="sep/16/2023 14:07:52" limit-uptime=8h name=ptb827 password=\
    ptb827 profile=wati
add comment="sep/10/2023 14:42:38" limit-uptime=8h name=rsx886 password=\
    rsx886 profile=wati
add comment="sep/22/2023 03:25:05" limit-uptime=8h name=syr699 password=\
    syr699 profile=wati
add comment="sep/11/2023 22:27:48" limit-uptime=8h name=jbk722 password=\
    jbk722 profile=wati
add comment="sep/26/2023 11:26:27" limit-uptime=8h name=ijz762 password=\
    ijz762 profile=wati
add comment="sep/26/2023 10:55:30" limit-uptime=8h name=txe836 password=\
    txe836 profile=wati
add comment="sep/28/2023 03:50:32" limit-uptime=8h name=xbr832 password=\
    xbr832 profile=wati
add comment="sep/13/2023 00:44:16" limit-uptime=8h name=vhp355 password=\
    vhp355 profile=wati
add comment="sep/04/2023 11:07:41" limit-uptime=8h name=tdn768 password=\
    tdn768 profile=wati
add comment="sep/14/2023 13:33:14" limit-uptime=8h name=rtp798 password=\
    rtp798 profile=wati
add comment="sep/27/2023 21:31:43" limit-uptime=8h name=vej546 password=\
    vej546 profile=wati
add comment="sep/17/2023 11:06:34" limit-uptime=8h name=xwc896 password=\
    xwc896 profile=wati
add comment="sep/20/2023 03:15:00" limit-uptime=8h name=kya475 password=\
    kya475 profile=wati
add comment="sep/21/2023 15:40:15" limit-uptime=8h name=ijh559 password=\
    ijh559 profile=wati
add comment="sep/03/2023 16:10:16" limit-uptime=8h name=fkp337 password=\
    fkp337 profile=wati
add comment="sep/08/2023 05:31:18" limit-uptime=8h name=ckn973 password=\
    ckn973 profile=wati
add comment="sep/19/2023 21:40:16" limit-uptime=8h name=djp756 password=\
    djp756 profile=wati
add comment="sep/22/2023 00:14:00" limit-uptime=8h name=zue492 password=\
    zue492 profile=wati
add comment="sep/03/2023 21:21:07" limit-uptime=8h name=kbc653 password=\
    kbc653 profile=wati
add comment="sep/25/2023 23:29:11" limit-uptime=8h name=zkv472 password=\
    zkv472 profile=wati
add comment="sep/26/2023 11:26:52" limit-uptime=8h name=rtn294 password=\
    rtn294 profile=wati
add comment="sep/21/2023 16:32:47" limit-uptime=8h name=yee258 password=\
    yee258 profile=wati
add comment="sep/11/2023 12:40:32" limit-uptime=8h name=wja422 password=\
    wja422 profile=wati
add comment="sep/20/2023 13:20:16" limit-uptime=8h name=fjc788 password=\
    fjc788 profile=wati
add comment="sep/08/2023 14:09:13" limit-uptime=8h name=beu442 password=\
    beu442 profile=wati
add comment="sep/16/2023 18:11:58" limit-uptime=8h name=twe567 password=\
    twe567 profile=wati
add comment="sep/06/2023 12:15:52" limit-uptime=8h name=sih524 password=\
    sih524 profile=wati
add comment="sep/06/2023 12:31:31" limit-uptime=8h name=thv876 password=\
    thv876 profile=wati
add comment="sep/17/2023 10:41:55" limit-uptime=8h name=zsj764 password=\
    zsj764 profile=wati
add comment="sep/19/2023 21:00:15" limit-uptime=8h name=fpm753 password=\
    fpm753 profile=wati
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
add comment="sep/16/2023 18:49:08" limit-uptime=8h name=erm764 password=\
    erm764 profile=wati
add comment="sep/22/2023 11:12:30" limit-uptime=8h name=uag544 password=\
    uag544 profile=wati
add comment="sep/24/2023 20:29:06" limit-uptime=8h name=byh248 password=\
    byh248 profile=wati
add comment="sep/17/2023 17:05:48" limit-uptime=8h name=hcw976 password=\
    hcw976 profile=wati
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
add comment="sep/12/2023 11:40:58" limit-uptime=8h name=vet938 password=\
    vet938 profile=wati
add comment="sep/12/2023 12:41:56" limit-uptime=8h name=ixc594 password=\
    ixc594 profile=wati
add comment="sep/05/2023 12:57:59" limit-uptime=8h name=vnz757 password=\
    vnz757 profile=wati
add comment="sep/26/2023 20:11:14" limit-uptime=8h name=vsd823 password=\
    vsd823 profile=wati
add comment="sep/19/2023 08:35:42" limit-uptime=8h name=sis962 password=\
    sis962 profile=wati
add comment="sep/23/2023 12:28:46" limit-uptime=8h name=efy589 password=\
    efy589 profile=wati
add comment="sep/14/2023 15:21:00" limit-uptime=8h name=udf939 password=\
    udf939 profile=wati
add comment="sep/22/2023 19:36:42" limit-uptime=8h name=ymz598 password=\
    ymz598 profile=wati
add comment="sep/13/2023 18:06:46" limit-uptime=8h name=gii757 password=\
    gii757 profile=wati
add comment="sep/19/2023 07:48:56" limit-uptime=8h name=kti294 password=\
    kti294 profile=wati
add comment="sep/05/2023 18:26:48" limit-uptime=8h name=ibd625 password=\
    ibd625 profile=wati
add comment="sep/15/2023 11:42:22" limit-uptime=8h name=dvh672 password=\
    dvh672 profile=wati
add comment="sep/26/2023 19:27:36" limit-uptime=8h name=ujc882 password=\
    ujc882 profile=wati
add comment="sep/25/2023 00:40:40" limit-uptime=8h name=mrd525 password=\
    mrd525 profile=wati
add comment="sep/20/2023 14:42:23" limit-uptime=8h name=ncf295 password=\
    ncf295 profile=wati
add comment="sep/16/2023 14:07:16" limit-uptime=8h name=pss634 password=\
    pss634 profile=wati
add comment="sep/20/2023 11:12:25" limit-uptime=8h name=gjw539 password=\
    gjw539 profile=wati
add comment="sep/16/2023 22:34:58" limit-uptime=8h name=fga252 password=\
    fga252 profile=wati
add comment="sep/15/2023 17:13:16" limit-uptime=8h name=why562 password=\
    why562 profile=wati
add comment="sep/24/2023 12:08:33" limit-uptime=8h name=emv239 password=\
    emv239 profile=wati
add comment="sep/28/2023 12:53:57" limit-uptime=8h name=zue865 password=\
    zue865 profile=wati
add comment="sep/14/2023 13:21:30" limit-uptime=8h name=xwt457 password=\
    xwt457 profile=wati
add comment="sep/18/2023 00:52:39" limit-uptime=8h name=wds552 password=\
    wds552 profile=wati
add comment="sep/13/2023 10:59:49" limit-uptime=8h name=fhy669 password=\
    fhy669 profile=wati
add comment="sep/21/2023 19:31:45" limit-uptime=8h name=rhe467 password=\
    rhe467 profile=wati
add comment="sep/13/2023 11:43:25" limit-uptime=8h name=xkt525 password=\
    xkt525 profile=wati
add comment="sep/12/2023 18:54:44" limit-uptime=8h name=auf658 password=\
    auf658 profile=wati
add comment="sep/13/2023 13:07:41" limit-uptime=8h name=rvw287 password=\
    rvw287 profile=wati
add comment="sep/20/2023 19:45:39" limit-uptime=8h name=sjj497 password=\
    sjj497 profile=wati
add comment="sep/21/2023 20:54:51" limit-uptime=8h name=idp679 password=\
    idp679 profile=wati
add comment="sep/25/2023 07:47:19" limit-uptime=8h name=urj778 password=\
    urj778 profile=wati
add comment="sep/28/2023 13:53:32" limit-uptime=8h name=bfj925 password=\
    bfj925 profile=wati
add comment="sep/10/2023 21:58:22" limit-uptime=8h name=uge753 password=\
    uge753 profile=wati
add comment="sep/10/2023 18:36:30" limit-uptime=8h name=tga453 password=\
    tga453 profile=wati
add comment="sep/26/2023 20:48:33" limit-uptime=8h name=cjg723 password=\
    cjg723 profile=wati
add comment="sep/27/2023 00:31:35" limit-uptime=8h name=ymb638 password=\
    ymb638 profile=wati
add comment="sep/22/2023 21:10:39" limit-uptime=8h name=jzc735 password=\
    jzc735 profile=wati
add comment="sep/28/2023 12:33:37" limit-uptime=8h name=afa832 password=\
    afa832 profile=wati
add comment="sep/18/2023 13:42:45" limit-uptime=8h name=frc292 password=\
    frc292 profile=wati
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xwa455 password=xwa455 \
    profile=-default-1-hp
add comment="sep/02/2023 17:46:52" limit-uptime=8h name=epk335 password=\
    epk335 profile=dian
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
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xwt638 password=xwt638 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=cbw264 password=cbw264 \
    profile=-default-1-hp
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
add comment="sep/19/2023 20:30:10" limit-uptime=8h name=ppb725 password=\
    ppb725 profile=dian
add comment="sep/19/2023 13:17:03" limit-uptime=8h name=yxp233 password=\
    yxp233 profile=dian
add comment="sep/18/2023 20:36:56" limit-uptime=8h name=zwz289 password=\
    zwz289 profile=dian
add comment="sep/16/2023 13:16:37" limit-uptime=8h name=dty936 password=\
    dty936 profile=dian
add comment="sep/15/2023 21:14:55" limit-uptime=8h name=igm743 password=\
    igm743 profile=dian
add comment="sep/19/2023 22:46:28" limit-uptime=8h name=zmy954 password=\
    zmy954 profile=dian
add comment="sep/20/2023 22:56:05" limit-uptime=8h name=smt364 password=\
    smt364 profile=dian
add comment="sep/19/2023 21:45:54" limit-uptime=8h name=bna487 password=\
    bna487 profile=dian
add comment="sep/19/2023 15:53:29" limit-uptime=8h name=jhx472 password=\
    jhx472 profile=dian
add comment="sep/20/2023 11:24:57" limit-uptime=8h name=mks665 password=\
    mks665 profile=dian
add comment="sep/20/2023 12:21:54" limit-uptime=8h name=vtv468 password=\
    vtv468 profile=dian
add comment="sep/20/2023 12:27:54" limit-uptime=8h name=sns683 password=\
    sns683 profile=dian
add comment="sep/20/2023 19:54:10" limit-uptime=8h name=ezc545 password=\
    ezc545 profile=dian
add comment="sep/20/2023 20:29:49" limit-uptime=8h name=aui268 password=\
    aui268 profile=dian
add comment="sep/20/2023 21:13:26" limit-uptime=8h name=fyg967 password=\
    fyg967 profile=dian
add comment="sep/21/2023 19:10:10" limit-uptime=8h name=smr982 password=\
    smr982 profile=dian
add comment="sep/21/2023 18:59:31" limit-uptime=8h name=jrm379 password=\
    jrm379 profile=dian
add comment="sep/22/2023 19:00:32" limit-uptime=8h name=uyp447 password=\
    uyp447 profile=dian
add comment="sep/22/2023 05:28:16" limit-uptime=8h name=nrm972 password=\
    nrm972 profile=dian
add comment="sep/21/2023 17:40:38" limit-uptime=8h name=xik927 password=\
    xik927 profile=dian
add comment="sep/23/2023 10:16:40" limit-uptime=8h name=sbe533 password=\
    sbe533 profile=dian
add comment="sep/22/2023 19:01:01" limit-uptime=8h name=bdn939 password=\
    bdn939 profile=dian
add comment="sep/23/2023 17:47:24" limit-uptime=8h name=srm696 password=\
    srm696 profile=dian
add comment="sep/22/2023 18:37:43" limit-uptime=8h name=mri639 password=\
    mri639 profile=dian
add comment="sep/22/2023 01:47:29" limit-uptime=8h name=djx642 password=\
    djx642 profile=dian
add comment="sep/23/2023 12:23:23" limit-uptime=8h name=zjv847 password=\
    zjv847 profile=dian
add comment="sep/23/2023 22:51:08" limit-uptime=8h name=nzm385 password=\
    nzm385 profile=dian
add comment="sep/24/2023 12:58:26" limit-uptime=8h name=xmg464 password=\
    xmg464 profile=dian
add comment="sep/24/2023 14:06:00" limit-uptime=8h name=whi872 password=\
    whi872 profile=dian
add comment="sep/24/2023 17:58:38" limit-uptime=8h name=vut922 password=\
    vut922 profile=dian
add comment="sep/25/2023 13:00:57" limit-uptime=8h name=bus992 password=\
    bus992 profile=dian
add comment="sep/30/2023 18:21:25" limit-uptime=8h name=kfx286 password=\
    kfx286 profile=-default-1-hp
add comment="sep/25/2023 11:10:59" limit-uptime=8h name=ctb465 password=\
    ctb465 profile=dian
add comment="sep/25/2023 19:12:26" limit-uptime=8h name=saf847 password=\
    saf847 profile=dian
add comment="sep/24/2023 20:21:17" limit-uptime=8h name=atc789 password=\
    atc789 profile=dian
add comment="sep/26/2023 18:30:04" limit-uptime=8h name=kuh453 password=\
    kuh453 profile=dian
add comment="sep/26/2023 18:31:49" limit-uptime=8h name=mat355 password=\
    mat355 profile=dian
add comment="sep/26/2023 14:35:16" limit-uptime=8h name=ksx756 password=\
    ksx756 profile=dian
add comment="sep/26/2023 09:51:33" limit-uptime=8h name=eck268 password=\
    eck268 profile=dian
add comment="sep/25/2023 17:39:10" limit-uptime=8h name=fci769 password=\
    fci769 profile=dian
add comment="sep/26/2023 21:29:27" limit-uptime=8h name=aks332 password=\
    aks332 profile=dian
add comment="sep/26/2023 22:55:16" limit-uptime=8h name=emb284 password=\
    emb284 profile=dian
add comment="sep/26/2023 21:08:39" limit-uptime=8h name=fdi497 password=\
    fdi497 profile=dian
add comment="sep/26/2023 20:59:14" limit-uptime=8h name=tjr367 password=\
    tjr367 profile=dian
add comment="oct/01/2023 21:20:16" limit-uptime=8h name=pji777 password=\
    pji777 profile=-default-1-hp
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
add comment="sep/27/2023 07:13:25" limit-uptime=8h name=jsh985 password=\
    jsh985 profile=dian
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
add comment="sep/16/2023 19:47:56" limit-uptime=8h name=zbr529 password=\
    zbr529 profile=dian
add comment="sep/16/2023 19:17:12" limit-uptime=8h name=zik539 password=\
    zik539 profile=dian
add comment="sep/16/2023 21:28:24" limit-uptime=8h name=xwu579 password=\
    xwu579 profile=dian
add comment="sep/13/2023 20:30:10" limit-uptime=8h name=zhy442 password=\
    zhy442 profile=dian
add comment="sep/13/2023 10:21:26" limit-uptime=8h name=zwa496 password=\
    zwa496 profile=dian
add comment="sep/18/2023 18:35:25" limit-uptime=8h name=ngb363 password=\
    ngb363 profile=dian
add comment="sep/17/2023 17:34:58" limit-uptime=8h name=hmt555 password=\
    hmt555 profile=dian
add comment="sep/17/2023 14:43:25" limit-uptime=8h name=xdy346 password=\
    xdy346 profile=dian
add comment="sep/16/2023 19:16:39" limit-uptime=8h name=eps673 password=\
    eps673 profile=dian
add comment="sep/14/2023 14:15:38" limit-uptime=8h name=iny524 password=\
    iny524 profile=dian
add comment="sep/10/2023 17:07:11" limit-uptime=8h name=zgh255 password=\
    zgh255 profile=dian
add comment="sep/18/2023 20:14:06" limit-uptime=8h name=fvn665 password=\
    fvn665 profile=dian
add comment="sep/18/2023 17:38:35" limit-uptime=8h name=bdb863 password=\
    bdb863 profile=dian
add comment="sep/16/2023 14:02:46" limit-uptime=8h name=dtw583 password=\
    dtw583 profile=dian
add comment="sep/15/2023 12:48:38" limit-uptime=8h name=xhn372 password=\
    xhn372 profile=dian
add comment="sep/05/2023 18:51:55" limit-uptime=8h name=kdy975 password=\
    kdy975 profile=agus
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
add comment="sep/04/2023 01:22:30" limit-uptime=8h name=ukw969 password=\
    ukw969 profile=agus
add comment="sep/04/2023 17:26:32" limit-uptime=8h name=txj965 password=\
    txj965 profile=agus
add comment="sep/05/2023 17:00:24" limit-uptime=8h name=hpy664 password=\
    hpy664 profile=agus
add comment="sep/06/2023 16:25:18" limit-uptime=8h name=vty444 password=\
    vty444 profile=agus
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
add comment="sep/02/2023 23:23:58" limit-uptime=8h name=hjh285 password=\
    hjh285 profile=agus
add comment="sep/06/2023 23:22:54" limit-uptime=8h name=zpy527 password=\
    zpy527 profile=agus
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
add comment="sep/03/2023 10:17:31" limit-uptime=8h name=vgu992 password=\
    vgu992 profile=agus
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=bkn326 password=bkn326 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=rhc565 password=rhc565 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=guv867 password=guv867 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=gin687 password=gin687 \
    profile=-default-1-hp
add comment="sep/06/2023 09:43:14" limit-uptime=8h name=tnd223 password=\
    tnd223 profile=nazim
add comment="sep/06/2023 08:26:54" limit-uptime=8h name=aup872 password=\
    aup872 profile=nazim
add comment="sep/02/2023 10:40:37" limit-uptime=8h name=vsf595 password=\
    vsf595 profile=nazim
add comment="sep/02/2023 11:30:58" limit-uptime=8h name=rkw677 password=\
    rkw677 profile=nazim
add comment="sep/02/2023 17:17:31" limit-uptime=8h name=uew479 password=\
    uew479 profile=nazim
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
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=xwm436 password=xwm436 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=hum874 password=hum874 \
    profile=-default-1-hp
add comment="sep/10/2023 16:01:46" limit-uptime=8h name=zys437 password=\
    zys437 profile=nazim
add comment="sep/11/2023 00:06:00" limit-uptime=8h name=mij998 password=\
    mij998 profile=nazim
add comment="sep/10/2023 17:14:06" limit-uptime=8h name=kru473 password=\
    kru473 profile=nazim
add comment="sep/10/2023 16:24:07" limit-uptime=8h name=ywk658 password=\
    ywk658 profile=nazim
add comment=vc-815-05.15.23-FREE limit-uptime=8h name=sad994 password=sad994 \
    profile=-default-1-hp
add comment="sep/11/2023 11:02:47" limit-uptime=8h name=gbw758 password=\
    gbw758 profile=nazim
add comment="sep/11/2023 19:55:58" limit-uptime=8h name=kec282 password=\
    kec282 profile=nazim
add comment="sep/12/2023 18:08:21" limit-uptime=8h name=kkz987 password=\
    kkz987 profile=nazim
add comment="sep/13/2023 00:16:20" limit-uptime=8h name=mhb286 password=\
    mhb286 profile=nazim
add comment="sep/16/2023 11:05:58" limit-uptime=8h name=hfw873 password=\
    hfw873 profile=nazim
add comment="sep/11/2023 13:16:53" limit-uptime=8h name=wxt884 password=\
    wxt884 profile=nazim
add comment="sep/13/2023 07:17:30" limit-uptime=8h name=sik757 password=\
    sik757 profile=nazim
add comment="sep/13/2023 07:40:05" limit-uptime=8h name=mvj972 password=\
    mvj972 profile=nazim
add comment="sep/13/2023 08:58:41" limit-uptime=8h name=zxs338 password=\
    zxs338 profile=nazim
add comment="sep/16/2023 07:03:57" limit-uptime=8h name=eac547 password=\
    eac547 profile=nazim
add comment="sep/13/2023 09:08:35" limit-uptime=8h name=ffp784 password=\
    ffp784 profile=nazim
add comment="sep/13/2023 15:26:44" limit-uptime=8h name=hcs365 password=\
    hcs365 profile=nazim
add comment="sep/13/2023 23:34:34" limit-uptime=8h name=wss993 password=\
    wss993 profile=nazim
add comment="sep/14/2023 12:38:13" limit-uptime=8h name=but542 password=\
    but542 profile=nazim
add comment="sep/16/2023 12:07:44" limit-uptime=8h name=eun956 password=\
    eun956 profile=nazim
add comment="sep/13/2023 10:51:12" limit-uptime=8h name=nnu639 password=\
    nnu639 profile=nazim
add comment="sep/14/2023 12:43:25" limit-uptime=8h name=xxx563 password=\
    xxx563 profile=nazim
add comment="sep/14/2023 12:42:27" limit-uptime=8h name=brw447 password=\
    brw447 profile=nazim
add comment="sep/14/2023 14:17:39" limit-uptime=8h name=bdz435 password=\
    bdz435 profile=nazim
add comment="sep/16/2023 17:08:35" limit-uptime=8h name=end987 password=\
    end987 profile=nazim
add comment="sep/14/2023 14:44:24" limit-uptime=8h name=ths547 password=\
    ths547 profile=nazim
add comment="sep/14/2023 19:19:02" limit-uptime=8h name=gra965 password=\
    gra965 profile=nazim
add comment="sep/15/2023 17:04:34" limit-uptime=8h name=kyx265 password=\
    kyx265 profile=nazim
add comment="sep/15/2023 17:16:07" limit-uptime=8h name=bay926 password=\
    bay926 profile=nazim
add comment="sep/16/2023 17:39:41" limit-uptime=8h name=idv698 password=\
    idv698 profile=nazim
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
add comment="sep/16/2023 18:35:03" limit-uptime=12h name=ayg345 password=\
    ayg345 profile=witno-12jam
add comment="sep/15/2023 09:53:15" limit-uptime=12h name=zam269 password=\
    zam269 profile=witno-12jam
add comment="sep/17/2023 08:42:46" limit-uptime=12h name=nyk499 password=\
    nyk499 profile=witno-12jam
add comment="sep/15/2023 14:37:21" limit-uptime=12h name=tzd442 password=\
    tzd442 profile=witno-12jam
add comment="sep/16/2023 18:24:19" limit-uptime=12h name=ksw848 password=\
    ksw848 profile=witno-12jam
add comment="sep/16/2023 19:20:20" limit-uptime=12h name=zwi848 password=\
    zwi848 profile=witno-12jam
add comment="sep/17/2023 10:09:06" limit-uptime=12h name=giz657 password=\
    giz657 profile=witno-12jam
add comment="sep/17/2023 11:26:37" limit-uptime=12h name=fzu277 password=\
    fzu277 profile=witno-12jam
add comment="sep/19/2023 17:16:21" limit-uptime=12h name=sme497 password=\
    sme497 profile=witno-12jam
add comment="sep/17/2023 15:41:23" limit-uptime=12h name=jgv449 password=\
    jgv449 profile=witno-12jam
add comment="sep/17/2023 19:31:43" limit-uptime=12h name=apc848 password=\
    apc848 profile=witno-12jam
add comment="sep/17/2023 20:53:09" limit-uptime=12h name=cbe569 password=\
    cbe569 profile=witno-12jam
add comment="sep/23/2023 11:45:33" limit-uptime=12h name=vkw975 password=\
    vkw975 profile=witno-12jam
add comment="sep/18/2023 20:07:44" limit-uptime=12h name=snz723 password=\
    snz723 profile=witno-12jam
add comment="sep/18/2023 15:11:52" limit-uptime=12h name=nxw897 password=\
    nxw897 profile=witno-12jam
add comment="sep/19/2023 17:04:36" limit-uptime=12h name=vtc777 password=\
    vtc777 profile=witno-12jam
add comment="sep/20/2023 09:11:30" limit-uptime=12h name=jdg898 password=\
    jdg898 profile=witno-12jam
add comment="sep/20/2023 16:21:25" limit-uptime=12h name=yvf699 password=\
    yvf699 profile=witno-12jam
add comment="sep/20/2023 16:19:07" limit-uptime=12h name=ngu683 password=\
    ngu683 profile=witno-12jam
add comment="sep/20/2023 18:52:45" limit-uptime=12h name=aay948 password=\
    aay948 profile=witno-12jam
add comment="sep/20/2023 20:25:30" limit-uptime=12h name=iwj544 password=\
    iwj544 profile=witno-12jam
add comment="sep/21/2023 11:17:37" limit-uptime=12h name=rsu449 password=\
    rsu449 profile=witno-12jam
add comment="sep/26/2023 16:02:02" limit-uptime=12h name=ghv963 password=\
    ghv963 profile=witno-12jam
add comment="sep/28/2023 23:51:59" limit-uptime=12h name=usd877 password=\
    usd877 profile=witno-12jam
add comment="sep/23/2023 10:35:52" limit-uptime=12h name=eni772 password=\
    eni772 profile=witno-12jam
add comment="sep/23/2023 13:14:26" limit-uptime=12h name=bmp384 password=\
    bmp384 profile=witno-12jam
add comment="sep/21/2023 19:07:22" limit-uptime=12h name=ggb655 password=\
    ggb655 profile=witno-12jam
add comment="sep/21/2023 09:30:09" limit-uptime=12h name=isv728 password=\
    isv728 profile=witno-12jam
add comment="sep/23/2023 15:06:56" limit-uptime=12h name=has957 password=\
    has957 profile=witno-12jam
add comment="sep/24/2023 16:22:10" limit-uptime=12h name=fbp742 password=\
    fbp742 profile=witno-12jam
add comment="sep/25/2023 17:05:16" limit-uptime=12h name=gvh663 password=\
    gvh663 profile=witno-12jam
add comment="sep/25/2023 10:39:30" limit-uptime=12h name=ibv566 password=\
    ibv566 profile=witno-12jam
add comment="sep/25/2023 13:26:48" limit-uptime=12h name=ysf529 password=\
    ysf529 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=hhe964 password=hhe964 \
    profile=-default-1-hp
add comment="sep/28/2023 17:24:57" limit-uptime=12h name=cjm449 password=\
    cjm449 profile=witno-12jam
add comment="sep/27/2023 08:21:02" limit-uptime=12h name=cde262 password=\
    cde262 profile=witno-12jam
add comment="sep/28/2023 11:58:15" limit-uptime=12h name=fkh483 password=\
    fkh483 profile=witno-12jam
add comment="sep/27/2023 12:03:31" limit-uptime=12h name=jym334 password=\
    jym334 profile=witno-12jam
add comment="sep/27/2023 13:26:13" limit-uptime=12h name=xyg893 password=\
    xyg893 profile=witno-12jam
add comment="sep/28/2023 18:31:24" limit-uptime=12h name=etj723 password=\
    etj723 profile=witno-12jam
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=bkc888 password=bkc888 \
    profile=-default-1-hp
add comment=vc-815-05.15.23-FREE limit-uptime=12h name=tcd873 password=tcd873 \
    profile=-default-1-hp
add comment="sep/30/2023 10:34:28" limit-uptime=12h name=gmt595 password=\
    gmt595 profile=witno-12jam
add comment="sep/30/2023 15:16:31" limit-uptime=12h name=gpw784 password=\
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
add comment="sep/18/2023 01:47:21" limit-uptime=8h name=kix479 password=\
    kix479 profile=agus
add comment="sep/15/2023 16:42:53" limit-uptime=8h name=wsd955 password=\
    wsd955 profile=agus
add comment="sep/18/2023 05:13:46" limit-uptime=8h name=svf323 password=\
    svf323 profile=agus
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
add comment="sep/18/2023 09:52:29" limit-uptime=8h name=sxd928 password=\
    sxd928 profile=agus
add comment="sep/17/2023 16:19:42" limit-uptime=8h name=vyx396 password=\
    vyx396 profile=agus
add comment="sep/17/2023 20:33:09" limit-uptime=8h name=skv598 password=\
    skv598 profile=agus
add comment="sep/14/2023 01:38:58" limit-uptime=8h name=swc399 password=\
    swc399 profile=agus
add comment="sep/19/2023 14:04:43" limit-uptime=8h name=aai594 password=\
    aai594 profile=-default-1-hp
add comment="sep/16/2023 22:51:53" limit-uptime=8h name=bsb354 password=\
    bsb354 profile=agus
add comment="sep/17/2023 22:59:32" limit-uptime=8h name=dma568 password=\
    dma568 profile=agus
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
add comment="sep/17/2023 17:40:57" limit-uptime=8h name=izr728 password=\
    izr728 profile=agus
add comment="sep/16/2023 14:46:20" limit-uptime=8h name=kdm452 password=\
    kdm452 profile=agus
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
add comment="sep/26/2023 21:34:06" limit-uptime=8h name=hku265 password=\
    hku265 profile=agus
add comment="sep/26/2023 19:21:38" limit-uptime=8h name=jab346 password=\
    jab346 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=gjz624 password=gjz624 \
    profile=agus
add comment="sep/29/2023 19:30:02" limit-uptime=8h name=exi292 password=\
    exi292 profile=agus
add comment="sep/27/2023 17:20:31" limit-uptime=8h name=uym728 password=\
    uym728 profile=agus
add comment="sep/27/2023 22:56:40" limit-uptime=8h name=icz374 password=\
    icz374 profile=agus
add comment="sep/27/2023 18:43:45" limit-uptime=8h name=ujv565 password=\
    ujv565 profile=agus
add comment="sep/29/2023 07:39:23" limit-uptime=8h name=gra386 password=\
    gra386 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=vtx427 password=vtx427 \
    profile=agus
add comment="sep/30/2023 09:35:38" limit-uptime=8h name=rhz624 password=\
    rhz624 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=nwt576 password=nwt576 \
    profile=agus
add comment="sep/27/2023 07:53:46" limit-uptime=8h name=der496 password=\
    der496 profile=agus
add comment="sep/27/2023 10:11:38" limit-uptime=8h name=afv734 password=\
    afv734 profile=agus
add comment="sep/28/2023 20:29:34" limit-uptime=8h name=kzg948 password=\
    kzg948 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pgf366 password=pgf366 \
    profile=agus
add comment="oct/01/2023 15:38:02" limit-uptime=8h name=cid235 password=\
    cid235 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=yde892 password=yde892 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pvj224 password=pvj224 \
    profile=agus
add comment="oct/01/2023 12:34:51" limit-uptime=8h name=fuk924 password=\
    fuk924 profile=agus
add comment="oct/02/2023 19:17:50" limit-uptime=8h name=ctw848 password=\
    ctw848 profile=agus
add comment="sep/30/2023 17:31:55" limit-uptime=8h name=zxu679 password=\
    zxu679 profile=agus
add comment="sep/30/2023 17:13:48" limit-uptime=8h name=eid363 password=\
    eid363 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=rtf544 password=rtf544 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=pse928 password=pse928 \
    profile=agus
add comment="oct/02/2023 02:14:41" limit-uptime=8h name=hyj367 password=\
    hyj367 profile=agus
add comment="sep/28/2023 08:23:02" limit-uptime=8h name=uvk857 password=\
    uvk857 profile=agus
add comment="sep/29/2023 13:23:46" limit-uptime=8h name=feg775 password=\
    feg775 profile=agus
add comment="oct/02/2023 20:21:09" limit-uptime=8h name=bmr446 password=\
    bmr446 profile=agus
add comment="sep/30/2023 21:03:05" limit-uptime=8h name=jgf852 password=\
    jgf852 profile=agus
add comment="sep/28/2023 13:36:49" limit-uptime=8h name=nfb747 password=\
    nfb747 profile=agus
add comment="sep/30/2023 21:14:41" limit-uptime=8h name=tvk325 password=\
    tvk325 profile=agus
add comment="sep/30/2023 18:44:05" limit-uptime=8h name=bcv783 password=\
    bcv783 profile=agus
add comment="oct/02/2023 22:11:06" limit-uptime=8h name=csk377 password=\
    csk377 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=dzf726 password=dzf726 \
    profile=agus
add comment="sep/30/2023 20:34:50" limit-uptime=8h name=jep945 password=\
    jep945 profile=agus
add comment="oct/01/2023 08:28:25" limit-uptime=8h name=usx832 password=\
    usx832 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=cuj649 password=cuj649 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=uwn333 password=uwn333 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=auy476 password=auy476 \
    profile=agus
add comment="sep/29/2023 21:14:44" limit-uptime=8h name=vsi629 password=\
    vsi629 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=jxf646 password=jxf646 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=wcu553 password=wcu553 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=yri578 password=yri578 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=xvw667 password=xvw667 \
    profile=agus
add comment="sep/28/2023 12:56:05" limit-uptime=8h name=gtj355 password=\
    gtj355 profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=adv364 password=adv364 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=xyb973 password=xyb973 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=dxd793 password=dxd793 \
    profile=agus
add comment=vc-644-08.01.23-agus limit-uptime=8h name=tfk498 password=tfk498 \
    profile=agus
add comment="sep/28/2023 13:19:50" limit-uptime=8h name=myu425 password=\
    myu425 profile=agus
add comment="sep/30/2023 12:45:02" limit-uptime=8h name=hpw779 password=\
    hpw779 profile=agus
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
add comment="oct/02/2023 10:47:52" limit-uptime=8h name=bja645 password=\
    bja645 profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=dip694 password=dip694 \
    profile=dian
add comment="oct/02/2023 15:29:38" limit-uptime=8h name=trn632 password=\
    trn632 profile=dian
add comment="oct/02/2023 19:47:19" limit-uptime=8h name=shi237 password=\
    shi237 profile=dian
add comment="oct/02/2023 20:28:14" limit-uptime=8h name=gyy445 password=\
    gyy445 profile=dian
add comment="oct/01/2023 14:03:21" limit-uptime=8h name=xpr942 password=\
    xpr942 profile=dian
add comment="oct/01/2023 19:59:05" limit-uptime=8h name=wuc424 password=\
    wuc424 profile=dian
add comment="oct/01/2023 22:30:28" limit-uptime=8h name=xis384 password=\
    xis384 profile=dian
add comment="oct/02/2023 07:45:22" limit-uptime=8h name=ytt595 password=\
    ytt595 profile=dian
add comment="oct/02/2023 14:15:18" limit-uptime=8h name=inw466 password=\
    inw466 profile=dian
add comment="sep/29/2023 20:15:17" limit-uptime=8h name=cza376 password=\
    cza376 profile=dian
add comment="sep/30/2023 16:20:13" limit-uptime=8h name=wks477 password=\
    wks477 profile=dian
add comment="sep/30/2023 15:54:50" limit-uptime=8h name=sax573 password=\
    sax573 profile=dian
add comment=vc-122-08.07.23-dian limit-uptime=8h name=euu643 password=euu643 \
    profile=dian
add comment="sep/29/2023 21:23:48" limit-uptime=8h name=wgm455 password=\
    wgm455 profile=dian
add comment="oct/01/2023 20:11:58" limit-uptime=8h name=ndv395 password=\
    ndv395 profile=dian
add comment="sep/30/2023 13:53:09" limit-uptime=8h name=bjy696 password=\
    bjy696 profile=dian
add comment="sep/29/2023 13:36:50" limit-uptime=8h name=sgb993 password=\
    sgb993 profile=dian
add comment="sep/29/2023 07:28:03" limit-uptime=8h name=fpe659 password=\
    fpe659 profile=dian
add comment="sep/29/2023 07:17:22" limit-uptime=8h name=wab865 password=\
    wab865 profile=dian
add comment="sep/27/2023 12:51:16" limit-uptime=8h name=wmy634 password=\
    wmy634 profile=dian
add comment="sep/28/2023 06:09:57" limit-uptime=8h name=utr579 password=\
    utr579 profile=dian
add comment="sep/28/2023 16:41:03" limit-uptime=8h name=adf364 password=\
    adf364 profile=dian
add comment="sep/28/2023 20:56:34" limit-uptime=8h name=yyz978 password=\
    yyz978 profile=dian
add comment="sep/29/2023 06:47:10" limit-uptime=8h name=ucg694 password=\
    ucg694 profile=dian
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
add comment="oct/02/2023 10:41:45" limit-uptime=8h name=suf768 password=\
    suf768 profile=evi
add comment="oct/02/2023 10:39:22" limit-uptime=8h name=hbf744 password=\
    hbf744 profile=evi
add comment="oct/02/2023 14:12:41" limit-uptime=8h name=hrv843 password=\
    hrv843 profile=evi
add comment="oct/02/2023 18:45:06" limit-uptime=8h name=psv422 password=\
    psv422 profile=evi
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
add comment="sep/29/2023 11:35:54" limit-uptime=8h name=ckv738 password=\
    ckv738 profile=evi
add comment="sep/29/2023 13:18:49" limit-uptime=8h name=fhc883 password=\
    fhc883 profile=evi
add comment="sep/29/2023 13:19:18" limit-uptime=8h name=sry486 password=\
    sry486 profile=evi
add comment="sep/29/2023 13:49:29" limit-uptime=8h name=sjy694 password=\
    sjy694 profile=evi
add comment="sep/29/2023 15:58:18" limit-uptime=8h name=xts638 password=\
    xts638 profile=evi
add comment=vc-303-08.07.23-evi limit-uptime=8h name=bda554 password=bda554 \
    profile=evi
add comment="oct/01/2023 17:54:38" limit-uptime=8h name=esv356 password=\
    esv356 profile=evi
add comment="sep/29/2023 18:45:37" limit-uptime=8h name=sfs928 password=\
    sfs928 profile=evi
add comment="sep/30/2023 14:57:00" limit-uptime=8h name=mnj927 password=\
    mnj927 profile=evi
add comment="oct/02/2023 10:31:30" limit-uptime=8h name=erp375 password=\
    erp375 profile=evi
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
add comment="sep/17/2023 13:33:02" limit-uptime=8h name=mui453 password=\
    mui453 profile=agus
add comment="sep/17/2023 02:28:30" limit-uptime=8h name=tve768 password=\
    tve768 profile=agus
add comment="sep/16/2023 20:05:46" limit-uptime=8h name=uzh998 password=\
    uzh998 profile=agus
add comment="sep/16/2023 21:21:49" limit-uptime=8h name=tfj885 password=\
    tfj885 profile=agus
add comment="sep/16/2023 19:12:31" limit-uptime=8h name=acs977 password=\
    acs977 profile=agus
add comment="sep/17/2023 09:47:16" limit-uptime=8h name=gxg334 password=\
    gxg334 profile=nazim
add comment="sep/17/2023 09:34:50" limit-uptime=8h name=hvs732 password=\
    hvs732 profile=nazim
add comment="sep/17/2023 10:35:09" limit-uptime=8h name=ejd265 password=\
    ejd265 profile=nazim
add comment="sep/17/2023 15:39:55" limit-uptime=8h name=une249 password=\
    une249 profile=nazim
add comment="sep/17/2023 17:43:18" limit-uptime=8h name=kam953 password=\
    kam953 profile=nazim
add comment="sep/17/2023 16:07:04" limit-uptime=8h name=wwz834 password=\
    wwz834 profile=nazim
add comment="sep/18/2023 11:00:45" limit-uptime=8h name=jmk488 password=\
    jmk488 profile=nazim
add comment="sep/18/2023 17:10:31" limit-uptime=8h name=wad982 password=\
    wad982 profile=nazim
add comment="sep/18/2023 18:24:41" limit-uptime=8h name=nnu366 password=\
    nnu366 profile=nazim
add comment="sep/20/2023 14:51:25" limit-uptime=8h name=fgf255 password=\
    fgf255 profile=nazim
add comment="sep/17/2023 19:24:15" limit-uptime=8h name=mep852 password=\
    mep852 profile=nazim
add comment="sep/18/2023 14:20:00" limit-uptime=8h name=bvy353 password=\
    bvy353 profile=nazim
add comment="sep/18/2023 18:16:58" limit-uptime=8h name=grk773 password=\
    grk773 profile=nazim
add comment="sep/18/2023 18:25:36" limit-uptime=8h name=evx778 password=\
    evx778 profile=nazim
add comment="sep/20/2023 10:33:50" limit-uptime=8h name=abj552 password=\
    abj552 profile=nazim
add comment=vc-854-08.17.23-nazim limit-uptime=8h name=jid856 password=jid856 \
    profile=nazim
add comment="sep/18/2023 20:20:25" limit-uptime=8h name=arx746 password=\
    arx746 profile=nazim
add comment="sep/19/2023 12:14:43" limit-uptime=8h name=wtz854 password=\
    wtz854 profile=nazim
add comment="sep/20/2023 12:42:43" limit-uptime=8h name=gsf843 password=\
    gsf843 profile=nazim
add comment=vc-854-08.17.23-nazim limit-uptime=8h name=kwi897 password=kwi897 \
    profile=nazim
add comment="sep/18/2023 21:24:55" limit-uptime=8h name=zxb647 password=\
    zxb647 profile=nazim
add comment="sep/19/2023 12:46:06" limit-uptime=8h name=jif542 password=\
    jif542 profile=nazim
add comment="sep/19/2023 19:26:48" limit-uptime=8h name=juh589 password=\
    juh589 profile=nazim
add comment="sep/19/2023 21:45:43" limit-uptime=8h name=rwf874 password=\
    rwf874 profile=nazim
add comment="sep/20/2023 09:41:56" limit-uptime=8h name=nxf352 password=\
    nxf352 profile=nazim
add comment="sep/21/2023 13:28:32" limit-uptime=8h name=the633 password=\
    the633 profile=nazim
add comment="sep/21/2023 13:55:05" limit-uptime=8h name=iis274 password=\
    iis274 profile=nazim
add comment="sep/21/2023 17:17:05" limit-uptime=8h name=wsp556 password=\
    wsp556 profile=nazim
add comment="sep/22/2023 09:17:13" limit-uptime=8h name=bby993 password=\
    bby993 profile=nazim
add comment="sep/22/2023 16:05:20" limit-uptime=8h name=rna595 password=\
    rna595 profile=nazim
add comment="sep/23/2023 06:23:51" limit-uptime=8h name=fjd626 password=\
    fjd626 profile=nazim
add comment="sep/23/2023 12:02:55" limit-uptime=8h name=kzy984 password=\
    kzy984 profile=nazim
add comment="sep/23/2023 16:37:02" limit-uptime=8h name=pah854 password=\
    pah854 profile=nazim
add comment="sep/23/2023 13:19:05" limit-uptime=8h name=wdg877 password=\
    wdg877 profile=nazim
add comment="sep/23/2023 15:54:14" limit-uptime=8h name=rvz723 password=\
    rvz723 profile=nazim
add comment="sep/29/2023 09:44:59" limit-uptime=8h name=vuv664 password=\
    vuv664 profile=nazim
add comment="sep/23/2023 17:19:51" limit-uptime=8h name=sci253 password=\
    sci253 profile=nazim
add comment="sep/24/2023 12:06:04" limit-uptime=8h name=kzf394 password=\
    kzf394 profile=nazim
add comment="sep/24/2023 13:11:16" limit-uptime=8h name=knv364 password=\
    knv364 profile=nazim
add comment="sep/25/2023 13:17:16" limit-uptime=8h name=aax982 password=\
    aax982 profile=nazim
add comment="sep/23/2023 17:34:36" limit-uptime=8h name=ipn436 password=\
    ipn436 profile=nazim
add comment="sep/24/2023 13:45:08" limit-uptime=8h name=ngd472 password=\
    ngd472 profile=nazim
add comment="sep/24/2023 17:33:54" limit-uptime=8h name=bvg555 password=\
    bvg555 profile=nazim
add comment="sep/25/2023 14:41:15" limit-uptime=8h name=tat888 password=\
    tat888 profile=nazim
add comment="sep/25/2023 16:18:53" limit-uptime=8h name=rss267 password=\
    rss267 profile=nazim
add comment="sep/24/2023 19:39:32" limit-uptime=8h name=izv726 password=\
    izv726 profile=nazim
add comment="sep/25/2023 13:32:06" limit-uptime=8h name=ydu974 password=\
    ydu974 profile=nazim
add comment="sep/25/2023 13:38:35" limit-uptime=8h name=duc745 password=\
    duc745 profile=nazim
add comment="sep/25/2023 20:32:57" limit-uptime=8h name=zwj775 password=\
    zwj775 profile=nazim
add comment="sep/26/2023 08:29:54" limit-uptime=8h name=suw478 password=\
    suw478 profile=nazim
add comment="sep/26/2023 11:19:47" limit-uptime=8h name=nca842 password=\
    nca842 profile=nazim
add comment="sep/26/2023 13:56:13" limit-uptime=8h name=khw243 password=\
    khw243 profile=nazim
add comment="sep/27/2023 08:50:03" limit-uptime=8h name=kmt648 password=\
    kmt648 profile=nazim
add comment="sep/26/2023 18:18:14" limit-uptime=8h name=vhk284 password=\
    vhk284 profile=nazim
add comment="sep/27/2023 09:39:29" limit-uptime=8h name=arw262 password=\
    arw262 profile=nazim
add comment="sep/27/2023 10:46:59" limit-uptime=8h name=bmd573 password=\
    bmd573 profile=nazim
add comment="sep/28/2023 04:45:55" limit-uptime=8h name=nfm677 password=\
    nfm677 profile=nazim
add comment="sep/27/2023 12:58:48" limit-uptime=8h name=cub658 password=\
    cub658 profile=nazim
add comment="sep/27/2023 13:03:08" limit-uptime=8h name=bgw626 password=\
    bgw626 profile=nazim
add comment="sep/27/2023 17:04:02" limit-uptime=8h name=iaw699 password=\
    iaw699 profile=nazim
add comment="sep/28/2023 16:41:01" limit-uptime=8h name=kck799 password=\
    kck799 profile=nazim
add comment="sep/27/2023 20:37:27" limit-uptime=8h name=hgm452 password=\
    hgm452 profile=nazim
add comment="sep/27/2023 18:57:51" limit-uptime=8h name=epy676 password=\
    epy676 profile=nazim
add comment="sep/27/2023 17:07:38" limit-uptime=8h name=kds666 password=\
    kds666 profile=nazim
add comment="sep/28/2023 01:05:31" limit-uptime=8h name=ruh749 password=\
    ruh749 profile=nazim
add comment="sep/28/2023 16:45:22" limit-uptime=8h name=ryy295 password=\
    ryy295 profile=nazim
add comment="sep/29/2023 15:27:28" limit-uptime=8h name=eud398 password=\
    eud398 profile=nazim
add comment="sep/28/2023 18:39:51" limit-uptime=8h name=dzx555 password=\
    dzx555 profile=nazim
add comment="sep/29/2023 19:38:44" limit-uptime=8h name=rde885 password=\
    rde885 profile=nazim
add comment="sep/29/2023 13:49:43" limit-uptime=8h name=vvx648 password=\
    vvx648 profile=nazim
add comment="sep/28/2023 17:13:45" limit-uptime=8h name=pyi254 password=\
    pyi254 profile=nazim
add comment="sep/28/2023 22:51:42" limit-uptime=8h name=knm644 password=\
    knm644 profile=nazim
add comment="sep/29/2023 12:49:22" limit-uptime=8h name=bzt845 password=\
    bzt845 profile=nazim
add comment="sep/29/2023 20:32:14" limit-uptime=8h name=djp662 password=\
    djp662 profile=nazim
add comment="sep/30/2023 08:20:26" limit-uptime=8h name=hje826 password=\
    hje826 profile=nazim
add comment="sep/29/2023 20:48:11" limit-uptime=8h name=mxt492 password=\
    mxt492 profile=nazim
add comment="sep/30/2023 13:24:07" limit-uptime=8h name=ygt442 password=\
    ygt442 profile=nazim
add comment="sep/30/2023 14:24:44" limit-uptime=8h name=mps444 password=\
    mps444 profile=nazim
add comment="sep/30/2023 15:10:32" limit-uptime=8h name=dhn358 password=\
    dhn358 profile=nazim
add comment="sep/30/2023 16:35:26" limit-uptime=8h name=ymv938 password=\
    ymv938 profile=nazim
add comment="oct/01/2023 15:49:03" limit-uptime=8h name=ezv743 password=\
    ezv743 profile=nazim
add comment="oct/01/2023 13:03:39" limit-uptime=8h name=hic375 password=\
    hic375 profile=nazim
add comment="oct/01/2023 13:03:23" limit-uptime=8h name=cww752 password=\
    cww752 profile=nazim
add comment="oct/01/2023 11:58:46" limit-uptime=8h name=nyf288 password=\
    nyf288 profile=nazim
add comment="sep/30/2023 22:16:11" limit-uptime=8h name=bxa768 password=\
    bxa768 profile=nazim
add comment="oct/02/2023 06:16:53" limit-uptime=8h name=xgp457 password=\
    xgp457 profile=nazim
add comment="oct/02/2023 08:44:58" limit-uptime=8h name=pzy343 password=\
    pzy343 profile=nazim
add comment="oct/01/2023 18:49:55" limit-uptime=8h name=swr888 password=\
    swr888 profile=nazim
add comment="oct/01/2023 18:49:07" limit-uptime=8h name=yxe594 password=\
    yxe594 profile=nazim
add comment="oct/01/2023 20:26:30" limit-uptime=8h name=ssp734 password=\
    ssp734 profile=nazim
add comment="oct/01/2023 19:34:48" limit-uptime=8h name=prr837 password=\
    prr837 profile=nazim
add comment="oct/02/2023 11:04:13" limit-uptime=8h name=esy398 password=\
    esy398 profile=nazim
add comment="oct/02/2023 14:01:37" limit-uptime=8h name=dtx763 password=\
    dtx763 profile=nazim
add comment="oct/02/2023 13:32:07" limit-uptime=8h name=naf274 password=\
    naf274 profile=nazim
add comment="oct/02/2023 13:50:09" limit-uptime=8h name=wpb752 password=\
    wpb752 profile=nazim
add comment="oct/02/2023 14:17:31" limit-uptime=8h name=psi497 password=\
    psi497 profile=nazim
add comment="oct/02/2023 15:40:08" limit-uptime=8h name=xfe629 password=\
    xfe629 profile=nazim
add comment="oct/02/2023 19:13:28" limit-uptime=8h name=awf696 password=\
    awf696 profile=nazim
add comment=vc-854-08.17.23-nazim limit-uptime=8h name=gms349 password=gms349 \
    profile=nazim
add comment="oct/02/2023 19:20:58" limit-uptime=8h name=sda465 password=\
    sda465 profile=nazim
add comment="sep/28/2023 12:00:24" limit-uptime=12h mac-address=\
    0C:C6:FD:01:01:89 name=ejk729 password=ejk729 profile=wawan
add comment="sep/29/2023 07:30:05" limit-uptime=12h mac-address=\
    0C:98:38:3C:BF:9F name=ttt632 password=ttt632 profile=wawan
add comment="oct/01/2023 09:12:35" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=srr278 password=srr278 profile=wawan
add comment="oct/02/2023 17:43:48" limit-uptime=12h mac-address=\
    B0:B5:C3:98:9F:53 name=xzv936 password=xzv936 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=sbs226 password=\
    sbs226 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=vvi444 password=\
    vvi444 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=pir477 password=\
    pir477 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=esa876 password=\
    esa876 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=yse928 password=\
    yse928 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ivd569 password=\
    ivd569 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=udc962 password=\
    udc962 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=cub675 password=\
    cub675 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=pyf324 password=\
    pyf324 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=dcz772 password=\
    dcz772 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=yar583 password=\
    yar583 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ynk257 password=\
    ynk257 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ava783 password=\
    ava783 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ahd878 password=\
    ahd878 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=brk277 password=\
    brk277 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=bzn397 password=\
    bzn397 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=wxx226 password=\
    wxx226 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=vsn983 password=\
    vsn983 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=mua579 password=\
    mua579 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=jsa848 password=\
    jsa848 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=mvd726 password=\
    mvd726 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=zbg643 password=\
    zbg643 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ttb629 password=\
    ttb629 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=zcr857 password=\
    zcr857 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=xge532 password=\
    xge532 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=vft557 password=\
    vft557 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ksu475 password=\
    ksu475 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=cjx739 password=\
    cjx739 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=cme889 password=\
    cme889 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=jue277 password=\
    jue277 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=mfs844 password=\
    mfs844 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=ipy428 password=\
    ipy428 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=kzb897 password=\
    kzb897 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=gzk978 password=\
    gzk978 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=jrd958 password=\
    jrd958 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=pfp986 password=\
    pfp986 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=snb726 password=\
    snb726 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=vau768 password=\
    vau768 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=bdb368 password=\
    bdb368 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=zrd929 password=\
    zrd929 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=mwh977 password=\
    mwh977 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=rws276 password=\
    rws276 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=xhm982 password=\
    xhm982 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=kdh488 password=\
    kdh488 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=nvb245 password=\
    nvb245 profile=wawan
add comment=vc-722-08.26.23-wawan limit-uptime=12h name=isj566 password=\
    isj566 profile=wawan
add comment=vc-536-08.27.23-dian limit-uptime=8h name=pxv479 password=pxv479 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xcx562 password=xcx562 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=mpj275 password=mpj275 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=asc225 password=asc225 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=kkv465 password=kkv465 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ddf495 password=ddf495 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hae259 password=hae259 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xuc848 password=xuc848 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vrn934 password=vrn934 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=nue892 password=nue892 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=pnu488 password=pnu488 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gap557 password=gap557 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ypf628 password=ypf628 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hne298 password=hne298 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hfr986 password=hfr986 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hpd987 password=hpd987 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=fyc245 password=fyc245 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rwy364 password=rwy364 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=yns893 password=yns893 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zet942 password=zet942 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gsz536 password=gsz536 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ppz584 password=ppz584 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xiz938 password=xiz938 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=sge332 password=sge332 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=nnx355 password=nnx355 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zct533 password=zct533 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xfa548 password=xfa548 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rxg999 password=rxg999 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=erh425 password=erh425 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=uwk693 password=uwk693 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=fnj772 password=fnj772 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rjy522 password=rjy522 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gup523 password=gup523 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gdw286 password=gdw286 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=kwz236 password=kwz236 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rsd786 password=rsd786 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=msb339 password=msb339 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xyz437 password=xyz437 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=wdc847 password=wdc847 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=pgb286 password=pgb286 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ugr528 password=ugr528 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vhp666 password=vhp666 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=jxt344 password=jxt344 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=yby654 password=yby654 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=bas623 password=bas623 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=dvp592 password=dvp592 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zan886 password=zan886 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ahs925 password=ahs925 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zjr789 password=zjr789 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=jcw674 password=jcw674 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=dam829 password=dam829 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=csc966 password=csc966 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=jdp485 password=jdp485 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=smw522 password=smw522 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vwy335 password=vwy335 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zjv986 password=zjv986 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=fyk827 password=fyk827 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=bvy886 password=bvy886 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xjb845 password=xjb845 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vmc423 password=vmc423 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xnz599 password=xnz599 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hga284 password=hga284 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=apn392 password=apn392 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=mek859 password=mek859 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=fjn293 password=fjn293 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=kxz969 password=kxz969 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vim375 password=vim375 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=myy883 password=myy883 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gmk387 password=gmk387 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=tne967 password=tne967 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=the279 password=the279 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xvu646 password=xvu646 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=thf263 password=thf263 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gkf259 password=gkf259 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=nrh648 password=nrh648 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=mdv982 password=mdv982 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ktz833 password=ktz833 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vxy458 password=vxy458 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rfd388 password=rfd388 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=sup564 password=sup564 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=tic523 password=tic523 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=icz585 password=icz585 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=dyw889 password=dyw889 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=vjw658 password=vjw658 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zgk256 password=zgk256 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=ina787 password=ina787 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=dvs384 password=dvs384 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=kcu948 password=kcu948 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=pjz823 password=pjz823 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=gvc622 password=gvc622 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=rbu994 password=rbu994 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=kvp644 password=kvp644 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=pkn456 password=pkn456 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=aka772 password=aka772 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=szi986 password=szi986 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=xuy926 password=xuy926 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=emp827 password=emp827 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=mjc624 password=mjc624 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=hez659 password=hez659 \
    profile=dian
add comment=vc-536-08.27.23-dian limit-uptime=8h name=zyh922 password=zyh922 \
    profile=dian
add comment=vc-524-08.27.23-agus limit-uptime=8h name=mgz643 password=mgz643 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=rum624 password=rum624 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=vty739 password=vty739 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ash535 password=ash535 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=wkg394 password=wkg394 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=kej585 password=kej585 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=xzx634 password=xzx634 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ifd374 password=ifd374 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=hei296 password=hei296 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=pxc494 password=pxc494 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=geh642 password=geh642 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ngd783 password=ngd783 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=fsx494 password=fsx494 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ukc679 password=ukc679 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=xkj222 password=xkj222 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=bhv269 password=bhv269 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=fmv924 password=fmv924 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=nps375 password=nps375 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=aax326 password=aax326 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=gih249 password=gih249 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=jkm676 password=jkm676 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ahz454 password=ahz454 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=dvw623 password=dvw623 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=rpv528 password=rpv528 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=bzr645 password=bzr645 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=xyh648 password=xyh648 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ywn873 password=ywn873 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=bxs753 password=bxs753 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=fgj656 password=fgj656 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=nzd479 password=nzd479 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=rty589 password=rty589 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ewf799 password=ewf799 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=vvp643 password=vvp643 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ujp935 password=ujp935 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=fpw239 password=fpw239 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=akg886 password=akg886 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=vni576 password=vni576 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=pih776 password=pih776 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=fvm774 password=fvm774 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=uya759 password=uya759 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=bdp464 password=bdp464 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=rdp923 password=rdp923 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=jwu464 password=jwu464 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=vpn522 password=vpn522 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=agz556 password=agz556 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=vfb582 password=vfb582 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=svi588 password=svi588 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=xux622 password=xux622 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=hkp256 password=hkp256 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=svb593 password=svb593 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=ucd842 password=ucd842 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=mtp734 password=mtp734 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=chy359 password=chy359 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=geg575 password=geg575 \
    profile=agus
add comment=vc-524-08.27.23-agus limit-uptime=8h name=rma835 password=rma835 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=gjr886 password=gjr886 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=egm238 password=egm238 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=cjt457 password=cjt457 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=mmn659 password=mmn659 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=arv822 password=arv822 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=izk655 password=izk655 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=ant579 password=ant579 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=gne295 password=gne295 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pvz398 password=pvz398 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=vdu245 password=vdu245 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=utt349 password=utt349 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=aay975 password=aay975 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=uwi276 password=uwi276 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=vkv834 password=vkv834 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pmp455 password=pmp455 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=gkh849 password=gkh849 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=ncb598 password=ncb598 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=vxd325 password=vxd325 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=acw835 password=acw835 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=vvx763 password=vvx763 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=cwv494 password=cwv494 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=jbn256 password=jbn256 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=kjv243 password=kjv243 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=gus467 password=gus467 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=dpw697 password=dpw697 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=enu778 password=enu778 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=nkx455 password=nkx455 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=bgi995 password=bgi995 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=rxg343 password=rxg343 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pii892 password=pii892 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=fyr427 password=fyr427 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=vkp482 password=vkp482 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=dws783 password=dws783 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=prn662 password=prn662 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=uzi755 password=uzi755 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=iut985 password=iut985 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=rie655 password=rie655 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=jwd292 password=jwd292 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=cvk625 password=cvk625 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=mkz438 password=mkz438 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=ngd444 password=ngd444 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=tpr776 password=tpr776 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=zfa278 password=zfa278 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=dff728 password=dff728 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=hhv549 password=hhv549 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=kfz822 password=kfz822 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=imt892 password=imt892 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pbt888 password=pbt888 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pyk982 password=pyk982 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=efp367 password=efp367 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pce898 password=pce898 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pzh346 password=pzh346 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=cej389 password=cej389 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=pmd858 password=pmd858 \
    profile=agus
add comment=vc-928-08.27.23-agus limit-uptime=8h name=yjb763 password=yjb763 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=gkb855 password=gkb855 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=zhy393 password=zhy393 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=fde889 password=fde889 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=kxe667 password=kxe667 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=jgw483 password=jgw483 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=ips475 password=ips475 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=egw254 password=egw254 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=bbk726 password=bbk726 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=bcw933 password=bcw933 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=uex683 password=uex683 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=wrs269 password=wrs269 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=rcc373 password=rcc373 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=epa742 password=epa742 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=fsv378 password=fsv378 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=cmi262 password=cmi262 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=arf775 password=arf775 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=vwv838 password=vwv838 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=nkb456 password=nkb456 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=fwv739 password=fwv739 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=azf256 password=azf256 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=ikh682 password=ikh682 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=tdh929 password=tdh929 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=teg542 password=teg542 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=tde596 password=tde596 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=iks779 password=iks779 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=npe744 password=npe744 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=avt256 password=avt256 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=txu683 password=txu683 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=vbm438 password=vbm438 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=cmi898 password=cmi898 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=zvm839 password=zvm839 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=aee886 password=aee886 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=prk638 password=prk638 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=wbn489 password=wbn489 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=zpk697 password=zpk697 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=vzn244 password=vzn244 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=acf843 password=acf843 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=kdf422 password=kdf422 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=egd534 password=egd534 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=cyj636 password=cyj636 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=fkx955 password=fkx955 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=iza532 password=iza532 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=kni266 password=kni266 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=dxd228 password=dxd228 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=gin483 password=gin483 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=dws875 password=dws875 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=kah238 password=kah238 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=mxa238 password=mxa238 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=aua956 password=aua956 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=uwn363 password=uwn363 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=kay597 password=kay597 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=fun982 password=fun982 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=yfk895 password=yfk895 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=api897 password=api897 \
    profile=agus
add comment=vc-332-08.27.23-agus limit-uptime=8h name=vae522 password=vae522 \
    profile=agus
add comment=vc-800-08.27.23-wati limit-uptime=8h name=neb465 password=neb465 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cwe965 password=cwe965 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gae895 password=gae895 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=irx378 password=irx378 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=npz323 password=npz323 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mde734 password=mde734 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ect779 password=ect779 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=web688 password=web688 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vwr655 password=vwr655 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zuy375 password=zuy375 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vbc374 password=vbc374 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zav576 password=zav576 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jus495 password=jus495 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xnh848 password=xnh848 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xdh332 password=xdh332 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=uae586 password=uae586 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yff558 password=yff558 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rmt248 password=rmt248 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zem355 password=zem355 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dis386 password=dis386 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ctj247 password=ctj247 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vkj529 password=vkj529 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jup737 password=jup737 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=pug837 password=pug837 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zib867 password=zib867 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rnc282 password=rnc282 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kcz285 password=kcz285 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zyc525 password=zyc525 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=une683 password=une683 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ezk878 password=ezk878 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jva639 password=jva639 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vvc557 password=vvc557 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yhz543 password=yhz543 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fax697 password=fax697 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kwe986 password=kwe986 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yef477 password=yef477 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ast745 password=ast745 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zwv798 password=zwv798 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=amc449 password=amc449 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=awr424 password=awr424 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rgh375 password=rgh375 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=nge929 password=nge929 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fgs857 password=fgs857 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ayy893 password=ayy893 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xdh237 password=xdh237 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bdh768 password=bdh768 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mcs727 password=mcs727 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mwz483 password=mwz483 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ypp736 password=ypp736 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gii537 password=gii537 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wzh938 password=wzh938 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vvi882 password=vvi882 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wrg635 password=wrg635 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kpv733 password=kpv733 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fwc497 password=fwc497 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dch785 password=dch785 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cfv995 password=cfv995 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ypc826 password=ypc826 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mak327 password=mak327 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kdb463 password=kdb463 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jdm852 password=jdm852 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mss894 password=mss894 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=swe477 password=swe477 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gxv277 password=gxv277 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fnm274 password=fnm274 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kuw938 password=kuw938 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mrd594 password=mrd594 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wch299 password=wch299 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vyj626 password=vyj626 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ycv684 password=ycv684 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cxj788 password=cxj788 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wse532 password=wse532 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xmk329 password=xmk329 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ppt896 password=ppt896 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mdm934 password=mdm934 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vcg855 password=vcg855 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xkf596 password=xkf596 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jgb597 password=jgb597 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ggd878 password=ggd878 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dky876 password=dky876 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=hzz447 password=hzz447 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=nxa873 password=nxa873 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=tub868 password=tub868 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fts975 password=fts975 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=sjd863 password=sjd863 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=uss649 password=uss649 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ika927 password=ika927 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=sxr365 password=sxr365 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vdt799 password=vdt799 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bfz545 password=bfz545 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ege954 password=ege954 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jwd645 password=jwd645 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zuc256 password=zuc256 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bne972 password=bne972 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=waz673 password=waz673 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=nfk623 password=nfk623 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cyg487 password=cyg487 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=baa283 password=baa283 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=pef388 password=pef388 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dzd382 password=dzd382 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=veh776 password=veh776 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cus757 password=cus757 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=utt993 password=utt993 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fbp774 password=fbp774 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rae472 password=rae472 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=tnp759 password=tnp759 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=stx882 password=stx882 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=acw762 password=acw762 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=hzs967 password=hzs967 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=akk335 password=akk335 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=iwi734 password=iwi734 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=aum289 password=aum289 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cdw775 password=cdw775 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zpy268 password=zpy268 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vpe992 password=vpe992 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ryk947 password=ryk947 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bdx878 password=bdx878 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rwp265 password=rwp265 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=hfs447 password=hfs447 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yad348 password=yad348 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=epv394 password=epv394 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vrd235 password=vrd235 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kku924 password=kku924 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wpe349 password=wpe349 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mxv427 password=mxv427 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yvu733 password=yvu733 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jtu747 password=jtu747 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jgv256 password=jgv256 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wzb776 password=wzb776 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bjn877 password=bjn877 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kct952 password=kct952 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jhz976 password=jhz976 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gdv379 password=gdv379 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kev272 password=kev272 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=pwn353 password=pwn353 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yrk363 password=yrk363 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ife686 password=ife686 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kzn879 password=kzn879 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bxs344 password=bxs344 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ewg893 password=ewg893 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dae324 password=dae324 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gph973 password=gph973 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=eud448 password=eud448 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vrx686 password=vrx686 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yaj222 password=yaj222 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=irw495 password=irw495 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xvp593 password=xvp593 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cew855 password=cew855 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vky527 password=vky527 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vpc328 password=vpc328 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fgv657 password=fgv657 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ccm997 password=ccm997 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=evs794 password=evs794 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ddz962 password=ddz962 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rkk623 password=rkk623 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fdr957 password=fdr957 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gff868 password=gff868 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gyz772 password=gyz772 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=pde283 password=pde283 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cwe466 password=cwe466 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=htj324 password=htj324 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cvn358 password=cvn358 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ibb384 password=ibb384 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=nss758 password=nss758 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yrv354 password=yrv354 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wjr635 password=wjr635 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gtw367 password=gtw367 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mxb954 password=mxb954 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xye497 password=xye497 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fvy538 password=fvy538 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=igx697 password=igx697 \
    profile=wati
add comment="sep/29/2023 12:41:17" limit-uptime=8h name=rra534 password=\
    rra534 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=eph747 password=eph747 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=njp934 password=njp934 \
    profile=wati
add comment="oct/02/2023 00:16:16" limit-uptime=8h name=vic385 password=\
    vic385 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mdt775 password=mdt775 \
    profile=wati
add comment="sep/29/2023 13:43:18" limit-uptime=8h name=sng575 password=\
    sng575 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dga577 password=dga577 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wcw365 password=wcw365 \
    profile=wati
add comment="oct/01/2023 19:47:33" limit-uptime=8h name=kjy927 password=\
    kjy927 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vea637 password=vea637 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fdf979 password=fdf979 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rzi234 password=rzi234 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gap692 password=gap692 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jvb823 password=jvb823 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=tpc332 password=tpc332 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=azv456 password=azv456 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jfs323 password=jfs323 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=tca683 password=tca683 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=udb944 password=udb944 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=pts846 password=pts846 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vuj263 password=vuj263 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yjh888 password=yjh888 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=uyr458 password=uyr458 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ith564 password=ith564 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xia983 password=xia983 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=cfp866 password=cfp866 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=unr762 password=unr762 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wcn434 password=wcn434 \
    profile=wati
add comment="sep/30/2023 16:10:49" limit-uptime=8h name=auz725 password=\
    auz725 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=uyg853 password=uyg853 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bwd598 password=bwd598 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=idx472 password=idx472 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=uyx553 password=uyx553 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vwz377 password=vwz377 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=khf578 password=khf578 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=sge323 password=sge323 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zfz955 password=zfz955 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=nra726 password=nra726 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jup466 password=jup466 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=sdw369 password=sdw369 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vgv472 password=vgv472 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=juh758 password=juh758 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xub896 password=xub896 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=gaw229 password=gaw229 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=hcs279 password=hcs279 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=vdw879 password=vdw879 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=icr585 password=icr585 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=kzz762 password=kzz762 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fmk453 password=fmk453 \
    profile=wati
add comment="sep/29/2023 23:43:53" limit-uptime=8h name=tpr585 password=\
    tpr585 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=djx634 password=djx634 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=eyd364 password=eyd364 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zgf795 password=zgf795 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=ncz486 password=ncz486 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=wfc497 password=wfc497 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=mca835 password=mca835 \
    profile=wati
add comment="oct/02/2023 06:31:31" limit-uptime=8h name=mrb335 password=\
    mrb335 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rvm625 password=rvm625 \
    profile=wati
add comment="oct/02/2023 19:25:29" limit-uptime=8h name=gxe736 password=\
    gxe736 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=xji346 password=xji346 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=yms282 password=yms282 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=fcv772 password=fcv772 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=bng763 password=bng763 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rkb447 password=rkb447 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=tck875 password=tck875 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=sbg956 password=sbg956 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=agy969 password=agy969 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=zva778 password=zva778 \
    profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=jks886 password=jks886 \
    profile=wati
add comment="oct/01/2023 00:32:27" limit-uptime=8h name=jsd797 password=\
    jsd797 profile=wati
add comment="sep/30/2023 12:41:52" limit-uptime=8h name=vsr564 password=\
    vsr564 profile=wati
add comment="oct/01/2023 15:25:26" limit-uptime=8h name=kux424 password=\
    kux424 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=dbm853 password=dbm853 \
    profile=wati
add comment="sep/29/2023 09:22:51" limit-uptime=8h name=gdm859 password=\
    gdm859 profile=wati
add comment="oct/01/2023 13:00:12" limit-uptime=8h name=paa425 password=\
    paa425 profile=wati
add comment="oct/01/2023 23:53:20" limit-uptime=8h name=kdu226 password=\
    kdu226 profile=wati
add comment="sep/30/2023 13:49:37" limit-uptime=8h name=tif524 password=\
    tif524 profile=wati
add comment=vc-800-08.27.23-wati limit-uptime=8h name=rvx285 password=rvx285 \
    profile=wati
add comment="oct/03/2023 01:48:58" limit-uptime=8h name=efr223 password=\
    efr223 profile=wati
add comment="oct/01/2023 10:19:34" limit-uptime=12h name=zfe868 password=\
    zfe868 profile=witno-12jam
add comment="oct/01/2023 15:18:02" limit-uptime=12h name=bsc635 password=\
    bsc635 profile=witno-12jam
add comment="oct/01/2023 16:14:13" limit-uptime=12h name=msg529 password=\
    msg529 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=nue979 password=\
    nue979 profile=witno-12jam
add comment="oct/01/2023 18:38:28" limit-uptime=12h name=der768 password=\
    der768 profile=witno-12jam
add comment="oct/02/2023 09:16:04" limit-uptime=12h name=dbc225 password=\
    dbc225 profile=witno-12jam
add comment="oct/02/2023 12:54:43" limit-uptime=12h name=xss227 password=\
    xss227 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=jxm952 password=\
    jxm952 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=znr468 password=\
    znr468 profile=witno-12jam
add comment="oct/02/2023 18:11:33" limit-uptime=12h name=yyt724 password=\
    yyt724 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=btc367 password=\
    btc367 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vkv934 password=\
    vkv934 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=atg489 password=\
    atg489 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=swr642 password=\
    swr642 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vsg949 password=\
    vsg949 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=upw274 password=\
    upw274 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=eug947 password=\
    eug947 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=sep685 password=\
    sep685 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vfz869 password=\
    vfz869 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=hyg352 password=\
    hyg352 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ymj474 password=\
    ymj474 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=gmf737 password=\
    gmf737 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=hgg294 password=\
    hgg294 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ayy279 password=\
    ayy279 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=iwc965 password=\
    iwc965 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=hif836 password=\
    hif836 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=auv586 password=\
    auv586 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=hnt375 password=\
    hnt375 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ama452 password=\
    ama452 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=zzc478 password=\
    zzc478 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=tus558 password=\
    tus558 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=khg232 password=\
    khg232 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=fzm256 password=\
    fzm256 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=fuz534 password=\
    fuz534 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ipn888 password=\
    ipn888 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=wcz927 password=\
    wcz927 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=bei742 password=\
    bei742 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=rae458 password=\
    rae458 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=pxv978 password=\
    pxv978 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=pkw435 password=\
    pkw435 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vzu975 password=\
    vzu975 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=nia643 password=\
    nia643 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=bec246 password=\
    bec246 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=htm623 password=\
    htm623 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=jzp548 password=\
    jzp548 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=uvt329 password=\
    uvt329 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=rzw855 password=\
    rzw855 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ddb845 password=\
    ddb845 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=yfv977 password=\
    yfv977 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=fdz555 password=\
    fdz555 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=jwe249 password=\
    jwe249 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=cki694 password=\
    cki694 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=nmm696 password=\
    nmm696 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ffj786 password=\
    ffj786 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=mwz373 password=\
    mwz373 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=svc764 password=\
    svc764 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=wft738 password=\
    wft738 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=hhy338 password=\
    hhy338 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vje662 password=\
    vje662 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=gtz425 password=\
    gtz425 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=tca885 password=\
    tca885 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=vsp247 password=\
    vsp247 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ktv342 password=\
    ktv342 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=wfz398 password=\
    wfz398 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ubv992 password=\
    ubv992 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=izy996 password=\
    izy996 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ysv357 password=\
    ysv357 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=drw796 password=\
    drw796 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ips595 password=\
    ips595 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=aci488 password=\
    aci488 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=zea832 password=\
    zea832 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=ctg889 password=\
    ctg889 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=cyt769 password=\
    cyt769 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=kxy992 password=\
    kxy992 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=cfd322 password=\
    cfd322 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=fjm743 password=\
    fjm743 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=bsy352 password=\
    bsy352 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=pmu596 password=\
    pmu596 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=xfk848 password=\
    xfk848 profile=witno-12jam
add comment=vc-706-08.30.23-witno limit-uptime=12h name=mby264 password=\
    mby264 profile=witno-12jam
/ip route
add comment=isp1 distance=1 gateway=192.168.18.1 routing-mark=ether1
add comment=isp1>isp2 distance=2 gateway=192.168.23.1 routing-mark=ether1
add comment=isp1>vpn1 distance=3 gateway=10.123.22.7 routing-mark=ether1
add comment=vpn1 distance=1 gateway=10.123.22.7 routing-mark=vpn
add comment=vpn1 distance=2 gateway=10.123.22.1 routing-mark=vpn
add comment=iiisp1 distance=10 gateway=192.168.18.1 routing-mark=vpn
add comment=iiisp2 distance=11 gateway=192.168.23.1 routing-mark=vpn
add comment=isp2 distance=1 gateway=192.168.23.1 routing-mark=ether2
add comment=isp2>isp1 distance=2 gateway=192.168.18.1 routing-mark=ether2
add comment=isp2>vpn1 distance=4 gateway=10.123.22.7 routing-mark=ether2
add comment=" router-rumah" distance=1 gateway=10.20.254.2 routing-mark=\
    router-rumah
add comment=iisp2 distance=20 gateway=192.168.23.1
add comment=iisp1 distance=30 gateway=192.168.18.1
add comment="     cek ISP2" distance=1 dst-address=1.0.0.3/32 gateway=\
    192.168.23.1
add comment="     cek ISP1" distance=1 dst-address=1.1.1.3/32 gateway=\
    192.168.18.1
add comment="     cek ISP2" disabled=yes distance=1 dst-address=8.8.4.4/32 \
    gateway=192.168.23.1
add comment="     cek ISP1" disabled=yes distance=1 dst-address=8.8.8.8/32 \
    gateway=192.168.18.1
add comment="      cek ISP2" distance=1 dst-address=9.9.9.11/32 gateway=\
    192.168.23.1
add comment="     cek ISP2" distance=1 dst-address=94.140.14.15/32 gateway=\
    192.168.23.1
add comment="     cek ISP1" distance=1 dst-address=94.140.15.16/32 gateway=\
    192.168.18.1
add comment=iiiisp2 distance=12 dst-address=103.143.170.11/32 gateway=\
    192.168.23.1
add comment=iiiisp1 distance=13 dst-address=103.143.170.11/32 gateway=\
    192.168.18.1
add comment="      cek ISP1" distance=1 dst-address=142.251.241.3/32 gateway=\
    192.168.18.1
add comment="     cek ISP1" distance=1 dst-address=149.112.112.11/32 gateway=\
    192.168.18.1
/ip route rule
add comment="PC MIRZA > ISP1" disabled=yes src-address=10.20.254.3/32 table=\
    ether1
add comment="PC MIRZA > ISP2" disabled=yes src-address=10.20.254.3/32 table=\
    ether2
add comment=isp1 src-address=10.20.254.4/32 table=ether1
add comment="ip 99/24 ke router rumah" disabled=yes dst-address=\
    192.168.99.0/24 table=router-rumah
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
set ether7-mirza disabled=yes
set ether8-belakang disabled=yes
set ether9-rumah disabled=yes
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
add comment=tegal-sekar name=29sekar@mnet.com password=29sekar@mnet.com \
    profile=area-tegal remote-address=10.10.2.28 service=pppoe
add comment=tegal-agus name=agus@mnet.com password=agus@mnet.com profile=\
    area-tegal remote-address=10.10.2.29 service=pppoe
add comment=tegal-anis name=anis@mnet.com password=anis@mnet.com profile=\
    area-tegal remote-address=10.10.2.30 service=pppoe
add comment=tegal-rini name=rini@mnet.com password=rini@mnet.com profile=\
    area-tegal remote-address=10.10.2.31 service=pppoe
add comment=tegal-andi name=andi@mnet.com password=andi@mnet.com profile=\
    area-tegal remote-address=10.10.2.32 service=pppoe
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
    \n/system script run ##clear-dns&log\r\
    \n\r\
    \n/system script run #update-speedtest" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=04:23:00
add interval=4w name=###restart-tiap-00-hari on-event="/system reboot" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=04:24:55
add interval=2m name="~ping isp2" on-event=":local intisp \"ether2\"\r\
    \n:local namaisp \"isp2\"\r\
    \n\r\
    \n:local time [/system clock get time]\r\
    \n:local error \"    \$namaisp mati \$time -\"\r\
    \n:local aman \"    \$namaisp nyala \$time -\"\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.8.8 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.8.8 GOOGLE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.8.8 GOOGLE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.4.4 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.4.4 GOOGLE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.4.4 GOOGLE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.1 CLOUDFLARE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.1 CLOUDFLARE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.1 CLOUDFLARE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.1 CLOUDFLARE\")\r\
    \n};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=1.1.1.2 count=3 ] = 0) d\
    o={\r\
    \n#log error (\"\$error 1.1.1.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 1.1.1.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n#};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.2 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.3 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.3 CLOUDFLARE Malware and Adult Content Blocki\
    ng Together\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.3 CLOUDFLARE Malware and Adult Content Bloc\
    king Together\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.3 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.3 CLOUDFLARE Malware and Adult Content Blocki\
    ng Together\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.3 CLOUDFLARE Malware and Adult Content Bloc\
    king Together\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.9 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 9.9.9.9 QUAD 9\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.9 QUAD 9\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.112 count=3 ]\
    \_= 0) do={\r\
    \nlog error (\"\$error 149.112.112.112 QUAD 9\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.112 QUAD 9\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.11 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.11 QUAD 9 Secured ECS: Malware blocking, DNSS\
    EC Validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.11 QUAD 9 Secured ECS: Malware blocking, DN\
    SSEC Validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.11 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 149.112.112.11 QUAD 9 Secured ECS: Malware blocking\
    , DNSSEC Validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.11 QUAD 9 Secured ECS: Malware blocki\
    ng, DNSSEC Validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.10 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.10 QUAD 9 Unsecured: No Malware blocking, no \
    DNSSEC validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.10 QUAD 9 Unsecured: No Malware blocking, n\
    o DNSSEC validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.10 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 149.112.112.10 QUAD 9 Unsecured: No Malware blockin\
    g, no DNSSEC validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.10 QUAD 9 Unsecured: No Malware block\
    ing, no DNSSEC validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.222.222 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.222.222 OpenDNS\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.222 OpenDNS\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.220.220 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.220.220 OpenDNS\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.220 OpenDNS\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.222.123 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.222.123 OpenDNS FamilyShield\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.123 OpenDNS FamilyShield\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.220.123 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.220.123 OpenDNS FamilyShield\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.123 OpenDNS FamilyShield\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.14 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.14 AdGuard\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.14 AdGuard\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.15.15 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.15.15 AdGuard\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.15.15 AdGuard\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.140 count=3 ] =\
    \_0) do={\r\
    \nlog error (\"\$error 94.140.14.140 AdGuard Non-filtering\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.140 AdGuard Non-filtering\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.141 count=3 ] =\
    \_0) do={\r\
    \nlog error (\"\$error 94.140.14.141 AdGuard Non-filtering\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.141 AdGuard Non-filtering\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.15 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.15 AdGuard Family protection\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.15 AdGuard Family protection\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.15.16 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.15.16 AdGuard Family protection\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.15.16 AdGuard Family protection\")\r\
    \n};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=77.88.8.1 count=3 ] = 0)\
    \_do={\r\
    \n#log error (\"\$error 77.88.8.1 Yandex\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 77.88.8.1 Yandex\")\r\
    \n#};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=77.88.8.8 count=3 ] = 0)\
    \_do={\r\
    \n#log error (\"\$error 77.88.8.8 Yandex\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 77.88.8.8 Yandex\")\r\
    \n#};\r\
    \n\r\
    \n\r\
    \n#:delay 1s;\r\
    \n#log info message=\"\$namaisp batasssss\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=17:32:44
add interval=2m name="~ping isp1" on-event=":local intisp \"ether1\"\r\
    \n:local namaisp \"isp1\"\r\
    \n\r\
    \n:local time [/system clock get time]\r\
    \n:local error \"\$namaisp mati \$time -\"\r\
    \n:local aman \"\$namaisp nyala \$time -\"\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.8.8 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.8.8 GOOGLE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.8.8 GOOGLE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=8.8.4.4 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 8.8.4.4 GOOGLE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.4.4 GOOGLE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.1 CLOUDFLARE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.1 CLOUDFLARE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.1 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.1 CLOUDFLARE\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.1 CLOUDFLARE\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.2 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.2 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.2 CLOUDFLARE Malware Blocking Only\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.1.1.3 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.1.1.3 CLOUDFLARE Malware and Adult Content Blocki\
    ng Together\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.3 CLOUDFLARE Malware and Adult Content Bloc\
    king Together\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=1.0.0.3 count=3 ] = 0) do\
    ={\r\
    \nlog error (\"\$error 1.0.0.3 CLOUDFLARE Malware and Adult Content Blocki\
    ng Together\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.3 CLOUDFLARE Malware and Adult Content Bloc\
    king Together\")\r\
    \n};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=9.9.9.9 count=3 ] = 0) d\
    o={\r\
    \n#log error (\"\$error 9.9.9.9 QUAD 9\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 9.9.9.9 QUAD 9\")\r\
    \n#};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=149.112.112.112 count=3 \
    ] = 0) do={\r\
    \n#log error (\"\$error 149.112.112.112 QUAD 9\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 149.112.112.112 QUAD 9\")\r\
    \n#};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.11 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.11 QUAD 9 Secured ECS: Malware blocking, DNSS\
    EC Validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.11 QUAD 9 Secured ECS: Malware blocking, DN\
    SSEC Validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.11 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 149.112.112.11 QUAD 9 Secured ECS: Malware blocking\
    , DNSSEC Validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.11 QUAD 9 Secured ECS: Malware blocki\
    ng, DNSSEC Validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=9.9.9.10 count=3 ] = 0) d\
    o={\r\
    \nlog error (\"\$error 9.9.9.10 QUAD 9 Unsecured: No Malware blocking, no \
    DNSSEC validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.10 QUAD 9 Unsecured: No Malware blocking, n\
    o DNSSEC validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=149.112.112.10 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 149.112.112.10 QUAD 9 Unsecured: No Malware blockin\
    g, no DNSSEC validation\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.10 QUAD 9 Unsecured: No Malware block\
    ing, no DNSSEC validation\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.222.222 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.222.222 OpenDNS\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.222 OpenDNS\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.220.220 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.220.220 OpenDNS\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.220 OpenDNS\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.222.123 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.222.123 OpenDNS FamilyShield\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.123 OpenDNS FamilyShield\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=208.67.220.123 count=3 ] \
    = 0) do={\r\
    \nlog error (\"\$error 208.67.220.123 OpenDNS FamilyShield\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.123 OpenDNS FamilyShield\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.14 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.14 AdGuard\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.14 AdGuard\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.15.15 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.15.15 AdGuard\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.15.15 AdGuard\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.140 count=3 ] =\
    \_0) do={\r\
    \nlog error (\"\$error 94.140.14.140 AdGuard Non-filtering\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.140 AdGuard Non-filtering\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.141 count=3 ] =\
    \_0) do={\r\
    \nlog error (\"\$error 94.140.14.141 AdGuard Non-filtering\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.141 AdGuard Non-filtering\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.14.15 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.14.15 AdGuard Family protection\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.15 AdGuard Family protection\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping routing-table=\"\$intisp\" address=94.140.15.16 count=3 ] = \
    0) do={\r\
    \nlog error (\"\$error 94.140.15.16 AdGuard Family protection\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.15.16 AdGuard Family protection\")\r\
    \n};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=77.88.8.1 count=3 ] = 0)\
    \_do={\r\
    \n#log error (\"\$error 77.88.8.1 Yandex\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 77.88.8.1 Yandex\")\r\
    \n#};\r\
    \n\r\
    \n#:if ([/ping routing-table=\"\$intisp\" address=77.88.8.8 count=3 ] = 0)\
    \_do={\r\
    \n#log error (\"\$error 77.88.8.8 Yandex\")\r\
    \n#} else={\r\
    \n##log warning (\"\$aman 77.88.8.8 Yandex\")\r\
    \n#};\r\
    \n\r\
    \n\r\
    \n#:delay 1s;\r\
    \n#log info message=\"\$namaisp batasssss\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=17:32:44
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
add disabled=yes interval=15m name="\$      auto ON" on-event="/ip firewall ma\
    ngle enable [find comment=\"                DISABLE hotspot tethering\"]\r\
    \n/system scheduler enable  \"\\\$      auto OFF\"\r\
    \n/system scheduler disable \"\\\$      auto ON\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=15m name="\$      auto OFF" on-event="/ip firewall mangle disable\
    \_[find comment=\"                DISABLE hotspot tethering\"]\r\
    \n/system scheduler disable \"\\\$      auto OFF\"\r\
    \n/system scheduler enable  \"\\\$      auto ON\"\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1d name="\$  auto trial on jm set6" on-event="/ip hotspot profile\
    \_set vlan-hotspot login-by=http-chap,mac-cookie,trial" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=18:30:00
add interval=1d name="\$ auto trial off jm set9" on-event=\
    "/ip hotspot profile set vlan-hotspot login-by=http-chap,mac-cookie" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=20:30:00
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
    start-date=jan/01/2023 start-time=17:32:44
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
    556
add dont-require-permissions=no name=~total-lan-UP owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    39
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
    source=15
add dont-require-permissions=no name=~total-ether1-isp1-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=210
add dont-require-permissions=no name=~total-ether2-isp2-DOWN owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=23
add dont-require-permissions=no name=~total-ether2-isp2-UP owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=356
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
    \n/tool netwatch set disabled=no [find comment=\"     VPN1 DNS\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN2 REMOTE\"]\r\
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
    \n/tool netwatch set disabled=no [find comment=\"     VPN1 DNS\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN2 REMOTE\"]\r\
    \n\r\
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
    \n/tool netwatch set disabled=no [find comment=\"     VPN1 DNS\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN2 REMOTE\"]\r\
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
    \n/tool netwatch set disabled=no [find comment=\"     VPN1 DNS\"]\r\
    \n/tool netwatch set disabled=no [find comment=\"     VPN2 REMOTE\"]\r\
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
add comment=mikhmon dont-require-permissions=no name="aug/18/2023-|-23:44:12-|\
    -jyg333-|-1000-|-172.16.0.98-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/18/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-07:48:59-|\
    -kti294-|-1000-|-172.16.0.188-|-00:08:22:A8:AA:24-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-08:35:44-|\
    -sis962-|-1000-|-172.16.0.67-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-11:07:28-|\
    -jpk727-|-1000-|-172.16.0.223-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-15:38:42-|\
    -fbs839-|-1000-|-172.16.0.101-|-36:7C:C2:E8:2E:D9-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-18:16:57-|\
    -ifp546-|-1000-|-172.16.0.250-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-18:55:00-|\
    -uys465-|-1000-|-172.16.0.255-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-21:00:18-|\
    -fpm753-|-1000-|-172.16.0.98-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/19/2023-|-21:40:18-|\
    -djp756-|-1000-|-172.16.0.67-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/19/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-03:15:02-|\
    -kya475-|-1000-|-172.16.0.108-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-09:37:03-|\
    -bib295-|-1000-|-172.16.1.15-|-14:47:2D:9B:F7:E7-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-09:41:58-|\
    -nxf352-|-1000-|-172.16.1.65-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-10:29:31-|\
    -rys352-|-1000-|-172.16.1.76-|-14:47:2D:99:CD:7B-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-10:33:53-|\
    -abj552-|-1000-|-172.16.0.133-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-11:12:28-|\
    -gjw539-|-1000-|-172.16.0.40-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-12:42:46-|\
    -gsf843-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-13:20:18-|\
    -fjc788-|-1000-|-172.16.1.101-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-14:04:53-|\
    -fcg894-|-1000-|-172.16.0.98-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-14:19:14-|\
    -ckb864-|-1000-|-172.16.0.250-|-08:7F:98:B3:29:A1-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-14:42:26-|\
    -ncf295-|-1000-|-172.16.0.243-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-14:51:27-|\
    -fgf255-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-16:28:19-|\
    -ttg237-|-1000-|-172.16.0.67-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/20/2023-|-19:45:42-|\
    -sjj497-|-1000-|-172.16.0.115-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/20/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-11:01:03-|\
    -mrj392-|-1000-|-172.16.1.125-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-13:12:21-|\
    -msg546-|-1000-|-172.16.1.188-|-C0:87:EB:7B:4A:35-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-13:28:34-|\
    -the633-|-1000-|-172.16.1.65-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-13:55:08-|\
    -iis274-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-17:17:08-|\
    -wsp556-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/21/2023-|-19:56:37-|\
    -pfc967-|-1000-|-172.16.1.222-|-38:29:5A:6F:0A:29-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/21/2023
add comment=mikhmon dont-require-permissions=no name="aug/22/2023-|-09:17:15-|\
    -bby993-|-1000-|-172.16.0.73-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/22/2023
add comment=mikhmon dont-require-permissions=no name="aug/22/2023-|-12:59:01-|\
    -vvk286-|-1000-|-172.16.1.189-|-96:19:3C:8F:BB:31-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/22/2023
add comment=mikhmon dont-require-permissions=no name="aug/22/2023-|-16:05:22-|\
    -rna595-|-1000-|-172.16.2.23-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/22/2023
add comment=mikhmon dont-require-permissions=no name="aug/22/2023-|-20:03:41-|\
    -rtd745-|-1000-|-172.16.2.44-|-0A:42:8F:C8:BE:9A-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/22/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-06:23:54-|\
    -fjd626-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-12:02:58-|\
    -kzy984-|-1000-|-172.16.0.106-|-D2:6B:83:C4:30:ED-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-13:19:08-|\
    -wdg877-|-1000-|-172.16.0.57-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-13:41:36-|\
    -bny348-|-1000-|-172.16.0.119-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-14:59:52-|\
    -psh958-|-1000-|-172.16.0.43-|-C0:87:EB:7B:4A:35-|-31d-|-evi-|-vc-929-07.1\
    0.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-15:45:53-|\
    -yuf745-|-1000-|-172.16.0.142-|-36:7C:C2:E8:2E:D9-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-15:54:16-|\
    -rvz723-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-16:37:05-|\
    -pah854-|-1000-|-172.16.0.112-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-17:19:54-|\
    -sci253-|-1000-|-172.16.0.136-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/23/2023-|-17:34:38-|\
    -ipn436-|-1000-|-172.16.0.53-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/23/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-12:06:06-|\
    -kzf394-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-13:10:48-|\
    -icd884-|-1000-|-172.16.0.212-|-96:E1:E1:EA:4D:74-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-13:11:18-|\
    -knv364-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-13:11:24-|\
    -ttj422-|-1000-|-172.16.0.211-|-42:6D:A9:D1:D2:0B-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-13:11:51-|\
    -rgf285-|-1000-|-172.16.0.214-|-6A:F7:CD:31:6B:A2-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-13:45:11-|\
    -ngd472-|-1000-|-172.16.0.194-|-2E:AC:62:26:12:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-16:14:27-|\
    -fbp296-|-1000-|-172.16.0.118-|-96:19:3C:8F:BB:31-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-17:33:56-|\
    -bvg555-|-1000-|-172.16.0.57-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-18:39:57-|\
    -wks223-|-1000-|-172.16.0.243-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-18:40:28-|\
    -abh839-|-1000-|-172.16.0.245-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/24/2023-|-19:39:35-|\
    -izv726-|-1000-|-172.16.0.250-|-86:8F:E5:EF:A0:50-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/24/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-12:41:56-|\
    -zfi438-|-1000-|-172.16.0.119-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-13:17:18-|\
    -aax982-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-13:32:08-|\
    -ydu974-|-1000-|-172.16.1.48-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-13:38:38-|\
    -duc745-|-1000-|-172.16.1.49-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-14:41:17-|\
    -tat888-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-16:18:55-|\
    -rss267-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-19:51:22-|\
    -hzj999-|-1000-|-172.16.0.66-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-20:32:59-|\
    -zwj775-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-22:20:15-|\
    -ggx525-|-1000-|-172.16.1.103-|-DE:E4:4B:BE:63:ED-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-23:29:14-|\
    -zkv472-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/25/2023-|-23:47:06-|\
    -gkp592-|-1000-|-172.16.0.239-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/25/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-08:29:56-|\
    -suw478-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add dont-require-permissions=no name=#update-speedtest owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    ip firewall address-list remove [find comment=\"MNET-SPEEDTEST\"]\r\
    \n/ip dns cache flush\r\
    \n:delay 1s\r\
    \n:if ([:len [/file find name=list-ip-speedtest.rsc]] > 0) do={/file remov\
    e list-ip-speedtest.rsc }; \r\
    \n:delay 1s\r\
    \n/tool fetch url=\"https://mnet.my.id/file/uploads/settingan-mikrotik/ip-\
    address/list-ip-speedtest.rsc\" mode=http;\r\
    \n/import list-ip-speedtest.rsc\r\
    \n:delay 5s\r\
    \n/file remove list-ip-speedtest.rsc\r\
    \n:log info message=\"berhasil import list-ip-speedtest.rsc\";"
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-10:55:33-|\
    -txe836-|-1000-|-172.16.1.124-|-0C:A8:A7:9F:5E:3C-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-10:58:36-|\
    -sfc932-|-1000-|-172.16.0.203-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-10:59:09-|\
    -pue698-|-1000-|-172.16.1.123-|-DA:AC:07:3A:6D:7A-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-11:19:49-|\
    -nca842-|-1000-|-172.16.0.112-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-11:26:29-|\
    -ijz762-|-1000-|-172.16.0.168-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-11:26:54-|\
    -rtn294-|-1000-|-172.16.1.131-|-DE:32:49:A2:E6:6A-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-11:57:31-|\
    -bpr768-|-1000-|-172.16.1.126-|-D8:55:75:CF:9F:CD-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-12:00:02-|\
    -cdb937-|-1000-|-172.16.1.135-|-20:3B:69:D7:A8:15-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-12:29:20-|\
    -nts824-|-1000-|-172.16.1.69-|-F2:C9:5C:2B:57:59-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-12:49:27-|\
    -vvw632-|-1000-|-172.16.0.182-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-13:56:15-|\
    -khw243-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-16:26:06-|\
    -pez525-|-1000-|-172.16.0.115-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-18:18:17-|\
    -vhk284-|-1000-|-172.16.0.57-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-18:25:39-|\
    -ukt326-|-1000-|-172.16.1.167-|-4E:0F:00:CF:16:24-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-18:34:10-|\
    -uui924-|-1000-|-172.16.1.173-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-18:35:20-|\
    -mbg429-|-1000-|-172.16.1.172-|-6C:D7:1F:2F:8F:AD-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-19:25:56-|\
    -vgf287-|-1000-|-172.16.1.180-|-0C:98:38:3C:BF:9F-|-31d-|-wawan-|-vc-226-0\
    6.18.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-19:27:38-|\
    -ujc882-|-1000-|-172.16.1.91-|-C4:FE:5B:73:81:91-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-20:11:17-|\
    -vsd823-|-1000-|-172.16.1.177-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/26/2023-|-20:48:36-|\
    -cjg723-|-1000-|-172.16.0.66-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/26/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-00:31:37-|\
    -ymb638-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-08:50:05-|\
    -kmt648-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-09:39:31-|\
    -arw262-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-10:47:01-|\
    -bmd573-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-11:30:34-|\
    -wdr722-|-1000-|-172.16.1.246-|-5A:C7:22:C3:F9:1A-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-12:58:50-|\
    -cub658-|-1000-|-172.16.0.112-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-13:03:10-|\
    -bgw626-|-1000-|-172.16.0.53-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-13:39:26-|\
    -yjh974-|-1000-|-172.16.1.230-|-EE:FE:44:80:FB:EB-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-14:59:06-|\
    -nsf454-|-1000-|-172.16.0.119-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-16:15:39-|\
    -ezj458-|-1000-|-172.16.1.110-|-C0:87:EB:7B:4A:35-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-17:04:04-|\
    -iaw699-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-17:07:40-|\
    -kds666-|-1000-|-172.16.1.217-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-18:57:53-|\
    -epy676-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-20:37:30-|\
    -hgm452-|-1000-|-172.16.2.50-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/27/2023-|-21:31:45-|\
    -vej546-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/27/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-01:05:33-|\
    -ruh749-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-03:50:35-|\
    -xbr832-|-1000-|-172.16.0.182-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-04:45:58-|\
    -nfm677-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-12:00:27-|\
    -ejk729-|-1000-|-172.16.2.87-|-0C:C6:FD:01:01:89-|-31d-|-wawan-|-vc-722-08\
    .26.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-12:33:40-|\
    -afa832-|-1000-|-172.16.1.177-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-521-07\
    .10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-12:54:00-|\
    -zue865-|-1000-|-172.16.2.95-|-16:25:6D:D5:FD:70-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-13:34:22-|\
    -mvv762-|-1000-|-172.16.0.66-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-13:53:34-|\
    -bfj925-|-1000-|-172.16.2.99-|-8C:AA:CE:2C:9D:48-|-31d-|-wati-|-vc-521-07.\
    10.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-15:17:34-|\
    -kii736-|-1000-|-172.16.1.166-|-38:29:5A:6F:0A:29-|-31d-|-evi-|-vc-929-07.\
    10.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-16:41:03-|\
    -kck799-|-1000-|-172.16.1.217-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-16:45:24-|\
    -ryy295-|-1000-|-172.16.0.53-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-17:13:47-|\
    -pyi254-|-1000-|-172.16.2.116-|-9C:F5:31:88:42:E3-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-18:39:54-|\
    -dzx555-|-1000-|-172.16.2.129-|-84:6F:CE:2D:A5:E5-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/28/2023-|-22:51:44-|\
    -knm644-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/28/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-07:30:07-|\
    -ttt632-|-1000-|-172.16.1.180-|-0C:98:38:3C:BF:9F-|-31d-|-wawan-|-vc-722-0\
    8.26.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-09:22:54-|\
    -gdm859-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-09:45:02-|\
    -vuv664-|-1000-|-172.16.2.137-|-BE:FE:EA:03:19:88-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-11:35:56-|\
    -ckv738-|-1000-|-172.16.2.169-|-08:7F:98:C9:79:77-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-12:41:19-|\
    -rra534-|-1000-|-172.16.1.83-|-9C:6B:72:A3:4D:D3-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-12:49:24-|\
    -bzt845-|-1000-|-172.16.0.112-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-13:18:51-|\
    -fhc883-|-1000-|-172.16.2.177-|-96:E1:E1:EA:4D:74-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-13:19:20-|\
    -sry486-|-1000-|-172.16.2.176-|-42:6D:A9:D1:D2:0B-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-13:43:20-|\
    -sng575-|-1000-|-172.16.0.66-|-B6:C9:23:09:57:C0-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-13:49:31-|\
    -sjy694-|-1000-|-172.16.0.119-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-13:49:45-|\
    -vvx648-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-15:27:30-|\
    -eud398-|-1000-|-172.16.1.242-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-15:58:20-|\
    -xts638-|-1000-|-172.16.0.115-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-18:45:40-|\
    -sfs928-|-1000-|-172.16.2.214-|-FC:A5:D0:9A:26:23-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-19:38:46-|\
    -rde885-|-1000-|-172.16.2.128-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-20:32:16-|\
    -djp662-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-20:48:14-|\
    -mxt492-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/29/2023-|-23:43:55-|\
    -tpr585-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/29/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-08:20:29-|\
    -hje826-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-12:41:55-|\
    -vsr564-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-13:24:10-|\
    -ygt442-|-1000-|-172.16.1.217-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-13:49:40-|\
    -tif524-|-1000-|-172.16.0.182-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-14:24:47-|\
    -mps444-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-14:57:02-|\
    -mnj927-|-1000-|-172.16.3.13-|-0A:C6:F5:AF:69:12-|-31d-|-evi-|-vc-303-08.0\
    7.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-15:10:35-|\
    -dhn358-|-1000-|-172.16.3.22-|-68:BF:C4:33:69:92-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-16:10:51-|\
    -auz725-|-1000-|-172.16.3.24-|-14:DD:9C:FF:18:F7-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-16:35:29-|\
    -ymv938-|-1000-|-172.16.0.53-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/30/2023-|-22:16:13-|\
    -bxa768-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/30/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-00:32:29-|\
    -jsd797-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-09:12:38-|\
    -srr278-|-1000-|-172.16.2.24-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-722-08\
    .26.23-wawan" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-11:58:49-|\
    -nyf288-|-1000-|-172.16.0.112-|-0C:A8:A7:0C:EE:2E-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-13:00:15-|\
    -paa425-|-1000-|-172.16.1.177-|-7C:2A:DB:AB:C3:50-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-13:03:25-|\
    -cww752-|-1000-|-172.16.3.21-|-1A:69:4C:CD:1A:EC-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-13:03:41-|\
    -hic375-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-15:25:28-|\
    -kux424-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-15:49:05-|\
    -ezv743-|-1000-|-172.16.2.41-|-70:B7:AA:06:67:47-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-17:54:41-|\
    -esv356-|-1000-|-172.16.0.76-|-F2:06:C1:CD:C7:61-|-31d-|-evi-|-vc-303-08.0\
    7.23-evi" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add dont-require-permissions=no name=######dns-ke-isp-original owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/ip dns set servers=192.168.18.1,192.168.23.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n/tool netwatch set disabled=yes [find comment=\"     VPN1 DNS\"]\r\
    \n"
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-18:49:09-|\
    -yxe594-|-1000-|-172.16.2.129-|-84:6F:CE:2D:A5:E5-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-18:49:58-|\
    -swr888-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-19:34:50-|\
    -prr837-|-1000-|-172.16.0.87-|-8C:AA:CE:39:35:BA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-19:47:36-|\
    -kjy927-|-1000-|-172.16.2.101-|-18:02:AE:8E:C9:EB-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-20:26:32-|\
    -ssp734-|-1000-|-172.16.3.53-|-46:42:54:88:A3:36-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="aug/31/2023-|-23:53:22-|\
    -kdu226-|-1000-|-172.16.0.239-|-9A:47:4B:2C:1F:15-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=aug2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    aug/31/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-00:16:18-|\
    -vic385-|-1000-|-172.16.0.182-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-06:16:56-|\
    -xgp457-|-1000-|-172.16.0.53-|-DA:3A:FF:2F:B1:F7-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-06:31:33-|\
    -mrb335-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-08:45:00-|\
    -pzy343-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-09:16:06-|\
    -dbc225-|-1000-|-172.16.0.116-|-28:31:66:8E:F1:A1-|-31d-|-witno-12jam-|-vc\
    -706-08.30.23-witno" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-10:31:33-|\
    -erp375-|-1000-|-172.16.0.115-|-CC:2D:83:95:7B:E4-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-10:39:25-|\
    -hbf744-|-1000-|-172.16.0.148-|-4A:5D:76:86:19:27-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-10:41:47-|\
    -suf768-|-1000-|-172.16.0.119-|-20:34:FB:F7:F6:62-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-11:04:15-|\
    -esy398-|-1000-|-172.16.3.34-|-FA:76:75:E2:FB:63-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-12:54:45-|\
    -xss227-|-1000-|-172.16.2.247-|-76:5D:AD:43:D9:0A-|-31d-|-witno-12jam-|-vc\
    -706-08.30.23-witno" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-13:32:09-|\
    -naf274-|-1000-|-172.16.1.242-|-B2:09:C6:29:5F:34-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-13:50:11-|\
    -wpb752-|-1000-|-172.16.0.162-|-2C:4D:54:A9:F6:A6-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-14:01:39-|\
    -dtx763-|-1000-|-172.16.0.161-|-9A:9F:DC:03:D8:F2-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-14:12:44-|\
    -hrv843-|-1000-|-172.16.0.167-|-20:3B:69:D7:A8:15-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-14:17:34-|\
    -psi497-|-1000-|-172.16.0.35-|-16:B8:31:3E:97:FA-|-31d-|-nazim-|-vc-854-08\
    .17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-15:40:10-|\
    -xfe629-|-1000-|-172.16.1.245-|-62:2A:CD:15:E2:56-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-17:43:50-|\
    -xzv936-|-1000-|-172.16.2.24-|-B0:B5:C3:98:9F:53-|-31d-|-wawan-|-vc-722-08\
    .26.23-wawan" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-18:11:36-|\
    -yyt724-|-1000-|-172.16.0.92-|-EC:D0:9F:48:E1:A3-|-31d-|-witno-12jam-|-vc-\
    706-08.30.23-witno" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-18:45:09-|\
    -psv422-|-1000-|-172.16.0.191-|-F2:42:05:88:EC:61-|-31d-|-evi-|-vc-303-08.\
    07.23-evi" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-19:13:30-|\
    -awf696-|-1000-|-172.16.0.213-|-D2:97:87:1A:F3:99-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-19:21:00-|\
    -sda465-|-1000-|-172.16.2.128-|-F8:AB:82:1D:E2:7F-|-31d-|-nazim-|-vc-854-0\
    8.17.23-nazim" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/01/2023-|-19:25:32-|\
    -gxe736-|-1000-|-172.16.0.64-|-B4:A5:AC:B5:E9:F5-|-31d-|-wati-|-vc-800-08.\
    27.23-wati" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/01/2023
add comment=mikhmon dont-require-permissions=no name="sep/02/2023-|-01:49:01-|\
    -efr223-|-1000-|-172.16.0.204-|-16:DB:D2:B6:35:43-|-31d-|-wati-|-vc-800-08\
    .27.23-wati" owner=sep2023 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    sep/02/2023
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
add simple-queue=~rtrw-muksin
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
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"isp1 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1\" keep-result=no;" host=142.251.241.3 interval=12s timeout=2s \
    up-script="/tool netwatch set disabled=yes [find comment=\"z 1 NOTIF\"]\r\
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
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1\" keep-result=no;"
add comment="252 MIRZA ROUTER RUMAH" down-script="/tool fetch url=\"https://ap\
    i.telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessa\
    ge\\\?chat_id=-1001247315859&text=\\E2\\9D\\8C = mirza router rumah\" keep\
    -result=no;\r\
    \n}" host=10.20.254.2 timeout=2s up-script="/tool fetch url=\"https://api.\
    telegram.org/bot1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04/sendmessage\
    \\\?chat_id=-1001247315859&text=\\E2\\9C\\85 = mirza router rumah\" keep-r\
    esult=no;\r\
    \n}"
add comment="z 1 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp1 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 142.251.241.3 notif\" keep-result=no;" host=142.251.241.3 \
    interval=3s up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 142.251.241.3 notif\" keep-result=no;"
add comment="z 2 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp2 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2 9.9.9.11 notif\" keep-result=no;" host=9.9.9.11 interval=3s \
    timeout=100ms up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2 9.9.9.11 notif\" keep-result=no;"
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
    \n\r\
    \n/ip dns set servers=192.168.18.1,192.168.23.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n\r\
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
    \n\r\
    \n/ip dns set servers=10.123.22.7\r\
    \n/ip dns cache flush\r\
    \n:delay 500ms;\r\
    \n\r\
    \n\r\
    \n\r\
    \nlog warning (\"server vpn1\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 server vpn1\" keep-result=no;"
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
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"isp2 mati\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2\" keep-result=no;" host=9.9.9.11 interval=10s timeout=2s \
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
    \n/ip dns cache flush\r\
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
    8C isp1 149.112.112.11 notif\" keep-result=no;" host=149.112.112.11 \
    interval=3s up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 149.112.112.11 notif\" keep-result=no;"
add comment="z 2 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp2 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2 1.0.0.3 notif\" keep-result=no;" host=1.0.0.3 interval=3s \
    timeout=100ms up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2 1.0.0.3 notif\" keep-result=no;"
add comment="z 1 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp1 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 1.1.1.3 notif\" keep-result=no;" host=1.1.1.3 interval=3s \
    up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 1.1.1.3 notif\" keep-result=no;"
add comment="z 2 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp2 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp2 94.140.14.15 notif\" keep-result=no;" host=94.140.14.15 interval=\
    3s timeout=100ms up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp2 94.140.14.15 notif\" keep-result=no;"
add comment="z 1 NOTIF" disabled=yes down-script="\r\
    \n\r\
    \nlog error (\"isp1 mati notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C isp1 94.140.15.16 notif\" keep-result=no;" host=94.140.15.16 interval=\
    3s up-script="\r\
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 on notif\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 isp1 94.140.15.16 notif\" keep-result=no;"
add comment="253 MIRZA PC RUMAH" down-script="/ip firewall nat disable [find c\
    omment=\"                REDIRECT vpn > pc mirza\"]\r\
    \n\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9D\\\
    8C = komputer mirza rumah\" keep-result=no;\r\
    \n}" host=10.20.254.3 interval=5s timeout=2s up-script="/ip firewall nat e\
    nable [find comment=\"                REDIRECT vpn > pc mirza\"]\r\
    \n\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001247315859&text=\\E2\\9C\\\
    85 = komputer mirza rumah\" keep-result=no;\r\
    \n}"
add comment="      1 CEK MODEM" down-script="log error (\"ISP1 MODEM RTO\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=480176579&text=\\E2\\9D\\8C IS\
    P1 MODEM restart modem vpn.mnet.my.id:14561\" keep-result=no;" host=\
    192.168.18.1 interval=5s timeout=75ms up-script="log warning (\"ISP1 MODEM\
    \_CEPET\")\r\
    \n:delay 500ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=480176579&text=\\E2\\9C\\85 IS\
    P1 MODEM CEPET\" keep-result=no;"
add comment="      2 CEK MODEM" down-script="log error (\"ISP2 MODEM RTO\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=480176579&text=\\E2\\9D\\8C IS\
    P2 MODEM restart modem vpn.mnet.my.id:14562\" keep-result=no;" host=\
    192.168.23.1 interval=5s timeout=75ms up-script="log warning (\"ISP2 MODEM\
    \_CEPET\")\r\
    \n:delay 500ms;\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=480176579&text=\\E2\\9C\\85 IS\
    P2 MODEM CEPET\" keep-result=no;"
/tool romon
set enabled=yes secrets=45
