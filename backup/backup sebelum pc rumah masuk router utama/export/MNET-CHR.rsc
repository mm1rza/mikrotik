# aug/16/2023 12:00:00 by RouterOS 6.48.6
# software id = FKGG-UMFD
#
#
#
/interface bridge
add name=bridge-vpn
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full \
    disable-running-check=no
/interface list
add name=ISP
/ip ipsec proposal
set [ find default=yes ] enc-algorithms=aes-128-cbc
/ip pool
add comment=10.124.33.0/22 name=pool-free ranges=10.124.32.2-10.124.35.254
add comment=10.124.40.0/22 name=pool-wuzz ranges=10.124.40.21-10.124.43.254
/ppp profile
set *0 only-one=yes
set *FFFFFFFE only-one=yes
/queue simple
add max-limit=1G/1G name="----------- VIP -----------" packet-marks=vip \
    priority=1/1 target=10.0.0.0/8
add max-limit=1G/1G name="-----ALL TRAFIK-----" target=10.0.0.0/8
add max-limit=1G/1G name="       ADMIN" parent="-----ALL TRAFIK-----" \
    priority=1/1 target=10.123.22.0/24
add max-limit=50M/50M name=PELANGGAN parent="-----ALL TRAFIK-----" priority=\
    7/7 target=10.123.223.0/24
add max-limit=100M/100M name=dhcp-FREE parent="-----ALL TRAFIK-----" target=\
    10.124.32.0/22
add max-limit=1G/1G name=dhcp-WUZZ parent="-----ALL TRAFIK-----" target=\
    10.124.40.0/22
/ppp profile
add insert-queue-before=PELANGGAN local-address=10.123.223.1 name=PELANGGAN \
    on-up=":local ips [/ppp active get [find name=\$user] address];\r\
    \n:local up [/ppp active get [find name=\$user] uptime];\r\
    \n:local caller [/ppp active get [find name=\$user] caller-id];\r\
    \n:local service [/ppp active get [find name=\$user] service];\r\
    \n:local comment [/ppp active get [find name=\$user] comment];\r\
    \n:local active [/ppp active print count];\r\
    \n\r\
    \n/ip firewall address-list add list=ip-publik-client address=\$caller com\
    ment=\"\$user\"" only-one=yes parent-queue=PELANGGAN rate-limit=\
    "5M/5M 10M/10M 5M/5M 10/10 7 3M/3M"
add insert-queue-before="       ADMIN" name=ADMIN on-down=\
    "/ip dns cache flush" on-up="/ip dns cache flush\r\
    \n\r\
    \n:local ips [/ppp active get [find name=\$user] address];\r\
    \n:local up [/ppp active get [find name=\$user] uptime];\r\
    \n:local caller [/ppp active get [find name=\$user] caller-id];\r\
    \n:local service [/ppp active get [find name=\$user] service];\r\
    \n:local comment [/ppp active get [find name=\$user] comment];\r\
    \n:local active [/ppp active print count];\r\
    \n\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 \$user masuk VPS IDNIX\" keep-result=no;\r\
    \n\r\
    \n/ip firewall address-list add list=ip-publik-client address=\$caller com\
    ment=\$user;\r\
    \n" only-one=yes parent-queue="       ADMIN" rate-limit=\
    "1000M/1000M 0/0 0/0 0/0 1 5M/5M"
add comment="5M/5M 7M/7M 3750K/3750K 10/10 1 625K/625K" insert-queue-before=\
    dhcp-FREE local-address=10.124.33.1 name=dhcp-FREE on-up=":local ips [/ppp\
    \_active get [find name=\$user] address];\r\
    \n:local up [/ppp active get [find name=\$user] uptime];\r\
    \n:local caller [/ppp active get [find name=\$user] caller-id];\r\
    \n:local service [/ppp active get [find name=\$user] service];\r\
    \n:local comment [/ppp active get [find name=\$user] comment];\r\
    \n:local active [/ppp active print count];\r\
    \n\r\
    \n/ip firewall address-list add list=ip-publik-client address=\$caller com\
    ment=\$user\r\
    \n" only-one=no parent-queue=dhcp-FREE rate-limit=20M/20M remote-address=\
    pool-free
add bridge=bridge-vpn insert-queue-before=dhcp-WUZZ local-address=10.124.40.1 \
    name=dhcp-WUZZ on-up=":local ips [/ppp active get [find name=\$user] addre\
    ss];\r\
    \n:local up [/ppp active get [find name=\$user] uptime];\r\
    \n:local caller [/ppp active get [find name=\$user] caller-id];\r\
    \n:local service [/ppp active get [find name=\$user] service];\r\
    \n:local comment [/ppp active get [find name=\$user] comment];\r\
    \n:local active [/ppp active print count];\r\
    \n\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\$user mas\
    uk VPS IDNIX\" keep-result=no;\r\
    \n\r\
    \n/ip firewall address-list add list=ip-publik-client address=\$caller com\
    ment=\$user;\r\
    \n\r\
    \n" only-one=no parent-queue=dhcp-WUZZ rate-limit=\
    "1000M/1000M 0/0 0/0 0/0 8 3M/3M" remote-address=pool-wuzz
/queue interface
set ether1 queue=ethernet-default
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0
/system logging action
set 0 memory-lines=2000
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=FTP policy="ftp,write,sensitive,!local,!telnet,!ssh,!reboot,!read,!po\
    licy,!test,!winbox,!password,!web,!sniff,!api,!romon,!dude,!tikapp"
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
add name=SSH policy="local,ssh,read,write,policy,test,sniff,sensitive,!telnet,\
    !ftp,!reboot,!winbox,!password,!web,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge-vpn interface=ether1
/ip neighbor discovery-settings
set discover-interface-list=none
/interface l2tp-server server
set default-profile=default enabled=yes ipsec-secret=vpn.mnet.my.id \
    keepalive-timeout=10 use-ipsec=yes
/interface list member
add interface=ether1 list=ISP
/interface ovpn-server server
set auth=sha1 certificate=SERVER cipher=aes256 enabled=yes keepalive-timeout=\
    10 require-client-certificate=yes
/interface pptp-server server
set default-profile=default enabled=yes keepalive-timeout=10
/interface sstp-server server
set authentication=mschap2 enabled=yes keepalive-timeout=10
/ip address
add address=103.143.170.11/27 interface=ether1 network=103.143.170.0
/ip cloud
set update-time=no
/ip dns
set allow-remote-requests=yes cache-max-ttl=5m cache-size=51200KiB servers=\
    9.9.9.9,1.1.1.1
/ip dns static
add address=172.16.0.1 name=hotspot.com ttl=5m
add address=172.16.0.1 name=hotspotan.com ttl=5m
/ip firewall address-list
add address=0.0.0.0/8 comment=ip-local-private list=list-ip-local-private
add address=10.0.0.0/8 comment=ip-local-private list=list-ip-local-private
add address=100.64.0.0/10 comment=ip-local-private list=list-ip-local-private
add address=127.0.0.0/8 comment=ip-local-private list=list-ip-local-private
add address=169.254.0.0/16 comment=ip-local-private list=\
    list-ip-local-private
add address=172.16.0.0/12 comment=ip-local-private list=list-ip-local-private
add address=192.0.0.0/24 comment=ip-local-private list=list-ip-local-private
add address=192.0.2.0/24 comment=ip-local-private list=list-ip-local-private
add address=192.168.0.0/16 comment=ip-local-private list=\
    list-ip-local-private
add address=198.18.0.0/15 comment=ip-local-private list=list-ip-local-private
add address=198.51.100.0/24 comment=ip-local-private list=\
    list-ip-local-private
add address=203.0.113.0/24 comment=ip-local-private list=\
    list-ip-local-private
add address=224.0.0.0/3 comment=ip-local-private list=list-ip-local-private
add address=255.255.255.255 comment=ip-local-private list=\
    list-ip-local-private
add address=240.0.0.0/4 comment=ip-local-private list=list-ip-local-private
add address=download.mikrotik.com comment=ip-mikrotik list=list-ip-private
add address=licence.mikrotik.com comment=ip-mikrotik list=list-ip-private
add address=api.telegram.org comment=ip-telegram list=list-ip-private
add address=216.239.35.4 comment=ip-sntp list=list-ip-private
add address=211.233.84.186 comment=ip-sntp list=list-ip-private
add address=download.mikrotik.com comment=ip-mikrotik list=list-ip-trusted
add address=licence.mikrotik.com comment=ip-mikrotik list=list-ip-trusted
add address=api.telegram.org comment=ip-telegram list=list-ip-trusted
add address=216.239.35.4 comment=ip-sntp list=list-ip-trusted
add address=211.233.84.186 comment=ip-sntp list=list-ip-trusted
add address=0.0.0.0/8 comment=ip-local-private list=list-ip-trusted
add address=10.0.0.0/8 comment=ip-local-private list=list-ip-trusted
add address=100.64.0.0/10 comment=ip-local-private list=list-ip-trusted
add address=127.0.0.0/8 comment=ip-local-private list=list-ip-trusted
add address=169.254.0.0/16 comment=ip-local-private list=list-ip-trusted
add address=172.16.0.0/12 comment=ip-local-private list=list-ip-trusted
add address=192.0.0.0/24 comment=ip-local-private list=list-ip-trusted
add address=192.0.2.0/24 comment=ip-local-private list=list-ip-trusted
add address=192.168.0.0/16 comment=ip-local-private list=list-ip-trusted
add address=198.18.0.0/15 comment=ip-local-private list=list-ip-trusted
add address=198.51.100.0/24 comment=ip-local-private list=list-ip-trusted
add address=203.0.113.0/24 comment=ip-local-private list=list-ip-trusted
add address=224.0.0.0/3 comment=ip-local-private list=list-ip-trusted
add address=255.255.255.255 comment=ip-local-private list=list-ip-trusted
add address=240.0.0.0/4 comment=ip-local-private list=list-ip-trusted
add address=103.143.170.11 comment="VPS INI" list=ip-publik
add address=8.8.8.8 comment="DNS GOOGLE" list=list-ip-trusted
add address=8.8.4.4 comment="DNS GOOGLE" list=list-ip-trusted
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=list-ip-trusted
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=list-ip-trusted
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    list-ip-trusted
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    list-ip-trusted
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    list-ip-trusted
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    list-ip-trusted
add address=9.9.9.9 comment="DNS QUAD 9" list=list-ip-trusted
add address=149.112.112.112 comment="DNS QUAD 9" list=list-ip-trusted
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    list-ip-trusted
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    list-ip-trusted
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    list-ip-trusted
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    list-ip-trusted
add address=208.67.222.222 comment="DNS OpenDNS" list=list-ip-trusted
add address=208.67.220.220 comment="DNS OpenDNS" list=list-ip-trusted
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=\
    list-ip-trusted
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=\
    list-ip-trusted
add address=94.140.14.14 comment="DNS AdGuard" list=list-ip-trusted
add address=94.140.15.15 comment="DNS AdGuard" list=list-ip-trusted
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=\
    list-ip-trusted
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=\
    list-ip-trusted
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    list-ip-trusted
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    list-ip-trusted
add address=77.88.8.1 comment="DNS Yandex" list=list-ip-trusted
add address=77.88.8.8 comment="DNS Yandex" list=list-ip-trusted
add address=8.8.8.8 comment="DNS GOOGLE" list=list-ip-private
add address=8.8.4.4 comment="DNS GOOGLE" list=list-ip-private
add address=1.1.1.1 comment="DNS CLOUDFLARE" list=list-ip-private
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=list-ip-private
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    list-ip-private
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=\
    list-ip-private
add address=1.1.1.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    list-ip-private
add address=1.0.0.3 comment=\
    "DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=\
    list-ip-private
add address=9.9.9.9 comment="DNS QUAD 9" list=list-ip-private
add address=149.112.112.112 comment="DNS QUAD 9" list=list-ip-private
add address=9.9.9.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    list-ip-private
add address=149.112.112.11 comment=\
    "DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=\
    list-ip-private
add address=9.9.9.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    list-ip-private
add address=149.112.112.10 comment=\
    "DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=\
    list-ip-private
add address=208.67.222.222 comment="DNS OpenDNS" list=list-ip-private
add address=208.67.220.220 comment="DNS OpenDNS" list=list-ip-private
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=\
    list-ip-private
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=\
    list-ip-private
add address=94.140.14.14 comment="DNS AdGuard" list=list-ip-private
add address=94.140.15.15 comment="DNS AdGuard" list=list-ip-private
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=\
    list-ip-private
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=\
    list-ip-private
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=\
    list-ip-private
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=\
    list-ip-private
