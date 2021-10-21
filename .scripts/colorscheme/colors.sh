#!/usr/bin/env bash

source $HOME/.scripts/library/animation.sh
source $HOME/.scripts/library/signal.sh
source $HOME/.scripts/library/cursor.sh
COLORSCHEMES_DIR="$HOME/.colorscheme"
INDEX=0

COLOR_BASED="\e[39m"
COLOR_DANGER="\e[91m"
COLOR_WARNING="\e[93m"
COLOR_SUCCESS="\e[92m"
COLOR_SKY="\e[34m"

THEME_USED_PATH="${HOME}/.scripts/colorscheme/used.log"
THEME_USED="$(cat ${THEME_USED_PATH})"

function listColorScheme() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  clear
  setCursor off
  echo -e "
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _______      _                       _                         
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m(_______)    | |                     | |                        
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m _       ___ | | ___   ____ ___  ____| |__  _____ ____  _____   
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m| |     / _ \| |/ _ \ / ___)___)/ ___)  _ \| ___ |    \| ___ |  
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m| |____| |_| | | |_| | |  |___ ( (___| | | | ____| | | | ____|  
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m \______)___/ \_)___/|_|  (___/ \____)_| |_|_____)_|_|_|_____)
${COLOR_BASED}\n"
  printf " %3s  %10s                        %4s\n\n" "No." "List Color" "Status"
  for COLORSCHEME in "${COLORSCHEMES_DIR}"/*; do
    COLORSCHEME_NAME[INDEX]=$( echo ${COLORSCHEME} | awk -F'/' '{print $NF}')
    COLORSCHEME_NAME_LIST[INDEX]=$( echo ${COLORSCHEME} | awk -F'/' '{print $NF}' | sed "s/.colors//g")
    if [ "${THEME_USED}" == "${COLORSCHEME_NAME[INDEX]}" ]; then
      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  ${COLOR_SUCCESS}%-23s${COLOR_BASED}            ${COLOR_SUCCESS}%-4s${COLOR_BASED}\n" ${INDEX} ${COLORSCHEME_NAME_LIST[INDEX]} "USED"
    else
      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  %-23s\n" ${INDEX} ${COLORSCHEME_NAME_LIST[INDEX]}
    fi
    INDEX=$(( ${INDEX} + 1 ));
  done
  INDEX=$(( ${INDEX} - 1 ));
  echo ""
}

listColorScheme
setCursor on
while :; do
  read -p "Select theme: " INDEX_THEME
  if [ -z "${INDEX_THEME}" ]; then
    break;
  elif ! [[ ${INDEX_THEME} =~ ^[0-9]+$ ]]; then
    echo -e "[ ${COLOR_DANGER}ERROR${COLOR_BASED} ] Unknown number!\n"
  elif (( ${INDEX_THEME} >= 0 && ${INDEX_THEME} <= ${INDEX} )); then
    eval CHOICE=${COLORSCHEME_NAME[INDEX_THEME]}
    start_animation "Applying Theme ..."
    sleep 1s
    if cp -fr "${COLORSCHEMES_DIR}/${CHOICE}" "${HOME}/.termux/colors.properties"; then
      termux-reload-settings
      if [ ! -f ${THEME_USED_PATH} ]; then
        echo -e "${CHOICE}" >> ${THEME_USED_PATH}
      elif [ -f ${THEME_USED_PATH} ]; then
        rm ${THEME_USED_PATH}
        echo -e "${CHOICE}" >> ${THEME_USED_PATH}
      fi
      stop_animation $? || exit 1
    else
      stop_animation $?
    fi
    break 
  else
    echo -e "[ ${COLOR_DANGER}ERROR${COLOR_BASED} ] Unknown number!\n"
  fi
done
