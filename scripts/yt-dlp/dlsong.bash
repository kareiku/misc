#!/bin/bash

if [ -z $1 ] || [ -z $2 ]
then echo "Usage: $0 FORMAT URL"
else yt-dlp -x --audio-format $1 $2
fi
