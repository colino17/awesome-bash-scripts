#!/bin/bash

mkdir loud

for i in *.mp3;
  do name=`echo "${i%.*}"`
  echo "$name"
  ffmpeg -y -i "$i" -af loudnorm=I=-12:LRA=6:TP=-1.5 "loud/${i%.*}.mp3"
done
