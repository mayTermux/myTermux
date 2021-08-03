#!/usr/bin/env bash
#/data/data/com.termux/files/usr/bin/env bash

source $(pwd)/.variables.sh

function logDate() {
  echo -e "    [${COLOR_WARNING}$(date +'%A, %d %B %Y %r')${COLOR_BASED}] > $@"
}

function banner() {
    echo -e "\n${COLOR_SKY}
              ╭────────────────────────────────────────────────────────────────╮
              ┃                    ${COLOR_DANGER}_______${COLOR_SKY}                                     ┃
              ┃                   ${COLOR_DANGER}(_______)${COLOR_SKY}                                    ┃
              ┃           ${COLOR_BASED}____  _   _ ${COLOR_DANGER}_${COLOR_BASED} _____  ____ ____  _   _ _   _          ${COLOR_SKY}┃
              ┃          ${COLOR_BASED}|    \| | | ${COLOR_DANGER}| |${COLOR_BASED} ___ |/ ___)    \| | | ( \ / )         ${COLOR_SKY}┃
              ┃          ${COLOR_BASED}| | | | |_| ${COLOR_DANGER}| |${COLOR_BASED} ____| |   | | | | |_| |) X (          ${COLOR_SKY}┃
              ┃          ${COLOR_BASED}|_|_|_|\__  ${COLOR_DANGER}|_|${COLOR_BASED}_____)_|   |_|_|_|____/(_/ \_)         ${COLOR_SKY}┃
              ┃                ${COLOR_BASED}(____/                                          ${COLOR_SKY}┃
              ┃                                                                ┃
              ┃                  ${COLOR_BASED}🚀 Version    : ${VERSION}                     ${COLOR_SKY}┃
              ┃                  ${COLOR_BASED}📅 Build Date : ${BUILD_DATE}                ${COLOR_SKY}┃
              ┃                   ${COLOR_BASED}⚙️ Author     : ${AUTHOR}                         ${COLOR_SKY}┃
              ┃                                                                ┃
              ╰────────────────────────────────────────────────────────────────╯${COLOR_BASED}"
}

function informationPackages() {
  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Packages"
  sleep 2s
  echo -e "
    ╭─────────────────────────────────────────────────────────────────────────────────────╮
    ┃                                 Information Packages                                ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯
    ┃      Package Name     ┃        Version       ┃     Download     ┃     Installed     ┃
    ╰─────────────────────────────────────────────────────────────────────────────────────╯"
  for DEPENDENCY_PACKAGE in "${DEPENDENCY_PACKAGES[@]}"; do
    PACKAGE_NAME=$(apt show $DEPENDENCY_PACKAGE 2> /dev/null | grep Package: | awk '{print $2}')
    VERSION=$(apt show $DEPENDENCY_PACKAGE 2> /dev/null | grep Version: | awk '{print $2}')
    DOWNLOAD_SIZE=$(apt show $DEPENDENCY_PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2$3}')
    INSTALLED_SIZE=$(apt show $DEPENDENCY_PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2$3}')
    printf "    ┃      %-13s    ▎     %10s       ▎      %6s       ▎      %6s      ┃\n" $PACKAGE_NAME $VERSION $DOWNLOAD_SIZE $INSTALLED_SIZE
  done
  echo -e "    ╰─────────────────────────────────────────────────────────────────────────────────────╯
  "

  read -p "    Do you want to install the packages? [Y/n] " Ask

  case "$Ask" in
    "" )
      installDependencyPackages
      informationRepository
      cloneRepository
      dotFiles
      installDotFiles
    ;;
    y|Y )
      installDependencyPackages
      informationRepository
      cloneRepository
      dotFiles
      installDotFiles
    ;;
    n|N )
      echo -e "Abort."
    ;;
    * )
      logDate {${COLOR_DANGER}ERROR ANSWER${COLOR_BASED}}
      exit 1  
    ;;
  esac
}

