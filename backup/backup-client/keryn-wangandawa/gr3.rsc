# aug/05/2023 12:00:00 by RouterOS 6.47.9
# software id = UDA9-EYCP
#
# model = RB750Gr3
# serial number = CC210E668F2C
/interface bridge
add name=bridge-lan
/interface ethernet
set [ find default-name=ether1 ] name=ether1-frist
set [ find default-name=ether2 ] name=ether2-idplay-bisnis
set [ find default-name=ether3 ] name=ether3-idplay-biasa
set [ find default-name=ether4 ] name=ether4-client
set [ find default-name=ether5 ] name=ether5-client
/interface list
add name=ISP
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/ip pool
add name=dhcp_pool0 ranges=192.168.9.2-192.168.9.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge-lan name=dhcp1
/interface bridge port
add bridge=bridge-lan interface=ether4-client
add bridge=bridge-lan interface=ether5-client
/interface list member
add interface=ether1-frist list=ISP
add interface=ether2-idplay-bisnis list=ISP
add interface=ether3-idplay-biasa list=ISP
/ip address
add address=192.168.9.1/24 interface=bridge-lan network=192.168.9.0
/ip dhcp-client
add disabled=no interface=ether1-frist
add default-route-distance=2 disabled=no interface=ether2-idplay-bisnis
add default-route-distance=3 disabled=no interface=ether3-idplay-biasa
/ip dhcp-server network
add address=192.168.9.0/24 dns-server=192.168.1.1,8.8.8.8,8.8.4.4 gateway=\
    192.168.9.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d cache-size=4048KiB
