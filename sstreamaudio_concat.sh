#!/bin/bash

date=`date +%Y-%m-%d:%H:%M:%S`
dir="/var/www/html"
file="$dir/a/stueall_$date.mp3"

mp3wrap $file $dir/stue_*.mp3
rm $dir/stue_*.mp3
