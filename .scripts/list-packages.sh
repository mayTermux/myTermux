#!/data/data/com.termux/files/usr/bin/env bash

# Author : xShin
# GitHub : https://github.com/xshin404

if [[ -f $HOME/.xshin.var ]]; then

    source $HOME/.xshin.var

    tablelightweight() {

        for lightweightpkg in ${lightweightpkgs[@]}; do
            name=$(apt show $lightweightpkg 2> /dev/null | sed -n 1p | awk '{print $2}')
            size=$(apt show $lightweightpkg 2> /dev/null | grep Installed-Size: | awk '{print $2$3}')
            printf "‏‏‎‏‏‎ ‎‏‏‎ ┃   %-8s              ▎  %6s  ┃\n" $name $size
        done

    }

    tablefull() {

        for fullpkg in ${fullpkgs[@]}; do
            name=$(apt show $fullpkg 2> /dev/null | sed -n 1p | awk '{print $2}')
            size=$(apt show $fullpkg 2> /dev/null | grep Installed-Size: | awk '{print $2$3}')
            printf "‏‏‎‏‏‎ ‎‏‏‎ ┃   %-11s    ▎ %7s  ┃\n" $name $size
        done

    }

    version() {

        echo -e "list-packages v.0.2.0 ( built on 1 Maret 2021 )"
    
    }

else

    echo -e "ERROR : Please Setting Up Global Variable First."
    exit 1

fi

help() {

    echo -e "Usage: \n  ./list-packages [mode] [options]"
    echo -e "\nMETA OPTIONS :"
    echo -e "  help                 show list of command-line options."
    echo -e "  version              show version of script."
    echo -e "\nMODE OPTIONS :"
    echo -e "  table                output with table mode."
    echo -e "\nRUN OPTIONS :"
    echo -e "  lightweight          show packages + size lightweight installation."
    echo -e "  full                 show packages + size full installation .\n"

}

if [[ "$1" == "table" && "$2" == "lightweight" ]]; then

    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╭────────────────────────────────────╮"
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ┃   Package Lightweight   ▎   Size   ┃"
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰────────────────────────────────────╯"
    tablelightweight
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰────────────────────────────────────╯"

elif [[ "$1" == "table" && "$2" == "full" ]]; then

    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╭─────────────────────────────╮"
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ┃   Package Full   ▎   Size   ┃"
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰─────────────────────────────╯"
    tablefull
    echo -e "‏‏‎‏‏‎ ‎‏‏‎ ╰─────────────────────────────╯"

elif [[ "$1" == "version" ]]; then

    version

elif [[ "$1" == "help" ]]; then

    help

else

    { help; exit 1; }

fi

