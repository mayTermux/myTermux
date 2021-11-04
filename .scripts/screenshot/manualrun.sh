#!/usr/bin/env bash

function manualrun() {

  FILENAME="${1}" 

  clear

  header

  title "?" "CHECKING FILE"

  printf "%-45s" "*******[+]*Status*File*" | sed 's/ /./g' | sed 's/*/ /g'

  if [ -f ${FILENAME} ]; then
  
    check

    title "+" "BACKUP"

    backupOriginalPhoto ${FILENAME} ${FILENAME}

    title "+" "CONVERTING"

    rounded ${FILENAME}
    shadow ${FILENAME}
    border ${FILENAME}
    footer ${FILENAME}
    echo -e ""
    setCursor on

    termux-open ${FILENAME}
    
  else

    stat "ERROR" "Danger" "\n\n    '${COLOR_DANGER}${FILENAME}${COLOR_BASED}' no such file!"
    setCursor on
    exit 1
    
  fi
}
