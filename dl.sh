#!/bin/bash

while read LINE; do youtube-dl -x -k --no-playlist --audio-format mp3 "$LINE"; done < links
