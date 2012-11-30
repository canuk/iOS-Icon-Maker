#!/usr/bin/env bash
# This script assumes that ImageMagick is installed and the convert command is accessible via the $PATH variable

# Ensure that one argument has been passed in.
if [ ! "$#" -eq 1 ]
then
	echo -e "This script requires one argument.\\ne.g. iOS_icon_maker.sh app_icon.png"
	exit 1
fi

# Assign the argument to the path variable so it is easier to follow throughout the script.
path=$1

# Ensure that the path points to a valid file.
if [ ! -f "$path" ]
then
	echo "Path must point to a valid file."
	exit 1
fi

# This function takes in the dimension of the icon (it assumes the icon is a square) and the name of the file to save the icon to.
function createIconImage()
{
	iconDimension=$1
	iconName=$2

	convert "$path" -resize ${iconDimension}x${iconDimension}^ -gravity center -extent ${iconDimension}x${iconDimension} -density 72 $iconName
}

# Create all the suggested icons for both the iPhone and iPad platforms to ensure the best appearance.
createIconImage 57 Icon.png
createIconImage 114 Icon@2x.png
createIconImage 29 Icon-Small.png
createIconImage 58 Icon-Small@2x.png
createIconImage 72 Icon-72.png
createIconImage 144 Icon-72@2x.png
createIconImage 50 Icon-Small-50.png
createIconImage 100 Icon-Small-50@2x.png
createIconImage 512 iTunesArtwork
createIconImage 1024 iTunesArtwork@2x
