#!/bin/bash

for f in *.mp4 *.mkv *.avi; do 
    ffprobe -i "$f" -v quiet -of csv=p=0 -show_entries format='filename, duration' -sexagesimal | 
    awk -F: '{printf "%s:%02d:%02d\n",$1,$2,$3}'
done 
