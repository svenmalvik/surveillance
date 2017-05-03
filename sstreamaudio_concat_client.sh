#!/bin/bash

date=`date +%Y-%m-%d:%H:%M:%S`
dir="/var/www/html"
file="$dir/a/stueall_$date.mp3"

mp3wrap $file $dir/stue_*.mp3

# special case
scp $file 10.0.1.36:/var/www/html/ar1/
rm $file $dir/stue_*.mp3
#####
