#! /bin/bash
/etc/init.d/apache2 start
a2enmod proxy && a2enmod proxy_http && a2enmod ssl

CHILATE=$(getent hosts chilate | awk '{print $1}')
COMPRAS=$(getent hosts compras | awk '{print $1}')

echo -e "
<VirtualHost *:80>
  ServerName www.chilate.com
  ProxyPass / http://${CHILATE}:80/
  ProxyPassReverse / http://${CHILATE}:80/
</VirtualHost>
<IfModule mod_ssl.c>
  <VirtualHost *:443>
      ServerName www.chilate.com.
      SSLProxyEngine on
      SSLProxyVerify none
      SSLProxyCheckPeerCN off
      SSLProxyCheckPeerName off
      SSLProxyCheckPeerExpire off
      SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
      SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
      ProxyPass /compras https://${COMPRAS}:443/
      ProxyPassReverse /compras https://${COMPRAS}:443/
  </VirtualHost>
</IfModule>
" > /etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump
