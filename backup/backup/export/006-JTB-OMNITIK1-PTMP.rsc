# sep/02/2023 00:00:00 by RouterOS 6.48.5
# software id = KTQ8-84PC
#
# model = RBOmniTikPG-5HacD
# serial number = C7070BE8FE5B
/interface bridge
add comment="20/40 eC | CSMA mati | 3200" name=bridge
/interface ethernet
set [ find default-name=ether2 ] poe-out=off
set [ find default-name=ether3 ] poe-out=off poe-priority=12
set [ find default-name=ether4 ] poe-out=off poe-priority=13
set [ find default-name=ether5 ] poe-out=off poe-priority=14
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=5ghz-a/n channel-width=\
    20/40mhz-Ce country=no_country_set default-authentication=no disabled=no \
    frequency=5725 frequency-mode=superchannel installation=any mode=\
    ap-bridge nv2-cell-radius=10 preamble-mode=long radio-name=Mnet \
    rx-chains=0,1 scan-list=5175,4980,5805,5825,5725 ssid=Mnet-OB-2-OMNITIK \
    station-roaming=enabled tdma-period-size=1 tx-chains=0,1 \
    wireless-protocol=nv2 wps-mode=disabled
/interface wireless nstreme
set wlan1 disable-csma=yes enable-nstreme=yes framer-policy=best-fit
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge interface=wlan1
add bridge=bridge interface=ether1
add bridge=bridge disabled=yes interface=all
/ip neighbor discovery-settings
set discover-interface-list=all
/interface wireless access-list
add comment="WAWAN CAFE" interface=wlan1 mac-address=48:8F:5A:B0:A7:20 \
    vlan-mode=no-tag
add comment="BAYU RUMAH" interface=wlan1 mac-address=48:8F:5A:B9:D7:38 \
    vlan-mode=no-tag
add comment=SRI interface=wlan1 mac-address=08:55:31:A6:B6:5A vlan-mode=\
    no-tag
add comment=OZI interface=wlan1 mac-address=48:8F:5A:B0:ED:3C vlan-mode=\
    no-tag
add comment=AAN interface=wlan1 mac-address=08:55:31:FA:A6:F0 vlan-mode=\
    no-tag
add comment="IRHAM + SLAMET" interface=wlan1 mac-address=48:8F:5A:B0:CB:57 \
    vlan-mode=no-tag
add comment=NAZIM interface=wlan1 mac-address=08:55:31:82:A5:FC vlan-mode=\
    no-tag
add comment="BAYU KANTOR" interface=wlan1 mac-address=48:8F:5A:B0:E5:04 \
    vlan-mode=no-tag
add comment=DIKROM interface=wlan1 mac-address=08:55:31:5D:E6:8D vlan-mode=\
    no-tag
add comment="SD SURO 1" interface=wlan1 mac-address=48:8F:5A:BC:0F:57 \
    vlan-mode=no-tag
add comment="SD PAGER 3" interface=wlan1 mac-address=48:8F:5A:BC:12:8F \
    vlan-mode=no-tag
add comment=SUBEKI disabled=yes interface=wlan1 mac-address=2C:C8:1B:FC:B6:22 \
    vlan-mode=no-tag
/ip address
add address=192.168.55.6/24 interface=bridge network=192.168.55.0
/ip dns
set allow-remote-requests=yes servers=192.168.55.1
/ip route
add distance=1 gateway=192.168.55.1
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
set name=006-JTB-OMNITIK1-PTMP
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
add disabled=yes interval=1d name="AUTO TUTUP DEFAULT" on-event="/interface wi\
    reless\r\
    \nset [ find default-name=wlan1 ] default-authentication=no \r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=1d name=restart on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/03/2021 start-time=04:30:00
add disabled=yes interval=1d name="ether3 mati" on-event=\
    "interface ethernet set disabled=yes ether3-amin" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/08/2022 start-time=04:00:00
add disabled=yes interval=1d name="ether3 nyala" on-event=\
    "interface ethernet set disabled=no ether3-amin" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/08/2022 start-time=04:05:00
add interval=12h name=##backup&cek-kabel on-event=\
    "/system script run ##backup\r\
    \n/system script run ##cek-kabel" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2020 start-time=00:00:00
add interval=6h name=##cek-kabel on-event="/system script run ##cek-kabel" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1w name=##reboot-7-hari-4.30 on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/2023 start-time=04:24:55
/system script
add dont-require-permissions=yes name=##backup owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local ftphost \"192.168.55.1\"\r\
    \n:local ftpuser \"mnet\"\r\
    \n:local ftppassword \"mnet\"\r\
    \n:local ftppath \"/\"\r\
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
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/\$mnet1\" up\
    load=yes\r\
    \n/tool fetch address=\"\$ftphost\" src-path=\$mnet2 user=\"\$ftpuser\" mo\
    de=ftp password=\"\$ftppassword\" dst-path=\"\$ftppath/backup/export/\$mne\
    t2\" upload=yes"
add dont-require-permissions=no name=##cek-kabel owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local server ([/system identity get name])\r\
    \n:local botid \"1353625910:AAGAPgQZzOh1JL2vN8jWriJs6XR-xInew04\"\r\
    \n:local chatid \"-1001247315859\";\r\
    \n\r\
    \n:delay 10s;\r\
    \n/interface ethernet monitor [find] once do={\r\
    \n:if (\$\"rate\" = \"10Mbps\") do={\r\
    \n/tool fetch \"https://api.telegram.org/bot\$botid/sendmessage\?chat_id=\
    \$chatid&text=\$server%0A\$name kabelnya \$rate %0Aperlu di ganti kabel\" \
    keep-result=no;};\r\
    \n}"
/tool e-mail
set address=0 from=0 password=0 port=587 start-tls=yes user=0
/tool mac-server
set allowed-interface-list=none
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes secrets=45
