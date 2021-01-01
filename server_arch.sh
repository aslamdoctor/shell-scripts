#! /bin/bash

# Apache 
alias startapache="sudo systemctl start httpd"
alias stopapache="sudo systemctl stop httpd"
alias restartapache="sudo systemctl restart httpd"

newapachehost(){
   host_string="<VirtualHost *:80>
    ServerAdmin webmaster@$1.local
    DocumentRoot \"/home/aslam/www/$1\"
    ServerName $1.local
    ServerAlias www.$1.local
    ErrorLog \"/var/log/httpd/$1.local-error_log\"
    CustomLog \"/var/log/httpd/$1.local-access_log\" common
</VirtualHost>"
   echo $host_string | sudo tee -a /etc/httpd/conf/extra/httpd-vhosts.conf
   sudo systemctl restart httpd
   sudo -- sh -c "echo 127.0.0.1    $1.local >> /etc/hosts"
   echo "Host created at http://$1.local"
}

# MySQL
alias startmysql="sudo systemctl start mysqld"
alias stopmysql="sudo systemctl stop mysqld"
alias restartmysql="sudo systemctl restart mysqld"

backupmysqldb(){
   mysqldump -u admin -padmin $1 > ./database.sql
}

restoremysqldb(){
   mysql -u admin -padmin -e "CREATE DATABASE IF NOT EXISTS $1"
   mysql -u admin -padmin $1 < ./database.sql
}

alias startlamp="sudo systemctl start mysqld | sudo systemctl start httpd"
alias stoplamp="sudo systemctl stop mysqld | sudo systemctl stop httpd"

# MongoDB
alias startmongodb="sudo systemctl start mongodb"
alias stopmongodb="sudo systemctl stop mongodb"
alias restartmongodb="sudo systemctl restart mongodb"

# Nginx
alias startnginx="sudo systemctl start nginx"
alias stopnginx="sudo systemctl stop nginx"
alias restartnginx="sudo systemctl restart nginx"



