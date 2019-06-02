#!/bin/sh
# Download photo of the day from nationalgeographic
# Author: Shuvankar Sarkar
# Date: 25 July 2017

currdate=$(date +"%Y%m%d")
img_file="./$currdate.jpg"
#echo $img_file
#echo $currdate
if [ -f "$img_file" ]
then
	echo "File already exists"
else
	img="$(curl https://www.nationalgeographic.com/photography/photo-of-the-day/ -s | grep -o "og:image[^\]*" | grep -o "https://[a-zA-Z0-9./?=_-]*")"
	if [ -n "$img" ]
	then
		echo "Downloading $img"
		curl -o $img_file $img
		echo "Wallpaper downloaded successfully and saved as $img_file"
	else
		echo "No Wallpaper today"
	fi
fi
