# feb/07/1970 03:39:46 by RouterOS 6.47.9
# software id = P6WR-EVML
#
# model = RBLHGG-5acD
# serial number = E0260E4494C4
/interface bridge
add name=bridge
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n channel-width=20/40mhz-eC \
    country=no_country_set default-authentication=no disabled=no frequency=\
    5760 frequency-mode=superchannel mode=bridge radio-name=\
    "jangan lupa bahagia" scan-list=5750,4980,5400,5760 ssid=\
    "jangan lupa bahagia" wireless-protocol=nstreme
/interface wireless nstreme
set wlan1 disable-csma=yes enable-nstreme=yes framer-policy=best-fit
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/interface bridge port
add bridge=bridge interface=all
/ip neighbor discovery-settings
set discover-interface-list=all
/interface wireless access-list
add interface=wlan1 mac-address=DC:2C:6E:AE:85:B2 vlan-mode=no-tag
/ip address
add address=192.168.1.20/24 interface=bridge network=192.168.1.0
/ip dns
set servers=192.168.1.1
/ip route
add distance=1 gateway=192.168.1.1
add distance=1 gateway=192.168.1.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name="AP SMA WANASARI 1"
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
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
    \n:local ftppath \"/backup-client/boni-sma1wanasari/\"\r\
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
/tool romon
set enabled=yes
