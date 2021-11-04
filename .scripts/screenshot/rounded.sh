#!/usr/bin/env bash

BORDER_RADIUS="15"

function rounded() {

  FILENAME="${1}"

  printf "%-45s" "*******[+]*Set*Rounded*Corner*" | sed 's/ /./g' | sed 's/*/ /g'

  convert ${FILENAME} \
    \( +clone -alpha extract -draw \
      "fill black polygon 0,0,0,${BORDER_RADIUS} ${BORDER_RADIUS},0 fill white circle ${BORDER_RADIUS},${BORDER_RADIUS},${BORDER_RADIUS},0" \
      \( +clone -flip \) -compose Multiply -composite \
      \( +clone -flop \) -compose Multiply -composite \
    \) \
    -alpha off -compose CopyOpacity -composite ${FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1
    check

}
