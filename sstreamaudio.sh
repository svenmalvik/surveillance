#!/bin/bash

date=`date +%Y-%m-%d:%H:%M:%S`
dir="/var/www/html"
file="$dir/stue_$date"

padsp streamer -t 0:60 -O $file.wav -F mono8
lame $file.wav $file.mp3

rm $file.wav

