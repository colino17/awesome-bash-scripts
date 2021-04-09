#!/bin/bash

# A script to convert all mp3s in the current directory to wma8

mkdir con

for i in *.mp3;
  do name=`echo "${i%.*}"`
  echo "$name"
  ffmpeg -y -i "$i" -c:a wmav2 "con/${i%.*}.wma"
done
