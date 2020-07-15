#! /bin/bash

alias startgulp="git clone git@github.com:aslamdoctor/gulp-boilerplate.git ./dev"
alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"
alias startmysql="sudo service mysql start"
alias stopmysql="sudo service mysql stop"
alias startmongodb="sudo service mongodb start"
alias stopmongodb="sudo service mongodb stop"
alias startnginx="sudo service nginx start"
alias stopnginx="sudo service nginx stop"

function newapachehost() {
        sudo cp /etc/apache2/sites-available/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
        sudo ln -s  /etc/apache2/sites-available/$1.local.conf
        sudo nano /etc/apache2/sites-available/$1.local.conf
}
