# sep/02/2023 00:00:00 by RouterOS 6.48.6
# software id = FFZN-PEUK
#
# model = RB750Gr3
# serial number = 8AFF0B3164C9
/interface bridge
add name=bridge-lan
/interface ethernet
set [ find default-name=ether1 ] name=ether1-IDPLAY1
set [ find default-name=ether2 ] name=ether2-BIZ
set [ find default-name=ether3 ] disabled=yes name=ether3-IDPLAY2
set [ find default-name=ether4 ] name=ether4-KALIGELANG
set [ find default-name=ether5 ] name=ether5-BALE
/interface sstp-client
add comment=MNET-VPN connect-to=103.143.170.11 disabled=no keepalive-timeout=\
    10 name=MNET-VPN-SSTP password=awazadawewe123 user=maxtkjsmk
/interface ovpn-client
add certificate=mnet.crt_0 cipher=aes256 comment=MNET-VPN connect-to=\
    103.143.170.11 disabled=yes mac-address=FE:0A:4B:9D:B0:30 name=\
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
add comment=MNET-VPN connect-to=103.143.170.11 ipsec-secret=vpn.mnet.my.id \
    keepalive-timeout=10 name=MNET-VPN-L2TP password=awazadawewe123 profile=\
    default user=maxtkjsmk
/interface pptp-client
add comment=MNET-VPN connect-to=103.143.170.11 keepalive-timeout=10 name=\
    MNET-VPN-PPTP password=awazadawewe123 profile=default user=maxtkjsmk
/queue simple
add max-limit=300M/300M name=GLOBAL-ALL-TRAFFIC target=""
add max-limit=300M/300M name=GLOBAL-KALIGELANG parent=GLOBAL-ALL-TRAFFIC \
    target=172.16.0.0/24
add max-limit=240M/280M name="[BTS] Kaligelang" parent=GLOBAL-KALIGELANG \
    target=172.16.0.4/32
add max-limit=240M/240M name=TEST parent=GLOBAL-KALIGELANG target=\
    172.16.0.99/32
add max-limit=4M/15M name="[MITRA] Firman" parent=GLOBAL-KALIGELANG priority=\
    1/1 target=172.16.0.2/32,172.16.0.15/32
add max-limit=20M/20M name="Paung H3" parent=GLOBAL-KALIGELANG priority=1/1 \
    target=172.16.0.19/32
/queue type
add kind=pfifo name=queue2 pfifo-limit=9000
add kind=pcq name=PCQ-BRUST-10M pcq-burst-rate=10M pcq-burst-threshold=3750k \
    pcq-burst-time=1m20s pcq-classifier=dst-address pcq-rate=5M
add kind=pcq name=PCQ-BRUST-10M-1Minutes pcq-burst-rate=10M \
    pcq-burst-threshold=3750k pcq-burst-time=5m20s pcq-classifier=dst-address \
    pcq-limit=500KiB pcq-rate=5M
add kind=pfifo name=default-smallest pfifo-limit=100
add kind=pcq name=PCQ-5M pcq-burst-rate=8M pcq-burst-threshold=3750k \
    pcq-burst-time=18s pcq-classifier=dst-address pcq-rate=5M
add kind=pcq name=PCQ-Upload pcq-burst-rate=5M pcq-burst-threshold=1500k \
    pcq-burst-time=20s pcq-classifier=src-address pcq-rate=2M \
    pcq-total-limit=4500KiB
add kind=pcq name=PCQ-1M pcq-burst-rate=3M pcq-burst-threshold=750k \
    pcq-burst-time=32s pcq-classifier=dst-address pcq-rate=1M
add kind=pcq name=PCQ-2M pcq-burst-rate=4M pcq-burst-threshold=1500k \
    pcq-burst-time=22s pcq-classifier=dst-address pcq-rate=2M
add kind=pcq name=PCQ-3M pcq-burst-rate=5M pcq-burst-threshold=2250k \
    pcq-burst-time=18s pcq-classifier=dst-address pcq-rate=3M
add kind=pcq name=PCQ-4M pcq-burst-rate=6M pcq-burst-threshold=3M \
    pcq-burst-time=16s pcq-classifier=dst-address pcq-rate=2M
add kind=pcq name=PCQ-512K pcq-burst-rate=1M pcq-burst-threshold=384k \
    pcq-burst-time=16s pcq-classifier=dst-address pcq-rate=512k
add kind=pcq name=PCQ-BRUST-15M-1Minutes pcq-burst-rate=15M \
    pcq-burst-threshold=7500k pcq-burst-time=2m pcq-classifier=dst-address \
    pcq-rate=10M
add kind=pcq name=PCQ-BRUST-10M-3Minutes pcq-burst-rate=10M \
    pcq-burst-threshold=3750k pcq-burst-time=8m pcq-classifier=dst-address \
    pcq-rate=5M
