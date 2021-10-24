#!/usr/bin/env bash

function stat() {

  if [ "${2}" == "Success" ]; then

    echo -e "    [ ${COLOR_WARNING}${1}${COLOR_BASED} ] > ${COLOR_SUCCESS}${3}${COLOR_BASED}"

  elif [ "${2}" == "Warning" ]; then

    echo -e "    [ ${COLOR_WARNING}${1}${COLOR_BASED} ] > ${COLOR_WARNING}${3}${COLOR_BASED}"

  elif [ "${2}" == "Danger" ]; then

    echo -e "    [ ${COLOR_WARNING}${1}${COLOR_BASED} ] > ${COLOR_DANGER}${3}${COLOR_BASED}"

  fi
  
}