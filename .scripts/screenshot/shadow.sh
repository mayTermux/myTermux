#!/usr/bin/env bash

SHADOW_COLOR="#000000"
SHADOW_SIZE="80x10+0+10"

function shadow() {

  FILENAME="${1}"

  printf "%-45s" "*******[+]*Set*Image*Shadow*" | sed 's/ /./g' | sed 's/*/ /g'

  convert ${FILENAME} \
    \( \
      +clone \
      -background "${SHADOW_COLOR}" \
      -shadow ${SHADOW_SIZE} \
    \) \
    +swap \
    -background none \
    -layers merge \
    +repage ${FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1

  check

}
