#kontrollib kas apache on olemas ja kui ei ole siis installib
APACHE2=$(dpkg-query -W -f="${Status}" apache2 2>/dev/null | grep -c "ok installed")
if [ $APACHE2 -eq 0 ]; then
echo "Paigaldame apache2"
apt install apache2
echo "Apache on paigaldatud"
service apache2 start
elif [ $APACHE2 -eq 1 ]; then
echo "Apache on seadme juba olemas"
service apache2 start
fi
#kontrollib kas mysql on olemas, kui ei ole siis installib
MYSQL=$(dpkg-query -W -f="${status}" mysql-server 2>/dev/null | grep -c "ok installed")
echo "paigaldame teenuse ja lisad"
apt install mysql-server
echo "mysql on paigaldatud"
touch $HOME/.my.cnf
echo "[client]" >> $HOME/.my.cnf
echo "host = localhost" >> $HOME/.my.cnf
echo "user = root" >> $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf
echo "mysql-server on paigaldatud"
#kontrollib kas php on olemas, kui ei ole siis installib
PHP=$(dpkg-query -W -f="${status}" php7.0 2>/dev/null | grep -c "ok installed")
if [ $PHP -eq 0 ]; then
echo "Php paigaldamine ja lisad"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "php on paigaldatud"
which php
elif [ $PHP -eq 1]; then
echo "php on paigaldatud"
which php
fi
#installib wordpressi
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
mv wordpress /var/www/html
#teeb andmebaasi
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL andmebaas ja kasutaja loodud"
#Lõpp
