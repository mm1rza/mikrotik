# jun/21/2023 12:00:00 by RouterOS 6.49.2
# software id = WH48-C0MY
#
# model = RBD52G-5HacD2HnD
# serial number = BEEB0B0B83CD
/interface bridge
add name=LAN-CLIENT
/interface ethernet
set [ find default-name=ether2 ] disabled=yes
/interface pppoe-client
add add-default-route=yes disabled=no interface=LAN-CLIENT name=PPPOE-ISP \
    password=001bale@mnet.com use-peer-dns=yes user=001bale@mnet.com
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-eC \
    country=no_country_set frequency=2442 frequency-mode=superchannel \
    mac-address=C1:AD:34:08:4D:17 mode=ap-bridge ssid="Server Bale" \
    tx-power-mode=all-rates-fixed
set [ find default-name=wlan2 ] band=5ghz-n/ac channel-width=20/40/80mhz-XXXX \
    country=no_country_set frequency=5745 frequency-mode=manual-txpower \
    mac-address=C4:12:F5:66:85:EF radio-name="xiaomi a4" scan-list=5745 ssid=\
    "BUMDES SS SUNGAPAN" station-roaming=enabled wmm-support=enabled
/interface pptp-client
add connect-to=103.133.222.110 name=pptp-monitoring password=test2 user=test2
/interface list
add exclude=dynamic name=ISP
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk \
    supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk,wpa-eap,wpa2-eap eap-methods=peap \
    management-protection=allowed mode=dynamic-keys mschapv2-password=\
    Awasdong123 mschapv2-username=142278110183@wifi.id name=seamless \
    radius-mac-accounting=yes radius-mac-authentication=yes \
    supplicant-identity=142278110183@wifi.id tls-mode=dont-verify-certificate \
    wpa-pre-shared-key=awseaAweawe wpa2-pre-shared-key=awseaAweawe
/ip pool
add name=POOL_1M ranges=192.168.201.2-192.168.201.254
add name=POOL_2M ranges=192.168.202.2-192.168.202.254
add name=POOL_3M ranges=192.168.203.2-192.168.203.254
add name=POOL_4M ranges=192.168.204.2-192.168.204.254
add name=POOL_5M ranges=192.168.205.2-192.168.205.254
add name=POOL_ISOLIR ranges=192.168.200.2-192.168.200.254
/port
set 0 baud-rate=9600 data-bits=8 flow-control=none name=usb1 parity=none \
    stop-bits=1
/ppp profile
add name=ya
add dns-server=1.1.1.1 local-address=192.168.222.1 name=QUNLIMITED only-one=\
    yes remote-address=192.168.222.2
/queue simple
add disabled=yes max-limit=100M/100M name="z ALL TRAFICK" priority=5/5 \
    target=192.168.200.0/24
add max-limit=100M/100M name=GLOBAL priority=5/5 target=192.168.0.0/16
add disabled=yes limit-at=2M/2M max-limit=2M/2M name=Paud parent=\
    "z ALL TRAFICK" target=192.168.200.11/32
add disabled=yes limit-at=512k/512k max-limit=1M/1M name=Intan parent=\
    "z ALL TRAFICK" target=192.168.200.4/32
add disabled=yes max-limit=1M/1M name=Ayu parent="z ALL TRAFICK" target=\
    192.168.200.12/32
add disabled=yes max-limit=2M/2M name=Andi parent="z ALL TRAFICK" target=\
    192.168.200.5/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name="Mba Enah" parent=\
    "z ALL TRAFICK" target=192.168.200.8/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Minar parent=\
    "z ALL TRAFICK" target=192.168.200.9/32
add disabled=yes limit-at=512k/512k max-limit=2M/2M name=Nugrroho parent=\
    "z ALL TRAFICK" target=192.168.200.7/32
add disabled=yes limit-at=512k/1M max-limit=3M/3M name=Komarudin parent=\
    "z ALL TRAFICK" target=192.168.200.13/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Tuprihati parent=\
    "z ALL TRAFICK" target=192.168.200.14/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name=Suranto parent=\
    "z ALL TRAFICK" target=192.168.200.15/32
add comment=" BLN bts" disabled=yes max-limit=512k/512k name="Mba Lastri" \
    parent="z ALL TRAFICK" target=192.168.200.16/32
add disabled=yes max-limit=1M/1M name=Vera parent="z ALL TRAFICK" target=\
    192.168.200.17/32
add disabled=yes limit-at=512k/1M max-limit=1M/2M name=Indah parent=\
    "z ALL TRAFICK" target=192.168.200.19/32
add comment="PARAREL BELA" disabled=yes limit-at=512k/1M max-limit=1M/2M \
    name=Selly parent="z ALL TRAFICK" target=192.168.200.20/32
add disabled=yes limit-at=512k/1M max-limit=3M/3M name=Fitri parent=\
    "z ALL TRAFICK" target=192.168.200.21/32
add disabled=yes limit-at=512k/1M max-limit=1M/2M name="Mba Jati" parent=\
    "z ALL TRAFICK" target=192.168.200.26/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Mitro parent=\
    "z ALL TRAFICK" target=192.168.200.22/32
add disabled=yes max-limit=1M/2M name=Puji parent="z ALL TRAFICK" target=\
    192.168.200.23/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Dessy parent=\
    "z ALL TRAFICK" target=192.168.200.25/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Hirin parent=\
    "z ALL TRAFICK" target=192.168.200.28/32
add comment="PARAREL TASARI" disabled=yes limit-at=512k/1M max-limit=1M/1M \
    name="Mba Yuni" parent="z ALL TRAFICK" target=192.168.200.29/32
