# aug/21/2023 12:00:00 by RouterOS 6.47.10
# software id = V62P-851Y
#
# model = RBLHGG-5acD
# serial number = E0260D1680BD
/interface bridge
add comment=eCee name=bridge
/interface ethernet
set [ find default-name=ether1 ] comment=5470
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40mhz-eC \
    comment="DISABLE CSMA + BEST FIT + 3900 | 5470 | eC" country=\
    no_country_set default-authentication=no disabled=no frequency=5470 \
    frequency-mode=superchannel installation=any mode=bridge nv2-cell-radius=\
    14 preamble-mode=long radio-name="Allah SWT" scan-list=\
    5470,5345,4980,5530,5180 ssid="Allah Yang Maha Penyayang" \
    station-roaming=enabled wireless-protocol=nstreme wps-mode=disabled
/interface wireless manual-tx-power-table
set wlan1 comment="DISABLE CSMA + BEST FIT + 3900 | 5470 | eC"
/interface wireless nstreme
set wlan1 comment="DISABLE CSMA + BEST FIT + 3900 | 5470 | eC" disable-csma=\
    yes enable-nstreme=yes framer-policy=best-fit
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge interface=all
/ip neighbor discovery-settings
set discover-interface-list=all
/interface wireless access-list
add comment="MUKSIN LAWAS" disabled=yes interface=wlan1 mac-address=\
    08:55:31:25:64:99 vlan-mode=no-tag
add comment="MUKSIN ANYAR" interface=wlan1 mac-address=2C:C8:1B:C8:34:B0 \
    vlan-mode=no-tag
/ip address
add address=192.168.55.19/24 interface=bridge network=192.168.55.0
/ip dns
set servers=192.168.55.1
/ip route
add distance=1 gateway=192.168.55.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/snmp
set enabled=yes
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system identity
set name=019-TGL-MUKSIN-PTP
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
add interval=1d name="1 ganti wireless" on-event="#/interface wireless set [ f\
    ind default-name=wlan1 ] frequency=4980\r\
    \n\r\
    \n/interface wireless\r\
    \nset [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40mhz-\
    eC \\\r\
    \n    comment=\"DISABLE CSMA + BEST FIT + 3900 | 5470 | eC\" country=\\\r\
    \n    no_country_set wireless-protocol=nv2 \r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=nov/21/2022 start-time=04:30:00
add interval=1d name="2 ganti wireless" on-event="#/interface wireless set [ f\
    ind default-name=wlan1 ] frequency=5470\r\
    \n\r\
    \n\r\
    \n\r\
    \n/interface wireless\r\
    \nset [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40mhz-\
    eC \\\r\
    \n    comment=\"DISABLE CSMA + BEST FIT + 3900 | 5470 | eC\" country=\\\r\
    \n    no_country_set wireless-protocol=nstreme \r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=nov/21/2022 start-time=07:30:00
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
add dont-require-permissions=no name="1 frek 4980" owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    interface wireless\r\
    \nset [ find default-name=wlan1 ] frequency=4980\r\
    \n"
add dont-require-permissions=no name="2 frek 5470" owner=mm1rza policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    interface wireless\r\
    \nset [ find default-name=wlan1 ] frequency=5470\r\
    \n"
/tool e-mail
set address=0 from=0 password=0 port=587 start-tls=yes user=0
/tool graphing interface
add interface=bridge
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes secrets=45
