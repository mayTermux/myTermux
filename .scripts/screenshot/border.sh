#!/usr/bin/env bash

BORDER_COLOR="#A8D7FE"
BORDER_SIZE=35

function border() {

  FILENAME="${1}"

  printf "%-45s" "*******[+]*Set*Image*Border*Color*" | sed 's/ /./g' | sed 's/*/ /g'

  convert ${FILENAME} -bordercolor "${BORDER_COLOR}" -border ${BORDER_SIZE} ${FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1
  check

}
