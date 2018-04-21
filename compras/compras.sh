#! /bin/bash
/etc/init.d/apache2 start
mkdir /var/www/chilate.com
mkdir /var/www/chilate.com/compras
a2enmod ssl
echo -e "
<html>
  <head>
    <title>Compras</title>
  </head>
  <body>
    <h1>Chilate.com - Compras</h1>
    <h2>Página de compras accedida con https</h2>
  </body>
</html>
" > /var/www/chilate.com/compras/index.html
echo -e "
<IfModule mod_ssl.c>
  <VirtualHost _default_:443>
    ServerAdmin joseosorio001@outlook.com
    ServerName www.chilate.com.
    ServerAlias www.chilate.com/compras
    DocumentRoot /var/www/chilate.com/compras/
    SSLEngine on
    SSLProxyEngine on
    SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/ssl_access.log combined
  </VirtualHost>
</IfModule>
" >> /etc/apache2/sites-enabled/compras.conf
a2dissite 000-default.conf
a2dissite default-ssl.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump
