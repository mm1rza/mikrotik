# aug/21/2023 12:00:00 by RouterOS 6.48.6
# software id = 449S-VW9I
#
# model = RBLHG-5HPnD
# serial number = DD000C784AC0
/interface bridge
add name=bridge
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=5ghz-a/n channel-width=\
    20/40mhz-XX country=no_country_set disabled=no frequency=auto \
    frequency-mode=superchannel installation=any mode=station-bridge \
    preamble-mode=long radio-name="Allah Yang Maha Pengasih" scan-list=\
    5520,5470,5480,5490,5720,5375,5345,5380 ssid="Allah Yang Maha Pengasih" \
    station-roaming=enabled
/interface wireless nstreme
set wlan1 enable-nstreme=yes
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
/interface bridge port
add bridge=bridge interface=wlan1
add bridge=bridge interface=ether1
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=192.168.55.3/24 interface=bridge network=192.168.55.0
/ip dns
set servers=192.168.55.1
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
set name=003-JTB-BEBEK-ST
/system ntp client
set enabled=yes primary-ntp=216.239.35.4 secondary-ntp=211.233.84.186
/system package update
set channel=long-term
/system scheduler
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
set address=0 from=0 password=0 start-tls=yes user=0
/tool romon
set enabled=yes secrets=45