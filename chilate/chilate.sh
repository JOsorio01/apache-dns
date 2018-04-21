#! /bin/bash
/etc/init.d/apache2 restart
mkdir /var/www/chilate.com/
mkdir /var/www/chilate.com/public_html
echo -e "
<html>
  <head>
    <title>Chilate.com</title>
  </head>
  <body>
    <h1>Pagina de inicio: Chilate.com</h1>
  </body>
</html>
" > /var/www/chilate.com/public_html/index.html

echo -e "
<VirtualHost *:80>
  ServerAdmin joseosorio001@outlook.compras
  ServerName www.chilate.com.
  ServerAlias www.chilate.com
  DocumentRoot /var/www/chilate.com/public_html/
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" >> /etc/apache2/sites-enabled/chilate.conf
a2dissite 000-default.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump
