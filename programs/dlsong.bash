#!/bin/bash
# Allows for easy downloading of songs using the yt-dlp utility.

if [ -z $1 ] || [ -z $2 ]
then echo "Usage: $0 FORMAT URL"
else yt-dlp -x --audio-format $1 $2
fi
