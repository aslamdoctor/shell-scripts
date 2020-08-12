#!/bin/sh

alias startboilerplate="git clone git@github.com:aslamdoctor/boilerplate.git"
alias startgulp="git clone git@github.com:aslamdoctor/gulp-boilerplate.git ./dev"
alias foldersize="sudo du -sh ./"
alias dirstat="ncdu"


killport () {
   sudo fuser -n tcp -k $1
   echo "Stopped port : $1"
   return 10
}

codeblvnk (){
   cd ~/www/blvnk_new
   code ./client
   code ./server
}

zipalldir(){
   for i in *
   do
      [ -d "$i" ] && zip -r "$i.zip" "$i"
   done
}

gitaddcommit(){
   git add .
   git commit -m "$1"
}

mkv2mp4(){
   ffmpeg -i $1 -codec copy $2
}
