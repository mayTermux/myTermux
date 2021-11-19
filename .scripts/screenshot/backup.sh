#!/usr/bin/env bash

PATH_BACKUP="${HOME}/.config/mytermux/awesomeshot/backup"

function backupOriginalPhoto() {

  FILENAME="${1}"
  FILENAME_BACKUP="${2}"
  CHANGE_FILENAME=$( echo "${FILENAME_BACKUP}" | sed 's/.png/.backup.png/g' )

  if [ ! -d ${PATH_BACKUP} ]; then

    mkdir -p ${PATH_BACKUP}

    cp ${FILENAME} ${PATH_BACKUP}/${CHANGE_FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1

    if [ -f ${PATH_BACKUP}/${CHANGE_FILENAME} ]; then

      printf "%-45s" "*******[+]*Backup*File*" | sed 's/ /./g' | sed 's/*/ /g'
      check

    else

      printf "%-45s" "*******[+]*Backup*File*" | sed 's/ /./g' | sed 's/*/ /g'
      check
    
    fi

  else

    cp ${FILENAME} ${PATH_BACKUP}/${CHANGE_FILENAME} >> ${LOG_PATH}/${LOG_FILE} 2>&1

    if [ -f ${PATH_BACKUP}/${CHANGE_FILENAME} ]; then

      printf "%-45s" "*******[+]*Backup*File*" | sed 's/ /./g' | sed 's/*/ /g'
      check

    else

      printf "%-45s" "*******[+]*Backup*File*" | sed 's/ /./g' | sed 's/*/ /g'
      check
    
    fi

  fi

}