export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rounded-custom"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting bgnotify)

PATH="$PREFIX/bin:$HOME/.local/bin:$PATH"
export PATH

LINK="https://github.com/xshin404"
export LINK

LINK_SSH="git@github.com:xshin404"
export LINK_SSH

export TERM=xterm-256color 

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lf/icons
source $HOME/.aliases
source $HOME/.autostart
