#!/usr/bin/env bash

function handleInterruptByUser() {

  pkill com.termux

  echo -e "
    \n    ${COLOR_BASED}[ ${COLOR_WARNING}ERROR${COLOR_BASED} ] > ${COLOR_DANGER}${1}${COLOR_BASED}\n"
  
  setCursor on

  read -n 1 -s -r -p "    Press any key to exit "

  exit 1

}