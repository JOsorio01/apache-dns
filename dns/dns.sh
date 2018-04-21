#! /bin/bash
/etc/init.d/bind9 start
HOSTNAME=$(hostname -I)
PROXY=$(getent hosts proxy | awk '{print $1}')
echo -e "
\$TTL 604800
@     IN    SOA   dns1.chilate.com    om13001.uesocc.edu.sv (
      2018103   ; Serial
      604800    ; Refresh
      86400     ; Retry
      2419200   ; Expire
      604800 )  ; Negative Cache TTL
;
@     IN    NS    dns1.chilate.com.
dns1  IN    A     $HOSTNAME
@     IN    A     $HOSTNAME
www   IN    A     $PROXY " > /etc/bind/db.chilate

printf "\n\n%s\n\t%s\n\t%s\n%s" "zone \"chilate.com\" {" "type master;" "file \"/etc/bind/db.chilate\";" "};" >> /etc/bind/named.conf.default-zones
named-checkzone -i full chilate.com /etc/bind/db.chilate
/etc/init.d/bind9 restart
hostname -I
tcpdump
