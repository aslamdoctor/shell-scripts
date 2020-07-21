#!/bin/sh

alias startgulp="git clone git@github.com:aslamdoctor/gulp-boilerplate.git ./dev"

killport () {
   sudo fuser -n tcp -k $1
   echo "Stopped port : $1"
   return 10
}
