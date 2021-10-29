#!/usr/bin/env bash

function stat() {

  if [ "${2}" == "Success" ]; then

    echo -e "    [ ${COLOR_SUCCESS}${1}${COLOR_BASED} ] > ${3}"

  elif [ "${2}" == "Warning" ]; then

    echo -e "    [ ${COLOR_WARNING}${1}${COLOR_BASED} ] > ${3}"

  elif [ "${2}" == "Danger" ]; then

    echo -e "    [ ${COLOR_DANGER}${1}${COLOR_BASED} ] > ${3}"

  fi
  
}