add max-limit=5M/5M name="test tt" parent="z ALL TRAFICK" target=\
    192.168.200.32/32
add disabled=yes limit-at=512k/0 max-limit=2M/2M name="sapa yah" parent=\
    "z ALL TRAFICK" target=192.168.200.34/32
add disabled=yes limit-at=512k/1M max-limit=3M/3M name=Amarin parent=\
    "z ALL TRAFICK" target=192.168.200.36/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Cipto parent=\
    "z ALL TRAFICK" target=192.168.200.38/32
add comment=BTS disabled=yes max-limit=1M/1M name="Aji Chicken" parent=\
    "z ALL TRAFICK" target=192.168.200.40/32
add disabled=yes limit-at=512k/512k max-limit=1M/1M name=Anggi parent=\
    "z ALL TRAFICK" target=192.168.200.41/32
add burst-time=2s/2s disabled=yes max-limit=1M/1M name=Makmor parent=\
    "z ALL TRAFICK" target=192.168.200.42/32
add burst-time=38s/28s disabled=yes max-limit=3M/3M name=Dolos parent=\
    "z ALL TRAFICK" target=192.168.200.43/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name=Hendro parent=\
    "z ALL TRAFICK" target=192.168.200.44/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name="Rohadi Do Eng" \
    parent="z ALL TRAFICK" target=192.168.200.45/32
add disabled=yes limit-at=512k/128k max-limit=1M/1M name=Subejo parent=\
    "z ALL TRAFICK" target=192.168.200.46/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Ana parent=\
    "z ALL TRAFICK" target=192.168.200.47/32
add comment="BTS 2 RUMAH" disabled=yes limit-at=512k/0 max-limit=1M/1M name=\
    Raun parent="z ALL TRAFICK" target=192.168.200.48/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Yoan parent=\
    "z ALL TRAFICK" target=192.168.200.49/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Nur Ridwan" parent=\
    "z ALL TRAFICK" target=192.168.200.51/32
add disabled=yes max-limit=64k/64k name="Ayu Yudi" parent="z ALL TRAFICK" \
    target=192.168.200.50/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Bambang Polisi" \
    parent="z ALL TRAFICK" target=192.168.200.52/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Amah Rizki" parent=\
    "z ALL TRAFICK" target=192.168.200.53/32
add comment="BTS 2 RUMAH" disabled=yes limit-at=512k/1M max-limit=2M/2M name=\
    Hartari parent="z ALL TRAFICK" target=192.168.200.55/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Mba Tati" parent=\
    "z ALL TRAFICK" target=192.168.200.54/32
add burst-time=12s/12s comment=SXT disabled=yes limit-at=2M/2M max-limit=\
    3M/3M name=Leni parent="z ALL TRAFICK" target=192.168.200.57/32
add disabled=yes max-limit=1M/1M name=Tang parent="z ALL TRAFICK" target=\
    192.168.200.62/32
add disabled=yes limit-at=512k/1M max-limit=3M/3M name="Dwi Sasongko" parent=\
    "z ALL TRAFICK" target=192.168.200.63/32
add limit-at=512k/1M max-limit=1M/1M name=Legowo parent="z ALL TRAFICK" \
    target=192.168.200.129/32
add disabled=yes limit-at=512k/768k max-limit=1M/1M name=Toto parent=\
    "z ALL TRAFICK" target=192.168.200.64/32
add comment="BTS " disabled=yes limit-at=512k/0 max-limit=1M/1M name=Wayudin \
    parent="z ALL TRAFICK" target=192.168.200.61/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="S TriI1mb" parent=\
    "z ALL TRAFICK" target=192.168.200.67/32
add disabled=yes max-limit=512k/512k name=Pator parent="z ALL TRAFICK" \
    target=192.168.200.65/32
add limit-at=512k/1M max-limit=1M/1M name="Semi Pempek" parent=\
    "z ALL TRAFICK" target=192.168.200.68/32
add disabled=yes max-limit=1M/2M name="Ning Kastari" parent="z ALL TRAFICK" \
    target=192.168.200.69/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Imam Pranoto" parent=\
    "z ALL TRAFICK" target=192.168.200.74/32
add burst-time=20s/20s comment="oktober sudah agus paarel tk[" disabled=yes \
    limit-at=512k/0 max-limit=1M/1M name="Wawin TK" parent="z ALL TRAFICK" \
    target=192.168.200.75/32
add disabled=yes limit-at=512k/0 max-limit=1M/2M name=Olivia parent=\
    "z ALL TRAFICK" target=192.168.200.77/32
add disabled=yes limit-at=1M/1M max-limit=1M/1M name=Ani parent=\
    "z ALL TRAFICK" target=192.168.200.79/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Ipank Sound El" \
    parent="z ALL TRAFICK" target=192.168.200.78/32
add disabled=yes limit-at=512k/0 max-limit=1M/1M name="Arjun Cipto" parent=\
    "z ALL TRAFICK" target=192.168.200.80/32
add max-limit=10M/100M name=PCYOGA parent="z ALL TRAFICK" priority=1/1 \
    target=192.168.200.254/32
add max-limit=5M/5M name="Rumah Yoga" parent="z ALL TRAFICK" priority=1/1 \
    target=192.168.200.250/32
add max-limit=3M/3M name=test1 parent="z ALL TRAFICK" priority=1/1 target=\
    192.168.200.251/32
add max-limit=1M/1M name="agus test" parent="z ALL TRAFICK" target=\
    192.168.200.246/32
add max-limit=1M/1M name=yes parent="z ALL TRAFICK" priority=1/1 target=\
    192.168.200.247/32
