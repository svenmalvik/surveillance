#!/bin/bash

date=`date +%Y-%m-%d:%H:%M:%S`
dir="/var/www/html/foscam"

files=`ls -tr $dir/foscam_*.jpeg`
counter=1
for singleFile in $files; do
  newName=_tmp_fc_`printf %05d $counter`.jpeg
  mv $singleFile $dir/$newName
  ((counter++))
done

ffmpeg -framerate 30 -i $dir/_tmp_fc_%05d.jpeg $dir/v/foscam_all_$date.mp4

rm -f $dir/_tmp_fc_*
