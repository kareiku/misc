#!/bin/bash

if [ -z $1 ]
then echo "Usage: $0 URL"
else yt-dlp -q --progress --no-warnings -x $1 -o './%(album)s/%(track_number)s-%(track)s.%(ext)s'
fi
