# Installation Steps

```
cd ~/
git clone git@github.com:aslamdoctor/shell-scripts.git
nano ~/.zshrc
```

Add below code inside the .bashrc or .zshrc file and save it

```
source ~/shell-scripts/common.sh
source ~/shell-scripts/server.sh
```

And finally run below command to update shell

```
source ~/.zshrc
```

# Apache

`startapache` - To start apache server

`stopapache` - To stop apache server

`restartapache` - To restart apache server

`reloadapache` - To reload apache server

`newapachehost hostname` - To create new host on apache server and add it to hosts file aswell. e.g. `newapachehost mywebsite` will make "mywebsite.local" url available and will create a folder called "mywebsite" inside ~/www folder. Make sure you don't delete "boilerplate.local.conf" in this repo.

# MySQL

`startmysql` - To start mysql server

`stopmysql` - To stop mysql server

`restartmysql` - To restart mysql server

`backupmysqldb dbname` - To create "database.sql" backup file specific database. please note that mysql username and password is written inside server.sh file so change it according to your needs.

`restoremysqldb dbname` - To restore database from existing "database.sql" backup file. please note that mysql username and password is written inside server.sh file so change it according to your needs.

`startlamp` - To start apache & mysql server

`stoplamp` - To stop apache & mysql server

# Nginx

`startnginx` - To start nginx server

`stopnginx` - To stop nginx server

`restartnginx` - To restart nginx server

`reloadnginx` - To reload nginx server

# Mongodb

`startmongodb` - To start mongodb server

`stopmongodb` - To stop mongodb server

`restartmongodb` - To restart mongodb server

# Common Scripts

`newboilerplate` - To clone my wordpress boilerplate repo from https://github.com/aslamdoctor/boilerplate. It also opens the project in VSCode

`newgulp` - To clone my gulp project repo from https://github.com/aslamdoctor/gulp-boilerplate. It also opens the project in VSCode

`killport portnumber` - To kill project on specific port number

`zipalldir` - To zip all the folders into current location into separate zip files

`foldersize` - To show folder size of the current location into user friendly units

`dirstat` - Runs the `ncdu` utility to check all folder sizes and allow to browse them from terminal only. The purpose of this utility is similar to "Windirstat" utility in windows. Make sure you have install `ncdu` on your system. For ubuntu, its `sudo apt install ncdu`.

`gitac "You commit message"` - Runs `git add` and then `git commit` command at once

`gitacp "You commit message" remote_repo` - Runs `git add`, `git commit` and `git push` command at once. e.g. `gitacp "Initial commit" origin`.
