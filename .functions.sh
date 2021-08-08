#!/usr/bin/env bash

source $(pwd)/.variables.sh

function logDate() {
  echo -e "    [${COLOR_WARNING}$(date +'%A, %d %B %Y %r')${COLOR_BASED}] > $@"
}

function dotTermux() {
  logDate Changing Colorscheme...
  sleep 2s
  rm -rf $HOME/.termux
  cp -R $(pwd)/.termux $HOME && termux-reload-settings
  for ((i=3; i>=0; i--)); do
    logDate Preparing Installation on ${COLOR_SUCCESS}${i}${COLOR_BASED}s
    sleep 1s
  done
  sleep 1s
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
              ┃                  ${COLOR_BASED}⚙️ Author     : ${AUTHOR}                          ${COLOR_SKY}┃
              ┃                                                                ┃
              ╰────────────────────────────────────────────────────────────────╯${COLOR_BASED}"
}

function informationPackages() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Packages"
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
    ;;

    y|Y )
      installDependencyPackages
    ;;

    n|N )
      logDate Status Installation [${COLOR_WARNING}Abort.${COLOR_BASED}]
      exit 1
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

      logDate Status $DEPENDENCY_PACKAGE [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

    else

      logDate Status $DEPENDENCY_PACKAGE [${COLOR_DANGER}FAILED${COLOR_BASED}]

    fi

    echo -e ""

  done

}

function changeSHELL() {
  chsh -s zsh
}

function OhMyZSH() {

  logDate Installing ${REPOSITORY_LINKS[0]}

  git clone git://github.com/${REPOSITORY_LINKS[0]} ${REPOSITORY_PATH[0]} &>/dev/null

  if [ -d ${REPOSITORY_PATH[0]} ]; then

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

  else

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_DANGER}FAILED${COLOR_BASED}]

  fi

}

function pluginZSHHighlighting() {

  logDate Installing ${REPOSITORY_LINKS[1]}

  git clone git://github.com/${REPOSITORY_LINKS[1]} ${REPOSITORY_PATH[1]} &>/dev/null

  if [ -d ${REPOSITORY_PATH[1]} ]; then

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

  else

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_DANGER}FAILED${COLOR_BASED}]

  fi

}

function pluginZSHAutosuggestion() {

  logDate Installing ${REPOSITORY_LINKS[2]}
  git clone git://github.com/${REPOSITORY_LINKS[2]} ${REPOSITORY_PATH[2]} &>/dev/null

  if [ -d ${REPOSITORY_PATH[2]} ]; then

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

  else

    logDate Status ${REPOSITORY_LINKS[0]} [${COLOR_DANGER}FAILED${COLOR_BASED}]

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

      REPOSITORY_NAME=$(curl https://api.github.com/${REPOSITORY_API} 2> /dev/null | grep full_name | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g")
      printf "    ┃      %-36s     ▎      %8s      ┃\n" $REPOSITORY_NAME `repoSize $REPOSITORY_API`

    done

    echo "    ╰────────────────────────────────────────────────────────────────────╯"
}

function cloneRepository() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Cloning or Downloading Repository\n"  
  sleep 2s

  for ((i=0; i<${#REPOSITORY_LINKS[@]}; i++)); do

    logDate Installing ${REPOSITORY_FULL_NAME[i]} ... 
    git clone ${REPOSITORY_LINKS[i]} ${REPOSITORY_PATH[i]} 2> /dev/null

    if [ -d ${REPOSITORY_PATH[i]} ]; then

      logDate Status ${REPOSITORY_LINKS[i]} [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      sleep 2s
      # logDate Repository PATH ${REPOSITORY_PATH[i]}

    else

      logDate Status ${REPOSITORY_LINKS[i]} [${COLOR_DANGER}FAILED${COLOR_BASED}]

    fi

    echo -e ""

  done

}

function dotFiles() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Dotfiles"
  sleep 2s

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

    logDate Installing $DOTFILE ...
    cp -R $DOTFILE $HOME

    if [ -d $HOME/$DOTFILE ]; then

      logDate Status $DOTFILE [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

    else

      logDate Status $DOTFILE [${COLOR_DANGER}FAILED${COLOR_BASED}]

    fi

    sleep 1s
    echo -e ""

  done
  
}

function neovimPlugins() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Neovim Plugins with Packer\n"

  if [ -f $HOME/NvChad/install.sh ]; then

    bash $HOME/NvChad/install.sh -i
    logDate Status Neovim Plugins [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
    cp $(pwd)/neovim-settings/xshin.lua $HOME/.config/nvim/lua/xshin.lua
    sed -i 's/"mappings"/"mappings",/g' ~/.config/nvim/init.lua
    sed -i '4i\    "xshin"' ~/.config/nvim/init.lua
    sed -i 's/g.nvim_tree_hide_dotfiles = 1/g.nvim_tree_hide_dotfiles = 0/g' ~/.config/nvim/lua/plugins/nvimtree.lua
  else

    logDate Status [${COLOR_DANGER}ERROR INSTALLER NOT FOUND${COLOR_BASED}]

  fi

}

function zshThemes() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing ZSH Custom Themes\n"  

  PATHDIR=".oh-my-zsh/custom/themes"

  for ZSH_CUSTOM_THEME in "${ZSH_CUSTOM_THEMES[@]}"; do

    logDate $ZSH_CUSTOM_THEME
    cp $(pwd)/${PATHDIR}/${ZSH_CUSTOM_THEME} $HOME/${PATHDIR}/${ZSH_CUSTOM_THEME}

    if [ -f $HOME/$PATHDIR/$ZSH_CUSTOM_THEME ]; then

      logDate Status $ZSH_CUSTOM_THEME [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]

    else

      logDate Status $ZSH_CUSTOM_THEME [${COLOR_DANGER}FAILED${COLOR_BASED}]

    fi

    echo -e ""

  done
}

function reloadSettings() {
  $(termux-reload-settings)
}

function finishing() {

  for FINISHING in "${FINISHINGS[@]}"; do

    cp $FINISHING $HOME

  done
  
  welcomeTermux
  alert

}

function welcomeTermux() {

  if [[ -f $PREFIX/etc/motd ]]; then

    mv $PREFIX/etc/motd $(pwd)/tmp/motd.backup

  fi

}

function alert() {

  echo -e "\n‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Installation Finish, but you need restart Termux to clear setup"

}

function main() {
  dotTermux
  clear
  banner
  informationPackages
  informationRepository
  cloneRepository
  dotFiles
  installDotFiles
  neovimPlugins
  zshThemes
  changeSHELL
  # reloadSettings
  finishing
}
