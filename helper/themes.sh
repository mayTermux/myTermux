#!/usr/bin/env bash

ZSH_CUSTOM_THEMES=(
  osx.zsh-theme
  osx2.zsh-theme
  archcraft.zsh-theme
  ar-round.zsh-theme
  la-round.zsh-theme
  rounded-custom.zsh-theme
  rounded.zsh-theme
  simple.zsh-theme
)

function zshTheme() {

  setCursor off

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Getting Information ZSH Theme"
  sleep 2s

  # echo -e "
  #   ╭─────────────────────────────────────────────────────────╮
  #   ┃                  Information ZSH Theme                  ┃
  #   ╰─────────────────────────────────────────────────────────╯
  #   ┃              File Name            ┃     File Size       ┃
  #   ╰─────────────────────────────────────────────────────────╯"
    echo -e "
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃                  Information ZSH Theme                  ┃
    ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃      File Name                          File Size       ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

  for ZSH_CUSTOM_THEME in "${ZSH_CUSTOM_THEMES[@]}"; do

    FILE_SIZE=$(du -s -h .oh-my-zsh/custom/themes/$ZSH_CUSTOM_THEME | awk '{print $1}')
    printf  "    ┃      ${COLOR_SUCCESS}%-24s${COLOR_BASED}             ${COLOR_WARNING}%5s${COLOR_BASED}         ┃\n" $ZSH_CUSTOM_THEME $FILE_SIZE
    echo -e "    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

  done

  echo ""

}

function installZshTheme() {

  setCursor off

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing ZSH Custom Themes\n"  

  PATHDIR=".oh-my-zsh/custom/themes"

  for ZSH_CUSTOM_THEME in "${ZSH_CUSTOM_THEMES[@]}"; do

    start_animation "       Installing ${COLOR_WARNING}'${COLOR_SUCCESS}${ZSH_CUSTOM_THEME}${COLOR_WARNING}'${COLOR_BASED} ..."
    sleep 2s
    cp $(pwd)/${PATHDIR}/${ZSH_CUSTOM_THEME} $HOME/${PATHDIR}/${ZSH_CUSTOM_THEME}

    if [ -f $HOME/$PATHDIR/$ZSH_CUSTOM_THEME ]; then

      stop_animation $? || exit 1

    else

      stop_animation $?

    fi

  done
  
  setCursor on

}
