#!/bin/bash

mkdir con

for i in *.mp3;
  do name=`echo "${i%.*}"`
  echo "$name"
  ffmpeg -y -i "$i" "con/${i%.*}.wma"
done
