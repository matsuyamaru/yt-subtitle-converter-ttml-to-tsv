#!/bin/bash

#This is support only youtube ttml subtitle.
#This script output subtitles in one-minute segments.
FILE=$1
echo Time	Subtitle
 
if [ -e $FILE ]; then
  cat $1 | sed s/\<p.begin=//g | sed s/end=\".*style=\"s2\"\>//g| sed s/\<.p\>//| sed s/\<.*$//g | sed s/\....\"/\"/g | grep . | sed -e 's/^\"\(.....\).*\"/\1\t/g'|awk -F "\t" -v'OFS=\t' '{a[$1]=a[$1] $2} END {for (key in a){ print key, a[key];}}' | sort 
fi