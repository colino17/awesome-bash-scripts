#!/bin/bash

# A script to normalize volume of tracks before converting to mp3. Target volume is based on the default volumes for most tracks in Amped2
# To check mean volume of a track use the command "ffmpeg -i input.mp3 -filter:a volumedetect -f null /dev/null"
# https://trac.ffmpeg.org/wiki/AudioVolume

mkdir loud

for i in *.mp3;
  do name=`echo "${i%.*}"`
  echo "$name"
  ffmpeg -y -i "$i" -af loudnorm=I=-12:LRA=6:TP=-1.5 "loud/${i%.*}.mp3"
done
