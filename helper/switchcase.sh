#!/usr/bin/env bash

function switchCase() {

  setCursor on

  read -p "    ${1} ${2}? [Y/n] " SWITCH_CASE

  case "$SWITCH_CASE" in

    "" )
      ${3}
    ;;

    y|Y )
      ${3}
    ;;

    n|N )
      stat "ERROR" "Warning" "Abort."
    ;;

    * )
      stat "ERROR" "Warning" "Unknown '${SWITCH_CASE}'"
      switchCase ${1} ${2} ${3}
    ;;

  esac

}