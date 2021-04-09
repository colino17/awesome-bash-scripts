#!/bin/bash

# A script to pull mp3s from all Youtube links listed in a "links" file

while read LINE; do youtube-dl -x -k --no-playlist --audio-format mp3 "$LINE"; done < links