add max-limit=1M/2M name="PC Cendana" parent="z ALL TRAFICK" priority=1/1 \
    target=192.168.200.248/32
add burst-time=20s/20s limit-at=512k/1M max-limit=1M/1M name=test3 parent=\
    "z ALL TRAFICK" target=192.168.200.245/32
add disabled=yes limit-at=64k/64k max-limit=1M/1M name=Kustoro parent=\
    "z ALL TRAFICK" target=192.168.200.58/32
add limit-at=1M/1M max-limit=1M/1M name=test2 parent="z ALL TRAFICK" target=\
    192.168.200.252/32
add disabled=yes max-limit=5M/10M name=sid parent="z ALL TRAFICK" priority=\
    1/1 target=192.168.200.249/32
add disabled=yes limit-at=512k/768k max-limit=1M/2M name="Amin Prayoga" \
    parent="z ALL TRAFICK" target=192.168.200.2/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name="Nani diana" parent=\
    "z ALL TRAFICK" target=192.168.200.113/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Kosidah parent=\
    "z ALL TRAFICK" target=192.168.200.113/32
add disabled=yes limit-at=1M/0 max-limit=2M/2M name="Mamo BR BTS" parent=\
    "z ALL TRAFICK" target=192.168.200.81/32
add disabled=yes limit-at=64k/64k max-limit=1M/1M name=Harti/Afifah parent=\
    "z ALL TRAFICK" target=192.168.200.82/32
add limit-at=512k/512k max-limit=1M/1M name="Lebe A. Munir" parent=\
    "z ALL TRAFICK" target=192.168.200.85/32
add disabled=yes limit-at=512k/0 max-limit=1M/1M name="Bambang Sus" parent=\
    "z ALL TRAFICK" target=192.168.200.86/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name="Tri Servis" parent=\
    "z ALL TRAFICK" target=192.168.200.87/32
add limit-at=512k/1M max-limit=1M/1M name=Dian parent="z ALL TRAFICK" target=\
    192.168.200.88/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Wawa/Sumiati parent=\
    "z ALL TRAFICK" target=192.168.200.89/32
add disabled=yes limit-at=0/64k max-limit=1M/1M name=Wulan/Munirah parent=\
    "z ALL TRAFICK" target=192.168.200.90/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Noval parent=\
    "z ALL TRAFICK" target=192.168.200.91/32
add disabled=yes limit-at=512k/0 max-limit=2M/3M name="Agus Clay" parent=\
    "z ALL TRAFICK" target=192.168.200.93/32
add disabled=yes max-limit=1M/1M name="Nurul Printis" parent="z ALL TRAFICK" \
    target=192.168.200.101/32
add disabled=yes max-limit=1M/1M name="Manten Sirin" parent="z ALL TRAFICK" \
    target=192.168.200.102/32
add disabled=yes limit-at=512k/1M max-limit=1M/2M name=Kedi parent=\
    "z ALL TRAFICK" target=192.168.200.103/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name=Urip parent=\
    "z ALL TRAFICK" target=192.168.200.104/32
add disabled=yes limit-at=1M/2M max-limit=2M/2M name=Fatun parent=\
    "z ALL TRAFICK" target=192.168.200.105/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name=Harto parent=\
    "z ALL TRAFICK" target=192.168.200.106/32
add disabled=yes limit-at=1M/1M max-limit=1M/1M name=Wagino parent=\
    "z ALL TRAFICK" target=192.168.200.107/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Lisa parent=\
    "z ALL TRAFICK" target=192.168.200.109/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=moro parent=\
    "z ALL TRAFICK" target=192.168.200.100/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name="Tulus Bakso" parent=\
    "z ALL TRAFICK" target=192.168.200.97/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name="moro ayam" parent=\
    "z ALL TRAFICK" target=192.168.200.99/32
add limit-at=512k/1M max-limit=1M/1M name=kosong7 parent="z ALL TRAFICK" \
    target=192.168.200.98/32
add limit-at=64k/64k max-limit=64k/64k name="Daris PRIHATI" parent=\
    "z ALL TRAFICK" target=192.168.200.96/32
add disabled=yes limit-at=512k/1M max-limit=4M/4M name="Mamo BR Rumah" \
    parent="z ALL TRAFICK" target=192.168.200.94/32
add disabled=yes limit-at=512k/1M max-limit=2M/2M name=munawaroh parent=\
    "z ALL TRAFICK" target=192.168.200.111/32
add disabled=yes max-limit=3M/3M name=Baldes parent="z ALL TRAFICK" target=\
    192.168.200.116/32
add disabled=yes max-limit=4M/4M name="mbak budi" parent="z ALL TRAFICK" \
    target=192.168.200.117/32
add limit-at=512k/1M max-limit=1M/1M name="hafis " parent="z ALL TRAFICK" \
    target=192.168.200.118/32
add disabled=yes max-limit=1M/2M name="Lia " parent="z ALL TRAFICK" target=\
    192.168.200.120/32
add disabled=yes max-limit=1M/2M name="Ika new" parent="z ALL TRAFICK" \
    target=192.168.200.121/32
add disabled=yes max-limit=2M/2M name=zidan parent="z ALL TRAFICK" target=\
    192.168.200.122/32
add disabled=yes limit-at=1M/1M max-limit=2M/2M name=Jamil parent=\
    "z ALL TRAFICK" target=192.168.200.66/32
add disabled=yes limit-at=512k/1M max-limit=1M/1M name=Fera parent=\
    "z ALL TRAFICK" target=192.168.200.123/32
