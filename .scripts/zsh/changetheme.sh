#!/usr/bin/env bash

LIBRARYS=(
  animation signal cursor colors stat
)

LIBRARY_PATH="${HOME}/.scripts/library"

for LIBRARY in ${LIBRARYS[@]}; do
  source ${LIBRARY_PATH}/${LIBRARY}.sh
done

ZSH_CUSTOM_THEME_DIR="${HOME}/.oh-my-zsh/custom/themes"
INDEX_LOOP=1

THEME_USED_PATH="${HOME}/.config/mytermux/zsh"
THEME_USED_FILE_NAME="used.log"
THEME_USED="$(cat ${THEME_USED_PATH}/${THEME_USED_FILE_NAME})"

ZSH_CONFIGURATION_PATH="${HOME}/.zshrc"
ZSH_CONFIGURATION_THEME_USED="$(echo ${THEME_USED} | sed 's/.zsh-theme//g')"

function banner() {

  echo -e "
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m   ____  __          __  ___         _____  _____ __  __
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m  / __ \/ /_        /  |/  /_  __   /__  / / ___// / / /
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m / / / / __ \______/ /|_/ / / / /_____/ /  \__ \/ /_/ / 
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m/ /_/ / / / /_____/ /  / / /_/ /_____/ /_____/ / __  /  
\e[3$(( $RANDOM * 6 / 32767 + 1 ))m\____/_/ /_/     /_/  /_/\__, /     /____/____/_/ /_/   
\e[9$(( $RANDOM * 6 / 32767 + 1 ))m                        /____/                            
${COLOR_BASED}\n"

}

function listZshTheme() {

  clear
  setCursor off
  banner
  printf " %3s  %10s                              %4s\n\n" "No." "List Theme" "Status"

  for ZSHTHEME in ${ZSH_CUSTOM_THEME_DIR}/*; do

    ZSHTHEME_FILE_NAME[INDEX_LOOP]=$( echo ${ZSHTHEME} | awk -F'/' '{print $NF}')
    ZSHTHEME_LIST_NAME[INDEX_LOOP]=$( echo ${ZSHTHEME} | awk -F'/' '{print $NF}' | sed "s/.zsh-theme//g")

    if [ "${THEME_USED}" == "${ZSHTHEME_FILE_NAME[INDEX_LOOP]}" ]; then

      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  ${COLOR_SUCCESS}%-23s -->${COLOR_BASED} \
             ${COLOR_SUCCESS}%-4s${COLOR_BASED}\n" ${INDEX_LOOP} ${ZSHTHEME_LIST_NAME[INDEX_LOOP]} "USED"

    else

      printf "[${COLOR_WARNING}%2s${COLOR_BASED}]  %-23s\n" ${INDEX_LOOP} ${ZSHTHEME_LIST_NAME[INDEX_LOOP]}

    fi

    INDEX_LOOP=$(( ${INDEX_LOOP} + 1 ));

  done

  INDEX_LOOP=$(( ${INDEX_LOOP} - 1 ));

  echo ""

}

function selectZshTheme() {

  setCursor on

  while :; do

    read -p "Select ZSH theme: " INDEX_THEME

    if [ -z "${INDEX_THEME}" ]; then

      break;

    elif ! [[ ${INDEX_THEME} =~ ^[1-9]+$ ]]; then

      stat "ERROR" "Danger" "Unknown '${COLOR_DANGER}number${COLOR_BASED}', please enter the right number!\n"

    elif (( ${INDEX_THEME} >= 0 && ${INDEX_THEME} <= ${INDEX_LOOP} )); then

      eval CHOICE=${ZSHTHEME_LIST_NAME[INDEX_THEME]}

      start_animation "Applying Theme ..."
      sleep 1s

      if sed -i "s/ZSH_THEME=\"${ZSH_CONFIGURATION_THEME_USED}\"/ZSH_THEME=\"${CHOICE}\"/g" ${ZSH_CONFIGURATION_PATH}; then

        if [ ! -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          echo -e "${ZSHTHEME_FILE_NAME[INDEX_THEME]}" >> ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

        elif [ -f ${THEME_USED_PATH}/${THEME_USED_FILE_NAME} ]; then

          sed -i "s/${THEME_USED}/${ZSHTHEME_FILE_NAME[INDEX_THEME]}/g" ${THEME_USED_PATH}/${THEME_USED_FILE_NAME}

        fi

        stop_animation $?

        echo ""

        stat "INFO" "Success" "Please run '${COLOR_SUCCESS}refresh${COLOR_BASED}' or '${COLOR_SUCCESS}source ~/.zshrc${COLOR_BASED}' to apply theme!\n"

        # source ${ZSH_CONFIGURATION_PATH}

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

  listZshTheme
  selectZshTheme

}

main
