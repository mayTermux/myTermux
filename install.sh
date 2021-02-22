#!/bin/bash

DIR=`cd $(dirname $0); pwd`

source $DIR/.xshin.var

zsh() {
    echo -e "   ____  __          __  ___         _____  _____ __  __"
    echo -e "  / __ \/ /_        /  |/  /_  __   /__  / / ___// / / /"
    echo -e " / / / / __ \______/ /|_/ / / / /_____/ /  \__ \/ /_/ /"
    echo -e "/ /_/ / / / /_____/ /  / / /_/ /_____/ /_____/ / __  /"
    echo -e "\____/_/ /_/     /_/  /_/\__, /     /____/____/_/ /_/"
    echo -e "                        /____/"
    echo -e "\n[1] Simple Mode"
    echo -e "[2] Powerlevel10k Mode\n"
    read -p "Choose : " ChooseMode
    simple() {
        echo -e $lyw"\nPreparing to backup files or directory related on zsh !\n$df"
        sleep 2s
        for file in "${files[@]}"; do
            if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
                echo -e $lyw"[*] $file found . . ."
                echo -e "Preparing backup $file to $file.old !$df"
                sleep 2s
                { mv -u ${HOME}/${file}{,.old}; }
                if [[ -f "$HOME/$file.old" || -d "$HOME/$file.old" ]]; then
                    echo -e $lgn"[*] Successfully backup $file\n$df"
                else
                    echo -e $lgn"[*] Failed backup $file\n$df"
                fi
            else
                echo -e $lyw"[*] $file not found, skip it !\n$df"
            fi
        done
        echo -e $lyw"Preparing to install package related on zsh !\n$df"
        sleep 2s
        pkg update -y && pkg upgrade -y
        echo ""
        for ohpkg in "${ohpkgs[@]}"; do
            echo -e $lyw"[*] Installing $ohpkg . . .\n$df"
            { pkg install -y $ohpkg; }
            ipkg=$(pkg list-installed $ohpkg 2> /dev/null | tail -n 1)
            cpkg=${ipkg%/*}
            if [[ $cpkg == $ohpkg ]]; then
                echo -e $lgn"\n[!] Successfully installed $ohpkg\n$df"
            else
                echo -e $lrd"\n[!] Failed installed $ohpkg\n$df"
            fi
        done
        echo -e $lyt"Preparing to clone repository related on zsh !\n$df"
        sleep 2s
        for ohrepo in "${ohrepos[@]}"; do
            echo -e $lyw"[*] Cloning $ohrepo . . .\n$df"
            git clone $ohrepo
            echo ""
        done
        echo -e $lyt"Preparing to check clone repository related on zsh !\n$df"
        sleep 2s
        for ohname in "${ohnames[@]}"; do
            if [[ "$ohname" == "oh-my-zsh" ]]; then
                mv $ohname .$ohname
                mv .$ohname $HOME/
                if [[ -d $HOME/.$ohname ]]; then
                    echo -e $lgn"[!] Successfully clone $ohname $df"
                else
                    echo -e $lrd"[!] Failed clone $ohname $df"
                fi
            elif [[ "$ohname" == "zsh-syntax-highlighting" ]]; then
                mv $ohname $HOME/.oh-my-zsh/custom/plugins/
                if [[ -d $HOME/.oh-my-zsh/custom/plugins/$ohname ]]; then
                    echo -e $lgn"[!] Successfully clone $ohname $df"
                else
                    echo -e $lrd"[!] Failed clone $ohname $df"
                fi
            elif [[ "$ohname" == "zsh-autosuggestions" ]]; then
                mv $ohname $HOME/.oh-my-zsh/custom/plugins/
                if [[ -d $HOME/.oh-my-zsh/custom/plugins/$ohname ]]; then
                    echo -e $lgn"[!] Successfully clone $ohname $df"
                else
                    echo -e $lrd"[!] Failed clone $ohname $df"
                fi
            else
                echo $lyw"$ohname not found ! $df"
            fi
        done
        echo ""
        echo -e $lyt"Preparing to setup my zshfile !\n$df"
        sleep 2s
        mkdir $HOME/.config/
        for zshfile in "${zshfiles[@]}"; do
            if [[ "$zshfile" == ".zshrc" ]]; then
                cp $DIR/termux/$zshfile $HOME
                if [[ -f $HOME/$zshfile ]]; then
                    echo -e $lgn"[!] Successfully setup $zshfile $df"
                else
                    echo -e $lrd"[!] Failed setup $zshfile $df"
                fi
            elif [[ "$zshfile" == "rounded.zsh-theme" ]]; then
                cp $DIR/termux/$zshfile $HOME/.oh-my-zsh/custom/themes/
                if [[ -f $HOME/.oh-my-zsh/custom/themes/$zshfile ]]; then
                    echo -e $lgn"[!] Successfully setup $zshfile $df"
                else
                    echo -e $lrd"[!] Failed setup $zshfile $df"
                fi
            elif [[ "$zshfile" == ".termux" ]]; then
                cp -R $DIR/termux/$zshfile $HOME
                if [[ -d $HOME/$zshfile ]]; then
                    echo -e $lgn"[!] Successfully setup $zshfile $df"
                else
                    echo -e $lrd"[!] Failed setup $zshfile $df"
                fi
            elif [[ "$zshfile" == "neofetch" ]]; then
                cp -R $DIR/termux/.config/$zshfile $HOME/.config/
                if [[ -d $HOME/.config/$zshfile ]]; then
                    echo -e $lgn"[!] Successfully setup $zshfile $df"
                else
                    echo -e $lrd"[!] Failed setup $zshfile $df"
                fi
            else
                echo -e $lyw"$zshfile not found ! $df"
            fi
        done
        echo ""
        echo -e $lyw"Getting PATH ZSH . . .\n$df"
        sleep 2s
        which zsh
        chsh -s zsh
        echo ""
        termux-reload-settings
        # echo -e $lyw"Result : [!] Please restart Termux to complete\n$df"
    }

    p10k() {
        echo -e $lyw"Adding Theme Powerlevel10k !\n$df"
        sleep 2s
        git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        if [[ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
            echo -e $lyw"Preparing change theme ZSH to Powerlevel10k"
            sed -i '1iZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc"
            echo -e $lgn"[!] Successfully adding Theme Powerlevel10k $df"
        else
            echo -e $lrd"[!] Failed adding Theme Powerlevel10k $df"
        fi
    }

    if [[ $ChooseMode == 1 ]]; then
        simple
        echo -e $lyw"[!] Please restart Termux to complete installation ZSH $df"
    elif [[ $ChooseMode == 2 ]]; then
        simple
        p10k
        echo -e $lyw"[!] Please restart Termux to complete installation ZSH\n$df"
    else
        { echo -e $lyw"Please input correctly answer $df"; zsh; }
    fi
}

standar() {
    zsh
    echo -e "\nPreparing to backup files or directory standar !\n$df"
    sleep 2s
    for sfile in "${stanfiles[@]}"; do
        if [[ -f "$HOME/$sfile" || -d "$HOME/$sfile" ]]; then
            echo -e $lyw"[*] $sfile found . . ."
            echo -e "Preparing backup $sfile to $sfile.old !$df"
            sleep 2s
            { mv -u ${HOME}/${sfile}{,.old}; }
            if [[ -f "$HOME/$sfile.old" || -d "$HOME/$sfile.old" ]]; then
                echo -e $lgn"[*] Successfully backup $sfile\n$df"
            else
                echo -e $lgn"[*] Failed backup $sfile\n$df"
            fi
        else
            echo -e $lyw"[*] $sfile not found, skip it !\n$df"
        fi
    done
    echo -e "Preparing to install standar package !\n$df"
    sleep 2s
    for spkg in "${stanpkgs[@]}"; do
        echo -e $lyw"[*] Installing $spkg . . .\n$df"
        { pkg install -y $spkg; }
        ipkg=$(pkg list-installed $spkg 2> /dev/null | tail -n 1)
        cpkg=${ipkg%/*}
        if [[ $cpkg == $spkg ]]; then
            echo -e $lgn"\n[!] Successfully installed $spkg\n$df"
            if [[ $cpkg == "python" ]]; then
                pip install youtube-dl
                if [[ -f $PREFIX/bin/youtube-dl ]]; then
                    echo -e $lgn"\n[!] Successfully installed youtube-dl\n$df"
                else
                    echo -e $lrd"\n[!] Failed installed youtube-dl\n$df"
                fi
            fi
        else
            echo -e $lrd"\n[!] Failed installed $spkg\n$df"
        fi
    done
    echo -e "Preparing to setup music (mpd & ncmpcpp) !\n$df"
    sleep 2s
    for music in "${musics[@]}"; do
        cp -R $DIR/termux/.config/$music $HOME/.config/
        if [[ -d $HOME/.config/$music ]]; then
            echo -e $lgn"[!] Successfully setup $music $df"
        else
            echo -e $lrd"[!] Failed setup $music $df"
        fi
    done
    echo -e $lyw"\nSetup music done !\n$df"
    sleep 2s
    echo -e "Preparing to setup neovim + plugin !\n$df"
    sleep 2s
    for neovim in "${neovims[@]}"; do
        if [[ "$neovim" == "nvim" ]]; then
            cp -R $DIR/termux/.local $HOME/
            if [[ -d $HOME/.local/share/$neovim ]]; then
                echo -e $lgn"[!] Successfully setup $neovim $df"
            else
                echo -e $lrd"[!] Failed setup $neovim $df"
            fi
        elif [[ "$neovim" == "init.vim" ]]; then
            mkdir $HOME/.config/nvim/
            cp $DIR/termux/.config/nvim/$neovim $HOME/.config/nvim/
            if [[ -f $HOME/.config/nvim/$neovim ]]; then
                echo -e $lgn"[!] Successfully setup $neovim $df"
            else
                echo -e $lrd"[!] Failed setup $neovim $df"
            fi
        fi
    done
}

all() {
    standar
    echo -e $lyt"Preparing to clone private github repository\n$df"
    sleep 2s
    mkdir $HOME/repository
    for privrepo in "${privrepos[@]}"; do
        echo -e $lyw"[*] Cloning $privrepo . . .\n$df"
        git clone $privlink/$privrepo $HOME/repository/$privrepo
        if [[ -d $HOME/repository/$privrepo ]]; then
            echo -e $lgn"\n[!] Successfully clone $privrepo\n$df"
            if [[ $privrepo == "gitconsole" ]]; then
                bash $HOME/repository/$privrepo/auto_conf.sh
            elif [[ $privrepo == "termuxconsole" ]]; then
                bash $HOME/repository/$privrepo/auto_conf.sh
            fi
        else
            echo -e $lrd"[!] Failed clone $privrepo\n$df"
        fi
    done
}

version() {
    echo -e "myTermux v0.2.0"
}

help() {
    echo -e "Usage: \n  ./install.sh [options]"
    echo -e "\nMETA OPTIONS :"
    echo -e "  -h, --help           Show list of command-line options."
    echo -e "  -v, --version        Show version of script."
    echo -e "\nRUN OPTIONS :"
    echo -e "  -z, --zsh            Just installing Oh-My-ZSH."
    echo -e "  -s, --standar        Oh-My-ZSH + some package like (vim, nvim + plugin, mpd, ncmpcpp, youtube-dl, ncdu & etc), take a lot more storage."
    echo -e "  -a, --all            Installing all my Termux, NOTE ! take a lot more storage & need clone private github repository (Authentication).\n"
}

if [[ $1 == -z || $1 == --zsh ]]; then
    zsh
elif [[ $1 == -s || $1 == --standar ]]; then
    standar
elif [[ $1 == -a || $1 == --all ]]; then
    all
elif [[ $1 == -h || $1 == --help ]]; then
    help
elif [[ $1 == -v || $1 == --version ]]; then
    version
else
    { help; exit 0; }
fi
