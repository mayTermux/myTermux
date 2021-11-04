#!/usr/bin/env bash

FOOTER_TEXT=" Shot by Awesomeshot"
FOOTER_POSITION="South"
FOOTER_XY="+0+20"
FOOTER_FONT="JetBrains-Mono-Medium-Nerd-Font-Complete"
FOOTER_FONT_SIZE="20"
FOOTER_FOREGROUND_COLOR="#000000"
FOOTER_BACKGROUND_COLOR="none"

function footer() {

  FILENAME="${1}"

  printf "%-45s" "*******[+]*Set*Image*Footer*" | sed 's/ /./g' | sed 's/*/ /g'

  echo -n "${FOOTER_TEXT}" |
  convert ${FILENAME} \
    -gravity ${FOOTER_POSITION} \
    -pointsize ${FOOTER_FONT_SIZE} \
    -fill ${FOOTER_FOREGROUND_COLOR} \
    -undercolor ${FOOTER_BACKGROUND_COLOR} \
    -font ${FOOTER_FONT} \
    -annotate ${FOOTER_XY} \
    @- ${FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1

  check

}