add kind=pcq name=PCQ-BRUST-15M-3Minutes pcq-burst-rate=15M \
    pcq-burst-threshold=6M pcq-burst-time=7m30s pcq-classifier=dst-address \
    pcq-rate=8M
add kind=pcq name=PCQ-BRUST-4M-7M-1Minutes pcq-burst-rate=7M \
    pcq-burst-threshold=3M pcq-burst-time=2m20s pcq-classifier=dst-address \
    pcq-rate=4M
/queue simple
add max-limit=3M/10M name="Agus Supriyono" parent=GLOBAL-KALIGELANG priority=\
    1/1 queue=default-small/PCQ-BRUST-10M target=172.16.0.3/32
add max-limit=4M/10M name="Voucher Firman" parent="[MITRA] Firman" priority=\
    1/1 queue=default-small/PCQ-BRUST-10M-1Minutes target=172.16.0.15/32
add max-limit=4M/15M name=Hendrik parent=GLOBAL-KALIGELANG priority=1/1 \
    queue=default/PCQ-BRUST-15M-3Minutes target=172.16.0.5/32
add max-limit=4M/10M name=Tasroni parent=GLOBAL-KALIGELANG priority=5/5 \
    queue=default/PCQ-BRUST-10M-1Minutes target=172.16.0.6/32
add max-limit=4M/10M name=Rohani parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default/PCQ-BRUST-10M-1Minutes target=172.16.0.7/32
add max-limit=4M/10M name=Kristo parent=GLOBAL-KALIGELANG priority=5/5 queue=\
    default/PCQ-BRUST-10M-1Minutes target=172.16.0.8/32
add max-limit=4M/10M name=Cokro parent=GLOBAL-KALIGELANG priority=5/5 queue=\
    default/PCQ-BRUST-10M-1Minutes target=172.16.0.9/32
add max-limit=80M/80M name=PC parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default-smallest/default-smallest target=172.16.0.10/32
add max-limit=4M/10M name=Anton parent=GLOBAL-KALIGELANG priority=5/5 queue=\
    default/PCQ-BRUST-10M-1Minutes target=172.16.0.11/32
add max-limit=4M/10M name=Puji parent=GLOBAL-KALIGELANG priority=5/5 queue=\
    default-small/PCQ-BRUST-10M-1Minutes target=172.16.0.13/32
add max-limit=4M/10M name=Rini parent=GLOBAL-KALIGELANG priority=2/2 queue=\
    default-small/PCQ-BRUST-10M-1Minutes target=172.16.0.14/32
add max-limit=4M/10M name=G26 parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default-small/PCQ-BRUST-10M-3Minutes target=172.16.0.16/32
add max-limit=4M/7M name=Banjaran parent=GLOBAL-KALIGELANG priority=1/1 \
    queue=default-small/PCQ-BRUST-4M-7M-1Minutes target=172.16.0.17/32
add max-limit=4M/10M name="Ari G20" parent=GLOBAL-KALIGELANG priority=1/1 \
    queue=default-small/PCQ-BRUST-10M-3Minutes target=172.16.0.18/32
add max-limit=4M/15M name=Ipin parent=GLOBAL-KALIGELANG priority=5/5 queue=\
    default/PCQ-BRUST-15M-1Minutes target=172.16.0.12/32
add max-limit=4M/7M name=Ricemill parent=GLOBAL-KALIGELANG priority=1/1 \
    queue=default-small/PCQ-BRUST-4M-7M-1Minutes target=172.16.0.20/32
add max-limit=4M/7M name=Yasin parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default-small/PCQ-BRUST-4M-7M-1Minutes target=172.16.0.21/32
add max-limit=4M/7M name=Yeni parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default-small/PCQ-BRUST-4M-7M-1Minutes target=172.16.0.22/32
add max-limit=4M/7M name=Kluweng parent=GLOBAL-KALIGELANG priority=1/1 queue=\
    default-small/PCQ-BRUST-4M-7M-1Minutes target=172.16.0.23/32
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface bridge port
add bridge=bridge-lan interface=ether4-KALIGELANG
add bridge=bridge-lan interface=ether5-BALE
/ip neighbor discovery-settings
set discover-interface-list=ISP
/interface list member
add interface=ether1-IDPLAY1 list=ISP
add interface=ether2-BIZ list=ISP
add interface=bridge-lan list=LAN
add interface=ether3-IDPLAY2 list=ISP
add comment=MNET-VPN interface=MNET-VPN-SSTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-L2TP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-PPTP list=MNET-VPN
add comment=MNET-VPN interface=MNET-VPN-OVPN list=MNET-VPN
add interface=ether4-KALIGELANG list=LAN
add interface=ether5-BALE list=LAN
/interface pppoe-server server
add disabled=no interface=bridge-lan one-session-per-host=yes service-name=\
    bebaswis
