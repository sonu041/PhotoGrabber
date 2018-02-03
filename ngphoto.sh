#!/bin/sh
# Download photo of the day from nationalgeographic
# Author: Shuvankar Sarkar
# Date: 25 July 2017

img="$(curl https://www.nationalgeographic.com/photography/photo-of-the-day/ -s | grep -o "aemLeadImage':[^\]*" | grep -o "https://[a-zA-Z0-9./?=_-]*")"
currdate=$(date +"%Y%m%d")
img_file="/Users/shuvankar/Desktop/Shuvankar/PhotoGrabber/$currdate.jpg"
imgpath="/Users/shuvankar/Desktop/Shuvankar/PhotoGrabber/$img_file"
echo $currdate
if [ -n "$img" ]
then

	echo "Downloading $img"
	if [ -f "$img_file" ]
	then
		echo "File already exists"
	else
		curl -o $img_file $img
		echo "Wallpaper downloaded successfully and saved as $img_file"
		#Change Wallpaper: MAC
		#osascript -e 'tell application "Finder" to set desktop picture to POSIX file $imgpath'
	fi
else
	echo "No Wallpaper today"
fi
