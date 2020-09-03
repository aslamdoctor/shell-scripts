#! /bin/bash

# Apache 
alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"
alias restartapache="sudo service apache2 restart"
alias reloadapache="sudo service apache2 reload"

newapachehost(){
   sudo cp ~/shell-scripts/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
   sudo sed -i "s/boilerplate/$1/g" /etc/apache2/sites-available/$1.local.conf
   sudo a2ensite $1.local.conf && sudo service apache2 reload
   sudo -- sh -c "echo 127.0.0.1    $1.local >> /etc/hosts"
}

# MySQL
alias startmysql="sudo service mysql start"
alias stopmysql="sudo service mysql stop"
alias restartmysql="sudo service mysql restart"

backupmysqldb(){
   mysqldump -u admin -padmin $1 > ./database.sql
}

restoremysqldb(){
   mysql -u admin -padmin -e "CREATE DATABASE IF NOT EXISTS $1"
   mysql -u admin -padmin $1 < ./database.sql
}

alias startlamp="sudo service mysql start | sudo service apache2 start"
alias stoplamp="sudo service mysql stop | sudo service apache2 stop"

# MongoDB
alias startmongodb="sudo service mongodb start"
alias stopmongodb="sudo service mongodb stop"
alias restartmongodb="sudo service mongodb restart"

# Nginx
alias startnginx="sudo service nginx start"
alias stopnginx="sudo service nginx stop"
alias restartnginx="sudo service nginx restart"
alias reloadnginx="sudo service nginx reload"



