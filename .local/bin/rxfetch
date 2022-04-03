#!/usr/bin/env bash

magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;40;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
c0=${reset}
c1=${magenta}
c2=${green}
c3=${white}
c4=${blue}
c5=${red}
c6=${yellow}
c7=${cyan}
c8=${black}
c9=${bgyellow}
c10=${bgwhite}

function getCodeName() {
  codename="$(getprop ro.product.board)"
}

function getClientBase() {
  client_base="$(getprop ro.com.google.clientidbase)"
}

function getModel() {
  model="$(getprop ro.product.brand) $(getprop ro.product.model)"
}

function getDistro() {
  os="$(uname -o) $(uname -m)"
}

function getKernel() {
  kernel="$(uname -r)"
}

function getTotalPackages() {
  package_manager="$(which {apt,dpkg} 2>/dev/null | grep -v "not found" | awk -F/ 'NR==1{print $NF}')"
  case "${package_manager}" in
    "apt" )
      packages=$(apt list --installed 2>/dev/null | wc -l)
    ;;
    
    "dpkg" )
      packages=$(dpkg-query -l | wc -l)
    ;;
    
    "" )
      packages="Unknown"
    ;;
  esac
}

function getShell() {
  shell="$(basename $SHELL)"
}

function getUptime() {
  uptime="$(uptime --pretty | sed 's/up//')"
}

function getMemoryUsage() {
  #memory="$(free --mega | sed -n -E '2s/^[^0-9]*([0-9]+) *([0-9]+).*/'"${space}"'\2 \/ \1MB/p')"
  _MEM="Mem:"
  _GREP_ONE_ROW="$(free --mega | grep "${_MEM}")"
  _TOTAL="$(echo ${_GREP_ONE_ROW} | awk '{print $2}')"
  _USED="$(echo ${_GREP_ONE_ROW} | awk '{print $3}')"

  memory="${_USED}MB / ${_TOTAL}MB"
}

function getDiskUsage() {
  _MOUNTED_ON="/data"
  _GREP_ONE_ROW="$(df -h | grep ${_MOUNTED_ON})"
  _SIZE="$(echo ${_GREP_ONE_ROW} | awk '{print $2}')"
  _USED="$(echo ${_GREP_ONE_ROW} | awk '{print $3}')"
  _AVAIL="$(echo ${_GREP_ONE_ROW} | awk '{print $4}')"
  _USE="$(echo ${_GREP_ONE_ROW} | awk '{print $5}' | sed 's/%//')"
  _MOUNTED="$(echo ${_GREP_ONE_ROW} | awk '{print $6}')"

  storage="${_USED}B / ${_SIZE}B = ${_AVAIL}B (${_USE}%)"
}

function main() {
  getCodeName
  getClientBase
  getModel
  getDistro
  getKernel
  getTotalPackages
  getShell
  getUptime
  getMemoryUsage
  getDiskUsage
}

main

echo -e "\n\n"
echo -e "  ┏━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "  ┃ ${c1}r${c2}x${c7}f${c4}e${c5}t${c6}${c7}c${c1}h${c0}      ${c5}${c0}  ${c6}${c0}  ${c7}${c0} ┃  ${codename}${c5}@${c0}${client_base}"
echo -e "  ┣━━━━━━━━━━━━━━━━━━━━━━┫"
echo -e "  ┃                      ┃  ${c1}phone${c0}  ${model}"
echo -e "  ┃          ${c3}•${c8}_${c3}•${c0}         ┃  ${c2}os${c0}     ${os}"
echo -e "  ┃          ${c8}${c0}${c9}oo${c0}${c8}|${c0}         ┃  ${c7}ker${c0}    ${kernel}"
echo -e "  ┃         ${c8}/${c0}${c10} ${c0}${c8}'\'${c0}        ┃  ${c4}pkgs${c0}   ${packages}"
echo -e "  ┃        ${c9}(${c0}${c8}\_;/${c0}${c9})${c0}        ┃  ${c5}sh${c0}     ${shell}"
echo -e "  ┃                      ┃  ${c6}up${c0}    ${uptime}"
echo -e "  ┃   android ${c1}${c0} termux   ┃  ${c1}ram${c0}    ${memory}"
echo -e "  ┃                      ┃  ${c2}disk${c0}   ${storage}"
echo -e "  ┗━━━━━━━━━━━━━━━━━━━━━━┛  ${c1}━━━${c2}━━━${c3}━━━${c4}━━━${c5}━━━${c6}━━━${c7}━━━"
echo -e "\n\n"

#echo -e "     •_•       "
#echo -e "     oo|       "
#echo -e "    / '\'"
#echo -e "   (\_;/)"