add address=77.88.8.1 comment="DNS Yandex" list=list-ip-private
add address=77.88.8.8 comment="DNS Yandex" list=list-ip-private
add address=mnet.my.id comment="HOSTING HOSTING HOSTING" list=list-ip-trusted
add address=mnet.my.id comment="HOSTING HOSTING HOSTING" list=list-ip-private
add address=103.21.216.0/22 list=ip-publik-client
add address=139.0.0.0/19 list=ip-publik-client
add address=139.0.0.0/21 list=ip-publik-client
add address=139.0.8.0/21 list=ip-publik-client
add address=139.0.16.0/21 list=ip-publik-client
add address=139.0.24.0/21 list=ip-publik-client
add address=139.195.0.0/19 list=ip-publik-client
add address=139.195.0.0/22 list=ip-publik-client
add address=139.195.4.0/22 list=ip-publik-client
add address=139.195.8.0/22 list=ip-publik-client
add address=139.195.12.0/22 list=ip-publik-client
add address=139.195.16.0/22 list=ip-publik-client
add address=139.195.20.0/22 list=ip-publik-client
add address=139.195.24.0/22 list=ip-publik-client
add address=139.195.28.0/22 list=ip-publik-client
add address=139.255.0.0/19 list=ip-publik-client
add address=139.255.0.0/22 list=ip-publik-client
add address=139.255.4.0/22 list=ip-publik-client
add address=139.255.8.0/22 list=ip-publik-client
add address=139.255.12.0/22 list=ip-publik-client
add address=139.255.16.0/22 list=ip-publik-client
add address=139.255.20.0/22 list=ip-publik-client
add address=139.255.24.0/22 list=ip-publik-client
add address=139.255.28.0/22 list=ip-publik-client
add address=139.255.32.0/19 list=ip-publik-client
add address=139.255.32.0/22 list=ip-publik-client
add address=139.255.36.0/22 list=ip-publik-client
add address=139.255.40.0/22 list=ip-publik-client
add address=139.255.44.0/22 list=ip-publik-client
add address=139.255.48.0/22 list=ip-publik-client
add address=139.255.52.0/22 list=ip-publik-client
add address=139.255.56.0/22 list=ip-publik-client
add address=139.255.60.0/22 list=ip-publik-client
add address=139.255.64.0/19 list=ip-publik-client
add address=139.255.64.0/22 list=ip-publik-client
add address=139.255.68.0/22 list=ip-publik-client
add address=139.255.72.0/22 list=ip-publik-client
add address=139.255.76.0/22 list=ip-publik-client
add address=139.255.80.0/22 list=ip-publik-client
add address=139.255.84.0/22 list=ip-publik-client
add address=139.255.88.0/22 list=ip-publik-client
add address=139.255.92.0/22 list=ip-publik-client
add address=139.255.96.0/19 list=ip-publik-client
add address=139.255.96.0/22 list=ip-publik-client
add address=139.255.100.0/22 list=ip-publik-client
add address=139.255.104.0/22 list=ip-publik-client
add address=139.255.108.0/22 list=ip-publik-client
add address=139.255.112.0/22 list=ip-publik-client
add address=139.255.116.0/22 list=ip-publik-client
add address=139.255.120.0/22 list=ip-publik-client
add address=139.255.124.0/22 list=ip-publik-client
add address=139.255.124.0/23 list=ip-publik-client
add address=139.255.124.0/24 list=ip-publik-client
add address=139.255.192.0/22 list=ip-publik-client
add address=139.255.196.0/22 list=ip-publik-client
add address=139.255.200.0/22 list=ip-publik-client
add address=139.255.204.0/22 list=ip-publik-client
add address=139.255.208.0/22 list=ip-publik-client
add address=139.255.212.0/22 list=ip-publik-client
add address=139.255.216.0/22 list=ip-publik-client
add address=139.255.220.0/22 list=ip-publik-client
add address=139.255.224.0/19 list=ip-publik-client
add address=139.255.224.0/22 list=ip-publik-client
add address=139.255.228.0/22 list=ip-publik-client
add address=139.255.232.0/22 list=ip-publik-client
add address=139.255.236.0/22 list=ip-publik-client
add address=139.255.240.0/22 list=ip-publik-client
add address=139.255.244.0/22 list=ip-publik-client
add address=139.255.248.0/22 list=ip-publik-client
add address=139.255.252.0/22 list=ip-publik-client
add address=202.77.96.0/19 list=ip-publik-client
add address=202.77.96.0/22 list=ip-publik-client
add address=202.77.100.0/22 list=ip-publik-client
add address=202.77.104.0/22 list=ip-publik-client
add address=202.77.108.0/22 list=ip-publik-client
add address=202.77.112.0/22 list=ip-publik-client
add address=202.77.116.0/22 list=ip-publik-client
add address=202.77.120.0/22 list=ip-publik-client
add address=202.77.124.0/22 list=ip-publik-client
add address=202.77.124.0/24 list=ip-publik-client
add address=202.137.0.0/19 list=ip-publik-client
add address=202.137.0.0/22 list=ip-publik-client
add address=202.137.3.0/24 list=ip-publik-client
add address=202.137.4.0/22 list=ip-publik-client
add address=202.137.8.0/22 list=ip-publik-client
add address=202.137.12.0/22 list=ip-publik-client
add address=202.137.16.0/22 list=ip-publik-client
add address=202.137.20.0/22 list=ip-publik-client
add address=202.137.24.0/22 list=ip-publik-client
add address=202.137.28.0/22 list=ip-publik-client
add address=45.126.184.0/22 list=ip-publik-client
add address=45.126.184.0/24 list=ip-publik-client
add address=45.126.185.0/24 list=ip-publik-client
add address=45.126.186.0/24 list=ip-publik-client
add address=45.126.187.0/24 list=ip-publik-client
add address=103.101.67.0/24 list=ip-publik-client
add address=103.101.228.0/22 list=ip-publik-client
add address=103.105.80.0/22 list=ip-publik-client
add address=103.105.80.0/24 list=ip-publik-client
add address=103.105.81.0/24 list=ip-publik-client
add address=103.105.82.0/24 list=ip-publik-client
add address=103.105.83.0/24 list=ip-publik-client
add address=103.195.56.0/24 list=ip-publik-client
add address=103.195.57.0/24 list=ip-publik-client
add address=103.195.58.0/24 list=ip-publik-client
add address=103.195.59.0/24 list=ip-publik-client
add address=103.208.136.0/24 list=ip-publik-client
add address=103.233.152.0/22 list=ip-publik-client
add address=103.233.152.0/24 list=ip-publik-client
add address=103.233.153.0/24 list=ip-publik-client
add address=103.233.154.0/24 list=ip-publik-client
add address=103.233.155.0/24 list=ip-publik-client
add address=112.78.128.0/24 list=ip-publik-client
add address=112.78.129.0/24 list=ip-publik-client
add address=112.78.130.0/24 list=ip-publik-client
add address=112.78.131.0/24 list=ip-publik-client
add address=112.78.132.0/24 list=ip-publik-client
add address=112.78.133.0/24 list=ip-publik-client
add address=112.78.134.0/24 list=ip-publik-client
add address=112.78.138.0/24 list=ip-publik-client
add address=112.78.139.0/24 list=ip-publik-client
add address=112.78.140.0/24 list=ip-publik-client
add address=112.78.142.0/24 list=ip-publik-client
add address=112.78.143.0/24 list=ip-publik-client
add address=112.78.145.0/24 list=ip-publik-client
add address=112.78.146.0/24 list=ip-publik-client
add address=112.78.147.0/24 list=ip-publik-client
add address=112.78.148.0/24 list=ip-publik-client
add address=112.78.149.0/24 list=ip-publik-client
add address=112.78.150.0/24 list=ip-publik-client
add address=112.78.151.0/24 list=ip-publik-client
add address=112.78.152.0/24 list=ip-publik-client
add address=112.78.153.0/24 list=ip-publik-client
add address=112.78.154.0/24 list=ip-publik-client
add address=112.78.155.0/24 list=ip-publik-client
add address=112.78.156.0/24 list=ip-publik-client
add address=112.78.157.0/24 list=ip-publik-client
add address=112.78.158.0/24 list=ip-publik-client
add address=112.78.159.0/24 list=ip-publik-client
add address=112.78.160.0/21 list=ip-publik-client
add address=112.78.168.0/24 list=ip-publik-client
add address=112.78.169.0/24 list=ip-publik-client
add address=112.78.170.0/24 list=ip-publik-client
add address=112.78.171.0/24 list=ip-publik-client
add address=112.78.172.0/24 list=ip-publik-client
add address=112.78.173.0/24 list=ip-publik-client
add address=112.78.174.0/24 list=ip-publik-client
add address=112.78.175.0/24 list=ip-publik-client
add address=112.78.176.0/24 list=ip-publik-client
add address=112.78.178.0/24 list=ip-publik-client
add address=112.78.179.0/24 list=ip-publik-client
add address=112.78.180.0/24 list=ip-publik-client
add address=112.78.181.0/24 list=ip-publik-client
add address=112.78.182.0/24 list=ip-publik-client
add address=112.78.183.0/24 list=ip-publik-client
add address=112.78.184.0/24 list=ip-publik-client
add address=112.78.185.0/24 list=ip-publik-client
add address=112.78.187.0/24 list=ip-publik-client
add address=112.78.188.0/24 list=ip-publik-client
add address=112.78.189.0/24 list=ip-publik-client
add address=112.78.190.0/24 list=ip-publik-client
add address=112.78.191.0/24 list=ip-publik-client
add address=113.11.176.0/24 list=ip-publik-client
add address=113.11.177.0/24 list=ip-publik-client
add address=113.11.178.0/24 list=ip-publik-client
add address=113.11.179.0/24 list=ip-publik-client
add address=113.11.180.0/24 list=ip-publik-client
add address=113.11.181.0/24 list=ip-publik-client
add address=113.11.183.0/24 list=ip-publik-client
add address=117.102.64.0/24 list=ip-publik-client
add address=117.102.65.0/24 list=ip-publik-client
add address=117.102.66.0/24 list=ip-publik-client
add address=117.102.67.0/24 list=ip-publik-client
add address=117.102.68.0/24 list=ip-publik-client
add address=117.102.69.0/24 list=ip-publik-client
add address=117.102.71.0/24 list=ip-publik-client
add address=117.102.72.0/24 list=ip-publik-client
add address=117.102.74.0/24 list=ip-publik-client
add address=117.102.75.0/24 list=ip-publik-client
add address=117.102.76.0/24 list=ip-publik-client
add address=117.102.77.0/24 list=ip-publik-client
add address=117.102.78.0/24 list=ip-publik-client
add address=117.102.81.0/24 list=ip-publik-client
add address=117.102.83.0/24 list=ip-publik-client
add address=117.102.87.0/24 list=ip-publik-client
add address=117.102.89.0/24 list=ip-publik-client
add address=117.102.91.0/24 list=ip-publik-client
add address=117.102.93.0/24 list=ip-publik-client
add address=117.102.94.0/24 list=ip-publik-client
add address=117.102.96.0/24 list=ip-publik-client
add address=117.102.99.0/24 list=ip-publik-client
add address=117.102.100.0/24 list=ip-publik-client
add address=117.102.105.0/24 list=ip-publik-client
add address=117.102.106.0/24 list=ip-publik-client
add address=117.102.108.0/24 list=ip-publik-client
add address=117.102.109.0/24 list=ip-publik-client
add address=117.102.111.0/24 list=ip-publik-client
add address=117.102.112.0/24 list=ip-publik-client
add address=117.102.115.0/24 list=ip-publik-client
add address=117.102.117.0/24 list=ip-publik-client
add address=117.102.119.0/24 list=ip-publik-client
add address=117.102.121.0/24 list=ip-publik-client
add address=117.102.123.0/24 list=ip-publik-client
add address=117.102.124.0/24 list=ip-publik-client
add address=117.102.125.0/24 list=ip-publik-client
add address=117.102.126.0/24 list=ip-publik-client
add address=117.102.127.0/24 list=ip-publik-client
add address=118.99.64.0/18 list=ip-publik-client
add address=118.99.64.0/24 list=ip-publik-client
add address=118.99.65.0/24 list=ip-publik-client
add address=118.99.66.0/24 list=ip-publik-client
add address=118.99.67.0/24 list=ip-publik-client
add address=118.99.68.0/24 list=ip-publik-client
add address=118.99.69.0/24 list=ip-publik-client
add address=118.99.70.0/24 list=ip-publik-client
add address=118.99.71.0/24 list=ip-publik-client
add address=118.99.72.0/24 list=ip-publik-client
add address=118.99.73.0/24 list=ip-publik-client
add address=118.99.74.0/24 list=ip-publik-client
add address=118.99.75.0/24 list=ip-publik-client
add address=118.99.76.0/24 list=ip-publik-client
add address=118.99.77.0/24 list=ip-publik-client
add address=118.99.78.0/24 list=ip-publik-client
add address=118.99.79.0/24 list=ip-publik-client
add address=118.99.80.0/24 list=ip-publik-client
add address=118.99.81.0/24 list=ip-publik-client
add address=118.99.82.0/24 list=ip-publik-client
add address=118.99.83.0/24 list=ip-publik-client
add address=118.99.84.0/24 list=ip-publik-client
add address=118.99.87.0/24 list=ip-publik-client
add address=118.99.88.0/24 list=ip-publik-client
add address=118.99.90.0/24 list=ip-publik-client
add address=118.99.91.0/24 list=ip-publik-client
add address=118.99.92.0/24 list=ip-publik-client
add address=118.99.93.0/24 list=ip-publik-client
add address=118.99.94.0/24 list=ip-publik-client
add address=118.99.97.0/24 list=ip-publik-client
add address=118.99.98.0/23 list=ip-publik-client
add address=118.99.100.0/24 list=ip-publik-client
add address=118.99.101.0/24 list=ip-publik-client
add address=118.99.102.0/23 list=ip-publik-client
add address=118.99.104.0/24 list=ip-publik-client
add address=118.99.105.0/24 list=ip-publik-client
add address=118.99.106.0/24 list=ip-publik-client
add address=118.99.107.0/24 list=ip-publik-client
add address=118.99.108.0/24 list=ip-publik-client
add address=118.99.109.0/24 list=ip-publik-client
add address=118.99.110.0/24 list=ip-publik-client
add address=118.99.111.0/24 list=ip-publik-client
add address=118.99.112.0/24 list=ip-publik-client
add address=118.99.113.0/24 list=ip-publik-client
add address=118.99.114.0/23 list=ip-publik-client
add address=118.99.116.0/24 list=ip-publik-client
add address=118.99.117.0/24 list=ip-publik-client
add address=118.99.118.0/24 list=ip-publik-client
add address=118.99.119.0/24 list=ip-publik-client
add address=118.99.120.0/24 list=ip-publik-client
add address=118.99.121.0/24 list=ip-publik-client
add address=118.99.122.0/24 list=ip-publik-client
add address=118.99.123.0/24 list=ip-publik-client
add address=118.99.124.0/24 list=ip-publik-client
add address=118.99.125.0/24 list=ip-publik-client
add address=118.99.126.0/23 list=ip-publik-client
add address=118.99.126.0/24 list=ip-publik-client
add address=118.99.127.0/24 list=ip-publik-client
add address=180.87.86.0/24 list=ip-publik-client
add address=182.253.2.0/24 list=ip-publik-client
add address=182.253.4.0/24 list=ip-publik-client
add address=182.253.7.0/24 list=ip-publik-client
add address=182.253.8.0/24 list=ip-publik-client
add address=182.253.9.0/24 list=ip-publik-client
add address=182.253.10.0/24 list=ip-publik-client
add address=182.253.12.0/24 list=ip-publik-client
add address=182.253.13.0/24 list=ip-publik-client
add address=182.253.14.0/24 list=ip-publik-client
add address=182.253.16.0/24 list=ip-publik-client
add address=182.253.20.0/24 list=ip-publik-client
add address=182.253.21.0/24 list=ip-publik-client
add address=182.253.22.0/24 list=ip-publik-client
add address=182.253.24.0/24 list=ip-publik-client
add address=182.253.25.0/24 list=ip-publik-client
add address=182.253.26.0/24 list=ip-publik-client
add address=182.253.31.0/24 list=ip-publik-client
add address=182.253.32.0/24 list=ip-publik-client
add address=182.253.35.0/24 list=ip-publik-client
add address=182.253.37.0/24 list=ip-publik-client
add address=182.253.38.0/24 list=ip-publik-client
add address=182.253.39.0/24 list=ip-publik-client
add address=182.253.40.0/24 list=ip-publik-client
add address=182.253.42.0/24 list=ip-publik-client
add address=182.253.43.0/24 list=ip-publik-client
add address=182.253.44.0/24 list=ip-publik-client
add address=182.253.46.0/24 list=ip-publik-client
add address=182.253.57.0/24 list=ip-publik-client
add address=182.253.61.0/24 list=ip-publik-client
add address=182.253.63.0/24 list=ip-publik-client
add address=182.253.64.0/24 list=ip-publik-client
add address=182.253.65.0/24 list=ip-publik-client
add address=182.253.66.0/24 list=ip-publik-client
add address=182.253.67.0/24 list=ip-publik-client
add address=182.253.69.0/24 list=ip-publik-client
add address=182.253.70.0/24 list=ip-publik-client
add address=182.253.72.0/24 list=ip-publik-client
add address=182.253.73.0/24 list=ip-publik-client
add address=182.253.74.0/24 list=ip-publik-client
add address=182.253.75.0/24 list=ip-publik-client
add address=182.253.76.0/24 list=ip-publik-client
add address=182.253.77.0/24 list=ip-publik-client
add address=182.253.78.0/24 list=ip-publik-client
add address=182.253.79.0/24 list=ip-publik-client
add address=182.253.80.0/24 list=ip-publik-client
add address=182.253.81.0/24 list=ip-publik-client
add address=182.253.82.0/24 list=ip-publik-client
add address=182.253.83.0/24 list=ip-publik-client
add address=182.253.84.0/24 list=ip-publik-client
add address=182.253.86.0/24 list=ip-publik-client
add address=182.253.87.0/24 list=ip-publik-client
add address=182.253.88.0/23 list=ip-publik-client
add address=182.253.89.0/24 list=ip-publik-client
add address=182.253.90.0/24 list=ip-publik-client
add address=182.253.91.0/24 list=ip-publik-client
add address=182.253.92.0/24 list=ip-publik-client
add address=182.253.93.0/24 list=ip-publik-client
add address=182.253.94.0/24 list=ip-publik-client
add address=182.253.95.0/24 list=ip-publik-client
add address=182.253.96.0/24 list=ip-publik-client
add address=182.253.97.0/24 list=ip-publik-client
add address=182.253.98.0/24 list=ip-publik-client
add address=182.253.99.0/24 list=ip-publik-client
add address=182.253.100.0/24 list=ip-publik-client
add address=182.253.101.0/24 list=ip-publik-client
add address=182.253.102.0/24 list=ip-publik-client
add address=182.253.103.0/24 list=ip-publik-client
add address=182.253.104.0/24 list=ip-publik-client
add address=182.253.105.0/24 list=ip-publik-client
add address=182.253.106.0/24 list=ip-publik-client
add address=182.253.107.0/24 list=ip-publik-client
add address=182.253.108.0/24 list=ip-publik-client
add address=182.253.109.0/24 list=ip-publik-client
add address=182.253.110.0/24 list=ip-publik-client
add address=182.253.111.0/24 list=ip-publik-client
add address=182.253.112.0/24 list=ip-publik-client
add address=182.253.113.0/24 list=ip-publik-client
add address=182.253.114.0/24 list=ip-publik-client
add address=182.253.115.0/24 list=ip-publik-client
add address=182.253.116.0/24 list=ip-publik-client
add address=182.253.117.0/24 list=ip-publik-client
add address=182.253.118.0/24 list=ip-publik-client
add address=182.253.119.0/24 list=ip-publik-client
add address=182.253.120.0/24 list=ip-publik-client
add address=182.253.121.0/24 list=ip-publik-client
add address=182.253.122.0/24 list=ip-publik-client
add address=182.253.123.0/24 list=ip-publik-client
add address=182.253.124.0/24 list=ip-publik-client
add address=182.253.125.0/24 list=ip-publik-client
add address=182.253.126.0/24 list=ip-publik-client
add address=182.253.128.0/24 list=ip-publik-client
add address=182.253.129.0/24 list=ip-publik-client
add address=182.253.130.0/24 list=ip-publik-client
add address=182.253.131.0/24 list=ip-publik-client
add address=182.253.132.0/24 list=ip-publik-client
add address=182.253.133.0/24 list=ip-publik-client
add address=182.253.134.0/24 list=ip-publik-client
add address=182.253.135.0/24 list=ip-publik-client
add address=182.253.136.0/24 list=ip-publik-client
add address=182.253.137.0/24 list=ip-publik-client
add address=182.253.139.0/24 list=ip-publik-client
add address=182.253.140.0/24 list=ip-publik-client
add address=182.253.141.0/24 list=ip-publik-client
add address=182.253.142.0/24 list=ip-publik-client
add address=182.253.147.0/24 list=ip-publik-client
add address=182.253.149.0/24 list=ip-publik-client
add address=182.253.150.0/24 list=ip-publik-client
add address=182.253.151.0/24 list=ip-publik-client
add address=182.253.152.0/22 list=ip-publik-client
add address=182.253.156.0/24 list=ip-publik-client
add address=182.253.157.0/24 list=ip-publik-client
add address=182.253.158.0/23 list=ip-publik-client
add address=182.253.160.0/23 list=ip-publik-client
add address=182.253.162.0/24 list=ip-publik-client
add address=182.253.163.0/24 list=ip-publik-client
add address=182.253.164.0/23 list=ip-publik-client
add address=182.253.164.0/24 list=ip-publik-client
add address=182.253.165.0/24 list=ip-publik-client
add address=182.253.166.0/24 list=ip-publik-client
add address=182.253.167.0/24 list=ip-publik-client
add address=182.253.168.0/22 list=ip-publik-client
add address=182.253.172.0/22 list=ip-publik-client
add address=182.253.176.0/22 list=ip-publik-client
add address=182.253.180.0/24 list=ip-publik-client
add address=182.253.181.0/24 list=ip-publik-client
add address=182.253.182.0/24 list=ip-publik-client
add address=182.253.183.0/24 list=ip-publik-client
add address=182.253.184.0/24 list=ip-publik-client
add address=182.253.185.0/24 list=ip-publik-client
add address=182.253.186.0/24 list=ip-publik-client
add address=182.253.187.0/24 list=ip-publik-client
add address=182.253.188.0/24 list=ip-publik-client
add address=182.253.189.0/24 list=ip-publik-client
add address=182.253.191.0/24 list=ip-publik-client
add address=182.253.192.0/24 list=ip-publik-client
add address=182.253.193.0/24 list=ip-publik-client
add address=182.253.194.0/24 list=ip-publik-client
add address=182.253.195.0/24 list=ip-publik-client
add address=182.253.196.0/24 list=ip-publik-client
add address=182.253.197.0/24 list=ip-publik-client
add address=182.253.198.0/24 list=ip-publik-client
add address=182.253.199.0/24 list=ip-publik-client
add address=182.253.200.0/24 list=ip-publik-client
add address=182.253.201.0/24 list=ip-publik-client
add address=182.253.202.0/24 list=ip-publik-client
add address=182.253.203.0/24 list=ip-publik-client
add address=182.253.205.0/24 list=ip-publik-client
add address=182.253.206.0/24 list=ip-publik-client
add address=182.253.207.0/24 list=ip-publik-client
add address=182.253.208.0/24 list=ip-publik-client
add address=182.253.209.0/24 list=ip-publik-client
add address=182.253.210.0/24 list=ip-publik-client
add address=182.253.211.0/24 list=ip-publik-client
add address=182.253.212.0/24 list=ip-publik-client
add address=182.253.213.0/24 list=ip-publik-client
add address=182.253.214.0/24 list=ip-publik-client
add address=182.253.216.0/24 list=ip-publik-client
add address=182.253.217.0/24 list=ip-publik-client
add address=182.253.218.0/24 list=ip-publik-client
add address=182.253.219.0/24 list=ip-publik-client
add address=182.253.220.0/24 list=ip-publik-client
add address=182.253.223.0/24 list=ip-publik-client
add address=182.253.224.0/24 list=ip-publik-client
add address=182.253.225.0/24 list=ip-publik-client
add address=182.253.227.0/24 list=ip-publik-client
add address=182.253.228.0/24 list=ip-publik-client
add address=182.253.229.0/24 list=ip-publik-client
add address=182.253.230.0/23 list=ip-publik-client
add address=182.253.232.0/22 list=ip-publik-client
add address=182.253.237.0/24 list=ip-publik-client
add address=182.253.239.0/24 list=ip-publik-client
add address=182.253.241.0/24 list=ip-publik-client
add address=182.253.243.0/24 list=ip-publik-client
add address=182.253.244.0/24 list=ip-publik-client
add address=182.253.245.0/24 list=ip-publik-client
add address=182.253.246.0/23 list=ip-publik-client
add address=182.253.248.0/24 list=ip-publik-client
add address=182.253.249.0/24 list=ip-publik-client
add address=182.253.250.0/24 list=ip-publik-client
add address=182.253.251.0/24 list=ip-publik-client
add address=182.253.252.0/24 list=ip-publik-client
add address=182.253.254.0/24 list=ip-publik-client
add address=182.253.255.0/24 list=ip-publik-client
add address=202.169.32.0/24 list=ip-publik-client
add address=202.169.33.0/24 list=ip-publik-client
add address=202.169.34.0/24 list=ip-publik-client
add address=202.169.35.0/24 list=ip-publik-client
add address=202.169.36.0/24 list=ip-publik-client
add address=202.169.38.0/24 list=ip-publik-client
add address=202.169.40.0/24 list=ip-publik-client
add address=202.169.41.0/24 list=ip-publik-client
add address=202.169.42.0/24 list=ip-publik-client
add address=202.169.44.0/24 list=ip-publik-client
add address=202.169.45.0/24 list=ip-publik-client
add address=202.169.47.0/24 list=ip-publik-client
add address=202.169.48.0/24 list=ip-publik-client
add address=202.169.50.0/24 list=ip-publik-client
add address=202.169.52.0/24 list=ip-publik-client
add address=202.169.53.0/24 list=ip-publik-client
add address=202.169.54.0/24 list=ip-publik-client
add address=202.169.57.0/24 list=ip-publik-client
add address=202.169.59.0/24 list=ip-publik-client
add address=202.169.60.0/24 list=ip-publik-client
add address=202.169.61.0/24 list=ip-publik-client
add address=202.169.63.0/24 list=ip-publik-client
add address=203.142.65.0/24 list=ip-publik-client
add address=203.142.66.0/24 list=ip-publik-client
add address=203.142.67.0/24 list=ip-publik-client
add address=203.142.68.0/24 list=ip-publik-client
add address=203.142.71.0/24 list=ip-publik-client
add address=203.142.72.0/24 list=ip-publik-client
add address=203.142.73.0/24 list=ip-publik-client
add address=203.142.74.0/24 list=ip-publik-client
add address=203.142.75.0/24 list=ip-publik-client
add address=203.142.76.0/24 list=ip-publik-client
add address=203.142.77.0/24 list=ip-publik-client
add address=203.142.78.0/24 list=ip-publik-client
add address=203.142.79.0/24 list=ip-publik-client
add address=203.142.82.0/24 list=ip-publik-client
add address=203.142.83.0/24 list=ip-publik-client
add address=203.142.84.0/24 list=ip-publik-client
add address=203.142.86.0/24 list=ip-publik-client
add address=203.142.87.0/24 list=ip-publik-client
add address=103.105.128.0/24 list=ip-publik-client
add address=103.105.129.0/24 list=ip-publik-client
add address=103.105.130.0/24 list=ip-publik-client
add address=103.105.131.0/24 list=ip-publik-client
add address=110.35.80.0/24 list=ip-publik-client
add address=110.35.81.0/24 list=ip-publik-client
add address=110.35.82.0/24 list=ip-publik-client
add address=110.35.83.0/24 list=ip-publik-client
add address=110.35.84.0/24 list=ip-publik-client
add address=110.35.85.0/24 list=ip-publik-client
add address=202.59.160.0/24 list=ip-publik-client
add address=202.59.161.0/24 list=ip-publik-client
add address=202.59.162.0/24 list=ip-publik-client
add address=202.59.163.0/24 list=ip-publik-client
add address=202.59.164.0/24 list=ip-publik-client
add address=202.59.165.0/24 list=ip-publik-client
add address=202.59.166.0/24 list=ip-publik-client
add address=202.59.167.0/24 list=ip-publik-client
add address=202.59.168.0/24 list=ip-publik-client
add address=202.59.169.0/24 list=ip-publik-client
add address=202.59.170.0/24 list=ip-publik-client
add address=202.59.171.0/24 list=ip-publik-client
add address=202.59.172.0/24 list=ip-publik-client
add address=202.59.173.0/24 list=ip-publik-client
add address=202.59.174.0/24 list=ip-publik-client
add address=202.59.175.0/24 list=ip-publik-client
add address=103.162.62.0/24 list=ip-publik-client
add address=103.162.63.0/24 list=ip-publik-client
add address=103.190.170.0/24 list=ip-publik-client
add address=23.37.192.0/20 list=ip-publik-client
add address=61.247.0.0/18 list=ip-publik-client
add address=61.247.0.0/19 list=ip-publik-client
add address=61.247.32.0/19 list=ip-publik-client
add address=96.7.60.0/22 list=ip-publik-client
add address=111.94.0.0/15 list=ip-publik-client
add address=111.94.0.0/16 list=ip-publik-client
add address=111.94.0.0/19 list=ip-publik-client
add address=111.94.32.0/19 list=ip-publik-client
add address=111.94.64.0/19 list=ip-publik-client
add address=111.94.96.0/19 list=ip-publik-client
add address=111.94.128.0/19 list=ip-publik-client
add address=111.94.160.0/19 list=ip-publik-client
add address=111.94.192.0/19 list=ip-publik-client
add address=111.94.224.0/19 list=ip-publik-client
add address=111.94.252.0/22 list=ip-publik-client
add address=111.95.0.0/16 list=ip-publik-client
add address=111.95.0.0/19 list=ip-publik-client
add address=111.95.32.0/19 list=ip-publik-client
add address=111.95.64.0/19 list=ip-publik-client
add address=111.95.96.0/19 list=ip-publik-client
add address=111.95.128.0/19 list=ip-publik-client
add address=111.95.160.0/19 list=ip-publik-client
add address=111.95.192.0/19 list=ip-publik-client
add address=111.95.224.0/19 list=ip-publik-client
add address=111.95.252.0/22 list=ip-publik-client
add address=118.136.0.0/15 list=ip-publik-client
add address=118.136.0.0/16 list=ip-publik-client
add address=118.136.0.0/19 list=ip-publik-client
add address=118.136.32.0/19 list=ip-publik-client
add address=118.136.64.0/19 list=ip-publik-client
add address=118.136.96.0/19 list=ip-publik-client
add address=118.136.128.0/19 list=ip-publik-client
add address=118.136.160.0/19 list=ip-publik-client
add address=118.136.192.0/19 list=ip-publik-client
add address=118.136.224.0/19 list=ip-publik-client
add address=118.137.0.0/16 list=ip-publik-client
add address=118.137.0.0/19 list=ip-publik-client
add address=118.137.32.0/19 list=ip-publik-client
add address=118.137.64.0/19 list=ip-publik-client
add address=118.137.96.0/19 list=ip-publik-client
add address=118.137.128.0/19 list=ip-publik-client
add address=118.137.160.0/19 list=ip-publik-client
add address=118.137.192.0/19 list=ip-publik-client
add address=118.137.224.0/19 list=ip-publik-client
add address=139.0.32.0/19 list=ip-publik-client
add address=139.0.64.0/19 list=ip-publik-client
add address=139.0.96.0/19 list=ip-publik-client
add address=139.0.128.0/19 list=ip-publik-client
add address=139.0.160.0/19 list=ip-publik-client
add address=139.0.192.0/19 list=ip-publik-client
add address=139.0.224.0/19 list=ip-publik-client
add address=139.192.0.0/14 list=ip-publik-client
add address=139.192.0.0/16 list=ip-publik-client
add address=139.192.0.0/19 list=ip-publik-client
add address=139.192.32.0/19 list=ip-publik-client
add address=139.192.64.0/19 list=ip-publik-client
add address=139.192.96.0/19 list=ip-publik-client
add address=139.192.128.0/19 list=ip-publik-client
add address=139.192.160.0/19 list=ip-publik-client
add address=139.192.192.0/19 list=ip-publik-client
add address=139.192.224.0/19 list=ip-publik-client
add address=139.193.0.0/16 list=ip-publik-client
add address=139.193.0.0/19 list=ip-publik-client
add address=139.193.32.0/19 list=ip-publik-client
add address=139.193.64.0/19 list=ip-publik-client
add address=139.193.96.0/19 list=ip-publik-client
add address=139.193.128.0/19 list=ip-publik-client
add address=139.193.160.0/19 list=ip-publik-client
add address=139.193.192.0/19 list=ip-publik-client
add address=139.193.224.0/19 list=ip-publik-client
add address=139.194.0.0/16 list=ip-publik-client
add address=139.194.0.0/19 list=ip-publik-client
add address=139.194.32.0/19 list=ip-publik-client
add address=139.194.64.0/19 list=ip-publik-client
add address=139.194.96.0/19 list=ip-publik-client
add address=139.194.128.0/19 list=ip-publik-client
add address=139.194.160.0/19 list=ip-publik-client
add address=139.194.192.0/19 list=ip-publik-client
add address=139.194.224.0/19 list=ip-publik-client
add address=139.195.32.0/19 list=ip-publik-client
add address=139.195.64.0/19 list=ip-publik-client
add address=139.195.96.0/19 list=ip-publik-client
add address=139.195.128.0/19 list=ip-publik-client
add address=139.195.160.0/19 list=ip-publik-client
add address=139.195.192.0/19 list=ip-publik-client
add address=139.195.224.0/19 list=ip-publik-client
add address=139.228.0.0/16 list=ip-publik-client
add address=139.228.0.0/19 list=ip-publik-client
add address=139.228.32.0/19 list=ip-publik-client
add address=139.228.64.0/19 list=ip-publik-client
add address=139.228.96.0/19 list=ip-publik-client
add address=139.228.128.0/19 list=ip-publik-client
add address=139.228.160.0/19 list=ip-publik-client
add address=139.228.192.0/19 list=ip-publik-client
add address=139.228.224.0/19 list=ip-publik-client
add address=139.255.128.0/19 list=ip-publik-client
add address=139.255.160.0/19 list=ip-publik-client
add address=140.0.0.0/16 list=ip-publik-client
add address=140.0.0.0/19 list=ip-publik-client
add address=140.0.32.0/19 list=ip-publik-client
add address=140.0.64.0/19 list=ip-publik-client
add address=140.0.96.0/19 list=ip-publik-client
add address=140.0.128.0/19 list=ip-publik-client
add address=140.0.160.0/19 list=ip-publik-client
add address=140.0.192.0/19 list=ip-publik-client
add address=140.0.224.0/19 list=ip-publik-client
add address=149.108.0.0/16 list=ip-publik-client
add address=149.108.0.0/19 list=ip-publik-client
add address=149.108.32.0/19 list=ip-publik-client
add address=149.108.64.0/19 list=ip-publik-client
add address=149.108.96.0/19 list=ip-publik-client
add address=149.108.128.0/19 list=ip-publik-client
add address=149.108.160.0/19 list=ip-publik-client
add address=149.108.192.0/19 list=ip-publik-client
add address=149.108.224.0/19 list=ip-publik-client
add address=149.110.0.0/16 list=ip-publik-client
add address=149.110.0.0/19 list=ip-publik-client
add address=149.110.32.0/19 list=ip-publik-client
add address=149.110.64.0/19 list=ip-publik-client
add address=149.110.96.0/19 list=ip-publik-client
add address=149.110.128.0/19 list=ip-publik-client
add address=149.110.160.0/19 list=ip-publik-client
add address=149.110.192.0/19 list=ip-publik-client
add address=149.110.224.0/19 list=ip-publik-client
add address=149.113.0.0/16 list=ip-publik-client
add address=149.113.0.0/19 list=ip-publik-client
add address=149.113.32.0/19 list=ip-publik-client
add address=149.113.64.0/19 list=ip-publik-client
add address=149.113.96.0/19 list=ip-publik-client
add address=149.113.128.0/19 list=ip-publik-client
add address=149.113.160.0/19 list=ip-publik-client
add address=149.113.192.0/19 list=ip-publik-client
add address=149.113.224.0/19 list=ip-publik-client
add address=163.171.195.0/24 list=ip-publik-client
add address=163.171.223.0/24 list=ip-publik-client
add address=184.29.30.0/23 list=ip-publik-client
add address=184.50.64.0/20 list=ip-publik-client
add address=184.51.116.0/22 list=ip-publik-client
add address=202.73.96.0/22 list=ip-publik-client
add address=103.135.224.0/22 list=ip-publik-client
add address=103.135.224.0/24 list=ip-publik-client
add address=103.135.225.0/24 list=ip-publik-client
add address=103.135.226.0/24 list=ip-publik-client
add address=103.135.227.0/24 list=ip-publik-client
add address=103.175.48.0/23 list=ip-publik-client
add address=103.175.48.0/24 list=ip-publik-client
add address=103.175.49.0/24 list=ip-publik-client
add address=139.0.230.27 comment=rohman2 list=ip-publik-client
add address=103.162.63.153 comment=rohman1 list=ip-publik-client
add address=202.59.166.86 comment=keryn123 list=ip-publik-client
add address=103.135.227.50 comment=maxtkjsmk list=ip-publik-client
add address=149.113.127.210 comment=mnet-router-remote list=ip-publik-client
add address=182.253.131.81 comment=muhsin list=ip-publik-client
add address=139.0.32.53 comment=rumah-router-remote list=ip-publik-client
add address=139.0.45.197 comment=rohman6 list=ip-publik-client
add address=202.59.168.148 comment=keryn123 list=ip-publik-client
add address=182.253.131.80 comment=subeki list=ip-publik-client
add address=139.194.156.82 comment=rohman5 list=ip-publik-client
add address=149.113.5.235 comment=keryn123 list=ip-publik-client
add address=202.59.175.198 comment=keryn123 list=ip-publik-client
add address=139.194.158.217 comment=rohman7 list=ip-publik-client
add address=139.0.40.221 comment=rumah-router-remote list=ip-publik-client
add address=202.59.168.96 comment=keryn123 list=ip-publik-client
add address=139.0.44.39 comment=rohman7 list=ip-publik-client
add address=149.113.94.215 comment=keryn123 list=ip-publik-client
add address=202.59.168.101 comment=keryn123 list=ip-publik-client
add address=202.59.166.109 comment=keryn123 list=ip-publik-client
add address=139.194.100.113 comment=rumah-router-dns list=ip-publik-client
add address=149.113.107.141 comment=keryn123 list=ip-publik-client
add address=202.59.168.155 comment=keryn123 list=ip-publik-client
add address=149.113.107.0 comment=keryn123 list=ip-publik-client
add address=202.59.168.99 comment=keryn123 list=ip-publik-client
add address=139.194.148.60 comment=rohman7 list=ip-publik-client
add address=202.59.166.111 comment=keryn123 list=ip-publik-client
add address=202.59.168.103 comment=keryn123 list=ip-publik-client
add address=202.59.168.144 comment=keryn123 list=ip-publik-client
add address=149.113.124.248 comment=rumah-router-dns list=ip-publik-client
add address=139.0.226.154 comment=rohman3 list=ip-publik-client
add address=202.59.168.145 comment=keryn123 list=ip-publik-client
add address=149.113.109.120 comment=keryn123 list=ip-publik-client
add address=202.59.168.157 comment=keryn123 list=ip-publik-client
add address=139.0.53.53 comment=rohman7 list=ip-publik-client
add address=139.0.226.51 comment=keryn123 list=ip-publik-client
add address=202.59.166.84 comment=keryn123 list=ip-publik-client
add address=139.194.108.140 comment=rohman6 list=ip-publik-client
add address=139.194.155.24 comment=keryn123 list=ip-publik-client
add address=139.194.110.235 comment=keryn123 list=ip-publik-client
add address=202.59.175.194 comment=keryn123 list=ip-publik-client
add address=139.0.60.82 comment=rohman7 list=ip-publik-client
add address=149.113.127.88 comment=rumah-router-remote list=ip-publik-client
add address=202.59.166.108 comment=keryn123 list=ip-publik-client
add address=139.194.159.82 comment=keryn123 list=ip-publik-client
add address=202.59.168.102 comment=keryn123 list=ip-publik-client
add address=139.0.53.194 comment=rohman2 list=ip-publik-client
add address=139.194.101.174 comment=rumah-router-remote list=ip-publik-client
add address=139.0.229.241 comment=rohman7 list=ip-publik-client
add address=202.59.175.196 comment=keryn123 list=ip-publik-client
add address=139.0.235.191 comment=keryn123 list=ip-publik-client
add address=139.0.150.160 comment=rohman6 list=ip-publik-client
add address=202.59.168.150 comment=keryn123 list=ip-publik-client
add address=139.194.219.2 comment=rohman5 list=ip-publik-client
add address=202.59.166.104 comment=keryn123 list=ip-publik-client
add address=139.194.156.18 comment=keryn123 list=ip-publik-client
add address=139.194.111.205 comment=rohman5 list=ip-publik-client
add address=202.59.168.146 comment=keryn123 list=ip-publik-client
add address=139.0.45.78 comment=rohman2 list=ip-publik-client
add address=139.194.218.106 comment=rohman7 list=ip-publik-client
add address=139.194.99.108 comment=rumah-router-dns list=ip-publik-client
add address=202.59.168.154 comment=keryn123 list=ip-publik-client
add address=149.113.14.104 comment=keryn123 list=ip-publik-client
add address=202.59.175.193 comment=keryn123 list=ip-publik-client
add address=139.0.60.73 comment=rohman6 list=ip-publik-client
add address=139.194.158.22 comment=keryn123 list=ip-publik-client
add address=202.59.175.197 comment=keryn123 list=ip-publik-client
add address=139.0.58.36 comment=rohman6 list=ip-publik-client
add address=149.113.11.168 comment=rumah-router-remote list=ip-publik-client
add address=202.59.168.153 comment=keryn123 list=ip-publik-client
add address=139.194.218.39 comment=keryn123 list=ip-publik-client
add address=182.253.131.82 comment=muhsin list=ip-publik-client
add address=139.194.147.47 comment=rohman3 list=ip-publik-client
add address=139.194.100.76 comment=rumah-router-remote list=ip-publik-client
add address=149.113.69.14 comment=keryn123 list=ip-publik-client
add address=202.59.168.98 comment=keryn123 list=ip-publik-client
add address=139.0.61.153 comment=rohman6 list=ip-publik-client
add address=149.113.126.9 comment=rumah-router-remote list=ip-publik-client
add address=139.0.36.144 comment=rohman7 list=ip-publik-client
add address=139.0.237.166 comment=keryn123 list=ip-publik-client
add address=202.59.166.106 comment=keryn123 list=ip-publik-client
add address=139.194.148.211 comment=rohman7 list=ip-publik-client
add address=139.194.216.154 comment=rumah-router-dns list=ip-publik-client
add address=139.0.44.74 comment=rohman3 list=ip-publik-client
add address=139.194.101.46 comment=rumah-router-remote list=ip-publik-client
add address=139.194.215.71 comment=rohman6 list=ip-publik-client
add address=139.194.111.243 comment=rohman7 list=ip-publik-client
add address=149.113.67.5 comment=rohman6 list=ip-publik-client
add address=202.59.168.158 comment=keryn123 list=ip-publik-client
add address=139.0.225.184 comment=rohman2 list=ip-publik-client
add address=202.59.168.97 comment=keryn123 list=ip-publik-client
add address=202.59.168.156 comment=keryn123 list=ip-publik-client
add address=149.113.8.5 comment=rumah-router-remote list=ip-publik-client
add address=149.113.79.94 comment=rohman7 list=ip-publik-client
add address=103.135.227.47 comment=maxtkjsmk list=ip-publik-client
add address=139.194.221.245 comment=rumah-router-remote list=ip-publik-client
add address=202.59.166.82 comment=keryn123 list=ip-publik-client
add address=139.194.156.49 comment=rohman5 list=ip-publik-client
add address=202.59.166.105 comment=keryn123 list=ip-publik-client
add address=139.194.213.198 comment=muhsin list=ip-publik-client
add address=139.0.236.41 comment=rohman4 list=ip-publik-client
add address=202.59.168.147 comment=keryn123 list=ip-publik-client
add address=202.59.168.207 comment=keryn123 list=ip-publik-client
add address=202.59.168.205 comment=keryn123 list=ip-publik-client
add address=139.194.153.102 comment=rumah-router-remote list=ip-publik-client
add address=182.253.108.42 comment=maxtkjsmk list=ip-publik-client
add address=149.113.14.75 comment=rohman6 list=ip-publik-client
add address=202.59.168.152 comment=keryn123 list=ip-publik-client
add address=202.59.168.204 comment=keryn123 list=ip-publik-client
add address=139.0.148.23 comment=keryn123 list=ip-publik-client
add address=139.0.42.147 comment=keryn123 list=ip-publik-client
add address=139.194.101.110 comment=rumah-router-remote list=ip-publik-client
add address=139.0.48.184 comment=mnet-router-remote list=ip-publik-client
add address=149.113.76.147 comment=rohman5 list=ip-publik-client
add address=139.0.239.236 comment=keryn123 list=ip-publik-client
add address=139.0.239.64 comment=keryn123 list=ip-publik-client
add address=149.113.71.128 comment=keryn123 list=ip-publik-client
add address=139.194.109.103 comment=keryn123 list=ip-publik-client
add address=139.0.49.126 comment=rumah-router-remote list=ip-publik-client
add address=139.0.235.116 comment=rohman7 list=ip-publik-client
add address=139.194.219.98 comment=keryn123 list=ip-publik-client
add address=149.113.72.52 comment=rohman5 list=ip-publik-client
add address=202.59.175.195 comment=keryn123 list=ip-publik-client
add address=139.194.221.38 comment=rumah-router-remote list=ip-publik-client
add address=139.194.216.75 comment=rumah-router-remote list=ip-publik-client
add address=139.0.36.19 comment=rohman6 list=ip-publik-client
add address=139.0.61.192 comment=keryn123 list=ip-publik-client
add address=202.59.168.206 comment=keryn123 list=ip-publik-client
add address=139.194.110.26 comment=rohman7 list=ip-publik-client
add address=139.194.216.230 comment=rumah-router-remote list=ip-publik-client
add address=139.0.235.184 comment=keryn123 list=ip-publik-client
add address=202.59.166.110 comment=keryn123 list=ip-publik-client
add address=139.0.232.251 comment=keryn123 list=ip-publik-client
add address=202.59.168.202 comment=keryn123 list=ip-publik-client
add address=139.194.154.193 comment=keryn123 list=ip-publik-client
add address=149.113.72.219 comment=rohman2 list=ip-publik-client
add address=202.59.166.81 comment=keryn123 list=ip-publik-client
add address=139.0.50.244 comment=rumah-router-remote list=ip-publik-client
add address=139.0.236.138 comment=rohman6 list=ip-publik-client
add address=139.0.151.240 comment=keryn123 list=ip-publik-client
add address=139.0.51.15 comment=rumah-router-remote list=ip-publik-client
add address=202.59.168.100 comment=keryn123 list=ip-publik-client
add address=139.194.109.182 comment=rohman2 list=ip-publik-client
add address=149.113.10.132 comment=rumah-router-dns list=ip-publik-client
add address=139.194.147.79 comment=rohman3 list=ip-publik-client
add address=139.0.60.90 comment=keryn123 list=ip-publik-client
add address=139.194.148.100 comment=keryn123 list=ip-publik-client
add address=202.59.166.87 comment=keryn123 list=ip-publik-client
add address=149.113.9.24 comment=muhsin list=ip-publik-client
add address=139.194.104.208 comment=rohman4 list=ip-publik-client
add address=139.194.148.74 comment=keryn123 list=ip-publik-client
add address=112.78.177.12 comment=rumah-router-remote list=ip-publik-client
add address=139.0.52.216 comment=keryn123 list=ip-publik-client
add address=139.0.151.155 comment=keryn123 list=ip-publik-client
add address=139.0.150.64 comment=keryn123 list=ip-publik-client
add address=139.194.111.137 comment=keryn123 list=ip-publik-client
add address=139.194.109.18 comment=keryn123 list=ip-publik-client
add address=139.0.239.188 comment=keryn123 list=ip-publik-client
add address=139.194.158.17 comment=keryn123 list=ip-publik-client
add address=139.194.214.78 comment=keryn123 list=ip-publik-client
add address=139.0.231.55 comment=keryn123 list=ip-publik-client
add address=139.194.218.101 comment=keryn123 list=ip-publik-client
add address=149.113.15.95 comment=keryn123 list=ip-publik-client
add address=139.194.147.196 comment=keryn123 list=ip-publik-client
add address=139.194.214.109 comment=keryn123 list=ip-publik-client
add address=149.113.6.148 comment=keryn123 list=ip-publik-client
add address=139.194.219.154 comment=keryn123 list=ip-publik-client
add address=139.194.104.95 comment=keryn123 list=ip-publik-client
add address=139.0.233.52 comment=keryn123 list=ip-publik-client
add address=149.113.6.181 comment=keryn123 list=ip-publik-client
add address=139.0.224.65 comment=keryn123 list=ip-publik-client
add address=149.113.74.96 comment=keryn123 list=ip-publik-client
add address=139.0.237.97 comment=keryn123 list=ip-publik-client
add address=139.194.156.16 comment=keryn123 list=ip-publik-client
add address=139.0.151.84 comment=keryn123 list=ip-publik-client
add address=149.113.64.62 comment=keryn123 list=ip-publik-client
add address=149.113.70.80 comment=keryn123 list=ip-publik-client
add address=139.194.214.135 comment=keryn123 list=ip-publik-client
add address=139.0.47.27 comment=keryn123 list=ip-publik-client
add address=149.113.5.221 comment=keryn123 list=ip-publik-client
add address=149.113.69.75 comment=keryn123 list=ip-publik-client
add address=149.113.72.234 comment=keryn123 list=ip-publik-client
add address=149.113.5.226 comment=keryn123 list=ip-publik-client
add address=139.0.224.143 comment=keryn123 list=ip-publik-client
add address=149.113.7.21 comment=keryn123 list=ip-publik-client
add address=149.113.5.230 comment=keryn123 list=ip-publik-client
add address=139.0.228.141 comment=keryn123 list=ip-publik-client
add address=139.0.238.248 comment=keryn123 list=ip-publik-client
add address=139.194.218.28 comment=keryn123 list=ip-publik-client
add address=149.113.69.28 comment=keryn123 list=ip-publik-client
add address=139.194.110.36 comment=keryn123 list=ip-publik-client
add address=139.0.36.138 comment=keryn123 list=ip-publik-client
add address=149.113.5.233 comment=keryn123 list=ip-publik-client
add address=139.0.228.142 comment=keryn123 list=ip-publik-client
add address=139.0.235.142 comment=keryn123 list=ip-publik-client
add address=139.0.237.230 comment=keryn123 list=ip-publik-client
add address=139.194.149.153 comment=keryn123 list=ip-publik-client
add address=139.194.105.16 comment=keryn123 list=ip-publik-client
add address=149.113.73.10 comment=keryn123 list=ip-publik-client
add address=149.113.74.152 comment=keryn123 list=ip-publik-client
add address=139.0.239.27 comment=keryn123 list=ip-publik-client
add address=139.0.47.252 comment=keryn123 list=ip-publik-client
add address=139.194.218.45 comment=keryn123 list=ip-publik-client
add address=149.113.69.89 comment=keryn123 list=ip-publik-client
add address=139.194.110.87 comment=keryn123 list=ip-publik-client
add address=139.0.46.84 comment=keryn123 list=ip-publik-client
add address=139.0.63.195 comment=keryn123 list=ip-publik-client
add address=139.0.224.246 comment=keryn123 list=ip-publik-client
add address=149.113.73.129 comment=keryn123 list=ip-publik-client
add address=202.59.166.80 comment=keryn123 list=ip-publik-client
add address=139.194.158.67 comment=keryn123 list=ip-publik-client
add address=149.113.6.101 comment=rohman7 list=ip-publik-client
add address=149.113.9.220 comment=mnet-router-remote list=ip-publik-client
add address=139.0.42.221 comment=rohman7 list=ip-publik-client
add address=202.59.168.151 comment=keryn123 list=ip-publik-client
add address=202.59.168.201 comment=keryn123 list=ip-publik-client
add address=149.113.68.69 comment=keryn123 list=ip-publik-client
add address=139.194.109.198 comment=keryn123 list=ip-publik-client
add address=139.194.147.220 comment=keryn123 list=ip-publik-client
add address=139.194.98.136 comment=mnet-router-dns list=ip-publik-client
add address=149.113.6.243 comment=rohman2 list=ip-publik-client
add address=139.194.149.8 comment=keryn123 list=ip-publik-client
add address=139.194.105.205 comment=rohman3 list=ip-publik-client
add address=149.113.8.48 comment=muhsin list=ip-publik-client
add address=139.194.109.143 comment=keryn123 list=ip-publik-client
add address=139.0.236.242 comment=rohman7 list=ip-publik-client
add address=112.78.177.13 comment=mnet-router-remote list=ip-publik-client
add address=139.194.99.232 comment=muhsin list=ip-publik-client
add address=149.113.74.80 comment=keryn123 list=ip-publik-client
add address=202.59.168.149 comment=keryn123 list=ip-publik-client
add address=139.0.59.99 comment=rohman3 list=ip-publik-client
add address=139.194.219.93 comment=keryn123 list=ip-publik-client
add address=202.59.175.192 comment=keryn123 list=ip-publik-client
add address=139.0.43.110 comment=rohman7 list=ip-publik-client
add address=139.194.217.28 comment=muhsin list=ip-publik-client
add address=139.194.105.129 comment=keryn123 list=ip-publik-client
add address=103.135.227.43 comment=maxtkjsmk list=ip-publik-client
add address=139.0.233.31 comment=rohman4 list=ip-publik-client
add address=36.68.55.119 comment=vpn.mnet.my.id list=ip-publik-client
add address=139.194.222.148 comment=muhsin list=ip-publik-client
add address=139.194.147.117 comment=keryn123 list=ip-publik-client
add address=149.113.76.32 comment=rohman4 list=ip-publik-client
add address=149.113.9.125 comment=muhsin list=ip-publik-client
add address=139.0.42.207 comment=keryn123 list=ip-publik-client
add address=36.68.53.0/24 list=ip-publik-client
add address=36.68.53.215 comment=vpn.mnet.my.id list=ip-publik-client
add address=139.194.146.54 comment=rohman6 list=ip-publik-client
add address=149.113.64.30 comment=rohman2 list=ip-publik-client
add address=139.0.63.220 comment=rohman5 list=ip-publik-client
add address=103.144.170.183 comment=muhsin list=ip-publik-client
add address=149.113.9.207 comment=muhsin list=ip-publik-client
add address=139.194.147.230 comment=keryn123 list=ip-publik-client
add address=149.113.126.115 comment=rumah-router-dns list=ip-publik-client
add address=112.78.177.11 comment=mnet-router-remote list=ip-publik-client
add address=139.0.53.46 comment=rohman7 list=ip-publik-client
add address=149.113.73.230 comment=keryn123 list=ip-publik-client
add address=36.68.53.252 comment=vpn.mnet.my.id list=ip-publik-client
add address=149.113.64.156 comment=rohman6 list=ip-publik-client
add address=139.0.58.67 comment=keryn123 list=ip-publik-client
add address=139.194.222.96 comment=muhsin list=ip-publik-client
add address=149.113.73.149 comment=rohman3 list=ip-publik-client
add address=139.0.37.240 comment=keryn123 list=ip-publik-client
add address=139.194.147.170 comment=rohman7 list=ip-publik-client
add address=149.113.4.157 comment=rohman5 list=ip-publik-client
add address=149.113.74.128 comment=rohman5 list=ip-publik-client
add address=139.0.59.229 comment=keryn123 list=ip-publik-client
add address=139.194.110.40 comment=keryn123 list=ip-publik-client
add address=139.0.148.47 comment=rohman3 list=ip-publik-client
add address=139.0.101.75 comment=keryn123 list=ip-publik-client
add address=139.0.57.202 comment=muhsin list=ip-publik-client
add address=139.194.155.246 comment=rohman4 list=ip-publik-client
add address=139.0.45.242 comment=keryn123 list=ip-publik-client
add address=139.194.108.95 comment=keryn123 list=ip-publik-client
add address=139.194.154.191 comment=keryn123 list=ip-publik-client
add address=139.0.36.254 comment=keryn123 list=ip-publik-client
add address=149.113.7.212 comment=keryn123 list=ip-publik-client
add address=139.194.219.254 comment=keryn123 list=ip-publik-client
add address=139.0.46.64 comment=rohman7 list=ip-publik-client
add address=139.0.39.100 comment=muhsin list=ip-publik-client
add address=139.0.59.134 comment=keryn123 list=ip-publik-client
add address=139.0.37.26 comment=rohman5 list=ip-publik-client
add address=139.194.152.218 comment=muhsin list=ip-publik-client
add address=139.0.228.91 comment=keryn123 list=ip-publik-client
add address=139.0.45.208 comment=rohman7 list=ip-publik-client
add address=139.0.41.67 comment=muhsin list=ip-publik-client
add address=139.194.105.171 comment=keryn123 list=ip-publik-client
add address=139.0.45.161 comment=rohman4 list=ip-publik-client
add address=112.78.177.15 comment=mnet-router-remote list=ip-publik-client
add address=139.194.155.158 comment=keryn123 list=ip-publik-client
add address=139.194.221.184 comment=muhsin list=ip-publik-client
add address=149.113.76.193 comment=rohman6 list=ip-publik-client
add address=149.113.65.108 comment=keryn123 list=ip-publik-client
add address=139.194.216.195 comment=muhsin list=ip-publik-client
add address=139.0.237.117 comment=keryn123 list=ip-publik-client
add address=202.59.175.199 comment=keryn123 list=ip-publik-client
add address=149.113.76.21 comment=rohman6 list=ip-publik-client
add address=139.194.97.18 comment=mnet-router-dns list=ip-publik-client
add address=139.0.43.208 comment=keryn123 list=ip-publik-client
add address=139.0.46.254 comment=rohman2 list=ip-publik-client
add address=149.113.75.145 comment=keryn123 list=ip-publik-client
add address=139.194.149.158 comment=rohman6 list=ip-publik-client
add address=139.0.58.191 comment=rohman2 list=ip-publik-client
add address=139.194.221.195 comment=muhsin list=ip-publik-client
add address=139.194.99.166 comment=muhsin list=ip-publik-client
add address=112.78.177.14 comment=mnet-router-remote list=ip-publik-client
add address=139.0.43.103 comment=rohman2 list=ip-publik-client
add address=139.0.228.206 comment=keryn123 list=ip-publik-client
add address=139.194.219.225 comment=keryn123 list=ip-publik-client
add address=139.0.59.65 comment=rohman7 list=ip-publik-client
add address=149.113.70.46 comment=rohman4 list=ip-publik-client
add address=36.68.52.0/22 comment=bima list=ip-publik-client
add address=139.0.63.37 comment=rohman3 list=ip-publik-client
add address=139.0.233.176 comment=rohman6 list=ip-publik-client
add address=149.113.15.72 comment=keryn123 list=ip-publik-client
add address=139.0.51.2 comment=muhsin list=ip-publik-client
add address=139.0.46.96 comment=rohman6 list=ip-publik-client
add address=139.194.109.67 comment=rohman3 list=ip-publik-client
add address=139.0.42.240 comment=keryn123 list=ip-publik-client
add address=139.0.234.77 comment=rohman6 list=ip-publik-client
add address=139.0.237.185 comment=keryn123 list=ip-publik-client
add address=139.0.41.51 comment=muhsin list=ip-publik-client
add address=149.113.15.213 comment=rohman2 list=ip-publik-client
add address=139.0.111.55 comment=keryn123 list=ip-publik-client
add address=139.194.99.155 comment=muhsin list=ip-publik-client
add address=149.113.7.214 comment=rohman6 list=ip-publik-client
add address=139.194.156.190 comment=keryn123 list=ip-publik-client
add address=103.135.227.46 comment=maxtkjsmk list=ip-publik-client
add address=139.194.109.107 comment=rohman3 list=ip-publik-client
add address=139.194.111.32 comment=rohman3 list=ip-publik-client
add address=139.0.39.136 comment=muhsin list=ip-publik-client
add address=139.0.107.31 comment=keryn123 list=ip-publik-client
add address=139.0.59.7 comment=rohman3 list=ip-publik-client
add address=139.0.38.247 comment=muhsin list=ip-publik-client
add address=202.59.168.159 comment=keryn123 list=ip-publik-client
add address=139.0.233.121 comment=rohman3 list=ip-publik-client
add address=149.113.73.154 comment=keryn123 list=ip-publik-client
add address=139.0.41.130 comment=muhsin list=ip-publik-client
add address=149.113.4.139 comment=rohman4 list=ip-publik-client
add address=139.194.151.140 comment=muhsin list=ip-publik-client
add address=139.194.149.213 comment=keryn123 list=ip-publik-client
add address=139.0.107.227 comment=rohman6 list=ip-publik-client
add address=139.194.148.150 comment=keryn123 list=ip-publik-client
add address=139.0.63.80 comment=rohman3 list=ip-publik-client
add address=139.0.110.117 comment=rohman5 list=ip-publik-client
add address=139.0.59.73 comment=keryn123 list=ip-publik-client
add address=139.0.32.46 comment=muhsin list=ip-publik-client
add address=139.0.107.140 comment=rohman4 list=ip-publik-client
add address=139.195.117.178 comment=keryn123 list=ip-publik-client
add address=112.78.177.0/24 comment=mnet-router-remote list=ip-publik-client
add address=202.59.166.107 comment=keryn123 list=ip-publik-client
add address=139.0.33.218 comment=rumah-router-remote list=ip-publik-client
add address=149.113.79.83 comment=rohman4 list=ip-publik-client
add address=139.0.151.63 comment=keryn123 list=ip-publik-client
add address=139.194.111.0 comment=rohman3 list=ip-publik-client
add address=103.135.227.45 comment=maxtkjsmk list=ip-publik-client
add address=149.113.74.250 comment=keryn123 list=ip-publik-client
add address=202.59.166.83 comment=keryn123 list=ip-publik-client
add address=149.113.79.126 comment=rohman7 list=ip-publik-client
add address=149.113.122.57 comment=rumah-router-remote list=ip-publik-client
add address=139.194.215.38 comment=keryn123 list=ip-publik-client
add address=149.113.68.63 comment=subeki list=ip-publik-client
add address=139.194.104.250 comment=keryn123 list=ip-publik-client
add address=149.113.67.46 comment=keryn123 list=ip-publik-client
add address=139.0.151.159 comment=keryn123 list=ip-publik-client
add address=149.113.74.84 comment=rohman5 list=ip-publik-client
add address=139.0.232.23 comment=keryn123 list=ip-publik-client
add address=202.59.166.85 comment=keryn123 list=ip-publik-client
add address=139.0.228.247 comment=rohman7 list=ip-publik-client
add address=202.59.168.203 comment=keryn123 list=ip-publik-client
add address=139.0.148.186 comment=keryn123 list=ip-publik-client
add address=139.0.44.211 comment=subeki list=ip-publik-client
add address=149.113.5.217 comment=keryn123 list=ip-publik-client
add address=139.0.224.173 comment=rohman3 list=ip-publik-client
add address=139.0.63.148 comment=keryn123 list=ip-publik-client
add address=149.113.6.95 comment=subeki list=ip-publik-client
add address=149.113.7.103 comment=keryn123 list=ip-publik-client
add address=149.113.71.241 comment=rohman7 list=ip-publik-client
add address=139.0.63.245 comment=rohman6 list=ip-publik-client
add address=139.194.148.18 comment=rohman4 list=ip-publik-client
add address=149.113.76.163 comment=keryn123 list=ip-publik-client
add address=139.0.32.149 comment=rumah-router-remote list=ip-publik-client
add address=139.0.232.31 comment=rohman6 list=ip-publik-client
add address=139.194.156.210 comment=keryn123 list=ip-publik-client
add address=139.0.239.166 comment=rohman6 list=ip-publik-client
add address=139.194.146.52 comment=keryn123 list=ip-publik-client
add address=139.0.50.49 comment=muhsin list=ip-publik-client
add address=149.113.75.177 comment=rohman4 list=ip-publik-client
add address=139.0.105.138 comment=keryn123 list=ip-publik-client
add address=139.194.156.228 comment=keryn123 list=ip-publik-client
add address=139.194.156.166 comment=rohman2 list=ip-publik-client
add address=149.113.9.66 comment=rumah-router-remote list=ip-publik-client
add address=149.113.5.37 comment=keryn123 list=ip-publik-client
add address=149.113.14.91 comment=rohman3 list=ip-publik-client
add address=139.194.216.134 comment=rumah-router-remote list=ip-publik-client
add address=139.0.150.124 comment=keryn123 list=ip-publik-client
add address=103.135.227.91 comment=maxtkjsmk list=ip-publik-client
add address=139.194.148.40 comment=rohman5 list=ip-publik-client
add address=149.113.64.197 comment=rohman4 list=ip-publik-client
add address=149.113.125.23 comment=rumah-router-remote list=ip-publik-client
add address=139.0.234.80 comment=keryn123 list=ip-publik-client
add address=149.113.72.89 comment=rohman1 list=ip-publik-client
add address=149.113.15.188 comment=keryn123 list=ip-publik-client
add address=139.0.230.222 comment=rohman1 list=ip-publik-client
add address=139.0.49.51 comment=rumah-router-remote list=ip-publik-client
add address=139.194.215.35 comment=keryn123 list=ip-publik-client
add address=139.0.110.38 comment=rohman6 list=ip-publik-client
add address=139.194.217.238 comment=rumah-router-remote list=ip-publik-client
add address=149.113.7.240 comment=keryn123 list=ip-publik-client
add address=149.113.68.182 comment=rohman6 list=ip-publik-client
add address=139.0.224.35 comment=keryn123 list=ip-publik-client
add address=139.194.155.204 comment=rohman4 list=ip-publik-client
add address=139.194.153.45 comment=rumah-router-remote list=ip-publik-client
add address=149.113.67.74 comment=keryn123 list=ip-publik-client
add address=139.0.107.46 comment=rohman6 list=ip-publik-client
add address=139.194.208.126 comment=rumah-router-remote list=ip-publik-client
add address=139.0.234.217 comment=keryn123 list=ip-publik-client
add address=139.0.43.44 comment=rohman7 list=ip-publik-client
add address=139.0.227.13 comment=keryn123 list=ip-publik-client
add address=139.194.212.69 comment=rumah-router-remote list=ip-publik-client
add address=139.0.59.88 comment=rohman6 list=ip-publik-client
add address=139.0.105.72 comment=keryn123 list=ip-publik-client
add address=149.113.126.35 comment=rumah-router-dns list=ip-publik-client
add address=139.0.226.196 comment=rohman6 list=ip-publik-client
add address=149.113.70.110 comment=keryn123 list=ip-publik-client
add address=139.194.209.218 comment=rumah-router-remote list=ip-publik-client
add address=149.113.64.118 comment=rohman4 list=ip-publik-client
add address=139.0.63.185 comment=keryn123 list=ip-publik-client
add address=112.78.177.8 comment=muhsin list=ip-publik-client
add address=139.195.118.184 comment=rohman7 list=ip-publik-client
add address=149.113.75.143 comment=keryn123 list=ip-publik-client
add address=149.113.79.46 comment=keryn123 list=ip-publik-client
add address=103.135.224.150 comment=keryn123 list=ip-publik-client
add address=103.135.226.201 comment=keryn123 list=ip-publik-client
add address=149.113.9.60 comment=rumah-router-remote list=ip-publik-client
add address=139.195.117.73 comment=keryn123 list=ip-publik-client
add address=139.0.43.105 comment=keryn123 list=ip-publik-client
add address=117.102.97.0/24 list=ip-publik-client
add address=118.99.95.0/24 list=ip-publik-client
add address=182.253.6.0/24 list=ip-publik-client
add address=182.253.33.0/24 list=ip-publik-client
add address=182.253.47.0/24 list=ip-publik-client
add address=182.253.48.0/23 list=ip-publik-client
add address=182.253.48.0/24 list=ip-publik-client
add address=182.253.49.0/24 list=ip-publik-client
add address=182.253.50.0/24 list=ip-publik-client
add address=182.253.58.0/24 list=ip-publik-client
add address=182.253.59.0/24 list=ip-publik-client
add address=182.253.62.0/24 list=ip-publik-client
add address=182.253.127.0/24 list=ip-publik-client
add address=182.253.143.0/24 list=ip-publik-client
add address=182.253.145.0/24 list=ip-publik-client
add address=182.253.146.0/24 list=ip-publik-client
add address=182.253.148.0/24 list=ip-publik-client
add address=182.253.215.0/24 list=ip-publik-client
add address=182.253.242.0/24 list=ip-publik-client
add address=182.253.253.0/24 list=ip-publik-client
add address=202.169.37.0/24 list=ip-publik-client
add address=202.169.46.0/24 list=ip-publik-client
add address=202.169.56.0/24 list=ip-publik-client
add address=203.142.64.0/24 list=ip-publik-client
add address=111.95.242.0/24 list=ip-publik-client
add address=139.194.109.158 comment=keryn123 list=ip-publik-client
add address=139.0.229.88 comment=rohman7 list=ip-publik-client
add address=139.0.106.186 comment=keryn123 list=ip-publik-client
add address=139.194.105.88 comment=subeki list=ip-publik-client
add address=139.0.41.136 comment=rumah-router-remote list=ip-publik-client
add address=36.68.52.208 list=ip-publik-client
add address=139.0.227.175 comment=keryn123 list=ip-publik-client
add address=139.194.157.158 comment=rohman7 list=ip-publik-client
add address=139.0.40.68 comment=rumah-router-remote list=ip-publik-client
add address=149.113.14.181 comment=rumah-router-dns list=ip-publik-client
add address=149.113.6.221 comment=rohman5 list=ip-publik-client
add address=139.0.158.114 comment=rohman3 list=ip-publik-client
add address=149.113.67.56 comment=rohman7 list=ip-publik-client
add address=36.68.52.178 comment=mm1rza list=ip-publik-client
add address=139.195.118.140 comment=keryn123 list=ip-publik-client
add address=36.68.52.199 comment=mm1rza list=ip-publik-client
add address=36.68.55.234 comment=mm1rza list=ip-publik-client
add address=149.113.199.165 comment=rumah-router-remote list=ip-publik-client
add address=139.195.227.202 comment=rohman6 list=ip-publik-client
add address=139.0.60.222 comment=keryn123 list=ip-publik-client
add address=149.113.68.104 comment=rumah-router-remote list=ip-publik-client
add address=149.113.197.208 comment=rohman3 list=ip-publik-client
add address=149.113.93.0 comment=keryn123 list=ip-publik-client
add address=139.195.248.191 comment=rumah-router-remote list=ip-publik-client
add address=149.113.196.163 comment=rumah-router-remote list=ip-publik-client
add address=112.78.177.9 comment=muhsin list=ip-publik-client
add address=149.113.67.138 comment=rohman3 list=ip-publik-client
add address=149.108.48.150 comment=keryn123 list=ip-publik-client
/ip firewall filter
add action=accept chain=input comment=\
    "                ACCEPT ip publik client" src-address-list=\
    list-ip-trusted
