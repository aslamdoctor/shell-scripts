#! /bin/bash

alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"
alias restartapache="sudo service apache2 restart"
alias reloadapache="sudo service apache2 reload"

function newapachehost() {
	cp /etc/apache2/sites-available/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
        ln -s  /etc/apache2/sites-available/$1.local.conf
        nano /etc/apache2/sites-available/$1.local.conf
}
