#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="65"
x=$((SCREENWIDTH / 2 + 110))
y="10"

geometry="${width}x${height}+${x}+${y}"

while :; do
	charge=$(acpi --battery | cut -d, -f2 | tr -d '[:space:]%')
	icon="\ue1ff"
	if [[ $charge -lt 15 ]]; then
		icon="\ue1fd"
	elif [[ $charge -lt 40 ]]; then
		icon="\ue1fe"
	fi
	if [[ $(cat /sys/class/power_supply/ADP1/online) -eq 1 ]]; then
		icon="\ue201"
	fi
	echo "%{c}$(printf '%b' $icon) ${charge}%"
	sleep 2
done | lemonbar -d -n "battery" -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG &