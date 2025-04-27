#!/bin/bash

if [[ -z $1 ]]
then
    echo "Usage: $0 URL [URL...]"
else
    for url in $@
    do
        yt-dlp -q --progress --no-warnings -x $url -o './%(artist)s/%(album)s/%(track_number)s-%(track)s.%(ext)s'
    done
fi
