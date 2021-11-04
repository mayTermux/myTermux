#!/usr/bin/env bash

PROGRAM_NAME="awesomeshot"
VERSION="0.2.0"
REPOSITORY_URL="https://github.com/xshin404/myTermux/blob/main/.local/bin/awesomeshot"
BUILD_DATE="Sunday, 25 July 2021"
LAST_UPDATE="Wednesday, 03 November 2021"

LOG_PATH="${HOME}/.config/mytermux/awesomeshot"
LOG_FILE="awesomeshot.log"

function programName() {

  echo -e "${PROGRAM_NAME}"

}

function version() {

  echo -e "${PROGRAM_NAME} ${VERSION}"

}

function buildDate() {

  echo -e "${BUILD_DATE}"

}

function lastUpdate() {

  echo -e "${LAST_UPDATE}"

}

function about() {

  echo -e "
Program Name    : ${PROGRAM_NAME}
Version         : ${VERSION}
Repository URL  : ${REPOSITORY_URL}
Build Date      : ${BUILD_DATE}
Last Update     : ${LAST_UPDATE}
  "

}

function help() {

  echo -e "
Usage:
  awesomeshot [options] [files...]

META OPTIONS:
  -h, --help              show list of command-line options
  -v, --version           show version of awesomeshot

RUN OPTIONS:
  -a, --auto              run awesomeshot with automatic while take screenshot
  -m, --manual            run awesomeshot with manual (${COLOR_WARNING}require filename${COLOR_BASED})
  -i, --info              show about program
  "

}
