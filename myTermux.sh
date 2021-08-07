#!/usr/bin/env bash

source $(pwd)/.functions.sh
source $(pwd)/.variables.sh

function about() {
  echo -e "myTermux is my personal beutiful setup (xShin), including:
* Color Scheme
* Text Editor
* Plugins
* And more tools like awesomeshot
"
  echo -e "myTermux ${COLOR_WARNING}v.0.5.0-dev${COLOR_BASED}"
}

function version() {
  echo -e "
  Version: myTermux $VERSION
  Build Date: $BUILD_DATE
  Author: $AUTHOR
  "
}

function help() {
  echo -e "
    usage ./myTermux.sh [${COLOR_WARNING}options${COLOR_BASED}] \n
    OPTIONS:
    -a, --about            Print about myTermux
    -h, --help             Print help to use the script
    -v, --version          Show myTermux version
  "
}

case $1 in

  -a|--about )
    about
  ;;

  -h|--help )
    help
  ;;

  -v|--version )
    version
  ;;

  "" )
    help
  ;;

esac