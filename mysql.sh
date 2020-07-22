#! /bin/bash

alias startmysql="sudo service mysql start"
alias stopmysql="sudo service mysql stop"
alias restartmysql="sudo service mysql restart"

backupmysqldb(){
   mysqldump -u admin -padmin $1 > ./database.sql
}

restoremysqldb(){
   mysql -u admin -padmin $1 < ./database.sql
}
