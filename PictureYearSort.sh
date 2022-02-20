#!/bin/bash

# Requirements
#

# Dependencies
# - find (with -newermt flag)

DIR="$HOME/Dropbox/Camera Uploads"
DEST="$HOME/Dropbox/General/Camera"

for i in {2021..2022}; do # Limit year is (arbitrarily) set as 2100

	startYr="${i}0101"
	j=$((i+1))
	endYr="${j}0101"

	echo "Processing Date Range: $startYr-$endYr"

	mkdir -p "$DEST/$i"

	IFS=$'\n' # make newlines the only separator
	for file in $(find "$DIR" -newermt "$startYr" -not -newermt "$endYr"); do
		# This method relies on cp and rm throwing error on directory
		# mv would be better, but it would move the directory as well
		cp "$file" "$DEST/$i"
		rm "$file"
	done
done


