#!/data/data/com.termux/files/usr/bin/env bash

# Author : xShin
# GitHub : https://github.com/xshin404

if [[ -f $HOME/.xshin.var ]]; then

    if [[ -f $PREFIX/bin/tput ]]; then

        if [[ -f $PREFIX/bin/bc ]]; then

            source $HOME/.xshin.var

            source $DIR/.spinner/spinner.sh

            lightweight() {

                banner
                backup
                lightweightpackage
                zshrepo
                shell
                owl4cezsh
                dotfiles

                if [[ -d $HOME/.config/nvim ]]; then
                    rm -rf $HOME/.config/nvim
                fi

                welcome
                permission

            }

            full() {

                banner
                backup
                fullpackage
                zshrepo
                shell
                owl4cezsh
                dotfiles
                neovimplug
                welcome
                permission

            }

            help() {

                echo -e "Usage: \n  ./install.sh [options]"
                echo -e "\nMETA OPTIONS :\n"
                echo -e "  help                 show list of command-line options."
                echo -e "\nRUN OPTIONS :\n"
                echo -e "  lightweight          installing with lightweight mode 
                       (not included neovim plugins).\n"
                echo -e "  full                 installing full mode 
                       (included neovim plugins).\n"

            }

            if [[ "$1" == "lightweight" ]]; then

                mode="Install Lightweight"
                lightweight
                finish

            elif [[ "$1" == "full" ]]; then

                mode="Install Full"
                full
                finish

            elif [[ "$1" == "help" ]]; then

                mode="Help"
                banner
                help

            else

                mode="Help"
                banner
                help
                exit 1

            fi

        else

            echo -e '\e[31m'"\n⚠️ ERROR : bc not found !\e[39m\n"
            echo -e "⚠️ Troubleshooting :\n"
            echo -e "     bc                   run 'pkg install bc'
                                to install bc\n"
            exit 1

        fi

    else

        echo -e '\e[31m'"\n⚠️ ERROR : tput not found !\e[39m\n"
        echo -e "⚠️ Troubleshooting :\n"
        echo -e "     tput                 run 'pkg install ncurses-utils' 
                            to install tput\n"
        exit 1

    fi

else

    echo -e '\e[31m'"\n⚠️ ERROR : Global Variable not found !\e[39m\n"
    echo -e "⚠️ Troubleshooting :\n"
    echo -e "     Global Variable      make sure you copy .xshin.var to 
                          $HOME/\n"
    exit 1

fi