/ip firewall address-list
add address=bypass.mnet.my.id list=ip-local-private
add address=0.0.0.0/8 comment=ip-local-private list=ip-local-private
add address=10.0.0.0/8 comment=ip-local-private list=ip-local-private
add address=100.64.0.0/10 comment=ip-local-private list=ip-local-private
add address=127.0.0.0/8 comment=ip-local-private list=ip-local-private
add address=169.254.0.0/16 comment=ip-local-private list=ip-local-private
add address=172.16.0.0/12 comment=ip-local-private list=ip-local-private
add address=192.0.0.0/24 comment=ip-local-private list=ip-local-private
add address=192.0.2.0/24 comment=ip-local-private list=ip-local-private
add address=192.168.0.0/16 comment=ip-local-private list=ip-local-private
add address=198.18.0.0/15 comment=ip-local-private list=ip-local-private
add address=198.51.100.0/24 comment=ip-local-private list=ip-local-private
add address=203.0.113.0/24 comment=ip-local-private list=ip-local-private
add address=224.0.0.0/3 comment=ip-local-private list=ip-local-private
add address=255.255.255.255 comment=ip-local-private list=ip-local-private
add address=240.0.0.0/4 comment=ip-local-private list=ip-local-private
add address=3.33.221.48 list=z-list-raw-wa
add address=3.33.252.61 list=z-list-raw-wa
add address=15.197.206.217 list=z-list-raw-wa
add address=15.197.210.208 list=z-list-raw-wa
add address=31.13.64.60/31 list=z-list-raw-wa
add address=31.13.65.49 list=z-list-raw-wa
add address=31.13.65.50 list=z-list-raw-wa
add address=31.13.66.51 list=z-list-raw-wa
add address=31.13.66.56 list=z-list-raw-wa
add address=31.13.67.52/31 list=z-list-raw-wa
add address=31.13.68.60/31 list=z-list-raw-wa
add address=31.13.69.60/31 list=z-list-raw-wa
add address=31.13.70.49 list=z-list-raw-wa
add address=31.13.70.50 list=z-list-raw-wa
add address=31.13.71.49 list=z-list-raw-wa
add address=31.13.71.50 list=z-list-raw-wa
add address=31.13.72.48 list=z-list-raw-wa
add address=31.13.72.52 list=z-list-raw-wa
add address=31.13.73.52/31 list=z-list-raw-wa
add address=31.13.74.52/31 list=z-list-raw-wa
add address=31.13.75.60/31 list=z-list-raw-wa
add address=31.13.76.60/31 list=z-list-raw-wa
add address=31.13.77.60/31 list=z-list-raw-wa
add address=31.13.78.60/31 list=z-list-raw-wa
add address=31.13.79.53 list=z-list-raw-wa
add address=31.13.79.54 list=z-list-raw-wa
add address=31.13.80.48 list=z-list-raw-wa
add address=31.13.80.53 list=z-list-raw-wa
add address=31.13.81.48 list=z-list-raw-wa
add address=31.13.81.53 list=z-list-raw-wa
add address=31.13.82.51 list=z-list-raw-wa
add address=31.13.82.55 list=z-list-raw-wa
add address=31.13.83.49 list=z-list-raw-wa
add address=31.13.83.51 list=z-list-raw-wa
add address=31.13.84.49 list=z-list-raw-wa
add address=31.13.84.51 list=z-list-raw-wa
add address=31.13.85.49 list=z-list-raw-wa
add address=31.13.85.51 list=z-list-raw-wa
add address=31.13.86.49 list=z-list-raw-wa
add address=31.13.86.51 list=z-list-raw-wa
add address=31.13.87.48 list=z-list-raw-wa
add address=31.13.87.51 list=z-list-raw-wa
add address=31.13.88.60/31 list=z-list-raw-wa
add address=31.13.89.53 list=z-list-raw-wa
add address=31.13.89.54 list=z-list-raw-wa
add address=31.13.90.60/31 list=z-list-raw-wa
add address=31.13.91.60/31 list=z-list-raw-wa
add address=31.13.92.48 list=z-list-raw-wa
add address=31.13.92.52 list=z-list-raw-wa
add address=31.13.93.53 list=z-list-raw-wa
add address=31.13.93.54 list=z-list-raw-wa
add address=31.13.94.52 list=z-list-raw-wa
add address=31.13.94.54 list=z-list-raw-wa
add address=31.13.95.60/31 list=z-list-raw-wa
add address=34.192.181.12 list=z-list-raw-wa
add address=34.193.38.112 list=z-list-raw-wa
add address=34.194.71.217 list=z-list-raw-wa
add address=34.194.255.230 list=z-list-raw-wa
add address=69.171.250.60/31 list=z-list-raw-wa
add address=102.132.96.54/31 list=z-list-raw-wa
add address=102.132.97.54/31 list=z-list-raw-wa
add address=102.132.98.60/31 list=z-list-raw-wa
add address=102.132.99.60/31 list=z-list-raw-wa
add address=102.132.100.60/31 list=z-list-raw-wa
add address=102.132.101.60/31 list=z-list-raw-wa
add address=102.132.102.60/31 list=z-list-raw-wa
add address=102.132.103.60/31 list=z-list-raw-wa
add address=102.132.104.60/31 list=z-list-raw-wa
add address=102.132.105.60/31 list=z-list-raw-wa
add address=102.132.106.60/31 list=z-list-raw-wa
add address=102.132.107.60/31 list=z-list-raw-wa
add address=102.132.108.60/31 list=z-list-raw-wa
add address=102.132.109.60/31 list=z-list-raw-wa
add address=102.132.110.60/31 list=z-list-raw-wa
add address=102.132.111.60/31 list=z-list-raw-wa
add address=157.240.0.60/31 list=z-list-raw-wa
add address=157.240.1.60/31 list=z-list-raw-wa
add address=157.240.2.53 list=z-list-raw-wa
add address=157.240.2.54 list=z-list-raw-wa
add address=157.240.3.54/31 list=z-list-raw-wa
add address=157.240.4.60/31 list=z-list-raw-wa
add address=157.240.5.60/31 list=z-list-raw-wa
add address=157.240.6.53 list=z-list-raw-wa
add address=157.240.6.54 list=z-list-raw-wa
add address=157.240.7.53 list=z-list-raw-wa
add address=157.240.7.54 list=z-list-raw-wa
add address=157.240.8.53 list=z-list-raw-wa
add address=157.240.8.54 list=z-list-raw-wa
add address=157.240.9.53 list=z-list-raw-wa
add address=157.240.9.54 list=z-list-raw-wa
add address=157.240.10.53 list=z-list-raw-wa
add address=157.240.10.54 list=z-list-raw-wa
add address=157.240.11.53 list=z-list-raw-wa
add address=157.240.11.54 list=z-list-raw-wa
add address=157.240.12.53 list=z-list-raw-wa
add address=157.240.12.54 list=z-list-raw-wa
add address=157.240.13.54/31 list=z-list-raw-wa
add address=157.240.14.52/31 list=z-list-raw-wa
add address=157.240.15.60/31 list=z-list-raw-wa
add address=157.240.16.52/31 list=z-list-raw-wa
add address=157.240.17.60/31 list=z-list-raw-wa
add address=157.240.18.52/31 list=z-list-raw-wa
add address=157.240.19.53 list=z-list-raw-wa
add address=157.240.19.54 list=z-list-raw-wa
add address=157.240.20.52/31 list=z-list-raw-wa
add address=157.240.21.52/31 list=z-list-raw-wa
add address=157.240.22.53 list=z-list-raw-wa
add address=157.240.22.54 list=z-list-raw-wa
add address=157.240.23.53 list=z-list-raw-wa
add address=157.240.23.54 list=z-list-raw-wa
add address=157.240.24.60/31 list=z-list-raw-wa
add address=157.240.25.60/31 list=z-list-raw-wa
add address=157.240.26.54/31 list=z-list-raw-wa
add address=157.240.27.54/31 list=z-list-raw-wa
add address=157.240.28.51 list=z-list-raw-wa
add address=157.240.28.55 list=z-list-raw-wa
add address=157.240.29.60/31 list=z-list-raw-wa
add address=157.240.30.54/31 list=z-list-raw-wa
add address=157.240.31.60/31 list=z-list-raw-wa
add address=157.240.192.52 list=z-list-raw-wa
add address=157.240.192.55 list=z-list-raw-wa
add address=157.240.193.60/31 list=z-list-raw-wa
add address=157.240.194.54/31 list=z-list-raw-wa
add address=157.240.195.54 list=z-list-raw-wa
add address=157.240.195.56 list=z-list-raw-wa
add address=157.240.196.60/31 list=z-list-raw-wa
add address=157.240.197.60/31 list=z-list-raw-wa
add address=157.240.198.60/31 list=z-list-raw-wa
add address=157.240.199.60/31 list=z-list-raw-wa
add address=157.240.200.60/31 list=z-list-raw-wa
add address=157.240.201.60/31 list=z-list-raw-wa
add address=157.240.202.60/31 list=z-list-raw-wa
add address=157.240.203.60/31 list=z-list-raw-wa
add address=157.240.204.60/31 list=z-list-raw-wa
add address=157.240.205.60/31 list=z-list-raw-wa
add address=157.240.206.60/31 list=z-list-raw-wa
add address=157.240.207.60/31 list=z-list-raw-wa
add address=157.240.208.60/31 list=z-list-raw-wa
add address=157.240.209.60/31 list=z-list-raw-wa
add address=157.240.210.60/31 list=z-list-raw-wa
add address=157.240.211.60/31 list=z-list-raw-wa
add address=157.240.212.60/31 list=z-list-raw-wa
add address=157.240.213.60/31 list=z-list-raw-wa
add address=157.240.214.60/31 list=z-list-raw-wa
add address=157.240.215.60/31 list=z-list-raw-wa
add address=157.240.216.60/31 list=z-list-raw-wa
add address=157.240.217.60/31 list=z-list-raw-wa
add address=157.240.218.60/31 list=z-list-raw-wa
add address=157.240.219.60/31 list=z-list-raw-wa
add address=157.240.220.60/31 list=z-list-raw-wa
add address=157.240.221.60/31 list=z-list-raw-wa
add address=157.240.222.60/31 list=z-list-raw-wa
add address=157.240.223.60/31 list=z-list-raw-wa
add address=157.240.224.60/31 list=z-list-raw-wa
add address=157.240.225.60/31 list=z-list-raw-wa
add address=157.240.226.60/31 list=z-list-raw-wa
add address=157.240.227.60/31 list=z-list-raw-wa
add address=157.240.228.60/31 list=z-list-raw-wa
add address=157.240.229.60/31 list=z-list-raw-wa
add address=157.240.231.60/31 list=z-list-raw-wa
add address=157.240.232.60/31 list=z-list-raw-wa
add address=157.240.233.60/31 list=z-list-raw-wa
add address=157.240.234.60/31 list=z-list-raw-wa
add address=157.240.235.60/31 list=z-list-raw-wa
add address=157.240.236.60/31 list=z-list-raw-wa
add address=157.240.237.60/31 list=z-list-raw-wa
add address=157.240.238.60/31 list=z-list-raw-wa
add address=157.240.239.60/31 list=z-list-raw-wa
add address=157.240.240.60/31 list=z-list-raw-wa
add address=157.240.241.60/31 list=z-list-raw-wa
add address=157.240.242.60/31 list=z-list-raw-wa
add address=157.240.243.60/31 list=z-list-raw-wa
add address=157.240.244.60/31 list=z-list-raw-wa
add address=157.240.245.60/31 list=z-list-raw-wa
add address=157.240.246.60/31 list=z-list-raw-wa
add address=157.240.247.60/31 list=z-list-raw-wa
add address=157.240.248.60/31 list=z-list-raw-wa
add address=157.240.249.60/31 list=z-list-raw-wa
add address=157.240.250.60/31 list=z-list-raw-wa
add address=157.240.251.60/31 list=z-list-raw-wa
add address=157.240.252.60/31 list=z-list-raw-wa
add address=157.240.253.60/31 list=z-list-raw-wa
add address=157.240.254.60/31 list=z-list-raw-wa
add address=163.70.128.60/31 list=z-list-raw-wa
add address=163.70.129.60/31 list=z-list-raw-wa
add address=163.70.130.60/31 list=z-list-raw-wa
add address=163.70.131.60/31 list=z-list-raw-wa
add address=163.70.132.60/31 list=z-list-raw-wa
add address=163.70.133.60/31 list=z-list-raw-wa
add address=163.70.134.60/31 list=z-list-raw-wa
add address=163.70.135.60/31 list=z-list-raw-wa
add address=163.70.136.60/31 list=z-list-raw-wa
add address=163.70.137.60/31 list=z-list-raw-wa
add address=163.70.138.60/31 list=z-list-raw-wa
add address=163.70.139.60/31 list=z-list-raw-wa
add address=163.70.140.60/31 list=z-list-raw-wa
add address=163.70.141.60/31 list=z-list-raw-wa
add address=163.70.142.60/31 list=z-list-raw-wa
add address=163.70.143.60/31 list=z-list-raw-wa
add address=163.70.144.60/31 list=z-list-raw-wa
add address=163.70.145.60/31 list=z-list-raw-wa
add address=163.70.146.60/31 list=z-list-raw-wa
add address=163.70.147.60/31 list=z-list-raw-wa
add address=163.70.148.60/31 list=z-list-raw-wa
add address=163.70.149.60/31 list=z-list-raw-wa
add address=163.70.150.60/31 list=z-list-raw-wa
add address=163.70.151.60/31 list=z-list-raw-wa
add address=163.70.152.60/31 list=z-list-raw-wa
add address=163.70.153.60/31 list=z-list-raw-wa
add address=163.70.154.60/31 list=z-list-raw-wa
add address=163.70.155.60/31 list=z-list-raw-wa
add address=163.70.156.60/31 list=z-list-raw-wa
add address=163.70.157.60/31 list=z-list-raw-wa
add address=163.70.158.60/31 list=z-list-raw-wa
add address=163.70.159.60/31 list=z-list-raw-wa
add address=179.60.192.49 list=z-list-raw-wa
add address=179.60.192.51 list=z-list-raw-wa
add address=179.60.193.60/31 list=z-list-raw-wa
add address=179.60.194.53 list=z-list-raw-wa
add address=179.60.194.54 list=z-list-raw-wa
add address=179.60.195.49 list=z-list-raw-wa
add address=179.60.195.51 list=z-list-raw-wa
add address=185.60.216.53 list=z-list-raw-wa
add address=185.60.216.54 list=z-list-raw-wa
add address=185.60.217.53 list=z-list-raw-wa
add address=185.60.217.54 list=z-list-raw-wa
add address=185.60.218.53 list=z-list-raw-wa
add address=185.60.218.54 list=z-list-raw-wa
add address=185.60.219.60/31 list=z-list-raw-wa
/ip firewall mangle
add action=mark-routing chain=prerouting disabled=yes dst-address-list=\
    !ip-local-private dst-port=8080 new-routing-mark=isp1 passthrough=no \
    protocol=tcp
