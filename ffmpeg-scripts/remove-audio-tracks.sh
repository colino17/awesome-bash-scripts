#!/bin/sh

# Removes Subtitles and all audio tracks except the one specified
# Note that to retain track 1 the variable used should be 0, track 2 the variable would be 1, etc
# Usage "sh remove-audio-tracks.sh inputfilename audiotracktokeep outputfilename"

ffmpeg -i $1 -sn -map 0:v:0 -map 0:a:$2 -c copy $3
