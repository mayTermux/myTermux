#!/data/data/com.termux/files/usr/bin/env bash

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

while true; do

    echo -e ""
    echo -e "Welcome to Termux!\n"
    #echo -e "━━━━━━━━━━━━━━━━━\n"
    read -p "username : " username

    if [[ "$username" == "$user" ]]; then

        echo -e "password :"
        read -r -s password

        if [[ "$password" == "$pass" ]]; then
           
            echo -e ""
            echo -e "status   :$GREEN Success Login.$DEFAULT"
            sleep 2s
            clear
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

