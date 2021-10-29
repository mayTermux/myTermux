#!/usr/bin/env bash

LIBRARYS=(
  colors signal stat
)

LIBRARY_PATH="${HOME}/.scripts/library"

for LIBRARY in ${LIBRARYS[@]}; do
  source ${LIBRARY_PATH}/${LIBRARY}.sh
done

function fetchMusic() {

  MPD_HOST=127.0.0.1 # or localhost
  MPD_PORT=8000 # Depend your MPD configuration
  #MPC_CONNECT_MPD=$(mpc --host=${MPD_HOST} --port=${MPD_PORT} &> /dev/null)

  if mpc --host=${MPD_HOST} --port=${MPD_PORT} &> /dev/null; then

    GET_MUSIC_ARTIST=$(mpc --host=${MPD_HOST} --port=${MPD_PORT} --format '[%artist%]' current 2> /dev/null)
    GET_MUSIC_TITLE=$(mpc --host=${MPD_HOST} --port=${MPD_PORT} --format '[%title%]' current 2> /dev/null)

    echo -e "${GET_MUSIC_ARTIST} - ${GET_MUSIC_TITLE}"

  else

    echo -e "Unknown Artist - Unknown Song"

  fi

}

function fetchStorage() {

  MOUNTED_ON="/storage/emulated"
  GREP_ONE_ROW=$(df -h | grep ${MOUNTED_ON})
  SIZE=$(echo ${GREP_ONE_ROW} | awk '{print $2}')
  USED=$(echo ${GREP_ONE_ROW} | awk '{print $3}')
  AVAIL=$(echo ${GREP_ONE_ROW} | awk '{print $4}')
  USE=$(echo ${GREP_ONE_ROW}} | awk '{print $5}' | sed "s/%//g")
  MOUNTED=$(echo ${GREP_ONE_ROW} | awk '{print $6}')
  ICON=""

  function execute() {

    if [ ${USE} -ge 0 ] && [ ${USE} -le 10 ]; then

      echo -e "${COLOR_SUCCESS}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 11 ] && [ ${USE} -le 20 ]; then

      echo -e "${COLOR_SUCCESS}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 21 ] && [ ${USE} -le 30 ]; then

      echo -e "${COLOR_SUCCESS}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 31 ] && [ ${USE} -le 40 ]; then

      echo -e "${COLOR_SUCCESS}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 41 ] && [ ${USE} -le 50 ]; then

      echo -e "${COLOR_SUCCESS}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 51 ] && [ ${USE} -le 60 ]; then

      echo -e "${COLOR_WARNING}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 61 ] && [ ${USE} -le 70 ]; then

      echo -e "${COLOR_WARNING}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 71 ] && [ ${USE} -le 80 ]; then

      echo -e "${COLOR_WARNING}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 81 ] && [ ${USE} -le 90 ]; then

      echo -e "${COLOR_DANGER}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 91 ] && [ ${USE} -le 99 ]; then

      echo -e "${COLOR_DANGER}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} == 100 ]; then
    
      echo -e "${COLOR_DANGER}${ICON}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    fi

  }

  function help() {

    echo -e "Usage:
    ./fetch storage [options]
    "
    
    echo -e "Options:
    -a        Show fetch storage with all output
    -f        Show fetch storage with free space available
    -m        Show fetch storage mounted path
    -s        Show fetch storage total size
    -u        Show fetch storage total used
    -n        Show fetch storage for neofetch output
    -p        Show fetch storage percentage
    -h        Print help message
    "
  }

  case $1 in

    "" )
      # echo -e "[ ${COLOR_WARNING}${ICON} ${MOUNTED}${COLOR_BASED} ] > ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"
      stat "${ICON} ${MOUNTED}" "Warning" "${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"
    ;;

    -a )
      echo -e "${USED}B / ${SIZE}B = ${AVAIL}B (${USE}) > ${MOUNTED}"
    ;;

    -f )
      echo -e "${AVAIL}B"
    ;;

    -m )
      echo -e "${MOUNTED}"
    ;;

    -n )
      execute
    ;;

    -s )
      echo -e "${SIZE}B"
    ;;

    -u )
      echo -e "${USED}"
    ;;

    -p )
      echo -e "${USE}"
    ;;

    -h )
      help
    ;;

    * )
      help
    ;;

  esac

}