add action=accept chain=input src-address-list=ip-publik-client
add action=reject chain=input comment="                DROP ddos" dst-port=\
    21-23 protocol=tcp reject-with=icmp-network-unreachable src-address-list=\
    !ip-publik-client
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-1 \
    address-list-timeout=1d10m chain=input comment=\
    "                ADD ddos ip publik" connection-state=new \
    dst-address-list=!list-ip-trusted src-address-list=!ip-publik-client
add action=add-src-to-address-list address-list=zz-list-ip-brute-force-FINAL \
    address-list-timeout=none-dynamic chain=input protocol=tcp \
    src-address-list=zzz-list-ip-brute-force-11
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-11 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-10
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-10 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-9
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-9 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-8
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-8 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-7
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-7 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-6
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-6 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-5
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-5 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-4
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-4 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-3
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-3 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-2
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-2 \
    address-list-timeout=10m chain=input protocol=tcp src-address-list=\
    zzz-list-ip-brute-force-1
add action=add-src-to-address-list address-list=zz-list-ip-brute-force-FINAL \
    address-list-timeout=none-dynamic chain=input protocol=udp \
    src-address-list=zzz-list-ip-brute-force-11
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-11 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-10
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-10 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-9
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-9 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-8
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-8 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-7
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-7 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-6
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-6 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-5
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-5 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-4
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-4 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-3
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-3 \
    address-list-timeout=10m chain=input protocol=udp src-address-list=\
    zzz-list-ip-brute-force-2
