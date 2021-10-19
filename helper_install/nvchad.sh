#!/usr/bin/env bash

function NvChad() {

  echo -e "\n‏‏‎‏‏‎ ‎ ‎‏‏‎  ‎📦 Installing Neovim Plugins with Packer\n"

  stat "CHECK" "Warning" "NvChad Folder"
  
  if [ -d $HOME/NvChad ]; then

    stat "RESULT" "Success" "NvChad exist"

    stat "RUN" "Warning" "Move NvChad Folder to .config/nvim ..."

    mv $HOME/NvChad $HOME/.config/nvim

    if [ -d $HOME/.config/nvim ]; then

      stat "RESULT" "Success" "NvChad success move to .config/nvim"

      stat "RUN" "Warning" "Installing NvChad"

      nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

    else

      stat "RESULT" "Danger" "NvChad failed move to .config/nvim"

    fi

  else

    stat "RESULT" "Danger" "NvChad No such directory"

  fi

}