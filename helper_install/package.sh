#!/usr/bin/env bash

PACKAGES=(
  bat curl clang exa git imagemagick
  inotify-tools lf mpd mpc neovim
  neofetch termux-api tmux zsh
)

function packages() {

  setCursor off

  echo -e "‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Packages"
  echo -e "
    ╭─────────────────────────────────────────────────────────────────────────────────────╮
    ┃                                 Information Packages                                ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯
    ┃      Package Name     ┃        Version       ┃     Download     ┃     Installed     ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯"

  for PACKAGE in "${PACKAGES[@]}"; do

    PACKAGE_NAME=$(apt show $PACKAGE 2> /dev/null | grep Package: | awk '{print $2}')
    VERSION=$(apt show $PACKAGE 2> /dev/null | grep Version: | awk '{print $2}')
    DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2$3}')
    INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2$3}')
    printf "    ┃      ${COLOR_SUCCESS}%-13s${COLOR_BASED}    ▎     ${COLOR_WARNING}%10s${COLOR_BASED}       ▎      ${COLOR_WARNING}%6s${COLOR_BASED}       ▎      ${COLOR_WARNING}%6s${COLOR_BASED}      ┃\n" $PACKAGE_NAME $VERSION $DOWNLOAD_SIZE $INSTALLED_SIZE

  done

  echo -e "    ╰─────────────────────────────────────────────────────────────────────────────────────╯
  "

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