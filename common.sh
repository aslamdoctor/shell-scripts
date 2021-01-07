#!/bin/sh

alias foldersize="sudo du -sh ./"
alias dirstat="ncdu"
alias vpnup="nmcli con up $1"
alias vpndown="nmcli con down $1"

newboilerplate(){
   git clone git@github.com:aslamdoctor/boilerplate.git ./$1
   code ./$1
   exit
}

newgulp(){
#   mkdir ./$1
#   cd ./$1
   git clone git@github.com:aslamdoctor/gulp-boilerplate.git ./dev
   code ./
   exit
}

killport() {
   sudo fuser -n tcp -k $1
   echo "Stopped port : $1"
   return 10
}

codeblvnk(){
   code ~/www/blvnk_new/server && code ~/www/blvnk_new/client
   exit
}

zipalldir(){
   for i in *
   do
      [ -d "$i" ] && zip -r "$i.zip" "$i"
   done
}

gitac(){
   git add .
   git commit -m "$1"
}

gitacp(){
   git add .
   git commit -m "$1"
   git push $2
}

mkv2mp4(){
   ffmpeg -i $1 -codec copy $2
}

moveallimages(){
	find ./ -name '*.jpg' -exec mv -if '{}' ./ \;
	find ./ -name '*.png' -exec mv -if '{}' ./ \;
	find ./ -name '*.svg' -exec mv -if '{}' ./ \;
	find ./ -name '*.gif' -exec mv -if '{}' ./ \;
}




