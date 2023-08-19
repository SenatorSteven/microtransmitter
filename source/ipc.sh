#!/bin/bash

[[ -z $1 ]] && { printf "no command given\n"; exit 1; }
trap "clear; printf interrupted; tput cnorm" EXIT

dir=1
i=${#1}
max=$((2 * i))

tput civis
clear
while true; do
	for inner in {0..4}; do
		tput cup 0 0
		printf "[%$((i))s$1%$((max-i))s]"
		if(($i == 0)); then
			dir=+1
		elif(($i == $max)); then
			dir=-1
		fi
		i=$((i+dir))
		tput cup 2 0
		$1
		sleep 0.1
	done
done
exit 0
