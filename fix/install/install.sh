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
        echo -e "║             🚀$wh Version    :$lyw 0.3.0 $bl                   ║"
        echo -e "║             📅$wh Build Date :$lrd 26 Februari 2021 $bl        ║"
        echo -e "║             📦$wh Size       :$lgn 9.41 MB $bl                 ║"
        echo -e "║             ⚙️ $wh Maintainer :$lcyn xShin & Ann $df$bl             ║"
        echo -e "║                                                      ║"
        echo -e "╰──────────────────────────────────────────────────────╯\n$df"
}

backup() {
    banner
    echo -e "⚙️ Execute backup file & directory"
    for backup in "${backups[@]}"; do
        start_spinner_backup "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $backup"
        sleep 2
        if [[ -f $HOME/$backup || -d $HOME/$backup ]]; then
            mv -u ${HOME}/${backup}{,.old};
            stop_spinner_backup $?
            echo -e " ‎‏‏‎ ⚠️ backup to $backup.old\n"
        else
            sleep 2
            cp "empty" > /dev/null 2>&1
            stop_spinner_backup $?
 #           echo -e ""
        fi
    done
}

package() {
    backup
    echo -e "⚙️ Execute installing package"
    for ohpkg in "${ohpkgs[@]}"; do
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $ohpkg"
        pkg install -y $ohpkg &>/dev/null
        pkg install -y $ohpkg 2> /dev/null | tail -n 2 | sed -n 1p >> log.txt
        ipkg=$(pkg list-installed $ohpkg 2> /dev/null | tail -n 1)
        cpkg=${ipkg%/*}
        if [[ $cpkg == $ohpkg ]]; then
            stop_spinner $? || exit 1;
#            echo -e ""
        else
            sleep 2
            cp "empty" > /dev/null 2>&1
            stop_spinner $?
#            echo -e ""
        fi
    done
}

repository() {
    package
    echo -e "\n⚙️ Execute clone repository"
#    ohmyzsh() {
        # echo -e "⚠️ Info :"
        # echo -e "‏‏‎‏‏‎ ‎‏‏‎ ‎🚀 ‎User           : xShin"
        # echo -e "‎‎‏‏‎‏‏‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎⚙️ Repository Name : oh-my-zsh"
#        start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh ‎‏‏‎ "
#        git clone https://github.com/xshin404/oh-my-zsh $HOME/.oh-my-zsh &>/dev/null
#        check() {
#            if [[ -d $HOME/.oh-my-zsh ]]; then
#                stop_spinner $?
# #               echo -e ""
#            else
#                cp "empty" > /dev/null 2>&#1
#                stop_spinner $?
#                echo -e ""
#                start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh (retrying) ‎‏‏‎ "
#                git clone https://github.com/xshin404/oh-my-zsh $HOME/.oh-my-zsh &>/dev/null
#                check
#            fi
#        #}
#        check
#    }
    ohmyzsh() {
            start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh"
            git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
            check() {
            if [[ -d $HOME/.oh-my-zsh ]]; then
                stop_spinner $?
                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                echo -e ""
                start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎oh-my-zsh (retrying) ‎‏‏‎ "
                git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
                check
            fi
        }
        check
    }
    ohmyzsh

    highlighting() {
        start_spinner "‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting"
        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &>/dev/null
        check() {
            if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
                stop_spinner $?
                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                echo -e ""
                start_spinner "‏‏‎ ‎‏‏‎ ‎‎📦 zsh-syntax-highlighting (retrying) ‎‏‏‎ "
                git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/ &>/dev/null
                check
            fi
        }
        check
    }
    highlighting

    autosuggest() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions"
        git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/ &>/dev/null
        check() {
            if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
                stop_spinner $?
                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                echo -e ""
                start_spinner "‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions (retrying) ‎‏‏‎ "
                git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/ &>/dev/null
                check
            fi
        }
        check
    }
    autosuggest
}

dotfile() {
    repository
    echo -e "\n⚙️ Execute applying dotfiles"
    zshrc() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc"
        sleep 2
        cp $DIR/.zshrc $HOME/
        check() {
            if [[ -f $HOME/.zshrc ]]; then
                stop_spinner $?
#                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
#                echo -e ""
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc"
                sleep 2
                cp $DIR/.zshrc $HOME/
                check
            fi
        }
        check
    }
    zshrc

    rounded() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 rounded.zsh-theme"
        sleep 2
        cp $DIR/rounded.zsh-theme $HOME/.oh-my-zsh/custom/themes/
        check() {
            if [[ -f $HOME/.oh-my-zsh/custom/themes/rounded.zsh-theme ]]; then
                stop_spinner $?
#                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
#                echo -e ""
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 rounded.zsh-theme"
                sleep 2
                cp $DIR/rounded.zsh-theme $HOME/.oh-my-zsh/custom/themes/
                check
            fi
        }
        check
    }
    rounded

    termux() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux"
        sleep 2
        cp -R $DIR/.termux $HOME/.termux
        check() {
            if [[ -d $HOME/.termux ]]; then
                stop_spinner $?
#                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
#                echo -e ""
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux"
                sleep 2
                cp $DIR/.termux $HOME/
                check
            fi
        }
        check
    }
    termux

    config() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .config"
        sleep 2
        cp -R $DIR/.config $HOME/.config
        check() {
            if [[ -d $HOME/.config ]]; then
                stop_spinner $?
#                echo -e ""
                cp $DIR/fix/mpd/run $PREFIX/var/service/mpd/run
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
#                echo -e ""
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .config"
                sleep 2
                cp $DIR/.config $HOME/
                check
            fi
        }
        check
    }
    config
}

neovim() {
    nvim --headless +PlugInstall +qall > /dev/null 2>&1
    termux-reload-settings
}
neovim

shell() {
    dotfile
    echo -e "\n⚙️ Execute change shell to zsh"
    zsh() {
        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 change shell to zsh"
        sleep 2
        check() {
            if [[ $(which zsh) == "/data/data/com.termux/files/usr/bin/zsh" ]]; then
                chsh -s zsh
                stop_spinner $?
                echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
#                echo -e ""
            else
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
#                echo -e ""
            fi
        }
        check
    }
    zsh
}
shell