add action=mark-routing chain=prerouting comment=wa disabled=yes \
    dst-address-list=z-list-raw-wa new-routing-mark=isp2 passthrough=no \
    src-address=192.168.9.0/24
add action=mark-routing chain=prerouting comment=youtube disabled=yes \
    dst-address-list=z-list-raw-youtube new-routing-mark=isp2 passthrough=no \
    src-address=192.168.9.0/24
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    z-list-raw-tiktok new-routing-mark=isp2 passthrough=no src-address=\
    192.168.9.0/24
add action=mark-routing chain=prerouting comment=isp2 dst-address-list=\
    z-list-raw-snack new-routing-mark=isp2 passthrough=no src-address=\
    192.168.9.0/24
add action=mark-routing chain=prerouting comment=isp3 dst-port=\
    !21-23,53,80-81,443,853,5353,8000,8008,8080,8081,8090,8443,8888 \
    new-routing-mark=isp3 passthrough=no protocol=tcp src-address=\
    192.168.9.0/24
add action=mark-routing chain=prerouting comment=isp3 dst-port=\
    !21-23,53,80-81,443,853,5353,8000,8008,8080,8081,8090,8443,8888 \
    new-routing-mark=isp3 passthrough=no protocol=udp src-address=\
    192.168.9.0/24
