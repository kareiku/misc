#!/bin/bash

if [ -z $1 ]
then echo "Usage: $0 URL"
else yt-dlp -q --progress --no-warnings -x $1 -o './%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'
fi
