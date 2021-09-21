#!/usr/bin/env bash

# Author      : xShin (https://github.com/xshin404)
# Contributor : Ann   (https://github.com/annzc)

COLOR_BASED="\e[39m"
COLOR_DANGER="\e[91m"
COLOR_WARNING="\e[93m"
COLOR_SUCCESS="\e[92m"
COLOR_SKY="\e[34m"

function Error() {

  echo -e "[${COLOR_DANGER}ERROR${COLOR_BASED}] > $@"

}

function get_music() {

  ARTIST=$(mpc --host=127.0.0.1 --port=8000 --format '[%artist%]' current 2> /dev/null)
  TITLE=$(mpc --host=127.0.0.1 --port=8000 --format '[%title%]' current 2> /dev/null)

  if mpc --host=127.0.0.1 --port=8000 &> /dev/null; then

    echo -e "${ARTIST} - ${TITLE}"

  else

    echo -e "Unknown Artist - Unknown Song"

  fi

}

# Fetch storage
function storage() {

  MOUNTED_ON="/storage/emulated"
  GREP_ONE_ROW=$(df -h | grep ${MOUNTED_ON})
  SIZE=$(echo ${GREP_ONE_ROW} | awk '{print $2}')
  USED=$(echo ${GREP_ONE_ROW} | awk '{print $3}')
  AVAIL=$(echo ${GREP_ONE_ROW} | awk '{print $4}')
  USE=$(echo ${GREP_ONE_ROW}} | awk '{print $5}' | sed "s/%//g")
  MOUNTED=$(echo ${GREP_ONE_ROW} | awk '{print $6}')

  function execute() {

    if [ ${USE} -ge 0 ] && [ ${USE} -le 10 ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 11 ] && [ ${USE} -le 20 ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 21 ] && [ ${USE} -le 30 ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 31 ] && [ ${USE} -le 40 ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 41 ] && [ ${USE} -le 50 ]; then

      echo -e "${COLOR_SUCCESS}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 51 ] && [ ${USE} -le 60 ]; then

      echo -e "${COLOR_WARNING}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 61 ] && [ ${USE} -le 70 ]; then

      echo -e "${COLOR_WARNING}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 71 ] && [ ${USE} -le 80 ]; then

      echo -e "${COLOR_WARNING}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 81 ] && [ ${USE} -le 90 ]; then

      echo -e "${COLOR_DANGER}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} -ge 91 ] && [ ${USE} -le 99 ]; then

      echo -e "${COLOR_DANGER}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    elif [ ${USE} == 100 ]; then
    
      echo -e "${COLOR_DANGER}${COLOR_BASED} : ${USED}B / ${SIZE}B = ${AVAIL}B (${USE}%)"

    fi

  }

  function help() {
    # Usage Help
    echo -e "Usage:
    ./fetch storage [options]
    "
    
    # Option Help
    echo -e "Options:
    ''        Show default output fetch storage
    -a        Show fetch storage with all output
    -f        Show fetch storage with free space available
    -m        Show fetch storage mounted path
    -s        Show fetch storage total size
    -u        Show fetch storage total used
    -n        Show fetch storage for neofetch output
    -p        Show fetch storage percentage
    "
  }

  case $1 in

    "" )
      echo -e "[ ${COLOR_WARNING} ${MOUNTED}${COLOR_BASED} ] > ${USED}B / ${SIZE}B = ${AVAIL}B (${USE})"
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

    * )
      help
    ;;

  esac

}

function battery() {

  if [ -f ${PREFIX}/bin/termux-battery-status ]; then

    PERCENTAGE=$(termux-battery-status | grep percentage | awk '{print $2}' | sed "s/,//g")
    STATUS=$(termux-battery-status | grep status | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g")

    function execute() {

      if [ ${STATUS} == "CHARGING" ]; then

        if [ ${PERCENTAGE} -ge 0 ] && [ ${PERCENTAGE} -le 10 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 11 ] && [ ${PERCENTAGE} -le 20 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 21 ] && [ ${PERCENTAGE} -le 30 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 31 ] && [ ${PERCENTAGE} -le 40 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 41 ] && [ ${PERCENTAGE} -le 50 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 51 ] && [ ${PERCENTAGE} -le 60 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 61 ] && [ ${PERCENTAGE} -le 70 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 71 ] && [ ${PERCENTAGE} -le 80 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 81 ] && [ ${PERCENTAGE} -le 90 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 91 ] && [ ${PERCENTAGE} -le 99 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE})"

        fi

      elif [ ${STATUS} == "DISCHARGING" ]; then

        if [ ${PERCENTAGE} -ge 0 ] && [ ${PERCENTAGE} -le 10 ]; then

          echo -e "${COLOR_DANGER}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 11 ] && [ ${PERCENTAGE} -le 20 ]; then

          echo -e "${COLOR_DANGER}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 21 ] && [ ${PERCENTAGE} -le 30 ]; then

          echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 31 ] && [ ${PERCENTAGE} -le 40 ]; then

          echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 41 ] && [ ${PERCENTAGE} -le 50 ]; then

          echo -e "${COLOR_WARNING}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 51 ] && [ ${PERCENTAGE} -le 60 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 61 ] && [ ${PERCENTAGE} -le 70 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 71 ] && [ ${PERCENTAGE} -le 80 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 81 ] && [ ${PERCENTAGE} -le 90 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} -ge 91 ] && [ ${PERCENTAGE} -le 99 ]; then

          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        elif [ ${PERCENTAGE} == 100 ]; then
        
          echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Discharging, (${PERCENTAGE})"

        fi

      elif [ ${STATUS} == "FULL" ]; then

        echo -e "${COLOR_SUCCESS}${COLOR_BASED} : Charging, (${PERCENTAGE}%)"

      fi

    }

    function help() {
      # Usage Help
      echo -e "Usage:
      ./fetch battery [options]
      "
      
      # Option Help
      echo -e "Options:
      ''        Show default output fetch battery
      -h        Print help message
      -p        Show fetch battery percentage
      -s        Show fetch battery status state
      "
    }

    case $1 in

      "" )
        execute
      ;;

      -h )
        help
      ;;

      -p )
        echo -e "${PERCENTAGE}"
      ;;

      -s )
        echo -e "${STATUS}"
      ;;

      * )
        help
      ;;

    esac

  else

    Error "Fetching battery error, ${COLOR_WARNING}termux-battery-status ${COLOR_DANGER}not found${COLOR_BASED}. Make sure you installed ${COLOR_WARNING}Termux:API${COLOR_BASED} on ${COLOR_WARNING}Playstore${COLOR_BASED} or ${COLOR_SUCCESS}F-Droid${COLOR_BASED} and package ${COLOR_SUCCESS}termux-api${COLOR_BASED} with pkg"
  
  fi

}

function help() {

  # Usage Help
  echo -e "Usage:
  ./fetch [option1] [option2]
  "
  
  # Option Help
  echo -e "Options:
  music     Run fetch script music
  battery   Run fetch script battery (require option2)
  help      Print help message
  storage   Run fetch script storage (require option2)
  "  

}

case $1 in

  music )
    get_music
  ;;

  battery )
    battery $2
  ;;

  help )
    help
  ;;

  storage )
    storage $2
  ;;

  * )
    help
  ;;

esac
