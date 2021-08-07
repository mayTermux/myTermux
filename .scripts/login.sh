#!/usr/bin/env bash
#/data/data/com.termux/files/usr/bin/env bash

# Author : xShin
# GitHub : https://github.com/xshin404

RED="\e[91m"
YELLOW="\e[93m"
GREEN="\e[92m"
DEFAULT="\e[39m"

user="xshin"
pass="xshin"

handle_ctrl_c() {

        pkill com.termux

        echo -e "\n\nERROR    :$RED Oops, you can't exit!$DEFAULT\n"
        echo -e "             Message"
        echo -e "             ━━━━━━━"
        echo -e "$YELLOW   Press Enter to back Login or"
        echo -e "   Enter username / password to\n   continue.$DEFAULT"

}

trap "handle_ctrl_c" 2

clear
while true; do

    echo -e ""
    echo -e "Login to Termux!\n"
    # echo -e "━━━━━━━━━━━━━━\n"
    read -p "Username : " username

    if [[ "$username" == "$user" ]]; then

        echo -e "Password :"
        read -s -r password

        if [[ "$password" == "$pass" ]]; then
           
            echo -e ""
            echo -e "Status   :$GREEN Success Login.$DEFAULT"
            sleep 2s
            clear

            # if [ ! -d ~/.scripts/pid ]; then

            #     mkdir ~/.scripts/pid

            # fi

            # echo $$ >> ~/.scripts/pid/login
            break

        else

            echo -e ""
            echo -e "status   :$RED Wrong Password.$DEFAULT"
            sleep 2s
            clear

        fi

    else

        echo -e ""
        echo -e "status   :$YELLOW Wrong Username.$DEFAULT"
        sleep 2s
        clear

    fi

done