add action=add-src-to-address-list address-list=zzz-list-ip-brute-force-2 \
    address-list-timeout=10m chain=input connection-state="" protocol=udp \
    src-address-list=zzz-list-ip-brute-force-1
/ip firewall mangle
add action=jump chain=prerouting jump-target=vip protocol=icmp
add action=jump chain=input jump-target=vip protocol=icmp
add action=jump chain=forward jump-target=vip protocol=icmp
add action=jump chain=output jump-target=vip protocol=icmp
add action=jump chain=postrouting jump-target=vip protocol=icmp
add action=jump chain=prerouting jump-target=vip port=53,853,5353 protocol=\
    udp src-address=10.0.0.0/8
add action=jump chain=input jump-target=vip port=53,853,5353 protocol=udp \
    src-address=10.0.0.0/8
add action=jump chain=forward jump-target=vip port=53,853,5353 protocol=udp \
    src-address=10.0.0.0/8
add action=jump chain=output jump-target=vip port=53,853,5353 protocol=udp \
    src-address=10.0.0.0/8
add action=jump chain=postrouting jump-target=vip port=53,853,5353 protocol=\
    udp src-address=10.0.0.0/8
add action=jump chain=prerouting jump-target=vip port=53,853,5353 protocol=\
    tcp src-address=10.0.0.0/8