/ip address
add address=192.168.56.1/24 interface=bridge-lan network=192.168.56.0
/ip dhcp-client
add add-default-route=no disabled=no interface=ether1-IDPLAY1
add add-default-route=no disabled=no interface=ether2-BIZ
add add-default-route=no interface=ether3-IDPLAY2
/ip dns
set allow-remote-requests=yes cache-max-ttl=3s cache-size=4048KiB servers=\
    10.10.10.1,192.168.45.1
/ip firewall address-list
add address=0.0.0.0/8 comment=MNET-VPN list=ip-local-private-mnet
add address=10.0.0.0/8 comment=MNET-VPN list=ip-local-private-mnet
add address=100.64.0.0/10 comment=MNET-VPN list=ip-local-private-mnet
add address=127.0.0.0/8 comment=MNET-VPN list=ip-local-private-mnet
add address=169.254.0.0/16 comment=MNET-VPN list=ip-local-private-mnet
add address=172.16.0.0/12 comment=MNET-VPN list=ip-local-private-mnet
add address=192.0.0.0/24 comment=MNET-VPN list=ip-local-private-mnet
add address=192.0.2.0/24 comment=MNET-VPN list=ip-local-private-mnet
add address=192.168.0.0/16 comment=MNET-VPN list=ip-local-private-mnet
add address=198.18.0.0/15 comment=MNET-VPN list=ip-local-private-mnet
add address=198.51.100.0/24 comment=MNET-VPN list=ip-local-private-mnet
add address=203.0.113.0/24 comment=MNET-VPN list=ip-local-private-mnet
add address=224.0.0.0/3 comment=MNET-VPN list=ip-local-private-mnet
add address=255.255.255.255 comment=MNET-VPN list=ip-local-private-mnet
add address=240.0.0.0/4 comment=MNET-VPN list=ip-local-private-mnet
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
add address=172.16.0.99 disabled=yes list=ip-local-dns-to-biznet
/ip firewall mangle
add action=mark-routing chain=prerouting comment=MNET-VPN dst-address-list=\
    z-list-ip-speedtest dst-port=80,443 new-routing-mark=MNET passthrough=no \
    protocol=tcp src-address-list=ip-local-private-mnet
/ip firewall nat
add action=dst-nat chain=dstnat comment=MNET-VPN dst-port=53,5353,853 \
    protocol=udp src-address-list=ip-local-dns-to-vpn to-addresses=\
    10.123.223.1 to-ports=53
add action=dst-nat chain=dstnat comment=BIZNET dst-port=53,5353,853 protocol=\
    udp src-address-list=ip-local-dns-to-biznet to-addresses=10.10.10.1 \
    to-ports=53
add action=dst-nat chain=dstnat comment=MNET-VPN dst-port=53,5353,853 \
    protocol=tcp src-address-list=ip-local-dns-to-vpn to-addresses=\
    10.123.223.1
add action=dst-nat chain=dstnat comment="remote idplay 1" dst-port=8002 \
    protocol=tcp src-address=10.123.223.1 to-addresses=192.168.45.1 to-ports=\
    80
add action=dst-nat chain=dstnat comment="remote idplay 2" dst-port=8004 \
    protocol=tcp src-address=10.123.223.1 to-addresses=10.0.0.10 to-ports=80
add action=dst-nat chain=dstnat comment="remote ubi smk" dst-port=8005 \
    protocol=tcp src-address=10.123.223.1 to-addresses=172.16.16.2 to-ports=\
    80
add action=dst-nat chain=dstnat comment="remote ubi kaligelang" dst-port=8006 \
    protocol=tcp src-address=10.123.223.1 to-addresses=192.168.45.3 to-ports=\
    8291
add action=dst-nat chain=dstnat comment="remote rb bale to vpn" dst-port=8912 \
    protocol=tcp src-address=10.123.223.1 to-addresses=192.168.45.3 to-ports=\
    8291
add action=masquerade chain=srcnat comment=INTERNET out-interface-list=ISP
add action=masquerade chain=srcnat comment=MNET-NAT-VPN out-interface-list=\
    MNET-VPN
add action=masquerade chain=srcnat comment=GLOBAL
/ip route
add comment=MNET-VPN distance=1 gateway=10.123.223.1 routing-mark=MNET
add distance=1 gateway=10.10.10.1 routing-mark=isp2
add distance=1 gateway=192.168.45.1 routing-mark=isp1
add comment=isp1 distance=1 gateway=192.168.45.1
add comment=isp2 distance=3 gateway=10.10.10.1
add comment="CEK ISP1" distance=1 dst-address=94.140.14.15/32 gateway=\
    192.168.45.1
