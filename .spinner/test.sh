#!/bin/bash

source "$(pwd)/spinner.sh"
source $HOME/.xshin.var
DIR=`cd $(dirname $0); pwd`


banner() {
        echo -e "\n$bl╭──────────────────────────────────────────────────────╮"
        echo -e "║              $df$lcyn _______$bl                                ║"
        echo -e "║              $df$lcyn(_______)$bl                               ║"
        echo -e "║     $df$wh ____  _   _ $lcyn_$wh   _____  ____ ____  _   _ _   _$bl    ║"
        echo -e "║     $df$wh|    \| | | $lcyn| |$wh  ___ |/ ___)    \| | | ( \ / )$bl   ║"
        echo -e "║     $df$wh| | | | |_| $lcyn| |$wh  ____| |   | | | | |_| |) X ($bl    ║"
        echo -e "║     $df$wh|_|_|_|\__  $lcyn|_|$wh _____)_|   |_|_|_|____/(_/ \_)$bl   ║"
        echo -e "║           $df$wh(____/$bl                                     ║"
        echo -e "║                                                      ║"
        echo -e "║          🚀$wh Version    :$lyw 0.3.0 $bl                      ║"
        echo -e "║          📅$wh Build Date :$lrd 26 Februari 2021 $bl           ║"
        echo -e "║          📦$wh Size       :$lgn 9.41 MB $bl                    ║"
        echo -e "║          ⚙️ $wh Maintainer :$lcyn xShin & Ann $df$bl                ║"
        echo -e "║                                                      ║"
        echo -e "╰──────────────────────────────────────────────────────╯\n$df"
}
package() {
    banner
        echo -e "Execute installing package"
        for ohpkg in "${ohpkgs[@]}"; do
            start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $ohpkg"
            pkg install -y $ohpkg &>/dev/null
            pkg install -y $ohpkg 2> /dev/null | tail -n 2 | sed -n 1p >> log.txt
            ipkg=$(pkg list-installed $ohpkg 2> /dev/null | tail -n 1)
            cpkg=${ipkg%/*}
            if [[ $cpkg == $ohpkg ]]; then
                stop_spinner $? || exit 1;
            else
                sleep 2
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
            fi
        done
}

debug() {
    echo -e "\nExecute clone repository"

	ohmyzsh() {
        start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh"
        git clone git://github.com/robbyrussell/oh-my-zsh.git &>/dev/null
        check() {
            if [[ -d $DIR/oh-my-zsh ]]; then
                stop_spinner $?
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh (retrying) ‎‏‏‎ "
                git clone git://github.com/robbyrussell/oh-my-zsh.git &>/dev/null
                check
            fi
        }
        check
    }
    ohmyzsh

	highlighting() {
        start_spinner "‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting"
        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git &>/dev/null
        check() {
            if [[ -d $DIR/zsh-syntax-highlighting ]]; then
                stop_spinner $?
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                start_spinner "‏‏‎ ‎‏‏‎ ‎‎📦 zsh-syntax-highlighting (retrying) ‎‏‏‎ "
                git clone git://github.com/zsh-users/zsh-syntax-highlighting.git &>/dev/null
                check
            fi
        }
        check
    }
    highlighting

	autosuggest() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions"
        git clone git://github.com/zsh-users/zsh-autosuggestions.git &>/dev/null
        check() {
            if [[ -d $DIR/zsh-autosuggestions ]]; then
                stop_spinner $?
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                start_spinner "‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions (retrying) ‎‏‏‎ "
                git clone git://github.com/zsh-users/zsh-autosuggestions.git &>/dev/null
                check
            fi
        }
        check
    }
    autosuggest
}
#package
debug