add disabled=yes max-limit=2M/2M name=Bumdes parent="z ALL TRAFICK" target=\
    192.168.200.124/32
add disabled=yes max-limit=1M/2M name=Mukmin parent="z ALL TRAFICK" target=\
    192.168.200.127/32
add disabled=yes limit-at=1M/2M max-limit=2M/2M name=wardesi parent=\
    "z ALL TRAFICK" target=192.168.200.128/32
/ppp profile
set *0 dns-server=172.16.0.1,1.1.1.1 insert-queue-before="z ALL TRAFICK" \
    only-one=yes parent-queue="z ALL TRAFICK"
/queue type
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
    pcq-burst-time=16s pcq-classifier=dst-address pcq-rate=4M
add kind=pcq name=PCQ-512K pcq-burst-rate=1M pcq-burst-threshold=384k \
    pcq-burst-time=16s pcq-classifier=dst-address pcq-rate=512k
set 13 pcq-rate=2M
set 14 pcq-limit=500KiB pcq-rate=3M pcq-total-limit=5000KiB
/queue simple
add disabled=yes max-limit=100M/100M name="TEST PCQ ALL JANGAN DIHAPUS!!" \
    packet-marks=DOWNLOAD,UPLUAD,BERATdown,BERATup,no-mark queue=\
    PCQ-Upload/PCQ-5M target=192.168.200.0/24,192.168.201.0/24
add disabled=yes limit-at=512k/512k max-limit=1M/1M name="Toko Nur" parent=\
    "z ALL TRAFICK" queue=default-smallest/default-small target=\
    192.168.200.27/32
add max-limit=100M/100M name=Q5M parent=GLOBAL queue=PCQ-Upload/PCQ-5M \
    target=192.168.205.0/24
add max-limit=100M/100M name=Q1M parent=GLOBAL queue=PCQ-Upload/PCQ-1M \
    target=192.168.201.0/24
add max-limit=1M/1M name=Q-ISOLIR parent=GLOBAL queue=default/PCQ-512K \
    target=192.168.200.0/24
add max-limit=100M/100M name=Q2M parent=GLOBAL queue=PCQ-Upload/PCQ-2M \
    target=192.168.202.0/24
add max-limit=100M/100M name=Q3M parent=GLOBAL queue=PCQ-Upload/PCQ-3M \
    target=192.168.203.0/24
add max-limit=100M/100M name=Q4M parent=GLOBAL queue=PCQ-Upload/PCQ-4M \
    target=192.168.204.0/24
/ppp profile
add dns-server=1.1.1.1 insert-queue-before=Q5M local-address=192.168.205.1 \
    name=5M only-one=yes parent-queue=Q5M remote-address=POOL_5M
add dns-server=1.1.1.1 insert-queue-before=Q1M local-address=192.168.201.1 \
    name=1M only-one=yes parent-queue=Q1M remote-address=POOL_1M
add dns-server=1.1.1.1 insert-queue-before=Q2M local-address=192.168.202.1 \
    name=2M only-one=yes parent-queue=Q2M remote-address=POOL_2M
add dns-server=1.1.1.1 insert-queue-before=Q3M local-address=192.168.203.1 \
    name=3M only-one=yes parent-queue=Q3M remote-address=POOL_3M
add dns-server=1.1.1.1 insert-queue-before=Q4M local-address=192.168.204.1 \
    name=4M only-one=yes parent-queue=Q4M remote-address=POOL_4M
add dns-server=1.1.1.1 insert-queue-before=Q-ISOLIR local-address=\
    192.168.200.1 name=512K only-one=yes parent-queue=Q-ISOLIR \
    remote-address=POOL_ISOLIR
