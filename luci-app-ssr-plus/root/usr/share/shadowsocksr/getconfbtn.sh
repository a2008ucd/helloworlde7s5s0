#/bin/bash

mac="$(ifconfig |grep eth0.1|awk '{print $5}' |awk -F: '{print $1 $2 $3 $4 $5 $6}')"
sign="$(echo -n ${mac}|md5sum| awk '{print $1}')"

URL="https://updatavp.cloudchar.cn/routerinfo/${sign}/updatebyhand.php"
URL1="https://updatavp.cloudchar.cn/routerinfo/${sign}/shadowsocksr"

/etc/init.d/shadowsocksr stop

wget $URL

wget -O /etc/config/shadowsocksr $URL1

URL3="https://updatavp.cloudchar.cn/routerinfo/${sign}/n.html"
wget -O /www/n.html $URL3
