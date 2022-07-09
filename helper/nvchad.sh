#!/usr/bin/env bash

function NvChad() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Neovim Plugins with Packer\n"

  stat "CHECK" "Warning" "'${COLOR_WARNING}NvChad${COLOR_BASED}' Folder"
  
  if [ -d $HOME/NvChad ]; then

    stat "RESULT" "Success" "'${COLOR_SUCCESS}NvChad${COLOR_BASED}' exist"

    stat "RUN" "Warning" "Move '${COLOR_WARNING}NvChad${COLOR_BASED}' Folder to '${COLOR_WARNING}.config/nvim${COLOR_BASED}' ..."

    mv $HOME/NvChad $HOME/.config/nvim

    if [ -d $HOME/.config/nvim ]; then

      stat "RESULT" "Success" "'${COLOR_SUCCESS}NvChad${COLOR_BASED}' success move to '${COLOR_SUCCESS}.config/nvim${COLOR_BASED}'"

      stat "RUN" "Warning" "Installing '${COLOR_WARNING}NvChad${COLOR_BASED}' ..."

	  nvim

    else

      stat "RESULT" "Danger" "'${COLOR_DANGER}NvChad${COLOR_BASED}' failed move to '${COLOR_DANGER}.config/nvim${COLOR_BASED}'"

    fi

  else

    stat "RESULT" "Danger" "'${COLOR_DANGER}NvChad${COLOR_BASED}' No such directory"

  fi

}
