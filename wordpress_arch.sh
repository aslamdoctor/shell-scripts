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
	echo "==> created host files 👍"
	
	# delete .git repo folder as it is not needed on entire wordpress project
	sudo rm -r .git
	
	# open project in editor
	code .
	echo "==> Finish: All done 👍"
}

dropwpbp(){
	sudo rm -r ~/www/$1
	echo "==> removed ~/www/$1 👍"
	#sudo a2dissite $1.local.conf
	#sudo rm /etc/apache2/sites-available/$1.local.conf
	#echo "==> removed /etc/apache2/sites-available/$1.local.conf 👍"
	mysqladmin -u admin -p drop $1
	echo "==> removed database $1 👍"
	sudo sed -i "/^127\.0\.0\.1[[:space:]]$1.local/d" /etc/hosts
	echo "==> removed from hosts file 👍"

	echo "Please manually remove entry from Apache hosts file at  /etc/httpd/conf/extra/httpd-vhosts.conf"
}