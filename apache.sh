#! /bin/bash

alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"
alias restartapache="sudo service apache2 restart"
alias reloadapache="sudo service apache2 reload"

function newapachehost() {
	sudo cp /etc/apache2/sites-available/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
        sudo ln -s  /etc/apache2/sites-available/$1.local.conf /etc/apache2/sites-enabled/$1.local.conf
        sudo nano /etc/apache2/sites-available/$1.local.conf
	echo "Success!! Restart apache server and add the site to hosts file."
}
