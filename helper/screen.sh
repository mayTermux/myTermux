#!/usr/bin/env bash

function screenSize() {

  COLS=$(echo $COLUMNS)
  ROWS=$(echo $LINES)

  if [[ -n ${COLS} && -n ${ROWS} ]]; then
    
    if (( ${COLS} >= 101 & ${ROWS} >= 39 )); then

      ${1}
    
    else

      echo -e "[ ${COLOR_WARNING}INFO${COLOR_BASED} ]  > Your Screen Size
            Column: '${COLOR_WARNING}${COLS}${COLOR_BASED}'
            Lines : '${COLOR_WARNING}${ROWS}${COLOR_BASED}'
            "

      echo -e "[ ${COLOR_SUCCESS}INFO${COLOR_BASED} ]  > Require Screen Size
            Column: '${COLOR_SUCCESS}101${COLOR_BASED}'
            Lines : '${COLOR_SUCCESS}39${COLOR_BASED}'
            "

      echo -e "[ ${COLOR_WARNING}ERROR${COLOR_BASED} ] > Please ${COLOR_WARNING}zoom out${COLOR_BASED} your Terminal Screen!"

    fi

  else

    echo -e "[ ${COLOR_DANGER}ERROR${COLOR_BASED} ] > Please run '${COLOR_WARNING}export COLUMNS LINES${COLOR_BASED}' first and then run again!"

  fi

}