/interface bridge port
add bridge=LAN-CLIENT disabled=yes interface=ether2
add bridge=LAN-CLIENT interface=ether3
add bridge=LAN-CLIENT interface=ether4
add bridge=LAN-CLIENT interface=ether5
add bridge=LAN-CLIENT interface=ether1
/ip firewall connection tracking
set tcp-established-timeout=10m
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add list=ISP
add list=ISP
add interface=LAN-CLIENT list=ISP
/interface pppoe-server server
add disabled=no interface=LAN-CLIENT service-name=service1
/ip address
add address=192.168.200.1/24 interface=LAN-CLIENT network=192.168.200.0
add address=192.168.201.1/24 interface=LAN-CLIENT network=192.168.201.0
/ip dhcp-client
add comment=10.113.149.21/18
add add-default-route=no
add disabled=no interface=ether2
/ip dns
set allow-remote-requests=yes cache-max-ttl=10m servers=172.16.0.1
/ip firewall address-list
add address=192.168.200.0/24 comment="ip client" list=ip-local
add address=8.8.8.8 comment="ip dns" list=list-private-ip-dns
add address=103.133.222.110 comment="ip lokal" list=list-private-ip-dns
add address=139.99.65.149 comment="ip lokal" list=list-private-ip-dns
add address=36.94.24.125 comment="ip lokal" list=list-private-ip-dns
add address=103.153.2.173 comment="ip lokal" list=list-private-ip-dns
add address=0.0.0.0/8 comment="ip private" list=list-private-ip-dns
add address=10.0.0.0/8 comment="ip private" list=list-private-ip-dns
add address=100.64.0.0/10 comment="ip private" list=list-private-ip-dns
add address=127.0.0.0/8 comment="ip private" list=list-private-ip-dns
add address=169.254.0.0/16 comment="ip private" list=list-private-ip-dns
add address=172.16.0.0/12 comment="ip private" list=list-private-ip-dns
add address=192.0.0.0/24 comment="ip private" list=list-private-ip-dns
add address=192.0.2.0/24 comment="ip private" list=list-private-ip-dns
add address=192.88.99.0/24 comment="ip private" list=list-private-ip-dns
add address=192.168.0.0/16 comment="ip private" list=list-private-ip-dns
add address=198.18.0.0/15 comment="ip private" list=list-private-ip-dns
add address=198.51.100.0/24 comment="ip private" list=list-private-ip-dns
add address=203.0.113.0/24 comment="ip private" list=list-private-ip-dns
add address=224.0.0.0/4 comment="ip private" list=list-private-ip-dns
add address=240.0.0.0/4 comment="ip private" list=list-private-ip-dns
add address=255.255.255.255 comment="ip private" list=list-private-ip-dns
add address=1.1.1.1 comment="ip dns" list=list-private-ip-dns
add address=101.101.101.101 comment="ip dns" list=list-private-ip-dns
add address=114.114.114.114 comment="ip dns" list=list-private-ip-dns
add address=118.89.110.78 comment="ip dns" list=list-private-ip-dns
add address=119.29.107.85 comment="ip dns" list=list-private-ip-dns
add address=119.29.29.29 comment="ip dns" list=list-private-ip-dns
add address=12.159.2.159 comment="ip dns" list=list-private-ip-dns
add address=136.243.69.38 comment="ip dns" list=list-private-ip-dns
add address=176.103.130.130 comment="ip dns" list=list-private-ip-dns
add address=176.9.62.58 comment="ip dns" list=list-private-ip-dns
add address=185.184.222.222 comment="ip dns" list=list-private-ip-dns
add address=185.222.222.222 comment="ip dns" list=list-private-ip-dns
add address=213.239.207.143 comment="ip dns" list=list-private-ip-dns
add address=220.248.179.9 comment="ip dns" list=list-private-ip-dns
add address=223.5.5.5 comment="ip dns" list=list-private-ip-dns
add address=223.6.6.6 comment="ip dns" list=list-private-ip-dns
add address=47.96.179.163 comment="ip dns" list=list-private-ip-dns
add address=58.20.127.170 comment="ip dns" list=list-private-ip-dns
add address=58.20.127.238 comment="ip dns" list=list-private-ip-dns
add address=8.8.4.4 comment="ip dns" list=list-private-ip-dns
add address=9.9.9.9 comment="ip dns" list=list-private-ip-dns
add address=94.140.14.140 comment="ip dns" list=list-private-ip-dns
/ip firewall nat
add action=masquerade chain=srcnat
/ip route rule
add comment="PC Yoga" src-address=192.168.201.254/32 table=idplay
add src-address=192.168.201.2/32 table=idplay
add comment=SID src-address=192.168.200.249/32 table=idplay
add comment="Rumah Yoga" disabled=yes src-address=192.168.200.250/32 table=\
    idplay
add comment=#####GOBAL##### src-address=192.168.200.0/24 table=idplay
add disabled=yes interface=pptp-monitoring table=indihome
add disabled=yes src-address=192.168.200.245/32 table=indihome
add comment=agus src-address=192.168.200.246/32 table=idplay
add comment="masjid istikmal" disabled=yes src-address=192.168.200.11/32 \
    table=main
add comment="PC CENDANA54" disabled=yes src-address=192.168.200.248/32 table=\
    indihome
add disabled=yes src-address=192.168.200.252/32 table=indihome
add comment=yes disabled=yes src-address=192.168.200.247/32 table=idplay
add disabled=yes src-address=192.168.200.251/32 table=indihome
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/ppp secret
add local-address=192.168.222.1 name=rumahyoga password=rumahyoga \
    remote-address=192.168.222.3
add comment="Amin Prayoga" name=192901001@grogex.net password=\
    192901001@grogex.net profile=2M
add comment="Teguh S|2MB|Rp.120.000|SUNGAPAN" local-address=192.168.200.1 \
    name=192901002@grogex.net password=192901002@grogex.net remote-address=\
    192.168.200.3
add comment=Intan|1MB|Rp.70.000|SUNGAPAN name=192901003@grogex.net password=\
    192901003@grogex.net profile=1M
add comment="Andi Bau" name=192901004@grogex.net password=\
    192901004@grogex.net profile=2M
add comment=Amon|3MB|Rp.120.000|SUNGAPAN local-address=192.168.200.1 name=\
    192901005@grogex.net password=192901005@grogex.net remote-address=\
    192.168.200.6
add comment=Nugroho name=192901006@grogex.net password=192901006@grogex.net \
    profile=2M
add comment="Mbak Enah" name=192901007@grogex.net password=\
    192901007@grogex.net profile=2M
add comment=Minar|1MB|Rp.70.000|SUNGAPAN name=192901008@grogex.net password=\
    192901008@grogex.net profile=1M
add comment="S kholil|2MB|Rp.70.000|SUNGAPAN" local-address=192.168.200.1 \
    name=192901009@grogex.net password=192901009@grogex.net remote-address=\
    192.168.200.10
add comment=PKD name=192901010@grogex.net password=192901010@grogex.net \
    profile=2M
add comment=Ayu name=192901011@grogex.net password=192901011@grogex.net \
    profile=1M
add comment=Komarudin name=192901012@grogex.net password=192901012@grogex.net \
    profile=3M
add comment="Tuprihati Edi" name=192901013@grogex.net password=\
    192901013@grogex.net profile=1M
add comment="Suranto Lebe" name=192901014@grogex.net password=\
    192901014@grogex.net profile=2M
add comment=Lastri name=192901015@grogex.net password=192901015@grogex.net \
    profile=512K
