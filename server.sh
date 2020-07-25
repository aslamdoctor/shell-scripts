#! /bin/bash

alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"
alias restartapache="sudo service apache2 restart"
alias reloadapache="sudo service apache2 reload"

alias startmysql="sudo service mysql start"
alias stopmysql="sudo service mysql stop"
alias restartmysql="sudo service mysql restart"

alias startmongodb="sudo service mongodb start"
alias stopmongodb="sudo service mongodb stop"
alias restartmongodb="sudo service mongodb restart"

alias startnginx="sudo service nginx start"
alias stopnginx="sudo service nginx stop"
alias restartnginx="sudo service nginx restart"
alias reloadnginx="sudo service nginx reload"

function newapachehost() {
        sudo cp /etc/apache2/sites-available/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
        sudo ln -s  /etc/apache2/sites-available/$1.local.conf
        sudo nano /etc/apache2/sites-available/$1.local.conf
}
