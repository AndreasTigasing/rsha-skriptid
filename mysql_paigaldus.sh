#Kontrollib kas php server on installitud
MYSQL=$(dpkg-query -W -f="${status}" mysql-server 2>/dev/null | grep -c "ok installed")
#Kui on 0 siis ei ole installed ja annab teda et ta hakkab installima
echo "paigaldame teenuse ja lisad"
apt install mysql-server
echo "mysql on paigaldatud"
#lisame kasutaja
touch $HOME/.my.cnf #lisab konfi failid kasutaja kodukausta
echo "[client]" >> $HOME/.my.cnf
echo "host = localhost" >> $HOME/.my.cnf
echo "user = root" >> $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf
#kui on 1 siis annab teada et on paigaldatud
echo "mysql-server on paigaldatud"
mysql
#lõpp
fi