add action=jump chain=input jump-target=vip port=53,853,5353 protocol=tcp \
    src-address=10.0.0.0/8
add action=jump chain=forward jump-target=vip port=53,853,5353 protocol=tcp \
    src-address=10.0.0.0/8
add action=jump chain=forward dst-address=10.0.0.0/8 jump-target=vip port=\
    53,853,5353 protocol=tcp
add action=jump chain=output jump-target=vip port=53,853,5353 protocol=tcp \
    src-address=10.0.0.0/8
add action=jump chain=postrouting jump-target=vip port=53,853,5353 protocol=\
    tcp src-address=10.0.0.0/8
add action=jump chain=prerouting disabled=yes jump-target=vip protocol=gre
add action=jump chain=input disabled=yes jump-target=vip protocol=gre
add action=jump chain=forward disabled=yes jump-target=vip protocol=gre
add action=jump chain=output disabled=yes jump-target=vip protocol=gre
add action=jump chain=postrouting disabled=yes jump-target=vip protocol=gre
add action=mark-packet chain=vip new-packet-mark=vip passthrough=no
/ip firewall nat
add action=dst-nat chain=dstnat comment="172.16.0.1 ke pc mirza" dst-address=\
    172.16.0.1 to-addresses=10.123.22.6
add action=dst-nat chain=dstnat comment="ke MIRZA PC" dst-address-list=\
    ip-publik dst-port=80 protocol=tcp to-addresses=10.123.22.4 to-ports=80
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=22 \
    protocol=tcp to-addresses=10.123.22.4 to-ports=21
