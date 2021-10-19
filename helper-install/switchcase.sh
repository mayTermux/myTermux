#!/usr/bin/env bash

function switchCase() {

  setCursor on

  read -p "    ${1} ${2}? [Y/n] " SWITCH_CASE

  case "$SWITCH_CASE" in

    "" )
      ${3}
    ;;

    y|Y )
      ${3}
    ;;

    n|N )
      echo -e "Nnaaahh"

    ;;

    * )
      echo -e "ERROR"
    ;;

  esac

}

function caseInstallPackage() {

  read -p "    Do you want to install the packages? [Y/n] " INSTALL_PACKAGES

  case "$INSTALL_PACKAGES" in

    "" )
      installPackages
    ;;

    y|Y )
      installPackages
    ;;

    n|N )
      echo -e "No"
    ;;

    * )
      echo -e "Unknown"
    ;;

  esac
  
}

function caseBackupDotFiles() {

  read -p "    Do you want to backup the dotfiles? [Y/n] " BACKUP_DOTFILES

  if [ "${BACKUP_DOTFILES}" == "" ]; then

    backupDotFiles
  
  elif [ "${BACKUP_DOTFILES}" == "y" ]; then

    backupDotFiles

  else

    exit
  
  fi

}

function caseInstallDotfiles() {

  read -p "    Do you want to install dotfiles? [Y/n] " INSTALL_DOTFILES

  case "$INSTALL_DOTFILES" in

    "" )
      installDotFiles
    ;;

    y|Y )
      installDotFiles
    ;;

    n|N )
      echo -e "No"
    ;;

    * )
      echo -e "Unknown"
    ;;

  esac

}

function caseCloneRepository() {

  read -p "    Do you want to clone repository? [Y/n] " CLONE_REPOSITORY

  case "$CLONE_REPOSITORY" in

    "" )
      cloneRepository
    ;;

    y|Y )
      cloneRepository
    ;;

    n|N )
      echo -e "No"
    ;;

    * )
      echo -e "Unknown"
    ;;

  esac

}

function caseInstallZshTheme() {

  read -p "    Do you want to install ZSH Theme? [Y/n] " INSTALL_ZSH_THEME

  case "$INSTALL_ZSH_THEME" in

    "" )
      installZshTheme
    ;;

    y|Y )
      installZshTheme
    ;;

    n|N )
      echo -e "No"
    ;;

    * )
      echo -e "Unknown"
    ;;

  esac

}

