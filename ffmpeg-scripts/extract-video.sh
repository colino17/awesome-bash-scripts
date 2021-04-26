#!/bin/bash

# Usage = "./extract-video.sh filename.mp4 00:01:01 00:02:02"
# filename start-time end-time

ffmpeg -i "$1" -ss "$2" -to "$3" -c copy output.mp4

 