add action=dst-nat chain=dstnat comment=tv dst-address-list=ip-publik \
    dst-port=5938 protocol=tcp to-addresses=10.123.22.4 to-ports=5938
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=5938 \
    protocol=udp to-addresses=10.123.22.4 to-ports=5938
add action=dst-nat chain=dstnat comment=ultra dst-address-list=ip-publik \
    dst-port=2112 protocol=tcp to-addresses=10.123.22.4 to-ports=2112
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=2112 \
    protocol=udp to-addresses=10.123.22.4 to-ports=2112
add action=dst-nat chain=dstnat comment=rdp dst-address-list=ip-publik \
    dst-port=3389 protocol=tcp to-addresses=10.123.22.6 to-ports=3389
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=3389 \
    protocol=udp to-addresses=10.123.22.6 to-ports=3389
add action=dst-nat chain=dstnat comment="router rumah" dst-address-list=\
    ip-publik dst-port=8399 protocol=tcp to-addresses=10.123.22.6 to-ports=\
    8291
add action=dst-nat chain=dstnat comment="merpati router" dst-address-list=\
    ip-publik dst-port=8299 protocol=tcp to-addresses=10.123.22.2 to-ports=\
    8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8722 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=8728
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8085 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=8085
add action=dst-nat chain=dstnat comment="merpati modem isp" dst-address-list=\
    ip-publik dst-port=14561 protocol=tcp to-addresses=10.123.22.2 to-ports=\
    14561
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=14562 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=14562
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=14563 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=14563
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=14564 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=14564
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=14565 \
    protocol=tcp to-addresses=10.123.22.2 to-ports=14565
