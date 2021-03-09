#!/bin/bash

# ffmpeg -i "$i" -c:v libx265 -crf 23 -preset fast -c:a aac -strict -2 -movflags faststart "out/${i%.*}.mp4"
# "-strict -2 flags may be needed for older FFMPEDG versions when using AAC conversion

mkdir out

for i in *.mp4;
  do name=`echo "${i%.*}"`
  echo "$name"
  audioformat=$(ffprobe -loglevel error -select_streams a:0 -show_entries stream=codec_name -of default=nw=1:nk=1 "$i")
    if [ "$audioformat" = "aac" ]; then
      ffmpeg -i "$i" -c:v libx265 -crf 23 -preset fast -c:a copy -movflags faststart "out/${i%.*}.mp4"
    else
      ffmpeg -i "$i" -c:v libx265 -crf 23 -preset fast -c:a aac -movflags faststart "out/${i%.*}.mp4"
    fi
done
