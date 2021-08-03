#!/usr/bin/env bash
#/data/data/com.termux/files/usr/bin/env bash

COLOR_BASED="\e[39m"
COLOR_DANGER="\e[91m"
COLOR_WARNING="\e[93m"
COLOR_SUCCESS="\e[92m"
COLOR_SKY="\e[34m"

VERSION="0.5.0 ${COLOR_WARNING}dev${COLOR_BASED}"
BUILD_DATE="01 August 2021"
AUTHOR="xShin"

DEPENDENCY_PACKAGES=(
  bat cava curl exa git imagemagick
  inotify-tools lf mpd ncmpcpp neovim
  neofetch openssh termux-api tmux zsh
)

DOTFILES=(
  .local .config .termux .color-toys
)

REPOSITORY_LINKS=(
  https://github.com/robbyrussell/oh-my-zsh
  https://github.com/zsh-users/zsh-syntax-highlighting
  https://github.com/zsh-users/zsh-autosuggestions
  https://github.com/wbthomason/packer.nvim
  https://github.com/jimeh/tmux-themepack
)

REPOSITORY_APIS=(
  repositories/291137
  repos/zsh-users/zsh-syntax-highlighting
  repos/zsh-users/zsh-autosuggestions
  repos/wbthomason/packer.nvim
  repos/jimeh/tmux-themepack
)

REPOSITORY_PATH=(
  $HOME/.oh-my-zsh/
  $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
)