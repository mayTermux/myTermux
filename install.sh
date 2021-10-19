#!/usr/bin/env bash

HELPERS=(
  colors animation banner package switchcase
  dotfiles clone themes nvchad utility
  stat signal cursor finish
)

for HELPER in ${HELPERS[@]}; do
  source $(pwd)/helper/${HELPER}.sh
done

COLS=$(echo $COLUMNS)
ROWS=$(echo $LINES)

function screenSize() {

  if [[ -n ${COLS} && -n ${ROWS} ]]; then

    if (( ${COLS} >= 101 && ${ROWS} >= 39 )); then

      ${1}

    elif (( ${COLS} <= 101 && ${ROWS} <= 39 )); then

      stat "ERROR" "Warning" "Please zoom out your Terminal Screen!"

    else

      stat "ERROR" "Danger" "Unknown ERROR!!!"

    fi

  else

    stat "ERROR" "Danger" "Please run 'export COLUMNS LINES' first and then run again!"
  
  fi

}

function main() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  clear
  banner

  packages
  switchCase "Install" "Packages" installPackages

  dotFiles
  backupDotFiles
  switchCase "Install" "Dotfiles" installDotFiles

  repositories
  switchCase "Clone" "Repositories" cloneRepository

  zshTheme
  switchCase "Install" "ZSH Themes" installZshTheme

  NvChad
  utility

  alertFinish

}

screenSize main