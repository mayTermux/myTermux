#!/usr/bin/env bash

source $(pwd)/ghost.sh

start_ghost "[ TEST ] > bash-animation"
sleep 2s
stop_ghost $?