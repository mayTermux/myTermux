export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ma"
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  bgnotify
  zsh-fzf-history-search
  zsh-autocomplete
)

PATH="$PREFIX/bin:$HOME/.local/bin:$PATH"
export PATH

LINK="https://github.com/mayTermux"
export LINK

LINK_SSH="git@github.com:mayTermux"
export LINK_SSH

export TERM=xterm-256color 

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons

# Prediction List View
#zstyle ':autocomplete:*' default-context history-incremental-search-backward
#zstyle ':autocomplete:history-incremental-search-backward:*' min-input 1

source $HOME/.aliases
source $HOME/.autostart
