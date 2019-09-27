#!/usr/bin/env bash

[ "$(pgrep -f current_status | wc -l)" -gt "2" ] && pkill -f current_status

for i in {1..15}; do
	monitor=$(xrandr --listmonitors | grep "^ " | cut -f 6 -d' ' | head -1)
	time=$(date "+%H:%M:%S")
	date=$(date "+%d/%m %a")
	volume=$(echo $(mixerctl -n outputs.master | awk -F, '{print $1}') '* 100 / 255' | bc)'%'
	brightness=$(echo $(xrandr --current --verbose | grep -i brightness | head -1 | awk '{print $2}') "$operand * 100" | bc | awk -F. '{print $1}')

	notify-send -u low "current_status" "<b>Time</b>: $time\n<b>Date</b>: $date\n<b>Volume</b>: $volume\n<b>Brightness</b>: $brightness%"
	sleep 0.2
done
