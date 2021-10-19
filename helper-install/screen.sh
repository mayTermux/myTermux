#!/usr/bin/env bash

COLS=$(echo $COLUMNS)
ROWS=$(echo $LINES)

function screenSize() {

  if [[ -n ${COLS} && -n ${ROWS} ]]; then

    if (( ${COLS} >= 101 & ${ROWS} >= 39 )); then

      ${1}

    elif (( ${COLS} <= 101 & ${ROWS} <= 42 )); then

      stat "ERROR" "Warning" "Please zoom out your Terminal Screen!"

    else

      stat "ERROR" "Danger" "Unknown ERROR!!!"

    fi

  else

    stat "ERROR" "Danger" "Please run 'export COLUMNS LINES' first and then run again!"
  
  fi

}