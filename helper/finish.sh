#!/usr/bin/env bash

function alertFinish() {

  echo -e "‏‏‎‏‏‎\n    ‎‏‏‎⚠️ Installation Finish, but you need restart Termux to clear setup\n"

}

function alertNotification() {

  IMAGE_PATH="${HOME}/.config/mytermux/alert/images"
  IMAGE_FILE_NAME="finish.png"

  termux-notification --sound -t "myTermux ${VERSION} has been installed" --image-path ${IMAGE_PATH}/${IMAGE_FILE_NAME}

}

function alertTorch() {

  termux-toast -b "#A8D7FE" -c "#373E4D" -g middle "myTermux ${VERSION} has been installed"

}


function mainAlert() {

  alertFinish
  alertNotification
  alertTorch

}