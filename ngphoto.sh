#!/bin/sh
# Download photo of the day from nationalgeographic
# Author: Shuvankar Sarkar
# Date: 25 July 2017

img="$(curl http://www.nationalgeographic.com/photography/photo-of-the-day/ -s | grep -o "aemLeadImage':[^\]*" | grep -o "http://[a-zA-Z0-9./?=_-]*")"
currdate=$(date +"%d%m%Y")
echo $currdate
if [ -n "$img" ]
then
	img_file="$currdate.jpg"
  echo "Downloading $img"
	if [ -f "$img_file" ]
	then
		echo "File already exists"
	else
    curl -o $img_file $img
		echo "Wallpaper downloaded successfully and saved as $img_file"
	fi
else
	echo "No Wallpaper today"
fi
