# jun/22/2023 00:00:00 by RouterOS 6.46.8
# software id = 1YD1-U91Y
#
# model = RBOmniTikUPA-5HnD
# serial number = E10F0ED63A09
/interface bridge
add name=bridge
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n channel-width=20/40mhz-eC \
    country=no_country_set disabled=no frequency=5755 frequency-mode=\
    superchannel mode=ap-bridge ssid="OMNI LAPANGAN" wireless-protocol=\
    nstreme
/interface wireless nstreme
set wlan1 enable-nstreme=yes
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/user group
add name=bacasaja policy="read,winbox,romon,!local,!telnet,!ssh,!ftp,!reboot,!\
    write,!policy,!test,!password,!web,!sniff,!sensitive,!api,!dude,!tikapp"
add name=bwtest policy="local,test,winbox,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=bridge interface=all
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=192.168.56.4/24 interface=bridge network=192.168.56.0
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d servers=8.8.8.8,8.8.4.4
/ip firewall nat
add action=masquerade chain=srcnat disabled=yes
add action=masquerade chain=srcnat disabled=yes
/ip route
add distance=1 gateway=192.168.56.1
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
set name=P-004-AP-OMNITIK-LAPANGAN
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
/tool romon
set enabled=yes
