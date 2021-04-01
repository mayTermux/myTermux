#!/data/data/com.termux/files/usr/bin/env bash

function myip() {

    for((i=1; i<6; i++)) do

        ifconfig | grep inet | sed -n $i"p" | awk '{print $2}'

    done

}

if [[ "$1" == "ap" ]]; then

    myip | sed -n 1p

elif [[ "$1" == "apv6" ]]; then

    myip | sed -n 2p

elif [[ "$1" == "cc" ]]; then

    myip | sed -n 3p

elif [[ "$1" == "lo" ]]; then
    
    myip | sed -n 4p

elif [[ "$1" == "lov6" ]]; then

    myip | sed -n 5p

elif [[ "$1" == "wlan" ]]; then

    myip | sed -n 6p

else

    echo -e "ERROR Execute: Unknown Paramater Use!!!"

fi
