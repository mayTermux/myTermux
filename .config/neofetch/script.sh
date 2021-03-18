#!/data/data/com.termux/files/usr/bin/env bash

# Storage
storage() {

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

battery() {

	if [[ -f $PREFIX/bin/termux-battery-status ]]; then

		percentage=`termux-battery-status | grep percentage | awk '{print $2}' | tr , '%'`
		status=`termux-battery-status | grep status | awk '{print $2}'`
		lyw='\e[93m'
		lgn='\e[92m'
		df='\e[39m'

		if [[ $status == '"CHARGING",' ]]; then

			echo -e $lgn"$df : Charging, (${percentage})"

		elif [[ $status == '"DISCHARGING",' ]]; then

			echo -e $lyw"$df : Discharging, (${percentage})"

		elif [[ $status == '"FULL"' ]]; then

			echo -e $lgn"$df : Full, (${percentage})"

		fi

	else

		echo -e 'ERROR: termux-battery-status not found, make sure you install the Termux-API APP (Playstore or F-Droid) and the package with "pkg install termux-api"'

}

version() {

	echo -e "neofetch output v.0.3.0"

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
