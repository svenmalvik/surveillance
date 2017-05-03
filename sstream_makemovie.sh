#!/bin/bash

date=`date +%Y-%m-%d:%H:%M:%S`
dir="/var/www/html"

files=`ls -tr $dir/stue_*.jpeg`
counter=1
for singleFile in $files; do
  newName=_tmp_`printf %05d $counter`.jpeg
  mv $singleFile $dir/$newName
  ((counter++))
done

ffmpeg -framerate 30 -i $dir/_tmp_%05d.jpeg $dir/stue_all_$date.mp4

rm -f $dir/_tmp_*