add comment="CEK ISP2" distance=1 dst-address=94.140.15.16/32 gateway=\
    10.10.10.1
add comment=iisp1 distance=2 dst-address=103.143.170.11/32 gateway=\
    192.168.45.1
add comment=iisp2 distance=3 dst-address=103.143.170.11/32 gateway=10.10.10.1
add comment="CEK ISP2" distance=1 dst-address=149.112.112.11/32 gateway=\
    10.10.10.1
add comment="CEK ISP1" distance=1 dst-address=149.112.112.112/32 gateway=\
    192.168.45.1
/ip route rule
add comment=isp3 disabled=yes src-address=172.16.0.99/32 table=isp2
add comment=isp1 src-address=172.16.0.2/32 table=isp1
/ppp secret
add comment="[MITRA] Firman" name=02000 password=02000 profile=PPPOE \
    remote-address=172.16.0.2 service=pppoe
add comment="Agus Supriyono" name=01820 password=01820 profile=PPPOE \
    remote-address=172.16.0.3 service=pppoe
add comment=Hendrik name=01102 password=01102 profile=PPPOE remote-address=\
    172.16.0.5 service=pppoe
add local-address=172.16.0.1 name=pc password=pc profile=PPPOE \
    remote-address=172.16.0.10 service=pppoe
add comment=Tasroni name=02001 password=02001 profile=PPPOE remote-address=\
    172.16.0.6 service=pppoe
add comment=Rohani name=02002 password=02002 profile=PPPOE remote-address=\
    172.16.0.7 service=pppoe
add comment=Kristo name=02003 password=02003 profile=PPPOE remote-address=\
    172.16.0.8 service=pppoe
add comment=Cokro name=02004 password=02004 profile=PPPOE remote-address=\
    172.16.0.9 service=pppoe
add comment="[BTS] Kaligelang" name=01101 password=01101 profile=PPPOE \
    remote-address=172.16.0.4 service=pppoe
add comment=Anton name=01103 password=01103 profile=PPPOE remote-address=\
    172.16.0.11 service=pppoe
add comment=Ipin name=02005 password=02005 profile=PPPOE remote-address=\
    172.16.0.12 service=pppoe
add comment=Puji name=02006 password=02006 profile=PPPOE remote-address=\
    172.16.0.13 service=pppoe
add comment=Rini name=02007 password=02007 profile=PPPOE remote-address=\
    172.16.0.14 service=pppoe
add comment="Voucher Firman" name=52001 password=52001 profile=PPPOE \
    remote-address=172.16.0.15 service=pppoe
add comment=Test name=test password=test profile=PPPOE remote-address=\
    172.16.0.99 service=pppoe
add comment=G26 name=01726 password=01726 profile=PPPOE remote-address=\
    172.16.0.16 service=pppoe
add comment=BANJARAN name=03000 password=03000 profile=PPPOE remote-address=\
    172.16.0.17 service=pppoe
add comment=Cinane name=011020 password=011020 profile=PPPOE remote-address=\
    172.16.0.18 service=pppoe
add comment=Paung name=01803 password=01803 profile=PPPOE remote-address=\
    172.16.0.19 service=pppoe
add comment="Ripin Ricemill" name=02008 password=02008 profile=PPPOE \
    remote-address=172.16.0.20 service=pppoe
add comment=Yasin name=02009 password=02009 profile=PPPOE remote-address=\
    172.16.0.21 service=pppoe
add comment=Yeni name=03001 password=03001 profile=PPPOE remote-address=\
    172.16.0.22 service=pppoe
add comment=Yasin name=02010 password=02010 profile=PPPOE remote-address=\
    172.16.0.23 service=pppoe
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
/tool graphing interface
add interface=ether1-IDPLAY1
add interface=ether2-BIZ
add interface=ether3-IDPLAY2
add interface=ether4-KALIGELANG
add interface=ether5-BALE
/tool graphing resource
add
/tool mac-server
set allowed-interface-list=LAN
/tool netwatch
add comment=" ISP1 ID CEK" down-script="/ip route disable [find comment=\"isp1\
    \"]\r\
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
    \n:delay 500ms;\r\
    \nlog warning (\"isp1 off\")" host=94.140.14.15 interval=10s up-script="/i\
    p route enable [find comment=\"isp1\"]\r\
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
    \nlog warning (\"isp1 on\")"
add comment=" ISP2 BIZ CEK" down-script="/ip route disable [find comment=\"isp\
    2\"]\r\
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
    \n:delay 500ms;\r\
    \nlog warning (\"isp2 off\")" host=149.112.112.11 interval=10s up-script="\
    /ip route enable [find comment=\"isp2\"]\r\
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
    \nlog warning (\"isp2 on\")"
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
