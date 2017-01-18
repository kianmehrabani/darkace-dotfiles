#!/bin/bash

dimensions=$(xrandr | grep '*' | awk {'print $1'})
SCREENHEIGHT=$(echo $dimensions | cut -d 'x' -f2)
SCREENWIDTH=$(echo $dimensions | cut -d 'x' -f1)

WINDOW_GAP="20"
FONT='IosevkaTerm:size=9:style=Bold'
FONT_ICON='WunconSiji:size=8'

if [[ ! -e /tmp/theme ]]; then
	theme=0
else
	theme=$(cat /tmp/theme)
fi

if [[ $theme -eq 0 ]]; then
	FG="#0e0e31"
	FG_ACCENT="#4d4dc4"
	BG="#b0b0eb"
	BAR_FG="#1b95ad"
	BAR_BG="#0e0e31"
elif [[ $theme -eq 1 ]]; then
	FG="#2e102c"
	FG_ACCENT="#fd7e49"
	BG="#fedac4"
	BAR_FG="#d15e34"
	BAR_BG="#2e102c"
elif [[ $theme -eq 2 ]]; then
	FG="#0a150f"
	FG_ACCENT="#00b64d"
	BG="#9ef7b2"
	BAR_FG="#00b64d"
	BAR_BG="#0a150f"
fi