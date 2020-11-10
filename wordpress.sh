wpbp() {
	# clone repo
	cd ~/www
	git clone git@github.com:aslamdoctor/boilerplate.git $1
	cd ~/www/$1/database
	echo "==> git repo cloned 👍"
	
	# restore mysql db
	mysql -u admin -padmin -e "CREATE DATABASE IF NOT EXISTS $1"
	mysql -u admin -padmin $1 < ./database.sql
	echo "==> mysql database restored 👍"

	# update wp-config.php
	cd ..
	sed -i "s/boilerplate/$1/g" wp-config.php
	echo "==> updated wp-config.php file 👍"
	
	# do search-replace on db
	wp search-replace "http://boilerplate.local" "http://$1.local"
	echo "==> search-replace done on database 👍"
	
	# create vhost and host files
	sudo cp ~/shell-scripts/boilerplate.local.conf /etc/apache2/sites-available/$1.local.conf
	sudo sed -i "s/boilerplate/$1/g" /etc/apache2/sites-available/$1.local.conf
	sudo a2ensite $1.local.conf && sudo service apache2 reload
	sudo -- sh -c "echo 127.0.0.1    $1.local >> /etc/hosts"
	echo "==> created host files 👍"
	
	# open project in editor
	code .
	echo "==> Finish: All done 👍"
}

dropwpbp(){
	sudo rm -r ~/www/$1
	echo "==> removed ~/www/$1 👍"
	sudo a2dissite $1.local.conf
	sudo rm /etc/apache2/sites-available/$1.local.conf
	echo "==> removed /etc/apache2/sites-available/$1.local.conf 👍"
	mysqladmin -u admin -p drop $1
	echo "==> removed database $1 👍"
	sudo sed -i "/^127\.0\.0\.1[[:space:]]$1.local/d" /etc/hosts
	echo "==> removed from hosts file 👍"
}