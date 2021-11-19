#!/usr/bin/env bash

function header() {
    printf "\n\n                      %-18s\n\n" "AWESOMESHOT v${VERSION}"
}

function title() {

    echo -e "\n   ${COLOR_SKY}[${1}] ${2}${COLOR_BASED} "

}

function check() {

    if [[ $? -eq 0 && ${PIPESTATUS[0]} -eq 0 ]]; then
        echo -e " ${COLOR_SUCCESS}[SUCCESS]${COLOR_DEFAULT} "
    else
        echo -e " ${COLOR_DANGER}[FAILED]${COLOR_DEFAULT} "
        exit 1
    fi
}