add action=mark-routing chain=prerouting new-routing-mark=isp passthrough=no \
    src-address=192.168.9.0/24
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1-frist
add action=masquerade chain=srcnat out-interface=ether2-idplay-bisnis
add action=masquerade chain=srcnat out-interface=ether3-idplay-biasa
/ip firewall raw
add action=add-dst-to-address-list address-list=z-list-raw-wa \
    address-list-timeout=none-dynamic chain=prerouting comment=wa content=\
    .whatsapp.com dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-wa \
    address-list-timeout=none-dynamic chain=prerouting content=.whatsapp.net \
    dst-address-list=!ip-local-private src-address=192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-youtube \
    address-list-timeout=none-dynamic chain=prerouting comment=yt content=\
    .youtube.com dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-youtube \
    address-list-timeout=none-dynamic chain=prerouting content=\
    .googlevideo.com dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-youtube \
    address-list-timeout=none-dynamic chain=prerouting content=.ytimg.com \
    dst-address-list=!ip-local-private src-address=192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-tiktok \
    address-list-timeout=none-dynamic chain=prerouting comment=tiktok \
    content=.tiktokv.com dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktokcdn.com \
    dst-address-list=!ip-local-private src-address=192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-tiktok \
    address-list-timeout=none-dynamic chain=prerouting content=.tiktok.com \
    dst-address-list=!ip-local-private src-address=192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-snack \
    address-list-timeout=none-dynamic chain=prerouting comment=snak content=\
    .snackvideo.in dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-snack \
    address-list-timeout=none-dynamic chain=prerouting content=\
    .snackvideo.com dst-address-list=!ip-local-private src-address=\
    192.168.9.0/24
