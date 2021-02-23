#!/bin/bash

#DIR=`cd $(dirname $0); pwd`

#source $DIR/.xshin.var

source $HOME/.xshin.var

if [[ -f $HOME/.xshin.var ]]; then
zshPackages() {
    for ohpkg in ${ohpkgs[@]}; do
        name=$(apt show $ohpkg 2> /dev/null | sed -n 1p | awk '{print $2}')
        size=$(apt show $ohpkg 2> /dev/null | sed -n 4p | awk '{print $2" "$3}')
        echo -e "$name : $size"
    done
}

standarPackages() {
    for stanpkg in ${stanpkgs[@]}; do
        name=$(apt show $stanpkg 2> /dev/null | sed -n 1p | awk '{print $2}')
        size=$(apt show $stanpkg 2> /dev/null | sed -n 4p | awk '{print $2" "$3}')
        echo -e "$name : $size"
    done
}

version() {
    echo -e "check-size-packages v.0.1.0"
}
else
    echo -e "ERROR : Please Setting Up Global Variable First."
    exit 1
fi

help() {
    echo -e "Usage: \n  ./list-packages [options]"
    echo -e "\nMETA OPTIONS :"
    echo -e "  -h, --help           show list of command-line options."
    echo -e "  -v, --version        show version of script."
    echo -e "\nRUN OPTIONS :"
    echo -e "  zsh                  show all packages + size zsh installation."
    echo -e "  standar              show all packages + size standar installation."
    echo -e "  all                  show all packages + size all installation.\n"
}

if [[ "$1" == "zsh" ]]; then
    zshPackages
elif [[ "$1" == "standar" || "$1" == "all" ]]; then
    zshPackages
    standarPackages
elif [[ "$1" == "-v" || "$1" == "--version" ]]; then
    version
elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
    help
else
    { help; exit 1; }
fi
