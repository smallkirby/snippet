#!/bin/sh
nmcli connection add type wifi ifname wlp0s20f3 con-name UTOKYO_WIFI ssid Utokyo-WiFi
nmcli con edit id UTOKYO_WIFI

# 以下はcmcli内でのコマンド
set ipv4.method auto
set 802-1x.eap peap
set 802-1x.anonymous-identity **********@utac.u-tokyo.ac.jp
set 802-1x.ca-cert /usr/share/ca-certificates/mozilla/Security_Communication_RootCA2.crt
set 802-1x.identity ********
set 802-1x.password ********
set wifi-sec.key-mgmt wpa-eap
set 802-1x.phase2-auth mschapv2
save
activate
#nmcli内でのコマンド以上
