#!/usr/bin/env bash

function screenSize() {

  COLS=$(echo $COLUMNS)
  ROWS=$(echo $LINES)

  if [[ -n ${COLS} && -n ${ROWS} ]]; then
    
    if (( ${COLS} >= 101 & ${ROWS} >= 39 )); then

      ${1}
    
    else

      echo -e "[ ${COLOR_WARNING}ERROR${COLOR_BASED} ] > Please ${COLOR_WARNING}zoom out${COLOR_BASED} your Terminal Screen!"

    fi

  else

    echo -e "[ ${COLOR_DANGER}ERROR${COLOR_BASED} ] > Please run '${COLOR_WARNING}export COLUMNS LINES${COLOR_BASED}' first and then run again!"

  fi

}