add comment=VERA disabled=yes local-address=192.168.200.1 name=\
    192901016@grogex.net password=192901016@grogex.net remote-address=\
    192.168.200.17
add comment="KOSONG 3" local-address=192.168.200.1 name=192901017@grogex.net \
    password=192901017@grogex.net remote-address=192.168.200.18
add comment=Indah name=192901018@grogex.net password=192901018@grogex.net \
    profile=2M
add comment="Selly Seblak" name=192901019@grogex.net password=\
    192901019@grogex.net profile=2M
add comment=Fitri name=192901020@grogex.net password=192901020@grogex.net \
    profile=3M
add comment=Mitro name=192901021@grogex.net password=192901021@grogex.net \
    profile=1M
add comment="Puji Bengkel" name=192901022@grogex.net password=\
    192901022@grogex.net profile=2M
add comment=Suswondo|1MB|Rp.70.000|SUNGAPAN local-address=192.168.200.1 name=\
    192901023@grogex.net password=192901023@grogex.net remote-address=\
    192.168.200.24
add comment=Dessy name=192901024@grogex.net password=192901024@grogex.net \
    profile=1M
add comment="Jati Bale" name=192901025@grogex.net password=\
    192901025@grogex.net profile=2M
add comment="Toko Nur" name=192901026@grogex.net password=\
    192901026@grogex.net profile=1M
add comment=Hirin name=192901027@grogex.net password=192901027@grogex.net \
    profile=1M
add comment="Bumdes ss" name=192901028@grogex.net password=\
    192901028@grogex.net profile=2M
add comment=imeldaI2MB|Rp.120.000|SUNGAPAN local-address=192.168.200.1 name=\
    192901029@grogex.net password=192901029@grogex.net remote-address=\
    192.168.200.30
add comment="LAKA NAMANE TAPI AKTIF TULISANE KEDI" local-address=\
    192.168.200.1 name=192901030@grogex.net password=192901030@grogex.net \
    remote-address=192.168.200.31
add comment=Kadus3|1MB|Rp.70.000|SUNGAPAN local-address=192.168.200.1 name=\
    192901031@grogex.net password=192901031@grogex.net remote-address=\
    192.168.200.32
add comment=NITA local-address=192.168.200.1 name=192901032@grogex.net \
    password=192901032@grogex.net remote-address=192.168.200.33
add comment="sapa yah" name=192901033@grogex.net password=\
    192901033@grogex.net profile=2M
add comment="DINI D" local-address=192.168.200.1 name=192901034@grogex.net \
    password=192901034@grogex.net remote-address=192.168.200.35
add comment=Amarin name=192901035@grogex.net password=192901035@grogex.net \
    profile=3M
add comment="Pak Lurah|3MB|Rp.0|SUNGAPAN" disabled=yes local-address=\
    192.168.200.1 name=192901036@grogex.net password=192901036@grogex.net \
    remote-address=192.168.200.37
add comment=Cipto name=192901037@grogex.net password=192901037@grogex.net \
    profile=1M
add comment=Legowo|1MB|Rp.70.000|SUNGAPAN local-address=192.168.200.1 name=\
    192901038@grogex.net password=192901038@grogex.net remote-address=\
    192.168.200.39
add comment="Aji Chicken" name=192901039@grogex.net password=\
    192901039@grogex.net profile=1M
add comment=Anggi name=192901040@grogex.net password=192901040@grogex.net \
    profile=1M
add disabled=yes local-address=192.168.200.1 name=test3 password=test3 \
    remote-address=192.168.200.245
add disabled=yes local-address=192.168.200.1 name=yes password=yes \
    remote-address=192.168.200.247
add name=pcyoga password=pcyoga profile=5M
add disabled=yes local-address=192.168.200.1 name=test2 password=test2 \
    remote-address=192.168.200.252
add comment=MakmorIBts|SUNGAPAN name=192901041@grogex.net password=\
    192901041@grogex.net profile=1M
add comment=Dolos name=192901042@grogex.net password=192901042@grogex.net \
    profile=3M
add comment=Hendro name=192901043@grogex.net password=192901043@grogex.net \
    profile=2M
add comment=Rohadi name=192901044@grogex.net password=192901044@grogex.net \
    profile=2M
add comment=SUBEJO|1MB|Rp.70.000|SUNGAPAN name=192901045@grogex.net password=\
    192901045@grogex.net profile=1M
add comment=Ana name=192901046@grogex.net password=192901046@grogex.net \
    profile=1M
add comment=Raun name=192901047@grogex.net password=192901047@grogex.net \
    profile=2M
add comment=Yoan name=192901048@grogex.net password=192901048@grogex.net \
    profile=1M
add comment="Ayu Yudi" name=192901049@grogex.net password=\
    192901049@grogex.net profile=512K
add comment="NUR RIDWAN|1MB|Rp.70.000|SUNGAPAN" name=192901050@grogex.net \
    password=192901050@grogex.net profile=1M
add local-address=192.168.200.1 name=pccendana54 password=pccendana54 \
    remote-address=192.168.200.248
add disabled=yes local-address=192.168.200.1 name=agus password=agus \
    remote-address=192.168.200.246
add comment="BAMBANG POLISI|2MB|Rp.120.000|SUNGAPAN" name=\
    192901051@grogex.net password=192901051@grogex.net profile=1M
add comment="AMAH RIZKI|4MB|Rp.175.000|SUNGAPAN" name=192901052@grogex.net \
    password=192901052@grogex.net profile=1M
add comment="MBA TATI|3MB|Rp.150.000|SUNGAPAN" name=192901053@grogex.net \
    password=192901053@grogex.net profile=1M
