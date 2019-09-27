#!/usr/bin/env bash

[ ! -z "$1" ] && ( [ "$1" == 'inc' ] || [ "$1" == 'dec' ] ) || exit

[ "$1" == 'inc' ] && operand=' + 0.1' || operand=' - 0.1'

brightness=$(echo $(xrandr --current --verbose | grep -i brightness | awk '{print $2}'; echo $operand) | bc)
monitor=$(xrandr --listmonitors | grep "^ " | cut -f 6 -d' ' | head -1)
#echo $brightness
#echo $monitor
xrandr --output HDMI-1 --brightness $brightness