add action=passthrough chain=srcnat comment="RADIO MNET" disabled=yes
add action=dst-nat chain=dstnat comment="vpn.mnet.my.id:14446 | Omnitik" \
    dst-address-list=ip-publik dst-port=14446 protocol=tcp to-addresses=\
    10.123.22.2 to-ports=14446
add action=passthrough chain=srcnat comment="BATAS CLIENT" disabled=yes
add action=dst-nat chain=dstnat comment=pratama dst-address-list=ip-publik \
    dst-port=8001 protocol=tcp to-addresses=10.123.223.31 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8002 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8002
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8003 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8912
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8004 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8004
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8005 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8005
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8006 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8006
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=8007 \
    protocol=tcp to-addresses=10.123.223.31 to-ports=8728
add action=dst-nat chain=dstnat comment=keryn dst-address-list=ip-publik \
    dst-port=9010 protocol=tcp to-addresses=10.123.223.38 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9011 \
    protocol=tcp to-addresses=10.123.223.38 to-ports=8728
add action=dst-nat chain=dstnat comment=muksin dst-address-list=ip-publik \
    dst-port=9696 protocol=tcp to-addresses=10.123.223.32 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9797 \
    protocol=tcp to-addresses=10.123.223.32 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman1 dst-address-list=ip-publik \
    dst-port=9001 protocol=tcp to-addresses=10.123.223.33 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9002 \
    protocol=tcp to-addresses=10.123.223.33 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman2 dst-address-list=ip-publik \
    dst-port=9003 protocol=tcp to-addresses=10.123.223.34 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman3 dst-address-list=ip-publik \
    dst-port=9004 protocol=tcp to-addresses=10.123.223.35 to-ports=8728
add action=dst-nat chain=dstnat comment="rohman 4" dst-address-list=ip-publik \
    dst-port=9007 protocol=tcp to-addresses=10.123.223.36 to-ports=8728
add action=dst-nat chain=dstnat comment=subeki dst-address-list=ip-publik \
    dst-port=9005 protocol=tcp to-addresses=10.123.223.37 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9006 \
    protocol=tcp to-addresses=10.123.223.37 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman5 dst-address-list=ip-publik \
    dst-port=9012 protocol=tcp to-addresses=10.123.223.39 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9013 \
    protocol=tcp to-addresses=10.123.223.39 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman6 dst-address-list=ip-publik \
    dst-port=9014 protocol=tcp to-addresses=10.123.223.40 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9015 \
    protocol=tcp to-addresses=10.123.223.40 to-ports=8728
