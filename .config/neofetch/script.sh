#!/data/data/com.termux/files/usr/bin/env bash

# Author : xShin & Annzc
# GitHub : https://github.com/xshin404
#          https://github.com/annzc

# Storage
function storage() {

	# Variable
	size=$(df -h | grep '/storage/emulated' | awk '{print $2}')
	used=$(df -h | grep '/storage/emulated' | awk '{print $3}')
	avail=$(df -h | grep '/storage/emulated' | awk '{print $4}')
	use=$(df -h | grep '/storage/emulated' | awk '{print $5}')
	mounted=$(df -h | grep '/storage/emulated' | awk '{print $6}')

	outputStorage() {
		
		echo -e "Internal Storage {"
		echo -e "	Size		:" $size
		echo -e "	Used		:" $used "/" $size "("$avail $use")"
		echo -e "	Available	:" $avail "/" $size "("$use")"
		echo -e "	Use%		:" $use
		echo -e "	Mounted On	:" $mounted
		echo -e "}"

	}

	outputStorage
	
}

function battery() {

	if [[ -f $PREFIX/bin/termux-battery-status ]]; then

        
		perc=`termux-battery-status | grep percentage | awk '{print $2}' | tr , '%'`
        #debug perc
        #perc=9
		status=`termux-battery-status | grep status | awk '{print $2}'`
        lrd="\e[91m"
		lyw="\e[93m"
		lgn="\e[92m"
		df="\e[39m"

        old() {

    		if [[ $status == '"CHARGING",' ]]; then

    			echo -e $lgn"$df : Charging, (${perc})"

    		elif [[ $status == '"DISCHARGING",' ]]; then

    			echo -e $lyw"$df : Discharging, (${perc})"

    		elif [[ $status == '"FULL"' ]]; then

    			echo -e $lgn"$df : Full, (${perc})"

    		fi

        }


        new() {

            #Known bug :
            # - Icon : 100% Battery on Discharging
            #          3-9% Battery on Discharging

            #Discharging

            if [[ $perc < 21 && $status == '"DISCHARGING",' ]]; then

                echo -e $lrd"$df : Discharging, (${perc})"

            elif [[ $perc < 30, && $perc > 20 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 40 && $perc > 29 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 50 && $perc > 39 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 60 && $perc > 49 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 70 && $perc > 59 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 80 && $perc > 69 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 90 && $perc > 79 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc < 99, && $perc > 89 && $status == '"DISCHARGING",' ]]; then

                echo -e $lyw"$df : Discharging, (${perc})"

            elif [[ $perc == 100 && $status == '"DISCHARGING",' ]]; then

                echo -e $lgn"$df : Discharging, (${perc})"


          #Charging

            elif [[ $perc < 21 && $perc > 2 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"  

            elif [[ $perc < 30 && $perc > 20 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 40 && $perc > 29 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 50 && $perc > 39 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 60 && $perc > 49 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 70 && $perc > 59 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 80 && $perc > 69 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 90 && $perc > 79 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc < 99,5 && $perc > 89 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            elif [[ $perc == 100 && $status == '"CHARGING",' ]]; then

                echo -e $lgn"$df : Charging, (${perc})"

            fi

        }

        new

	else

		echo -e 'ERROR : termux-battery-status not found, make sure you install 
the Termux-API APP (Playstore or F-Droid) and the package with 
"pkg install termux-api"'

    fi

}

version() {

	echo -e "neofetch output v.0.3.0 pre"

}

help() {

    echo -e "Usage: \n  ./script.sh [options]"
    echo -e "\nMETA OPTIONS :"
    echo -e "  -h, --help           Show list of command-line options."
    echo -e "  -v, --version        Show version of script."
    echo -e "\nRUN OPTIONS :"
    echo -e "  -s, --storage        Show Internal Storage."
    echo -e "  -b, --battery        Show Battery Android (Need Termux-API Insatlled)."

}

if [[ "$1" == "-s" || "$1" == "--storage" ]]; then

	storage

elif [[ "$1" == "-b" || "$1" == "--battery" ]]; then

	battery

elif [[ "$1" == "-v" || "$1" == "--version" ]]; then

	version

elif [[ "$1" == "-h" || "$1" == "--help" ]]; then

	help

else

	{ help; exit 1; }

fi
