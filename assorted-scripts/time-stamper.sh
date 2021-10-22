#!/bin/bash

# Purpose: Track timestamps of events on a single button press
# Source: https://www.artificialworlds.net/blog/2020/04/04/keeping-track-of-podcast-times-with-a-simple-bash-script-on-linux/
# Usage: "./time-stamper.sh" and then press ENTER whenever a timestamp is required

T=0
echo
while sleep 1; do
    echo -n -e "\e[1A"
    echo $(($T / 60))m $(($T % 60))s
    T=$(($T + 1))
done
