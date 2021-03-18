# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

PATH="$PREFIX/bin:$HOME/.local/bin:$PATH"
export PATH
LINK="https://github.com/xshin404"
export LINK

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="la-round"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-autosuggestions zsh-syntax-highlighting bgnotify)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal
# liases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Shortcut

    #Change
    alias chcolor="/data/data/com.termux/files/home/.termux/colors.sh"
    alias chfont="/data/data/com.termux/files/home/.termux/fonts.sh"

    #System    
    alias q="exit"
    alias c="clear"
    alias sd="cd /sdcard"
    alias pf="cd $PREFIX"

    #Ping    
    alias pg="ping google.com"

    #Music    
    alias n="ncmpcpp"
    alias mkill="mpd --kill"
    alias m="mkill && mpd && n"

    #Color Toys
    alias 256colors2="~/.color-toys/256colors2.pl"
    alias bloks="~/.color-toys/bloks"
    alias colortest="~/.color-toys/colortest"
    alias colortest-slim="~/.color-toys/colortest-slim"
    alias colorview="~/.color-toys/colorview"
    alias colorbars="~/.color-toys/colorbars"
    alias panes="~/.color-toys/panes"
    alias pipes1="~/.color-toys/pipes1"
    alias pipes2="~/.color-toys/pipes2"
    alias pipes2-slim="~/.color-toys/pipes2-slim"

    #System Information
    alias neo="neofetch --ascii_distro android_small && colortest-slim"
    alias memory="bash ~/.config/neofetch/script.sh --storage"
    alias battery="bash ~/.config/neofetch/script.sh --battery"
    alias ls="exa --icons"
    alias la="exa --icons -lgha --group-directories-first"
    alias listpkg="bash $HOME/.scripts/list-packages.sh $1 $2"

    ## Configuration

    #mpd
    alias mpdconf="nvim ~/.config/mpd/mpd.conf"
    alias mpconf="nvim /data/data/com.termux/files/usr/etc/mpd.conf"

    #ncmpcpp    
    alias ncmconf="nvim ~/.config/ncmpcpp/config"

    #neovim
    alias nviminit="nvim ~/.config/nvim/init.vim"
    alias nvimplug="nvim ~/.config/nvim/settings/plugins.vim"
    alias nvimconf="nvim ~/.config/nvim/settings/sets.vim"
    alias nvimtheme="nvim ~/.config/nvim/settings/themes.vim"
    alias nvimkey="nvim ~/.config/nvim/settings/keybinds.vim"

    #zsh
    alias zshconf="nvim ~/.zshrc"

    #neofetch    
    alias neoconf="nvim ~/.config/neofetch/config.conf"
    alias neoscript="nvim ~/.config/neofetch/script.sh"

    #Web Server (Require install LAMP on Termux) https://github.com/xshin404/lampTermux
    alias apaconf="nvim $PREFIX/etc/apache2/httpd.conf"
    alias phpmyadminconf="nvim $PREFIX/etc/phpmyadmin/config.inc.php"

    #Refresh
    alias refresh="source $HOME/.zshrc"

##lf icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

## First Boot

    #cursor bar or bold pipe
    #echo -e "\e[2 q"

    #cursor underline    
    echo -e "\e[4 q"

    #cursor pipe
    #echo -e "\e[6 q"

    c
    neo
