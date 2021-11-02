#!/usr/bin/env bash

LIBRARYS=(
  animation signal cursor colors stat
)

LIBRARY_PATH="${HOME}/.scripts/library"

for LIBRARY in ${LIBRARYS[@]}; do
  source ${LIBRARY_PATH}/${LIBRARY}.sh
done

FONTS_DIR="${HOME}/.fonts"
INDEX_LOOP=0

FONT_USED_PATH="${HOME}/.config/mytermux/fonts"
FONT_USED_FILE_NAME="used.log"
FONT_USED="$(cat ${FONT_USED_PATH}/${FONT_USED_FILE_NAME})"

TERMUX_CONFIGURATION_PATH="${HOME}/.termux"
TERMUX_CONFIGURATION_FONT_FILE_NAME="font.ttf"

function banner() {

  echo -e "
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _______                    
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m(_______)          _        
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _____ ___  ____ _| |_  ___ 
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m|  ___) _ \|  _ (_   _)/___)
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m| |  | |_| | | | || |_|___ |
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m|_|   \___/|_| |_| \__|___/ 
${COLOR_BASED}\n"

}

function listFonts() {

  clear
  setCursor off
  banner
  printf " %3s  %9s                                   %4s\n\n" "No." "List Font" "Status"

  for FONT in ${FONTS_DIR}/{*.ttf,*.otf}; do

    FONT_FILE_NAME[INDEX_LOOP]=$( echo ${FONT} | awk -F'/' '{print $NF}')
    FONT_LIST_NAME[INDEX_LOOP]=$( echo ${FONT} | awk -F'/' '{print $NF}' | sed "s/.ttf//g" | sed "s/.otf//g")

    if [ "${FONT_USED}" == "${FONT_FILE_NAME[INDEX_LOOP]}" ]; then

      printf "[${COLOR_SUCCESS}%2s${COLOR_BASED}]  ${COLOR_SUCCESS}%b %-s %b %b % b %b${COLOR_BASED}   ${COLOR_SUCCESS}%-4s${COLOR_BASED}\n" ${INDEX_LOOP} ${FONT_LIST_NAME[INDEX_LOOP]} "--> USED"

    else

      echo -e "[ ${COLOR_WARNING}${INDEX_LOOP}${COLOR_BASED}]  ${FONT_LIST_NAME[INDEX_LOOP]}"

    fi

    INDEX_LOOP=$(( ${INDEX_LOOP} + 1 ));

  done

  INDEX_LOOP=$(( ${INDEX_LOOP} - 1 ));

  echo ""

}

function selectFont() {

  setCursor on

  while :; do

    read -p "Select font: " INDEX_FONT

    if [ -z "${INDEX_FONT}" ]; then

      break;

    elif ! [[ ${INDEX_FONT} =~ ^[0-9]+$ ]]; then

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    elif (( ${INDEX_FONT} >= 0 && ${INDEX_FONT} <= ${INDEX_LOOP} )); then

      start_animation "Applying Font ..."
      sleep 1s

      if cp -fr "${FONTS_DIR}/${FONT_FILE_NAME[INDEX_FONT]}" "${TERMUX_CONFIGURATION_PATH}/${TERMUX_CONFIGURATION_FONT_FILE_NAME}"; then

        termux-reload-settings

        if [ ! -f ${FONT_USED_PATH}/${FONT_USED_FILE_NAME} ]; then

          echo -e "${FONT_FILE_NAME[INDEX_FONT]}" >> ${FONT_USED_PATH}/${FONT_USED_FILE_NAME}

        elif [ -f ${FONT_USED_PATH}/${FONT_USED_FILE_NAME} ]; then

          sed -i "s/${FONT_USED}/${FONT_FILE_NAME[INDEX_FONT]}/g" ${FONT_USED_PATH}/${FONT_USED_FILE_NAME}

        fi

        stop_animation $? || exit 1

      else

        stop_animation $?

      fi

      break 

    else

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    fi

  done

}

function main() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  listFonts
  selectFont

}

main