add comment=Hartari name=192901054@grogex.net password=192901054@grogex.net \
    profile=2M
add comment="ib ika@|1MB|Rp.70.000|SUNGAPAN" local-address=192.168.200.1 \
    name=192901055@grogex.net password=192901055@grogex.net remote-address=\
    192.168.200.56
add comment=Leni name=192901056@grogex.net password=192901056@grogex.net \
    profile=5M
add comment=Ani name=192901057@grogex.net password=192901057@grogex.net \
    profile=1M
add comment=sukma local-address=192.168.200.1 name=192901058@grogex.net \
    password=192901058@grogex.net remote-address=192.168.200.59
add comment=Wayudin name=192901060@grogex.net password=192901060@grogex.net \
    profile=1M
add comment=Tang name=192901061@grogex.net password=192901061@grogex.net \
    profile=1M
add comment="Dwi Sasongko" name=192901062@grogex.net password=\
    192901062@grogex.net profile=3M
add comment="Toto !mb" name=192901063@grogex.net password=\
    192901063@grogex.net profile=1M
add comment=Pator name=192901064@grogex.net password=192901064@grogex.net \
    profile=512K
add comment=Jamil name=192901065@grogex.net password=192901065@grogex.net \
    profile=2M
add comment="S Tri" name=192901066@grogex.net password=192901066@grogex.net \
    profile=1M
add comment="Semi !mb" local-address=192.168.200.1 name=192901067@grogex.net \
    password=192901067@grogex.net remote-address=192.168.200.68
add comment="Ning kastari" name=192901068@grogex.net password=\
    192901068@grogex.net profile=1M
add comment="|Moro|1Mb  cek agus" local-address=192.168.200.1 name=\
    192901069@grogex.net password=192901069@grogex.net remote-address=\
    192.168.200.70
add comment=SuharningsihI1Mb local-address=192.168.200.1 name=\
    192901070@grogex.net password=192901070@grogex.net remote-address=\
    192.168.200.71
add comment="bts ap tenda 01|KHOLIK" local-address=192.168.200.1 name=\
    192901071@grogex.net password=192901071@grogex.net remote-address=\
    192.168.200.72
add comment="siswoyo bpd" local-address=192.168.200.1 name=\
    192901072@grogex.net password=192901072@grogex.net remote-address=\
    192.168.200.73
add comment="Imam Pranoto" name=192901073@grogex.net password=\
    192901073@grogex.net profile=1M
add comment=Wawin name=192901074@grogex.net password=192901074@grogex.net \
    profile=1M
add comment="dodo br" local-address=192.168.200.1 name=192901075@grogex.net \
    password=192901075@grogex.net remote-address=192.168.200.76
add comment=Olivia name=192901076@grogex.net password=192901076@grogex.net \
    profile=1M
add comment="Ipank Sound El" name=192901077@grogex.net password=\
    192901077@grogex.net profile=1M
add comment="Pita Jepri Bengkel" local-address=192.168.200.1 name=\
    192901078@grogex.net password=192901078@grogex.net remote-address=\
    192.168.200.79
add comment="Arjun Cipto" name=192901079@grogex.net password=\
    192901079@grogex.net profile=1M
add comment="Mamo Rumah" name=192901080@grogex.net password=\
    192901080@grogex.net profile=2M
add local-address=192.168.201.1 name=sid password=sid remote-address=\
    192.168.201.252
add comment="Harti Afifah" name=192901081@grogex.net password=\
    192901081@grogex.net profile=2M
add comment=ria local-address=192.168.200.1 name=192901082@grogex.net \
    password=192901082@grogex.net remote-address=192.168.200.83
add comment="war desi" local-address=192.168.200.1 name=192901083@grogex.net \
    password=192901083@grogex.net remote-address=192.168.200.84
add comment="Lebe A Munir" local-address=192.168.200.1 name=\
    192901084@grogex.net password=192901084@grogex.net remote-address=\
    192.168.200.85
add comment="Bambang Sus" name=192901085@grogex.net password=\
    192901085@grogex.net profile=1M
add comment="Tri Servis" name=192901086@grogex.net password=\
    192901086@grogex.net profile=3M
add local-address=192.168.200.1 name=192901087@grogex.net password=\
    192901087@grogex.net remote-address=192.168.200.88
add comment=Wawa/Sumiati name=192901088@grogex.net password=\
    192901088@grogex.net profile=1M
add comment=Wulan name=192901089@grogex.net password=192901089@grogex.net \
    profile=1M
add comment=Noval name=192901090@grogex.net password=192901090@grogex.net \
    profile=1M
add local-address=192.168.200.1 name=test1 password=test1 remote-address=\
    192.168.200.251
add disabled=yes local-address=192.168.200.1 name=pkd password=pkd \
    remote-address=192.168.200.253
add comment="Agus Clay" name=192901092@grogex.net password=\
    192901092@grogex.net profile=2M
add comment="Nur Sultan" local-address=192.168.200.1 name=\
    192901091@grogex.net password=192901091@grogex.net remote-address=\
    192.168.200.92
add comment="Mamo Rumah" name=192901093@grogex.net password=\
    192901093@grogex.net profile=4M
add comment="LAKA NAMANE TAPI AKTIF" disabled=yes local-address=192.168.200.1 \
    name=192901094@grogex.net password=192901094@grogex.net remote-address=\
    192.168.200.95
add comment=DARIS local-address=192.168.200.1 name=192901095@grogex.net \
    password=192901095@grogex.net profile=2M remote-address=192.168.200.96
add comment="Tulus Bakso" name=192901096@grogex.net password=\
    192901096@grogex.net profile=2M
