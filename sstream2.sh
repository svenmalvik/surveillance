#!/bin/bash

function latest {
  rm -f /var/www/html/latest.jpeg
  file=$(ls -t1 /var/www/html/*.jpeg | head -n1)
  ln -s $file /var/www/html/latest.jpeg
}

function snap {
  dateVal=`date +%Y-%m-%d:%H:%M:%S`
  /usr/bin/streamer -q -s 640:400 -f jpeg -o /var/www/html/stue_$dateVal.jpeg
  convert /var/www/html/stue_$dateVal.jpeg -fill white  -undercolor '#00000080'  -gravity South -annotate +0+5 "$dateVal" /var/www/html/stue_$dateVal.jpeg
  latest
}

count=$((60/2))
for (( i=2; i <= $count; i++ )); do
  snap
  latest
  sleep 2
done
