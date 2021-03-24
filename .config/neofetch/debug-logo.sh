#!/data/data/com.termux/files/usr/bin/env bash

# Author : xShin
# GitHub : https://github.com/xshin404

logo=(

       AIX Alpine Anarchy Android Antergos antiX "AOSC\ OS"
       Apricity ArcoLinux ArchBox ARCHlabs
       ArchStrike XFerience ArchMerge Arch Artix Arya Bedrock
       BunsenLabs Calculate Carbs CentOS Chakra ChaletOS
       Chapeau Chrom* Cleanjaro ClearOS Clear_Linux Clover
       Condres Container_Linux CRUX Cucumber Debian Deepin
       DesaOS Devuan DracOS DarkOs DragonFly Drauger Elementary
       EndeavourOS Endless EuroLinux Exherbo Fedora Feren FreeBSD
       FreeMiNT Frugalware Funtoo GalliumOS Garuda Gentoo Pentoo
       gNewSense GNOME GNU GoboLinux Grombyang Guix Haiku Huayra
       Hyperbola janus Kali KaOS KDE_neon Kibojoe Kogaion
       Korora KSLinux Kubuntu LEDE LFS Linux_Lite
       LMDE Lubuntu Lunar macos Mageia MagpieOS Mandriva
       Manjaro Maui Mer Minix LinuxMint MX_Linux Namib
       Neptune NetBSD Netrunner Nitrux NixOS Nurunner
       NuTyX OBRevenge OpenBSD openEuler OpenIndiana openmamba
       OpenMandriva OpenStage OpenWrt osmc Oracle OS Elbrus PacBSD
       Parabola Pardus Parrot Parsix TrueOS PCLinuxOS Peppermint
       popos Porteus PostMarketOS Proxmox Puppy PureOS Qubes Radix
       Raspbian Reborn_OS Redstar Redcore Redhat Refracted_Devuan
       Regata Rosa sabotage Sabayon Sailfish SalentOS Scientific
       Septor SereneLinux SharkLinux Siduction Slackware SliTaz
       SmartOS Solus Source_Mage Sparky Star SteamOS SunOS
       openSUSE_Leap openSUSE_Tumbleweed openSUSE SwagArch Tails
       Trisquel Ubuntu-Budgie Ubuntu-GNOME Ubuntu-MATE Ubuntu-Studio
       Ubuntu Venom Void Obarun windows10 Windows7 Xubuntu Zorin
       IRIX 

)

logoOld=(

    Arch_old Ubuntu_old Redhat_old Dragonfly_old 
    
)

ubuntuFlavor=(

    Lubuntu Kubuntu Xubuntu Ubuntu-GNOME
    Ubuntu-Studio Ubuntu-Mate Ubuntu-Budgie 

)

logoSmall=(
  
    Arcolinux_small Dragonfly_small Fedora_small Alpine_small Arch_small Ubuntu_small
    CRUX_small Debian_small Gentoo_small FreeBSD_small Mac_small NixOS_small OpenBSD_small android_small
    Artix_small CentOS_small Cleanjaro_small Elementary_small GUIX_small Hyperbola_small
    Manjaro_small MX_small NetBSD_small Parabola_small POP_OS_small PureOS_small
    Slackware_small SunOS_small LinuxLite_small OpenSUSE_small Raspbian_small
    postmarketOS_small Void_small 

)

randomLogo=${logo[$RANDOM % ${#logo[@]} ]}

randomLogoSmall=${logoSmall[$RANDOM % ${#logoSmall[@]} ]}

function logodebug() {

    for logodebug in "${logo[@]}"; do

        neofetch --ascii_distro $logodebug
        echo -e "^^^^^^^^^^^^"
        echo -e "Distro Name : $logodebug"
        #sleep 2s
        echo -e ""

    done

}

function logodebugold() {

    for logodebugOld in "${logoOld[@]}"; do

        neofetch --ascii_distro $logodebugOld
        echo -e "^^^^^^^^^^^^"
        echo -e "Distro Name : $logodebugOld"
        #sleep 2s
        echo -e ""
    
    done

}

function logodebugubuntuflavor() {

    for logodebugubuntuFlavor in "${ubuntuFlavor[@]}"; do

        neofetch --ascii_distro $logodebugubuntuFlavor
        echo -e "^^^^^^^^^^^^"
        echo -e "Distro Name : $logodebugubuntuFlavor"
        #sleep 2s
        echo -e ""

    done

}


function logodebugsmall() {

    for logodebugSmall in "${logoSmall[@]}"; do

        neofetch --ascii_distro $logodebugSmall
        echo -e "^^^^^^^^^^^^"
        echo -e "Distro Name : $logodebugSmall"
        #sleep 2s
        echo -e ""

    done

}

function random() {

    neofetch --ascii_distro $randomLogo

}

function randomsmall() {

    neofetch --ascii_distro $randomLogoSmall

}

function help() {

    echo -e "\nUsage : ./debug-logo.sh [options]\n"

    echo -e "   RUN OPTIONS\n"
    echo -e "   --logo              all default logo neofetch"
    echo -e "   --old               distro logo old"
    echo -e "   --ubuntuflavor      ubuntu distro"
    echo -e "   --small             distro logo small"
    echo -e "   --all               all options will run\n"

    echo -e "   RANDOM OPTIONS\n"
    echo -e "   --random            random distro logo"
    echo -e "   --randomsmall       random distro logo small\n"

}

if [[ "$1" == "--logo" ]]; then

    logodebug

elif [[ "$1" == "--old" ]]; then

    logodebugold

elif [[ "$1" == "--ubuntuflavor" ]]; then

    logodebugubuntuflavor

elif [[ "$1" == "--small" ]]; then

    logodebugsmall

elif [[ "$1" == "--random" ]]; then

    random

elif [[ "$1" == "--randomsmall" ]]; then

    randomsmall

elif [[ "$1" == "--all" ]]; then

    logodebug
    logodebugold
    logodebugubuntuflavor
    logodebugsmall

else

    help
    exit 1

fi
