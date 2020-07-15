alias startapache="sudo service apache2 start"
alias stopapache="sudo service apache2 stop"

function newapachehost() {
	sudo cp /etc/apache2/sites-available/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
        sudo ln -s  /etc/apache2/sites-available/$1.local.conf
        sudo nano /etc/apache2/sites-available/$1.local.conf
}
