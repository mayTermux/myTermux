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
      stat "ERROR" "Warning" "${COLOR_DANGER}Abort.${COLOR_BASED}"
      exit 1
    ;;

    * )
      stat "ERROR" "Warning" "Unknown '${COLOR_DANGER}${SWITCH_CASE}${COLOR_BASED}'"
      switchCase ${1} ${2} ${3}
    ;;

  esac

}