#!/bin/bash

# DISK
sizehome=$(df -h | egrep '/data/media' | awk '{print $2}')
usedhome=$(df -h | egrep '/data/media' | awk '{print $3}')
availhome=$(df -h | egrep '/data/media' | awk '{print $4}')
usehome=$(df -h | egrep '/data/media' | awk '{print $5}')
mountedhome=$(df -h | egrep '/data/media' | awk '{print $6}')

home() {
	echo -e "home {"
	echo -e "        Size        :" $sizehome
	echo -e "        Used        :" $usedhome "/" $sizehome "("$usehome")"
	echo -e "        Avail       :" $availhome "/" $sizehome "("$usehome")"
	echo -e "        Use%        :" $usehome
	echo -e "        Mounted on  :" $mountedhome
	echo -e "}"
}

more() {
	echo -e "Usage : COMMAND [PARAMETER]\n"
	echo -e "-h		: Show internal partition"
	echo -e "--help		: Show help"
}

	if [[ "$1" == "-r" ]]; then
		root
	elif [[ "$1" == "-h" ]]; then
        home
	elif [[ "$1" == "--help" ]]; then
		more
    else
        { home; }
    fi
