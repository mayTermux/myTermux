#!/usr/bin/env bash

function screenSize() {

  REQUIRE_COLS=101
  REQUIRE_ROWS=39

  CURRENT_COLS=$(echo $COLUMNS)
  CURRENT_ROWS=$(echo $LINES)

  if [[ -n ${CURRENT_COLS} && -n ${CURRENT_ROWS} ]]; then
    
    if (( ${CURRENT_COLS} >= ${REQUIRE_COLS} & ${CURRENT_ROWS} >= ${REQUIRE_ROWS} )); then

      ${1}
    
    else

      stat "INFO" "Warning" "Your Screen Size
               Column: '${COLOR_WARNING}${CURRENT_COLS}${COLOR_BASED}'
               Lines : '${COLOR_WARNING}${CURRENT_ROWS}${COLOR_BASED}'
      "

      stat "INFO" "Success" "Require Screen Size
               Column: '${COLOR_SUCCESS}${REQUIRE_COLS}${COLOR_BASED}'
               Lines : '${COLOR_SUCCESS}${REQUIRE_ROWS}${COLOR_BASED}'
      "

      stat "ERROR" "Danger" "Please '${COLOR_WARNING}Zoom Out${COLOR_BASED}' your Terminal Screen! then run again."

    fi

  else

    stat "INFO" "Warning" "Can't get number '${COLOR_WARNING}COLUMNS${COLOR_BASED} & ${COLOR_WARNING}LINES${COLOR_BASED}' your terminal screen size
    "

    stat "ERROR" "Danger" "Please run '${COLOR_WARNING}export COLUMNS LINES${COLOR_BASED}' first and then run again."

  fi

}
