#!/usr/bin/env bash

PATH_DIRECTORY_WHEN_TAKE_SCREENSHOT="/sdcard/Pictures/Screenshots"

COUNT=1

function autorun() {

  clear

  header

  title "?" "WAITING TO TAKE SCREENSHOT [${COLOR_WARNING}${COUNT}${COLOR_SKY}]"

  inotifywait -m -e create ${PATH_DIRECTORY_WHEN_TAKE_SCREENSHOT} 2> /dev/null | \

    while read GET_FILENAME_WHEN_TAKE_SCREENSHOT; do

      printf "%-45s" "*******[+]*Execute*Program*" | sed 's/ /./g' | sed 's/*/ /g'

      GET_FILENAME=$(echo -e "${GET_FILENAME_WHEN_TAKE_SCREENSHOT}" | awk '{print $3}')
      FULL_PATH_FILENAME="${PATH_DIRECTORY_WHEN_TAKE_SCREENSHOT}/${GET_FILENAME}"

      echo -e ""

      title "+" "BACKUP"

      backupOriginalPhoto ${FULL_PATH_FILENAME} ${GET_FILENAME}

      title "+" "CONVERTING"

      rounded ${FULL_PATH_FILENAME}
      shadow ${FULL_PATH_FILENAME}
      border ${FULL_PATH_FILENAME}
      footer ${FULL_PATH_FILENAME}

      termux-open ${FULL_PATH_FILENAME}

      COUNT=$(( ${COUNT} + 1 ))

      title "?" "WAITING TO TAKE SCREENSHOT [${COLOR_WARNING}${COUNT}${COLOR_SKY}]"

    done

}