add comment=bumdes local-address=192.168.200.1 name=192901097@grogex.net \
    password=192901097@grogex.net profile=5M remote-address=192.168.200.98
add comment="Moro Ayam" name=192901098@grogex.net password=\
    192901098@grogex.net profile=2M
add comment=Moro name=192901099@grogex.net password=192901099@grogex.net \
    profile=1M
add comment="Nurul Printis" name=192901100@grogex.net password=\
    192901100@grogex.net profile=1M
add comment="Manten Sirin" name=192901101@grogex.net password=\
    192901101@grogex.net profile=2M
add local-address=192.168.200.1 name=wbs password=wbs remote-address=\
    192.168.200.244
add comment=Kedi name=192901102@grogex.net password=192901102@grogex.net \
    profile=2M
add comment=Urip name=192901103@grogex.net password=192901103@grogex.net \
    profile=2M
add comment=Fatun name=192901104@grogex.net password=192901104@grogex.net \
    profile=2M
add comment=Harto name=192901105@grogex.net password=192901105@grogex.net \
    profile=2M
add comment="Lia Ribut" local-address=192.168.200.1 name=192901107@grogex.net \
    password=192901107@grogex.net remote-address=192.168.200.108
add comment=Lisa name=192901108@grogex.net password=192901108@grogex.net \
    profile=1M
add comment=Wagino name=192901106@grogex.net password=192901106@grogex.net \
    profile=1M
add comment=Lisa name=192901109@grogex.net password=192901109@grogex.net \
    profile=1M
add comment=Roh name=192901110@grogex.net password=192901110@grogex.net \
    profile=2M
add comment=sukma local-address=192.168.200.1 name=192901111@grogex.net \
    password=192901111@grogex.net remote-address=192.168.200.112
add local-address=192.168.200.1 name=lurah password=lurah remote-address=\
    192.168.200.243
add comment="Nani diana" name=192901112@grogex.net password=\
    192901112@grogex.net profile=2M
add comment=Kosidah local-address=192.168.200.1 name=192901113@grogex.net \
    password=192901113@grogex.net remote-address=192.168.200.114
add name=pcyoga1 password=pcyoga1 profile=QUNLIMITED
add comment="EKO (BELUM)" local-address=192.168.200.1 name=\
    192901114@grogex.net password=192901114@grogex.net remote-address=\
    192.168.200.115
add comment="R Server" name=192901115@grogex.net password=\
    192901115@grogex.net profile=3M
add comment="Warung Budi" name=192901116@grogex.net password=\
    192901116@grogex.net profile=5M
add comment="Hafis Teguh" name=192901117@grogex.net password=\
    192901117@grogex.net profile=1M
add comment="Lia Ribut" name=192901119@grogex.net password=\
    192901119@grogex.net profile=2M
add comment=Dewie local-address=192.168.200.1 name=192901118@grogex.net \
    password=192901118@grogex.net remote-address=192.168.200.119
add comment="Ika new" name=192901120@grogex.net password=192901120@grogex.net \
    profile=5M
add comment=Zidan name=192901121@grogex.net password=192901121@grogex.net \
    profile=2M
add comment=Fera disabled=yes name=192901122@grogex.net password=\
    192901122@grogex.net profile=1M
add comment=PAUD name=192901123@grogex.net password=192901123@grogex.net \
    profile=1M
add comment=Mukmin name=192901126@grogex.net password=192901126@grogex.net \
    profile=2M
add local-address=192.168.200.1 name=192901124@grogex.net password=\
    192901124@grogex.net remote-address=192.168.200.125
add comment=Wardesi name=192901127@grogex.net password=192901127@grogex.net \
    profile=2M
add comment=Legowo local-address=192.168.200.1 name=192901128@grogex.net \
    password=192901128@grogex.net remote-address=192.168.200.129
add comment=Itasari name=192901129@grogex.net password=192901129@grogex.net \
    profile=2M
add local-address=192.168.200.1 name=192901130@grogex.net password=\
    192901130@grogex.net profile=1M remote-address=192.168.200.131
/queue simple
add burst-threshold=1M/0 disabled=yes dst=*F00363 limit-at=64k/64k max-limit=\
    1M/1M name=Ratno parent="z ALL TRAFICK" target=*F00363,*F00363
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=BALE-PUSAT
/system note
set show-at-login=no
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system scheduler
add disabled=yes name="Disable GLOBAL" on-event=\
    "ip route rule disable numbers=2" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/18/2021 start-time=22:00:00
add disabled=yes name="Enable GLOBAL" on-event=\
    "ip route rule enable numbers=2" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jul/18/2021 start-time=15:00:00
add disabled=yes interval=1h name=schedule1 on-event=\
    ":if ([:ping 8.8.8.8 count=5]=0) do={:system script run wms;}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=1m name="RENEW WMS" on-event=\
    "ip dhcp-client renew ISP-1-WMS" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=nov/09/2021 start-time=21:47:33
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
/tool e-mail
set address=74.125.68.109 from=mirza password=vixxfwnuqexwaocz port=587 \
    start-tls=yes user=mirza@poltektegal.ac.id
/tool netwatch
add disabled=yes down-script="/ip firewall nat set disable=yes [find comment=d\
    ns]\r\
    \n/lcd set enabled=yes" host=94.140.14.140 interval=5s timeout=800ms \
    up-script="/ip firewall nat set disable=no [find comment=dns]\r\
    \n/lcd set enabled=no"
add comment=DNSCEK host=94.140.14.140 interval=5s timeout=800ms
/tool romon
set enabled=yes