add action=dst-nat chain=dstnat comment=rohman7 dst-address-list=ip-publik \
    dst-port=9016 protocol=tcp to-addresses=10.123.223.41 to-ports=8291
add action=dst-nat chain=dstnat dst-address-list=ip-publik dst-port=9017 \
    protocol=tcp to-addresses=10.123.223.41 to-ports=8728
add action=masquerade chain=srcnat comment="ke internet | api 8728 , winbox 82\
    90  | 1-65535 | untuk publik dr vpn 10.001 - 65535"
/ip firewall raw
add action=accept chain=prerouting comment=\
    "                ACCEPT ip publik client" src-address-list=\
    list-ip-trusted
add action=accept chain=output dst-address-list=list-ip-trusted
add action=accept chain=prerouting src-address-list=ip-publik-client
add action=accept chain=output dst-address-list=ip-publik-client
add action=drop chain=prerouting comment=\
    "                DROP tunneling (L2TP)" dst-port=1701 protocol=udp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting comment=\
    "                DROP tunneling OVPN" dst-port=1194 protocol=tcp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting comment=\
    "                DROP tunneling (SSTP)" dst-port=443 protocol=tcp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting comment=\
    "                DROP tunneling (PPTP)" dst-port=1723 protocol=tcp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting comment="                DROP (neighbor dis 5\
    678) (mac address 20561) (snmp 161,162) (dude 2210,2211) (proxy 3128,8080)\
    \_(btest 2000,3000) (tracert 33434-33534)" dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534 protocol=tcp
add action=drop chain=prerouting dst-port=\
    5678,20561,161,162,2210,2211,3128,8080,2000,3000,33434-33534 protocol=udp
add action=drop chain=prerouting comment=\
    "                DROP winbox exploit" content=user.dat
add action=drop chain=prerouting comment="                DROP ddos" \
    dst-port=53,5353,853 protocol=tcp
add action=drop chain=prerouting dst-port=53,5353,853 protocol=udp
add action=drop chain=prerouting dst-port=21-23 protocol=tcp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting packet-size=1601-65535 protocol=icmp \
    src-address-list=zz-list-ip-brute-force-FINAL
add action=drop chain=prerouting packet-size=200 protocol=icmp \
    src-address-list=zz-list-ip-brute-force-FINAL
/ip ipsec policy
set 0 dst-address=0.0.0.0/0 src-address=0.0.0.0/0
/ip route
add distance=1 gateway=103.143.170.9
/ip service
set telnet disabled=yes
set www port=81
set ssh disabled=yes
set www-ssl port=442
set api disabled=yes
set winbox port=8290
set api-ssl disabled=yes
/ipv6 nd
set [ find default=yes ] advertise-dns=no
/ppp secret
add local-address=10.123.22.1 name=mnet-router-remote password=\
    456awasadawewe456 profile=ADMIN remote-address=10.123.22.2
add name=muhsin password=muhsin17010090 profile=PELANGGAN remote-address=\
    10.123.223.32
add name=rohman1 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.33
add name=rohman2 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.34
add name=rohman3 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.35
add name=maxtkjsmk password=awazadawewe123 profile=PELANGGAN remote-address=\
    10.123.223.31
add local-address=10.123.22.3 name=rumah-router-dns password=mirzarumah45 \
    profile=ADMIN remote-address=10.123.22.4
add name=subeki password=subeki99 profile=PELANGGAN remote-address=\
    10.123.223.37
add name=rohman4 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.36
add name=mnetvpn password=mnetvpn profile=dhcp-FREE
add name=mm1rza password=mm1rza profile=dhcp-WUZZ
add name=keryn123 password=12das213 profile=PELANGGAN remote-address=\
    10.123.223.38
add name=rohman5 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.39
add name=rohman6 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.40
add name=maxtkj password=maxtkj profile=dhcp-WUZZ
add name=mnetdns password=mnetdns profile=dhcp-FREE
add name=rohman7 password=awasadawewe profile=PELANGGAN remote-address=\
    10.123.223.41
add local-address=10.123.22.7 name=mnet-router-dns password=456awasadawewe456 \
    profile=ADMIN remote-address=10.123.22.8
add local-address=10.123.22.5 name=rumah-router-remote password=mirzarumah45 \
    profile=ADMIN remote-address=10.123.22.6
add name=vpn.mnet.my.id password=vpn.mnet.my.id profile=dhcp-FREE
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=MNET.MY.ID
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add interval=12h name=##backup on-event=\
    "/system script run ##backup-router-email&ftp" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2020 start-time=12:00:00
add interval=1w name="###auto renew licence" on-event=\
    "/system script run ###auto renew licence" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=04:24:55
add disabled=yes interval=1m name=~ping on-event=":local intisp \"ether1\"\r\
    \n:local namaisp \"isp1\"\r\
    \n\r\
    \n:local time [/system clock get time]\r\
    \n:local error \"mati \$time -\"\r\
    \n:local aman \"nyala \$time -\"\r\
    \n\r\
    \n:if ([/ping address=1.0.0.1 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 1.0.0.1\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.0.0.1\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=1.1.1.1 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 1.1.1.1\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 1.1.1.1\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=8.8.4.4 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 8.8.4.4\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.4.4\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=8.8.8.8 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 8.8.8.8\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 8.8.8.8\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=4.2.2.1 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 4.2.2.1\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 4.2.2.1\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=4.2.2.2 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 4.2.2.2\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 4.2.2.2\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=9.9.9.9 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 9.9.9.9\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 9.9.9.9\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=149.112.112.112 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 149.112.112.112\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 149.112.112.112\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=208.67.220.220 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 208.67.220.220\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.220.220\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=208.67.222.222 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 208.67.222.222\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 208.67.222.222\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=94.140.14.14 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 94.140.14.14\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.14\")\r\
    \n};\r\
    \n\r\
    \n:if ([/ping address=94.140.14.15 count=3 ] = 0) do={\r\
    \nlog error (\"\$error 94.140.14.15\")\r\
    \n} else={\r\
    \n#log warning (\"\$aman 94.140.14.15\")\r\
    \n};\r\
    \n\r\
    \n#:delay 1s;\r\
    \n#log info message=\"\$namaisp batasssss\"" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/11/2022 start-time=00:00:00
add disabled=yes interval=13s name="AUTO CARI DNS" on-event=":if ([/ping addre\
    ss=1.1.1.1 count=3] = 0) do={\r\
    \n  :if ([/ping address=8.8.8.8 count=3] = 0) do={\r\
    \n      :if ([/ping address=9.9.9.9 count=3] = 0) do={\r\
    \n      } else={\r\
    \n      /ip dns set servers=9.9.9.9,149.112.112.112\r\
    \n      };\r\
    \n  } else={\r\
    \n  /ip dns set servers=8.8.8.8,8.8.4.4\r\
    \n  };\r\
    \n} else={\r\
    \n/ip dns set servers=1.1.1.1,1.0.0.1\r\
    \n};" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=yes name=##backup-router-email&ftp owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":local ftphost \"43.229.254.178\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/\"\r\
    \n\r\
    \n:local identity \"MNET-CHR\"\r\
    \n:local mnet1 \"/backup/\$identity.backup\"\r\
    \n:local mnet2 \"/backup/export/\$identity.rsc\"\r\
    \n\r\
    \n/system backup save name=\$mnet1\r\
    \n/export compact file=\$mnet2"
add dont-require-permissions=no name="###auto renew licence" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/system license renew account=mirza082138@gmail.com password=78iGN\
    QOdqD level=p1"
add dont-require-permissions=no name="!              CLEAR LOG" owner=mm1rza \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/system logging action set memory memory-lines=1\r\
    \n/system logging action set memory memory-lines=2000\r\
    \n"
/tool e-mail
set address=74.125.68.109 from="MikroTik MNET" password=vixxfwnuqexwaocz \
    port=587 start-tls=yes user=mirza@poltektegal.ac.id
/tool graphing interface
add interface=ether1
/tool mac-server
set allowed-interface-list=none
/tool mac-server mac-winbox
set allowed-interface-list=none
/tool mac-server ping
set enabled=no
/tool netwatch
add comment="2 GOOGLE" disabled=yes down-script="\r\
    \n/ip dns set servers=9.9.9.9,149.112.112.112\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS IDNIX DNS GOOGLE\" keep-result=no;" host=8.8.8.8 interval=5s \
    up-script="\r\
    \n/ip dns set servers=8.8.8.8,8.8.4.4\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"VPS DNS GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS GOOGLE\" keep-result=no;"
add comment="~1 CLOUDFLARE " down-script="\r\
    \nlog error (\"VPS DNS CLOUDFLARE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS  NOTIF IDNIX DNS CLOUDFLARE\" keep-result=no;\r\
    \n" host=1.1.1.1 interval=5s up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS CLOUDFLARE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS  NOTIF IDNIX DNS CLOUDFLARE\" keep-result=no;"
add comment="4 ADGUARD" disabled=yes down-script="\r\
    \nlog error (\"VPS DNS ADGUARD\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS IDNIX DNS ADGUARD\" keep-result=no;" host=94.140.14.14 interval=5s \
    up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS ADGUARD\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS ADGUARD\" keep-result=no;"
add comment="3 OpenDNS" disabled=yes down-script="\r\
    \nlog error (\"VPS DNS OpenDNS\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS IDNIX DNS OpenDNS\" keep-result=no;" host=208.67.222.222 interval=\
    5s up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS OpenDNS\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS OpenDNS\" keep-result=no;"
add comment="0 Quad9 Recommended" disabled=yes down-script="\r\
    \n/ip dns set servers=1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS Quad9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS IDNIX DNS Quad9\" keep-result=no;" host=9.9.9.9 interval=5s \
    up-script="\r\
    \n/ip dns set servers=9.9.9.9,149.112.112.112\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"VPS DNS Quad9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS Quad9\" keep-result=no;"
add comment="1 CLOUDFLARE" disabled=yes down-script="\r\
    \n/ip dns set servers=8.8.8.8,8.8.4.4\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS CLOUDFLARE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS IDNIX DNS CLOUDFLARE\" keep-result=no;\r\
    \n" host=1.1.1.1 interval=5s up-script="\r\
    \n/ip dns set servers=1.1.1.1,1.0.0.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"VPS DNS CLOUDFLARE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE\" keep-result=no;"
add comment="~0 Quad9" down-script="\r\
    \nlog error (\"VPS DNS Quad9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS  NOTIF IDNIX DNS Quad9\" keep-result=no;" host=9.9.9.9 interval=\
    5m5s up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS Quad9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS  NOTIF IDNIX DNS Quad9\" keep-result=no;"
add comment="~2 GOOGLE" down-script="\r\
    \nlog error (\"VPS DNS GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS NOTIF IDNIX DNS GOOGLE\" keep-result=no;" host=8.8.8.8 interval=5s \
    up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS NOTIF IDNIX DNS GOOGLE\" keep-result=no;"
add comment="~3 OpenDNS" down-script="\r\
    \nlog error (\"VPS DNS OpenDNS\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS NOTIF IDNIX DNS OpenDNS\" keep-result=no;" host=208.67.222.222 \
    interval=5m5s up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS OpenDNS\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS NOTIF IDNIX DNS OpenDNS\" keep-result=no;"
add comment="~4 ADGUARD" down-script="\r\
    \nlog error (\"VPS DNS ADGUARD\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9D\\\
    8C VPS NOTIF IDNIX DNS ADGUARD\" keep-result=no;" host=94.140.14.14 \
    interval=5m5s up-script=":delay 500ms;\r\
    \nlog warning (\"VPS DNS ADGUARD\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS NOTIF IDNIX DNS ADGUARD\" keep-result=no;"
add comment="# CF& GOOGLE" disabled=yes down-script="\r\
    \n/ip dns set servers=1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS CLOUDFLARE n GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n GOOGLE\" keep-result=no;" host=1.1.1.1 \
    interval=5s up-script="\r\
    \n/ip dns set servers=1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog warning (\"VPS DNS CLOUDFLARE n GOOGLE\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n GOOGLE\" keep-result=no;"
add comment="# 9.9.9 & GG" disabled=yes down-script="\r\
    \n/ip dns set servers=9.9.9.9,149.112.112.112,1.1.1.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS CLOUDFLARE n CLOUD 9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n CLOUD 9\" keep-result=no;" host=9.9.9.9 \
    interval=5s up-script="\r\
    \n/ip dns set servers=9.9.9.9,149.112.112.112,8.8.8.8\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog error (\"VPS DNS CLOUDFLARE n CLOUD 9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n CLOUD 9\" keep-result=no;"
add comment="# 9.9.9 & CF" disabled=yes down-script="\r\
    \n/ip dns set servers=9.9.9.9,1.1.1.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \nlog error (\"VPS DNS CLOUDFLARE n CLOUD 9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n CLOUD 9\" keep-result=no;" host=9.9.9.9 \
    interval=5s up-script="\r\
    \n/ip dns set servers=9.9.9.9,1.1.1.1\r\
    \n/ip dns cache flush\r\
    \n\r\
    \n:delay 500ms;\r\
    \nlog error (\"VPS DNS CLOUDFLARE n CLOUD 9\")\r\
    \n/tool fetch url=\"https://api.telegram.org/bot1353625910:AAGAPgQZzOh1JL2\
    vN8jWriJs6XR-xInew04/sendmessage\\\?chat_id=-1001184386305&text=\\E2\\9C\\\
    85 VPS IDNIX DNS CLOUDFLARE n CLOUD 9\" keep-result=no;"
