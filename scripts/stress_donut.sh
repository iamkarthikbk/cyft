#!/bin/bash
#
gcc -o donut donut.c
#
#Trap all kill signals
trap 'Kill signals wont work the same way :))' `printf '%s ' {1..64}`
#START
#START DONUT
./donut & 1>/dev/null 2>/dev/null
echo "Hungry? Have a donut while I hog your system resources ;)"
sleep 2
echo "CPU RIP for the next 120 seconds.."
echo "Starting in 2.."
sleep 1
echo "Starting in 1..;)"
#CPU STRESS TEST
stress --cpu $nproc --timeout 120 1>/dev/null 2>/dev/null
sleep 120
echo "Return status $?"
echo "I'm going to spare your CPU for now, Memory - you're up next"
echo "Memory RIP for the next 120 seconds.."
echo "Starting in 2.."
sleep 1
#MEM STRESS TEST
stress --vm 2 --vm-bytes 1024M --timeout 120 1>/dev/null 2>/dev/null
sleep 120
echo "Return status $?"
echo "I/O - where you hiding at :))"
#IO STRESS TEST
stress --io 4 --timeout 120 1>/dev/null 2>/dev/null
sleep 120
echo "All of it at once now hehe"
#HEAVY STRESS TEST
stress --cpu 2 --io 4 --vm 2 --vm-bytes 1024M --timeout 120s
sleep 120
echo "If you're reading this message, then you failed at your task. --respect :("
#KILL donut
kill -9 `pidof ./donut`
#REMOVE donut
rm -f ./donut
#END
