#!/data/data/com.termux/files/usr/bin/env bash

# Author      : xShin (https://github.com/xshin404)
# Contributor : Ann   (https://github.com/annzc)


# Storage
function storage() {

	# Variable
	disk=$(df -h 2>/dev/null | grep "/storage/emulated")
	size=$(echo $disk | awk '{print $2}')
	used=$(echo $disk | awk '{print $3}')
	avail=$(echo $disk | awk '{print $4}')
	use=$(echo $disk | awk '{print $5}')
	mounted=$(echo $disk | awk '{print $6}')

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

		batt() {

			termux-battery-status | grep $1 | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g"

		}

		#debug perc
		#perc=9
		perc=`batt "percentage"`
		status=`batt "status"`

		lrd="\e[91m"
		lyw="\e[93m"
		lgn="\e[92m"
		df="\e[39m"

	old() {

		if [[ $status == "CHARGING" ]]; then

			echo -e $lgn"$df : Charging, ($perc%)"

		elif [[ $status == "DISCHARGING" ]]; then

			echo -e $lyw"$df : Discharging, ($perc%)"

		elif [[ $status == "FULL" ]]; then

			echo -e $lgn"$df : Full, ($perc%)"

		fi

	}

	new() {

		#Known bug :
		# - Icon : 100% Battery on Discharging
		#          3-9% Battery on Discharging

    #Discharging
		if [[ $status == "DISCHARGING" ]]; then

			if [[ $perc < 21 ]]; then

				echo -e $lrd"$df : Discharging, ($perc%)"

			elif [[ $perc < 30 && $perc > 20 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 40 && $perc > 29 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 50 && $perc > 39 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 60 && $perc > 49 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 70 && $perc > 59 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 80 && $perc > 69 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 90 && $perc > 79 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc < 99, && $perc > 89 ]]; then

				echo -e $lyw"$df : Discharging, ($perc%)"

			elif [[ $perc == 100 ]]; then

				echo -e $lgn"$df : Discharging, ($perc%)"

			fi

    #Charging
		elif [[ $status == "CHARGING" ]]; then

			if [[ $perc < 21 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"  

			elif [[ $perc < 30 && $perc > 20 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 40 && $perc > 29 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 50 && $perc > 39 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 60 && $perc > 49 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 70 && $perc > 59 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 80 && $perc > 69 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 90 && $perc > 79 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc < 99,5 && $perc > 89 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			elif [[ $perc == 100 ]]; then

				echo -e $lgn"$df : Charging, ($perc%)"

			fi

		fi

	}

	new

	else

		echo -e 'ERROR : termux-battery-status not found, make sure to install 
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
