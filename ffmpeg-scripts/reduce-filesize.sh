#!/bin/bash

# Usage = "./reduce-filesize.sh filename.mp4 25"
# 25 is the filesize you are targeting in megabytes

bitrate="$(awk "BEGIN {print int($2 * 1024 * 1024 * 8 / $(ffprobe \
    -v error \
    -show_entries format=duration \
    -of default=noprint_wrappers=1:nokey=1 \
    "$1" \
) / 1000)}")k"
ffmpeg \
    -y \
    -i "$1" \
    -c:v libx264 \
    -preset medium \
    -b:v $bitrate \
    -pass 1 \
    -c:a aac \
    -f mp4 \
    /dev/null \
&& \
ffmpeg \
    -i "$1" \
    -c:v libx264 \
    -preset medium \
    -b:v $bitrate \
    -pass 2 \
    -c:a aac  \
    "${1%.*}-$2mB.mp4"