function fetchBattery() {

  COMMAND="termux-battery-status"
  GET_BATTERY_PERCENTAGE=$(${COMMAND} 2> /dev/null | grep percentage | awk '{print $2}' | sed "s/,//g")
  GET_BATTERY_STATE=$(${COMMAND} 2> /dev/null | grep status | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g")

  function checkingCommand() {

    if [ -x "$(command -v ${COMMAND})" ]; then

      ${1}

    else

      stat "ERROR" "Danger" "Can't fetch battery, command '${COLOR_DANGER}${COMMAND}${COLOR_BASED}' not found. 
            Make sure you installed '${COLOR_WARNING}Termux:API${COLOR_BASED}' on '${COLOR_WARNING}Playstore${COLOR_BASED}' or 
            '${COLOR_SUCCESS}F-Droid${COLOR_BASED}' and the package '${COLOR_SUCCESS}termux-api${COLOR_BASED}' with '${COLOR_WARNING}pkg install${COLOR_BASED}'"

    fi

  }

  function executeFetch() {

    if [ ${GET_BATTERY_STATE} == "CHARGING" ]; then

      if [ ${GET_BATTERY_PERCENTAGE} -ge 0 ] && [ ${GET_BATTERY_PERCENTAGE} -le 10 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 11 ] && [ ${GET_BATTERY_PERCENTAGE} -le 20 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 21 ] && [ ${GET_BATTERY_PERCENTAGE} -le 30 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 31 ] && [ ${GET_BATTERY_PERCENTAGE} -le 40 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 41 ] && [ ${GET_BATTERY_PERCENTAGE} -le 50 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 51 ] && [ ${GET_BATTERY_PERCENTAGE} -le 60 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 61 ] && [ ${GET_BATTERY_PERCENTAGE} -le 70 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 71 ] && [ ${GET_BATTERY_PERCENTAGE} -le 80 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 81 ] && [ ${GET_BATTERY_PERCENTAGE} -le 90 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 91 ] && [ ${GET_BATTERY_PERCENTAGE} -le 99 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

      fi

    elif [ ${GET_BATTERY_STATE} == "DISCHARGING" ]; then

      if [ ${GET_BATTERY_PERCENTAGE} -ge 0 ] && [ ${GET_BATTERY_PERCENTAGE} -le 10 ]; then

        echo -e "${COLOR_DANGER}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 11 ] && [ ${GET_BATTERY_PERCENTAGE} -le 20 ]; then

        echo -e "${COLOR_DANGER}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 21 ] && [ ${GET_BATTERY_PERCENTAGE} -le 30 ]; then

        echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 31 ] && [ ${GET_BATTERY_PERCENTAGE} -le 40 ]; then

        echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 41 ] && [ ${GET_BATTERY_PERCENTAGE} -le 50 ]; then

        echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 51 ] && [ ${GET_BATTERY_PERCENTAGE} -le 60 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 61 ] && [ ${GET_BATTERY_PERCENTAGE} -le 70 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 71 ] && [ ${GET_BATTERY_PERCENTAGE} -le 80 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 81 ] && [ ${GET_BATTERY_PERCENTAGE} -le 90 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} -ge 91 ] && [ ${GET_BATTERY_PERCENTAGE} -le 99 ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      elif [ ${GET_BATTERY_PERCENTAGE} == 100 ]; then
      
        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${GET_BATTERY_PERCENTAGE}%)"

      fi

    elif [ ${GET_BATTERY_STATE} == "FULL" ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${GET_BATTERY_PERCENTAGE}%)"

    fi

  }

  function help() {
    
    echo -e "Usage:
    ./fetch battery [option]
    "
    
    echo -e "Options:
    percentage    Fetch Battery Percentage
    state         Fetch Battery State (Charging / Discharging / FULL)
    help          Print help message
    "

  }

  case ${1} in

    "" )
      checkingCommand executeFetch
    ;;

    percentage )
      echo -e "${GET_BATTERY_PERCENTAGE}"
    ;;

    state )
      echo -e "${GET_BATTERY_STATE}"
    ;;

    help )
      help
    ;;

    * )
      help
    ;;

  esac

}

function fetchHelp() {

  echo -e "\nUsage:
  ./fetch [option1] [option2]
  "
  
  echo -e "Options:
  music     Fetch script music
  battery   Fetch script battery (${COLOR_WARNING}require option2${COLOR_BASED})
  storage   Fetch script storage (${COLOR_WARNING}require option2${COLOR_BASED})
  help      Print help message
  "  

}

case ${1} in

  battery )
    fetchBattery ${2}
  ;;

  music )
    fetchMusic
  ;;

  storage )
    fetchStorage ${2}
  ;;

  help )
    fetchHelp
  ;;

  * )
    fetchHelp
  ;;

esac
