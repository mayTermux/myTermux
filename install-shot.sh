#!/data/data/com.termux/files/usr/bin/env bash
#/usr/bin/env bash

# Variable Color
C_NORMAL="\e[39m"
C_DANGER="\e[91m"
C_WARNING="\e[93m"
C_SUCCESS="\e[92m"

# Variable Package
SHOT_PACKAGES=(
  "tsu"
  "termux-api"
  "imagemagick"
  "jq"
)

function ask() {
  echo -e "\n${C_DANGER}This action or shot-imgck require root permission${C_NORMAL}\n"
  table
  read -p $'[\e[93mASK\e[39m] > Do you want to install shot-imgck? [Y/n] ' Ask
}

function table() {

  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╭─────────────────────────────────────────────────────────────────────╮"
  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ┃   Package Shot-Imgck    ▎    Download Size   ┃    Installaed Size   ┃"
  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰─────────────────────────────────────────────────────────────────────╯"

  for SHOT_PACKAGE in "${SHOT_PACKAGES[@]}"; do
    PACKAGE_NAME=$(apt show $SHOT_PACKAGE 2> /dev/null | sed -n 1p | awk '{print $2}')
    INSTALLED_SIZE=$(apt show $SHOT_PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2$3}')
    DOWNLOAD_SIZE=$(apt show $SHOT_PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2$3}')
    printf "‏‏‎‏‏‎ ‎‏‏‎ ┃   %-11s           ▎  %7s           ┃  %7s             ┃\n" $PACKAGE_NAME $DOWNLOAD_SIZE $INSTALLED_SIZE
  done

  echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰─────────────────────────────────────────────────────────────────────╯\n"
}

function action() {
    echo -e "\n[${C_WARNING}RUN${C_NORMAL}] * Update Repository && Upgrade Package"

    pkg update && pkg upgrade

    echo -e "\n[${C_WARNING}RUN${C_NORMAL}] * Installing Dependency Package"
    
    for SHOT_PACKAGE in "${SHOT_PACKAGES[@]}"; do

      echo -e "\n[${C_WARNING}PACKAGE NAME${C_NORMAL}] > $SHOT_PACKAGE\n"
      pkg install -y $SHOT_PACKAGE

    done

    if [[ -d $HOME/.local/bin ]]; then

      cp .local/bin/shot $HOME/.local/bin

    elif [[ -d $HOME/.local ]]; then

      mkdir $HOME/.local/bin
      cp .local/bin/shot $HOME/.local/bin
    
    else

      mkdir -p $HOME/.local/bin
      cp .local/bin/shot $HOME/.local/bin

    fi

    cp .scripts/shot-magick ~/.scripts/

    if [[ -f $HOME/.local/bin/shot && -f $HOME/.scripts/shot-magick ]]; then

      echo -e "[${C_SUCCESS}LOG${C_NORMAL}] > Installation Success, trying run the script!"

      shot 7 &

    else

      echo -e "[${C_DANGER}LOG${C_NORMAL}] > Installation Failed!"

    fi
}

ask
case "$Ask" in

  "" )
    action
  ;;

  y|Y )
    action
  ;;

  n|N )
    exit 1
  ;;

  * )
    echo -e "[${C_DANGER}ERROR${C_NORMAL}] > Unknown Answer"
  ;;


esac