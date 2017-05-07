#!/bin/bash

dir="/var/www/html/foscam"

function latest {
  rm -f $dir/latest_foscam.jpg
  file2=$(ls -t1 ${dir}/foscam_*.jpg | head -n1)
  ln -s $file2 $dir/latest_foscam.jpg
}

function snap {
  dateVal=`date +%Y-%m-%d:%H:%M:%S`
  file="foscam_$dateVal.jpg"
  curl -o $dir/$file "http://10.0.1.2:88/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2&usr=admin&pwd=password"
  convert $dir/$file -fill white  -undercolor '#00000080'  -gravity South -annotate +0+5 "$dateVal" $dir/$file
  latest
}

count=$((60/2))
for (( i=2; i <= $count; i++ )); do
  snap
  sleep 2
done
