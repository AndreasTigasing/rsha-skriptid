#kontrollib kas phpmyadmin on installed
PMA=$(dpkg-query -W -f="${status}" phpmyadmin 2>/dev/null | grep -c "ok installed")
#kui PMA on 0 siis annab teada ja installib
if [ $PMA -eq 0 ]; then
echo "Paigaldame phpmyadmin ja vajalikud lisad"
apt install phpmyadmin
echo "phpmyadmin on paigaldatud"
#kui PMA on 1 siis annab teada, et see on olemas
echo "phpmyadmin on juba paigaldatud"
#lõpp
fi
