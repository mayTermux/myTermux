#!/usr/bin/env bash

LIBRARYS=(
  animation signal cursor colors stat
)

LIBRARY_PATH="${HOME}/.scripts/library"

for LIBRARY in ${LIBRARYS[@]}; do
  source ${LIBRARY_PATH}/${LIBRARY}.sh
done

COLORSCHEMES_DIR="$HOME/.colorscheme"
INDEX_LOOP=0

THEME_USED_PATH="${HOME}/.config/mytermux/colorscheme"
THEME_USED_FILE_NAME="used.log"
THEME_USED="$(cat ${THEME_USED_PATH}/${THEME_USED_FILE_NAME})"

TERMUX_CONFIGURATION_PATH="${HOME}/.termux"
TERMUX_CONFIGURATION_COLOR_FILE_NAME="colors.properties"

function banner() {
    echo -e "
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _______      _                       _                         
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m(_______)    | |                     | |                        
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _       ___ | | ___   ____ ___  ____| |__  _____ ____  _____   
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m| |     / _ \| |/ _ \ / ___)___)/ ___)  _ \| ___ |    \| ___ |  
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m| |____| |_| | | |_| | |  |___ ( (___| | | | ____| | | | ____|  
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m \______)___/ \_)___/|_|  (___/ \____)_| |_|_____)_|_|_|_____)
${COLOR_BASED}\n"
}

function listColorScheme() {

  clear
  setCursor off
  banner
  printf " %3s  %10s                              %4s\n\n" "No." "List Color" "Status"

  for COLORSCHEME in ${COLORSCHEMES_DIR}/*; do

    COLORSCHEME_FILE_NAME[INDEX_LOOP]=$( echo ${COLORSCHEME} | awk -F'/' '{print $NF}')
    COLORSCHEME_LIST_NAME[INDEX_LOOP]=$( echo ${COLORSCHEME} | awk -F'/' '{print $NF}' | sed "s/.colors//g")

    if [ "${THEME_USED}" == "${COLORSCHEME_FILE_NAME[INDEX_LOOP]}" ]; then

      printf "[${COLOR_SUCCESS}%2s${COLOR_BASED}]  ${COLOR_SUCCESS}%-23s -->${COLOR_BASED} \
             ${COLOR_SUCCESS}%-4s${COLOR_BASED}\n" ${INDEX_LOOP} ${COLORSCHEME_LIST_NAME[INDEX_LOOP]} "USED"

    else

      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  %-23s\n" ${INDEX_LOOP} ${COLORSCHEME_LIST_NAME[INDEX_LOOP]}

    fi

    INDEX_LOOP=$(( ${INDEX_LOOP} + 1 ));

  done

  INDEX_LOOP=$(( ${INDEX_LOOP} - 1 ));

  echo ""

}

function selectTheme() {

  setCursor on

  while :; do

    read -p "Select theme: " INDEX_THEME

    if [ -z "${INDEX_THEME}" ]; then

      break;

    elif ! [[ ${INDEX_THEME} =~ ^[0-9]+$ ]]; then

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    elif (( ${INDEX_THEME} >= 0 && ${INDEX_THEME} <= ${INDEX_LOOP} )); then

      eval CHOICE=${COLORSCHEME_FILE_NAME[INDEX_THEME]}

      start_animation "Applying Theme ..."
      sleep 1s

      if cp -fr "${COLORSCHEMES_DIR}/${CHOICE}" "${TERMUX_CONFIGURATION_PATH}/${TERMUX_CONFIGURATION_COLOR_FILE_NAME}"; then

        termux-reload-settings

        if [ ! -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          echo -e "${CHOICE}" >> ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

        elif [ -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          sed -i "s/${THEME_USED}/${CHOICE}/g" ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

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

  listColorScheme
  selectTheme

}

main
