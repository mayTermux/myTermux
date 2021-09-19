#!/usr/bin/env bash

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
              ┃                  ${COLOR_BASED}🚀 Version    : ${VERSION}                     ${COLOR_SKY}    ┃
              ┃                  ${COLOR_BASED}📅 Build Date : ${BUILD_DATE}                ${COLOR_SKY}┃
              ┃                  ${COLOR_BASED}⚙️ Author      : ${AUTHOR}                         ${COLOR_SKY}┃
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
      echo ""
      exit 1
    ;;

    * )
      logDate [${COLOR_DANGER}ERROR ANSWER${COLOR_BASED}]
      exit 1  
    ;;

  esac

}

function installDependencyPackages() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Downloading Package\n"
  echo -e "Downloading Package:" >> $(pwd)/.log

  for DEPENDENCY_PACKAGE in "${DEPENDENCY_PACKAGES[@]}"; do

    logDate Installing $DEPENDENCY_PACKAGE ...
    pkg i -y $DEPENDENCY_PACKAGE &>/dev/null
    THIS_PACKAGE=$(pkg list-installed $DEPENDENCY_PACKAGE 2> /dev/null | tail -n 1)
    CHECK_PACKAGE=${THIS_PACKAGE%/*}

    if [[ $CHECK_PACKAGE == $DEPENDENCY_PACKAGE ]]; then

      logDate Status $DEPENDENCY_PACKAGE [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      # echo -e "$(date +'%A, %d %B %Y %r') Status $DEPENDENCY_PACKAGE [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}])" >> $(pwd)/.log
      echo -e "$(date +'%A, %d %B %Y %r') Status $DEPENDENCY_PACKAGE [SUCCESS]" >> $(pwd)/.log

    else

      logDate Status $DEPENDENCY_PACKAGE [${COLOR_DANGER}FAILED${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status $DEPENDENCY_PACKAGE [FAILED]" >> $(pwd)/.log
    fi

    echo -e ""

  done

  echo -e "" >> $(pwd)/.log

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
  echo -e "Cloning or Downloading Repository:" >> $(pwd)/.log
  sleep 2s

  for ((i=0; i<${#REPOSITORY_LINKS[@]}; i++)); do

    logDate Installing ${REPOSITORY_FULL_NAME[i]} ... 
    git clone ${REPOSITORY_LINKS[i]} ${REPOSITORY_PATH[i]} 2> /dev/null

    if [ -d ${REPOSITORY_PATH[i]} ]; then

      logDate Status ${REPOSITORY_LINKS[i]} [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status ${REPOSITORY_LINKS[i]} [SUCCESS]" >> $(pwd)/.log
      sleep 2s
      # logDate Repository PATH ${REPOSITORY_PATH[i]}

    else

      logDate Status ${REPOSITORY_LINKS[i]} [${COLOR_DANGER}FAILED${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status ${REPOSITORY_LINKS[i]} [FAILED]" >> $(pwd)/.log

    fi

    echo -e ""

  done

  echo -e "" >> $(pwd)/.log

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

function backupDotFiles() {

  function backupExec() {

    echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Backup dotfiles"
    echo -e "Backup dotfile:" >> $(pwd)/.log
    sleep 2s

    for BACKUP_DOTFILE in "${BACKUP_DOTFILES[@]}"; do
      echo -e ""
      logDate Backup $BACKUP_DOTFILE ...
      if [[ -d "$HOME/$BACKUP_DOTFILE" || -f "$HOME/$BACKUP_DOTFILE" ]]; then
        mv ${HOME}/${BACKUP_DOTFILE} ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S);
        if [[ -d ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) || -f ${HOME}/${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) ]]; then
          logDate Status $BACKUP_DOTFILE to ${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
          echo -e "$(date +'%A, %d %B %Y %r') Status $BACKUP_DOTFILE to ${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) [SUCCESS]" >> $(pwd)/.log
          echo -e ""
        else
          logDate Status $BACKUP_DOTFILE to ${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) [${COLOR_DANGER}FAILED${COLOR_BASED}]
          echo -e "$(date +'%A, %d %B %Y %r') Status $BACKUP_DOTFILE to ${BACKUP_DOTFILE}.$(date +%Y.%m.%d-%H.%M.%S) [FAILED]" >> $(pwd)/.log
          echo -e ""
        fi
      else
        logDate Status $BACKUP_DOTFILE [${COLOR_WARNING}NOT FOUND${COLOR_BASED}]
        echo -e "$(date +'%A, %d %B %Y %r') Status $BACKUP_DOTFILE [NOT FOUND]" >> $(pwd)/.log
        echo -e ""
      fi
    done
    echo -e "" >> $(pwd)/.log
  }

  echo -e ""
  backupExec
  installDotFiles
}

function installDotFiles() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Dotfiles\n"
  echo -e "Installing dotfile:" >> $(pwd)/.log

  for DOTFILE in "${DOTFILES[@]}"; do

    logDate Installing $DOTFILE ...
    cp -R $DOTFILE $HOME

    if [[ -d $HOME/$DOTFILE || -f $HOME/$DOTFILE ]]; then

      logDate Status $DOTFILE [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status $DOTFILE [SUCCESS]" >> $(pwd)/.log

    else

      logDate Status $DOTFILE [${COLOR_DANGER}FAILED${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status $DOTFILE [FAILED]" >> $(pwd)/.log

    fi

    echo -e ""

  done

  echo -e "" >> $(pwd)/.log
  
}

function neovimPlugins() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Neovim Plugins with Packer\n"
  echo -e "Installing Neovim Plugins:" >> $(pwd)/.log

  if [ -d $HOME/NvChad ]; then

    logDate Status NvChad [${COLOR_SUCCESS}FOUND${COLOR_BASED}]

    logDate Preparing to install Plugin [Move NvChad to .config/nvim]
    mv $HOME/NvChad $HOME/.config/nvim
    if [ -d $HOME/.config/nvim ]; then
    
      logDate Status .config/nvim [${COLOR_SUCCESS}OK${COLOR_BASED}]

      logDate Status Installer [${COLOR_SUCCESS}READY${COLOR_BASED}]
      nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
      logDate Status Neovim Plugins [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status Neovim Plugins [SUCCESS]" >> $(pwd)/.log

    else

      logDate Status .config/nvim [${COLOR_DANGER}Configuration not found${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status .config/nvim [Configuration not found]" >> $(pwd)/.log

    fi

  else

    logDate Status NvChad [${COLOR_DANGER}NvChad not found${COLOR_BASED}]
    echo -e "$(date +'%A, %d %B %Y %r') Status NvChad [NvChad not found]" >> $(pwd)/.log

  fi

  # if [ -f $HOME/NvChad/install.sh ]; then

  #   bash $HOME/NvChad/install.sh -i
  #   logDate Status Neovim Plugins [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
  #   cp $(pwd)/neovim-settings/xshin.lua $HOME/.config/nvim/lua/xshin.lua
  #   sed -i 's/"mappings"/"mappings",/g' ~/.config/nvim/init.lua
  #   sed -i '4i\    "xshin"' ~/.config/nvim/init.lua
  #   sed -i 's/g.nvim_tree_hide_dotfiles = 1/g.nvim_tree_hide_dotfiles = 0/g' ~/.config/nvim/lua/plugins/nvimtree.lua
  #   echo -e "$(date +'%A, %d %B %Y %r') Status Neovim Plugins [SUCCESS]" >> $(pwd)/.log

  # else

  #   logDate Status [${COLOR_DANGER}ERROR INSTALLER NOT FOUND${COLOR_BASED}]
  #   echo -e "$(date +'%A, %d %B %Y %r') Status Neovim Plugins [ERROR INSTALLER NOT FOUND]" >> $(pwd)/.log


  # fi

  echo -e "" >> $(pwd)/.log

}

function zshThemes() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing ZSH Custom Themes\n"  
  echo -e "Installing ZSH Custom Themes:" >> $(pwd)/.log

  PATHDIR=".oh-my-zsh/custom/themes"

  for ZSH_CUSTOM_THEME in "${ZSH_CUSTOM_THEMES[@]}"; do

    logDate $ZSH_CUSTOM_THEME
    cp $(pwd)/${PATHDIR}/${ZSH_CUSTOM_THEME} $HOME/${PATHDIR}/${ZSH_CUSTOM_THEME}

    if [ -f $HOME/$PATHDIR/$ZSH_CUSTOM_THEME ]; then

      logDate Status $ZSH_CUSTOM_THEME [${COLOR_SUCCESS}SUCCESS${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status $ZSH_CUSTOM_THEME [SUCCESS]" >> $(pwd)/.log

    else

      logDate Status $ZSH_CUSTOM_THEME [${COLOR_DANGER}FAILED${COLOR_BASED}]
      echo -e "$(date +'%A, %d %B %Y %r') Status $ZSH_CUSTOM_THEME [FAILED]" >> $(pwd)/.log

    fi

    echo -e ""

  done

  echo -e "" >> $(pwd)/.log
}

function reloadSettings() {
  $(termux-reload-settings)
}

function welcomeTermux() {

  if [[ -f $PREFIX/etc/motd ]]; then
    
    mkdir tmp
    mv $PREFIX/etc/motd $(pwd)/tmp/motd.backup

  fi

}

function alert() {

  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Log saved on $(pwd)/.log\n"
  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Installation Finish, but you need restart Termux to clear setup\n"

}

function awesomeshotFont() {
  cp ~/.termux/fonts/NerdFonts/JetBrains/JetBrains\ Mono\ Medium\ Nerd\ Font\ Complete.ttf $PREFIX/share/fonts/TTF/ 2> /dev/null
}

function main() {
  clear
  banner
  informationPackages
  dotFiles
  backupDotFiles
  reloadSettings
  awesomeshotFont
  informationRepository
  cloneRepository
  neovimPlugins
  zshThemes
  changeSHELL
  welcomeTermux
  alert
}