add action=add-dst-to-address-list address-list=z-list-raw-snack \
    address-list-timeout=none-dynamic chain=prerouting content=.myqcloud.com \
    dst-address-list=!ip-local-private src-address=192.168.9.0/24
/ip route
add comment="isp1 manual" distance=1 gateway=192.168.100.1 routing-mark=isp1
add comment="isp2 manual" distance=1 gateway=10.0.0.10 routing-mark=isp2
add comment="isp3 manual" distance=1 gateway=10.0.1.10 routing-mark=isp3
add comment=isp1 distance=1 gateway=192.168.100.1 routing-mark=isp
add comment=isp2 distance=2 gateway=10.0.0.10 routing-mark=isp
add comment=isp3 distance=3 gateway=10.0.1.10 routing-mark=isp
add comment="isp2 cek" distance=1 dst-address=8.8.4.4/32 gateway=10.0.0.10
add comment="isp1 cek" distance=1 dst-address=9.9.9.11/32 gateway=\
    192.168.100.1
add comment="isp3 cek" distance=1 dst-address=149.112.112.10/32 gateway=\
    10.0.1.10
add comment="isp2 cek" distance=1 dst-address=149.112.112.11/32 gateway=\
    10.0.0.10
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=gr3
/system ntp client
set enabled=yes primary-ntp=103.123.108.222 secondary-ntp=162.159.200.1
/system scheduler
add interval=1d name="auto reboot" on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/29/2022 start-time=03:00:00
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
    \n:local ftppath \"/backup-client/keryn-wangandawa/\"\r\
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
/tool graphing interface
add
/tool netwatch
add comment="  isp1 cek" down-script="/ip route disable [find comment=\"isp1\"\
    ]\r\
    \n/ip firewall nat disable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp1\"]" host=9.9.9.11 \
    interval=10s up-script="/ip route enable [find comment=\"isp1\"]\r\
    \n/ip firewall nat enable [find comment=\"isp1\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp1\"]"
add comment="  isp2 cek" down-script="/ip route disable [find comment=\"isp2\"\
    ]\r\
    \n/ip firewall nat disable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp2\"]" host=8.8.4.4 \
    interval=10s up-script="/ip route enable [find comment=\"isp2\"]\r\
    \n/ip firewall nat enable [find comment=\"isp2\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp2\"]"
add comment="  isp3 cek" down-script="/ip route disable [find comment=\"isp3\"\
    ]\r\
    \n/ip firewall nat disable [find comment=\"isp3\"]\r\
    \n/ip firewall mangle disable [find comment=\"isp3\"]" host=\
    149.112.112.10 interval=10s up-script="/ip route enable [find comment=\"is\
    p3\"]\r\
    \n/ip firewall nat enable [find comment=\"isp3\"]\r\
    \n/ip firewall mangle enable [find comment=\"isp3\"]"
/tool romon
set enabled=yes secrets=123
