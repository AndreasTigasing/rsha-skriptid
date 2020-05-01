#kotrollib kas php on installed
PHP=$(dpkg-query -W -f="${status}" php7.0 2>/dev/null | grep -c "ok installed")
#kui võrdub 0 siis ei ole paigaldatud ja nnab teda et hakkab installida
if [ $PHP -eq 0 ]; then
echo "Php paigaldamine ja lisad"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "php on paigaldatud"
which php
#Kui on 1 siis on installed php
elif [ $PHP -eq 1]; then
echo "php on paigaldatud"
which php
#lõpp
fi
