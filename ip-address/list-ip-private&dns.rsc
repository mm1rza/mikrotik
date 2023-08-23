








/ip firewall address-list
add address=0.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=10.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=100.64.0.0/10 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=127.0.0.0/8 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=169.254.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=172.16.0.0/12 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=192.0.0.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=192.0.2.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=192.168.0.0/16 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=198.18.0.0/15 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=198.51.100.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=203.0.113.0/24 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=224.0.0.0/3 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=255.255.255.255 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns
add address=240.0.0.0/4 comment=IP-LOKAL-PRIVATE list=ip-private-2-local&dns













/ip firewall address-list
add address=8.8.8.8 comment="DNS GOOGLE" list=ip-private-2-local&dns
add address=8.8.4.4 comment="DNS GOOGLE" list=ip-private-2-local&dns

add address=1.1.1.1 comment="DNS CLOUDFLARE" list=ip-private-2-local&dns
add address=1.0.0.1 comment="DNS CLOUDFLARE" list=ip-private-2-local&dns
add address=1.1.1.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=ip-private-2-local&dns
add address=1.0.0.2 comment="DNS CLOUDFLARE Malware Blocking Only" list=ip-private-2-local&dns
add address=1.1.1.3 comment="DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=ip-private-2-local&dns
add address=1.0.0.3 comment="DNS CLOUDFLARE Malware and Adult Content Blocking Together" list=ip-private-2-local&dns

add address=9.9.9.9 comment="DNS QUAD 9" list=ip-private-2-local&dns
add address=149.112.112.112 comment="DNS QUAD 9" list=ip-private-2-local&dns
add address=9.9.9.11 comment="DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=ip-private-2-local&dns
add address=149.112.112.11 comment="DNS QUAD 9 Secured ECS: Malware blocking, DNSSEC Validation" list=ip-private-2-local&dns
add address=9.9.9.10 comment="DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=ip-private-2-local&dns
add address=149.112.112.10 comment="DNS QUAD 9 Unsecured: No Malware blocking, no DNSSEC validation" list=ip-private-2-local&dns

add address=208.67.222.222 comment="DNS OpenDNS" list=ip-private-2-local&dns
add address=208.67.220.220 comment="DNS OpenDNS" list=ip-private-2-local&dns
add address=208.67.222.123 comment="DNS OpenDNS FamilyShield" list=ip-private-2-local&dns
add address=208.67.220.123 comment="DNS OpenDNS FamilyShield" list=ip-private-2-local&dns

add address=94.140.14.14 comment="DNS AdGuard" list=ip-private-2-local&dns
add address=94.140.15.15 comment="DNS AdGuard" list=ip-private-2-local&dns
add address=94.140.14.140 comment="DNS AdGuard Non-filtering" list=ip-private-2-local&dns
add address=94.140.14.141 comment="DNS AdGuard Non-filtering" list=ip-private-2-local&dns
add address=94.140.14.15 comment="DNS AdGuard Family protection" list=ip-private-2-local&dns
add address=94.140.15.16 comment="DNS AdGuard Family protection" list=ip-private-2-local&dns

add address=77.88.8.1 comment="DNS Yandex" list=ip-private-2-local&dns
add address=77.88.8.8 comment="DNS Yandex" list=ip-private-2-local&dns



add address=211.233.84.186 comment="SNTP" list=ip-private-2-local&dns
add address=216.239.35.4 comment="SNTP" list=ip-private-2-local&dns



add address=download.mikrotik.com comment="LAINNYA" list=ip-private-2-local&dns
add address=api.telegram.org comment="LAINNYA" list=ip-private-2-local&dns
add address=licence.mikrotik.com comment="LAINNYA" list=ip-private-2-local&dns
add address=vpn.mnet.my.id comment="LAINNYA" list=ip-private-2-local&dns
add address=mnet.my.id comment="LAINNYA" list=ip-private-2-local&dns
