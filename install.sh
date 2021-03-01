#!/bin/bash

if [[ -f $HOME/.xshin.var ]]; then

    source $HOME/.xshin.var

    DIR=`cd $(dirname $0); pwd`
    
    source $DIR/.spinner/spinner.sh

    banner() {

            echo -e "\n$bl╭────────────────────────────────────────────────────────╮"
            echo -e "║              $df$lcyn _______$bl                                  ║"
            echo -e "║              $df$lcyn(_______)$bl                                 ║"
            echo -e "║     $df$wh ____  _   _ $lcyn_$wh   _____  ____ ____  _   _ _   _$bl      ║"
            echo -e "║     $df$wh|    \| | | $lcyn| |$wh  ___ |/ ___)    \| | | ( \ / )$bl     ║"
            echo -e "║     $df$wh| | | | |_| $lcyn| |$wh  ____| |   | | | | |_| |) X ($bl      ║"
            echo -e "║     $df$wh|_|_|_|\__  $lcyn|_|$wh _____)_|   |_|_|_|____/(_/ \_)$bl     ║"
            echo -e "║           $df$wh(____/$bl                                       ║"
            echo -e "║                                                        ║"
            echo -e "║             🚀$wh Version    :$lyw 0.3.0 $bl                     ║"
            echo -e "║             📅$wh Build Date :$lrd 1 Maret 2021 $bl              ║"
            echo -e "║             📦$wh Size       :$lgn $repoSize $bl                  ║"
            echo -e "║             ⚙️ $wh Maintainer :$mg xShin$df$bl                      ║"
            echo -e "║                                                        ║"
            echo -e "╰────────────────────────────────────────────────────────╯$df"
            echo -e "              ⚠️ $wh Mode       :$lgn $mode\n$df"

    }

    full() {

        backup() {

            banner
            echo -e "⚙️ Backup dotfiles"
            
            for backup in "${backups[@]}"; do
                start_spinner_backup "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $backup"
                sleep 2
                if [[ -f $HOME/$backup || -d $HOME/$backup ]]; then
                    mv -u ${HOME}/${backup}{,.backup};
                    stop_spinner_backup $?
                    echo -e " ‎‏‏‎ ⚠️ backup to $backup.backup\n"
                else
                    sleep 2
                    cp "empty" > /dev/null 2>&1
                    stop_spinner_backup $?
                fi
            done

        }

        fullpackage() {

            backup
            echo -e "\n⚙️ Installing full package"


            for fullpkg in "${fullpkgs[@]}"; do
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $fullpkg"
                pkg install -y $fullpkg &>/dev/null

                check() {

                    ipkg=$(pkg list-installed $fullpkg 2> /dev/null | tail -n 1)
                    cpkg=${ipkg%/*}

                    if [[ $cpkg == $fullpkg ]]; then
                        stop_spinner $? || exit 1;
                    else
                        sleep 2
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎$fullpkg (retrying) ‎‏‏‎ "
                        pkg install -y $fullpkg &>/dev/null
                        check
                    fi

                }

                check

            done

            echo -e ""
            cp -R $DIR/.scripts $HOME/.scripts &>/dev/null
            if [[ -f $HOME/.scripts/list-packages.sh ]]; then
                bash $HOME/.scripts/list-packages.sh table full
            fi

        }

        repository() {

            fullpackage
            echo -e "\n⚙️ Installing oh-my-zsh"

            ohmyzsh() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 oh-my-zsh"
                git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
                    
                check() {

                    if [[ -d $HOME/.oh-my-zsh ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 oh-my-zsh (retrying)"
                        git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
                        check
                    fi

                }

                check

            }

            ohmyzsh

            echo -e "\n⚙️ Installing plugin oh-my-zsh"

            highlighting() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting"
                git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &>/dev/null

                check() {

                    if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting (retrying)"
                        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &>/dev/null
                        check
                    fi

                }

                check

            }

            highlighting

            autosuggest() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions"
                git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions &>/dev/null
                
                check() {

                    if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions (retrying)"
                        git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions &>/dev/null
                        check
                    fi

                }

                check

            }

            autosuggest

        }

        dotfiles() {

            repository
            echo -e "\n⚙️ Installing dotfiles"

            zshrc() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc"
                sleep 2
                cp $DIR/.zshrc $HOME/.zshrc

                check() {

                    if [[ -f $HOME/.zshrc ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc (retrying)"
                        sleep 2
                        cp $DIR/.zshrc $HOME/.zshrc
                        check
                    fi

                }

                check

            }

            zshrc

            termux() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux"
                sleep 2
                cp -R $DIR/.termux $HOME/.termux

                check() {

                    if [[ -d $HOME/.termux ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux (retrying)"
                        sleep 2
                        cp -R $DIR/.termux $HOME/.termux
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
                        cp $DIR/fix/mpd/run $PREFIX/var/service/mpd/run &>/dev/null
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .config (retrying)"
                        sleep 2
                        cp -R $DIR/.config $HOME/.config
                        check
                    fi

                }

                check

            }

            config

        }

        neovim() {

            dotfiles
            echo -e "\n⚙️ Installing neovim plugins"

            start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 coc.vim & etc"
            sleep 2

            (
                set -e

                nvim --headless +PlugInstall +qall > /dev/null 2>&1

            )

            if [ $? -eq 0 ]; then
                stop_spinner $?
            else
                sleep 2
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
            fi

        }

        shell() {

            neovim
            echo -e "\n⚙️ Setting SHELL default"

            zsh() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 change shell to zsh"
                sleep 2

                check() {

                    if [[ $(which zsh) == "/data/data/com.termux/files/usr/bin/zsh" ]]; then
                        chsh -s zsh
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                    fi

                }

                check

            }

            zsh

        }

        rounded() {

            shell
            echo -e "\n⚙️ Installing ZSH Theme"

            start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 rounded.zsh-theme"
            sleep 2
            cp $DIR/rounded.zsh-theme $HOME/.oh-my-zsh/custom/themes/rounded.zsh-theme

            check() {

                if [[ -f $HOME/.oh-my-zsh/custom/themes/rounded.zsh-theme ]]; then
                    stop_spinner $?
                    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
                else
                    cp "empty" > /dev/null 2>&1
                    stop_spinner $?
                    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
                fi

            }

            check

        }

        permission() {

            rounded
            termux-setup-storage
            termux-reload-settings

        }

        permission

    }

    lightweight() {

        backup() {

            banner
            echo -e "⚙️ Backup dotfiles"
            
            for backup in "${backups[@]}"; do
                start_spinner_backup "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $backup"
                sleep 2
                if [[ -f $HOME/$backup || -d $HOME/$backup ]]; then
                    mv -u ${HOME}/${backup}{,.backup};
                    stop_spinner_backup $?
                    echo -e " ‎‏‏‎ ⚠️ backup to $backup.backup\n"
                else
                    sleep 2
                    cp "empty" > /dev/null 2>&1
                    stop_spinner_backup $?
                fi
            done

        }

        lightweightpackage() {

            backup
            echo -e "\n⚙️ Installing lightweight package"

            for lightweightpkg in "${lightweightpkgs[@]}"; do
                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $lightweightpkg"
                pkg install -y $lightweightpkg &>/dev/null

                check() {

                    ipkg=$(pkg list-installed $lightweightpkg 2> /dev/null | tail -n 1)
                    cpkg=${ipkg%/*}

                    if [[ $cpkg == $lightweightpkg ]]; then
                        stop_spinner $? || exit 1;
                    else
                        sleep 2
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎$lightweightpkg (retrying) ‎‏‏‎ "
                        pkg install -y $lightweightpkg &>/dev/null
                        check
                    fi

                }

                check

            done

            echo -e ""
            cp -R $DIR/.scripts $HOME/.scripts &>/dev/null
            if [[ -f $HOME/.scripts/list-packages.sh ]]; then
                bash $HOME/.scripts/list-packages.sh table lightweight
            fi

        }

        repository() {

            lightweightpackage
            echo -e "\n⚙️ Installing oh-my-zsh"

            ohmyzsh() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 oh-my-zsh"
                git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
                    
                check() {

                    if [[ -d $HOME/.oh-my-zsh ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 oh-my-zsh (retrying)"
                        git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh/ &>/dev/null
                        check
                    fi

                }

                check

            }

            ohmyzsh

            echo -e "\n⚙️ Installing plugin oh-my-zsh"

            highlighting() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting"
                git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &>/dev/null

                check() {

                    if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-syntax-highlighting (retrying)"
                        git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &>/dev/null
                        check
                    fi

                }

                check

            }

            highlighting

            autosuggest() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions"
                git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions &>/dev/null
                
                check() {

                    if [[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 zsh-autosuggestions (retrying)"
                        git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions &>/dev/null
                        check
                    fi

                }

                check

            }

            autosuggest

        }

        dotfiles() {

            repository
            echo -e "\n⚙️ Installing dotfiles"

            zshrc() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc"
                sleep 2
                cp $DIR/.zshrc $HOME/.zshrc

                check() {

                    if [[ -f $HOME/.zshrc ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .zshrc (retrying)"
                        sleep 2
                        cp $DIR/.zshrc $HOME/.zshrc
                        check
                    fi

                }

                check

            }

            zshrc

            termux() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux"
                sleep 2
                cp -R $DIR/.termux $HOME/.termux

                check() {

                    if [[ -d $HOME/.termux ]]; then
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .termux (retrying)"
                        sleep 2
                        cp -R $DIR/.termux $HOME/.termux
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
                        cp $DIR/fix/mpd/run $PREFIX/var/service/mpd/run &>/dev/null
                        rm -rf $HOME/.config/nvim
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 .config (retrying)"
                        sleep 2
                        cp -R $DIR/.config $HOME/.config
                        check
                    fi

                }

                check

            }

            config

        }

        shell() {

            dotfiles
            echo -e "\n⚙️ Setting SHELL default"

            zsh() {

                start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 change shell to zsh"
                sleep 2

                check() {

                    if [[ $(which zsh) == "/data/data/com.termux/files/usr/bin/zsh" ]]; then
                        chsh -s zsh
                        stop_spinner $?
                    else
                        cp "empty" > /dev/null 2>&1
                        stop_spinner $?
                    fi

                }

                check

            }

            zsh

        }

        rounded() {

            shell
            echo -e "\n⚙️ Installing ZSH Theme"

            start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 rounded.zsh-theme"
            sleep 2
            cp $DIR/rounded.zsh-theme $HOME/.oh-my-zsh/custom/themes/rounded.zsh-theme

            check() {

                if [[ -f $HOME/.oh-my-zsh/custom/themes/rounded.zsh-theme ]]; then
                    stop_spinner $?
                    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
                else
                    cp "empty" > /dev/null 2>&1
                    stop_spinner $?
                    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ⚠️ Restart Termux to complete installation"
                fi

            }

            check

        }

        permission() {

            rounded
            termux-setup-storage
            termux-reload-settings

        }

        permission

    }

    help() {

        echo -e "Usage: \n  ./install.sh [options]"
        echo -e "\nMETA OPTIONS :"
        echo -e "  help                 show list of command-line options."
        echo -e "\nRUN OPTIONS :"
        echo -e "  lightweight          installing with lightweight mode 
                       (not included neovim plugins).\n"
        echo -e "  full                 installing full mode 
                       (included neovim plugins with 
                       node package manager).\n"

    }

    if [[ "$1" == "lightweight" ]]; then
        mode="Install Lightweight"
        lightweight
    elif [[ "$1" == "full" ]]; then
        mode="Install Full"
        full
    elif [[ "$1" == "help" ]]; then
        mode="Help"
        banner
        help
    else
        { mode="Help"; banner; help; exit 1; }
    fi

else
    echo -e '\e[31m'"\n⚠️ ERROR : Global Variable or tput not found !\e[39m\n"

    echo -e "⚠️ Troubleshooting :"
    echo -e "     Global Variable      make sure you copy .xshin.var to 
                          $HOME/\n"
    echo -e "     tput                 run 'pkg install ncurses-utils' 
                          to install tput\n"
    exit 1
fi