function installDependencyPackages() {
  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Downloading Package\n"
  for DEPENDENCY_PACKAGE in "${DEPENDENCY_PACKAGES[@]}"; do
    logDate Installing $DEPENDENCY_PACKAGE ...
    pkg i -y $DEPENDENCY_PACKAGE &>/dev/null
    THIS_PACKAGE=$(pkg list-installed $DEPENDENCY_PACKAGE 2> /dev/null | tail -n 1)
    CHECK_PACKAGE=${THIS_PACKAGE%/*}
    if [[ $CHECK_PACKAGE == $DEPENDENCY_PACKAGE ]]; then
      logDate Status $DEPENDENCY_PACKAGE [${COLOR_SUCCESS}OK${COLOR_BASED}]
    else
      logDate Status $DEPENDENCY_PACKAGE [${COLOR_DANGER}FAIL${COLOR_BASED}]
    fi
    echo -e ""
  done
}

function changeSHELL() {
  chsh -s zsh
}

function OhMyZSH() {
  git clone git://github.com/${ZSH_REPOSITORY[0]} ${REPOSITORY_PATH[0]} &>/dev/null
  if [ -d ${REPOSITORY_PATH[0]} ]; then
    logDate [${COLOR_SUCCESS}OK${COLOR_BASED}]
  else
    logDate [${COLOR_DANGER}FAIL${COLOR_BASED}]
  fi
}

function pluginZSHHighlighting() {
  git clone git://github.com/${ZSH_REPOSITORY[1]} ${REPOSITORY_PATH[1]} &>/dev/null
  if [ -d ${REPOSITORY_PATH[1]} ]; then
    logDate [${COLOR_SUCCESS}OK${COLOR_BASED}]
  else
    logDate [${COLOR_DANGER}FAIL${COLOR_BASED}]
  fi
}

function pluginZSHAutosuggestion() {
  git clone git://github.com/${ZSH_REPOSITORY[2]} ${REPOSITORY_PATH[2]} &>/dev/null
  if [ -d ${REPOSITORY_PATH[2]} ]; then
    logDate [${COLOR_SUCCESS}OK${COLOR_BASED}]
  else
    logDate [${COLOR_DANGER}FAIL${COLOR_BASED}]
  fi
}

function repoSize() {
    echo "$(echo "scale=2
    $(curl https://api.github.com/$@ 2>/dev/null | grep size | head -1 | tr -dc '[:digit:]') / 1024" | bc)MB"
}

function informationRepository() {
    echo -e "‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Repository"
    sleep 2s
    echo -e "
    ╭────────────────────────────────────────────────────────────────────╮
    ┃                         Information Repository                     ┃
    ╰────────────────────────────────────────────────────────────────────╯
    ┃              Repository Name                 ┃    Repository Size  ┃
    ╰────────────────────────────────────────────────────────────────────╯"
    for REPOSITORY_API in "${REPOSITORY_APIS[@]}"; do
      # REPO_SIZE=$(echo "scale=2 $(curl https://api.github.com/repos/${ZSH_REPO} 2> /dev/null | grep size | head -1 | tr -dc '[:digit:]') / 1024" | bc) MB")
      # REPO_SIZE=`repoSize $ZSH_REPO`
      REPOSITORY_NAME=$(curl https://api.github.com/${REPOSITORY_API} 2> /dev/null | grep full_name | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g")
      printf "    ┃      %-36s     ▎      %8s      ┃\n" $REPOSITORY_NAME `repoSize $REPOSITORY_API`
    done
    echo "    ╰────────────────────────────────────────────────────────────────────╯"
}

function cloneRepository() {
  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Cloning or Downloading Repository\n"  
  sleep 2s
  for REPOSITORY_LINK in "${REPOSITORY_LINKS[@]}"; do
    logDate $REPOSITORY_LINK ...
    if [[ $CHECK_PACKAGE == $DEPENDENCY_PACKAGE ]]; then
      logDate Status $DEPENDENCY_PACKAGE [${COLOR_SUCCESS}OK${COLOR_BASED}]
    else
      logDate Status $DEPENDENCY_PACKAGE [${COLOR_DANGER}FAIL${COLOR_BASED}]
    fi
    echo -e ""  
    logDate Status $REPOSITORY_LINK [${COLOR_SUCCESS}TEST${COLOR_BASED}]
  done
}

function dotFiles() {
  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting List Dotfiles"
  echo -e "
    ╭───────────────────────────────────────────────╮
    ┃             Information Dotfiles              ┃
    ╰───────────────────────────────────────────────╯
    ┃        Folder Name      ┃     Folder Size     ┃
    ╰───────────────────────────────────────────────╯"
  for DOTFILE in "${DOTFILES[@]}"; do
    FOLDER_SIZE=$(du -s -h $DOTFILE | awk '{print $1}')
    printf "    ┃        %-12s     ▎        %5s        ┃\n" $DOTFILE $FOLDER_SIZE
  done
  echo "    ╰───────────────────────────────────────────────╯"
}

function installDotFiles() {
  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Dotfiles\n"
  for DOTFILE in "${DOTFILES[@]}"; do
    logDate Status $DOTFILE [${COLOR_SUCCESS}TEST${COLOR_BASED}]
  done
}

banner
informationPackages
