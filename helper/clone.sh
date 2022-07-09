#!/usr/bin/env bash

REPOSITORY_LINKS=(
  https://github.com/robbyrussell/oh-my-zsh
  https://github.com/zsh-users/zsh-syntax-highlighting
  https://github.com/zsh-users/zsh-autosuggestions
  https://github.com/joshskidmore/zsh-fzf-history-search
  https://github.com/jimeh/tmux-themepack
  https://github.com/NvChad/NvChad
)

REPOSITORY_APIS=(
  repositories/291137
  repos/zsh-users/zsh-syntax-highlighting
  repos/zsh-users/zsh-autosuggestions
  repos/joshskidmore/zsh-fzf-history-search
  repos/jimeh/tmux-themepack
  repos/NvChad/NvChad
)

REPOSITORY_FULL_NAME=(
  robbyrussell/oh-my-zsh
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  joshskidmore/zsh-fzf-history-search
  jimeh/tmux-themepack
  NvChad/NvChad
)

REPOSITORY_PATH=(
  $HOME/.oh-my-zsh/
  $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  $HOME/.oh-my-zsh/custom/plugins/zsh-fzf-history-search
  $HOME/.tmux-themepack
  $HOME/NvChad
)

function repoSize() {

    echo "$(echo "scale=2
    $(curl https://api.github.com/$@ 2>/dev/null | grep size | head -1 | tr -dc '[:digit:]') / 1024" | bc)MB"

}

function repositories() {

  setCursor off

  echo -e "‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information Repository"
  sleep 2s

  echo -e "
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃                         Information Repository                     ┃ 
    ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃      Repository Name                          Repository Size      ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

  for REPOSITORY_API in "${REPOSITORY_APIS[@]}"; do

    REPOSITORY_NAME=$(curl https://api.github.com/${REPOSITORY_API} 2> /dev/null | grep full_name | sed -n 1p | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g")
    printf  "    ┃      ${COLOR_SUCCESS}%-36s${COLOR_BASED}       ${COLOR_WARNING}%8s${COLOR_BASED}           ┃\n" $REPOSITORY_NAME `repoSize $REPOSITORY_API`
    echo -e "    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

  done

  echo -e ""

}

function cloneRepository() {

  setCursor off

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Clone or Downloading Repository\n"  
  sleep 2s

  for ((i=0; i<${#REPOSITORY_LINKS[@]}; i++)); do

    start_animation "       Cloning ${COLOR_WARNING}'${COLOR_SUCCESS}${REPOSITORY_FULL_NAME[i]}${COLOR_WARNING}'${COLOR_BASED} ..."

    git clone ${REPOSITORY_LINKS[i]} ${REPOSITORY_PATH[i]} 2> /dev/null

    if [ -d ${REPOSITORY_PATH[i]} ]; then

      stop_animation $? || exit 1

    else

      stop_animation $?

    fi

  done

  setCursor on

}
