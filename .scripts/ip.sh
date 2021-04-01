#!/data/data/com.termux/files/usr/bin/env bash

function simcard() {

    interface=`ip route | sed -n 1p | awk '{print $3}'`

    if [[ "$interface" == "ccmni0" ]]; then

        echo -e "Simcard" `ip route | grep ccmni0 | awk '{print $9}'`

    elif [[ "$interface" == "ccmni1" ]]; then

        echo -e "Simcard" `ip route | grep ccmni1 | awk '{print $9}'`

    fi

}

function hotspot() {

    interface=`ip route | sed -n 2p | awk '{print $3}'`

    if [[ "$interface" == "ap0" ]]; then

        echo -e "Hotspot" `ip route | grep ap0 | awk '{print $9}'`

    elif [[ "$interface" == "tun0" ]]; then

        echo -e "Hotspot" `ip route | grep ap0 | awk '{print $9}'`

    fi

}

function vpn() {

    interface=`ip route | sed -n 2p | awk '{print $3}'`

    if [[ "$interface" == "tun0" ]]; then

        echo -e "VPN" `ip route | grep tun0 | awk '{print $9}'`

    elif [[ "$interface" == "wlan0" ]]; then

        echo -e "VPN" `ip route | grep tun0 | awk '{print $9}'`

    fi

}

function wifi() {

    interface=`ip route | sed -n 2p | awk '{print $3}'`

    if [[ "$interface" == "wlan0" ]]; then

        echo -e "WiFi" `ip route | grep wlan0 | awk '{print $9}'`

    elif [[ "$interface" == "tun0" ]]; then

        echo -e "WiFi" `ip route | grep wlan0 | awk '{print $9}'`

    fi

}

if [[ "$1" == "simcard" ]]; then

    simcard

elif [[ "$1" == "hotspot" ]]; then

    hotspot

elif [[ "$1" == "vpn" ]]; then

    vpn

elif [[ "$1" == "wifi" ]]; then

    wifi

elif [[ "$1" == "all" ]]; then


    simcard
    hotspot
    vpn
    wifi

else

    echo -e "ERROR Execute: Unknown Paramater Use!"

fi
