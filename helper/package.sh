#!/usr/bin/env bash

PACKAGES=(
  bat curl clang exa git imagemagick
  inotify-tools lf mpd mpc neovim
  neofetch termux-api tmux zsh
)

function packages() {

  setCursor off

  KB_DOWNLOAD_SIZE=0
  MB_DOWNLOAD_SIZE=0

  KB_INSTALLED_SIZE=0
  MB_INSTALLED_SIZE=0

  TOTAL_DOWNLOAD_SIZE=0
  TOTAL_INSTALLED_SIZE=0

  echo -e "‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Packages"
  # echo -e "
  #   ╭─────────────────────────────────────────────────────────────────────────────────────╮
  #   ┃                                 Information Packages                                ┃
  #   ╰─────────────────────────────────────────────────────────────────────────────────────╯
  #   ┃      Package Name     ┃        Version       ┃     Download     ┃     Installed     ┃
  #   ╰─────────────────────────────────────────────────────────────────────────────────────╯"
  echo -e "
    ╭─────────────────────────────────────────────────────────────────────────────────────╮
    ┃                                 Information Packages                                ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯
    ┃      Package Name              Version             Download           Installed     ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯"

  for PACKAGE in "${PACKAGES[@]}"; do

    PACKAGE_NAME=$(apt show $PACKAGE 2> /dev/null | grep Package: | awk '{print $2}')
    VERSION=$(apt show $PACKAGE 2> /dev/null | grep Version: | awk '{print $2}')

    DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2}')
    INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2}')

    UNIT_DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $3}')
    UNIT_INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $3}')

    printf "    ┃      ${COLOR_SUCCESS}%-13s${COLOR_BASED}          ${COLOR_WARNING}%10s${COLOR_BASED}              ${COLOR_WARNING}%-4s${COLOR_BASED} %-2s             ${COLOR_WARNING}%-4s${COLOR_BASED} %-2s     ┃\n" $PACKAGE_NAME $VERSION ${DOWNLOAD_SIZE} "${UNIT_DOWNLOAD_SIZE}" ${INSTALLED_SIZE} "${UNIT_INSTALLED_SIZE}"
    echo -e "    ╰─────────────────────────────────────────────────────────────────────────────────────╯"

    if [[ "${UNIT_DOWNLOAD_SIZE}" == "kB" && "${UNIT_INSTALLED_SIZE}" == "kB" ]]; then
      KB_DOWNLOAD_SIZE=$(echo -e "${KB_DOWNLOAD_SIZE}+${DOWNLOAD_SIZE}/1000" | bc )
      KB_INSTALLED_SIZE=$(echo -e "${KB_INSTALLED_SIZE}+${INSTALLED_SIZE}/1000" | bc )
    elif [[ "${UNIT_DOWNLOAD_SIZE}" == "MB" && "${UNIT_INSTALLED_SIZE}" == "MB" ]]; then
      MB_DOWNLOAD_SIZE=$(echo -e "${MB_DOWNLOAD_SIZE}+${DOWNLOAD_SIZE}" | bc )
      MB_INSTALLED_SIZE=$(echo -e "${MB_INSTALLED_SIZE}+${INSTALLED_SIZE}" | bc )
    fi

  done

  TOTAL_DOWNLOAD_SIZE=$(echo -e "${TOTAL_DOWNLOAD_SIZE}+${KB_DOWNLOAD_SIZE}+${MB_DOWNLOAD_SIZE}" | bc )
  TOTAL_INSTALLED_SIZE=$(echo -e "${TOTAL_INSTALLED_SIZE}+${KB_INSTALLED_SIZE}+${MB_INSTALLED_SIZE}" | bc )

  printf "    ┃     [ ${COLOR_WARNING}%5s${COLOR_BASED} ]                                     ${COLOR_WARNING}%6s${COLOR_BASED} %-2s          ${COLOR_WARNING}%6s${COLOR_BASED}  %-2s     ┃" "TOTAL" ${TOTAL_DOWNLOAD_SIZE} "MB" ${TOTAL_INSTALLED_SIZE} "MB"
  echo -e "\n    ╰─────────────────────────────────────────────────────────────────────────────────────╯"

  echo ""

}

function installPackages() {

  setCursor off

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Downloading Packages\n"

  for PACKAGE in "${PACKAGES[@]}"; do

    start_animation "       Installing ${COLOR_WARNING}'${COLOR_SUCCESS}${PACKAGE}${COLOR_WARNING}'${COLOR_BASED} ..."

    pkg i -y $PACKAGE &>/dev/null
    THIS_PACKAGE=$(pkg list-installed $PACKAGE 2> /dev/null | tail -n 1)
    CHECK_PACKAGE=${THIS_PACKAGE%/*}

    if [[ $CHECK_PACKAGE == $PACKAGE ]]; then

      stop_animation $? || exit 1

    else

      stop_animation $?

    fi

  done

  setCursor on

}
