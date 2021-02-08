#!/bin/bash
#
# This script rorates your screen by 90 deg every 3 seconds
#
# Trap SIGNINT
trap '' 2
#
echo "^C will not work anymore :)"
echo "Fix your screen :))"
#
# Rotation matrices
normal='100010001'
normal_float='1.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,1.000000'
inverted='-1 0 1 0 -1 1 0 0 1'
inverted_float='-1.000000,0.000000,1.000000,0.000000,-1.000000,1.000000,0.000000,0.000000,1.000000'
left='0 -1 1 1 0 0 0 0 1'
left_float='0.000000,-1.000000,1.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000'
right='0 1 0 -1 0 1 0 0 1'
right_float='0.000000,1.000000,0.000000,-1.000000,0.000000,1.000000,0.000000,0.000000,1.000000'
#
# Start
while :
do
	echo "left"
	xrandr -o left
	sleep 3
	echo "inverted"
	xrandr -o inverted
	sleep 3
	echo "right"
	xrandr -o right
	sleep 3
	echo "normal"
	xrandr -o normal
	sleep 3
done
#
# End
