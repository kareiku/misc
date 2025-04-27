#!/bin/bash

if [ -z $1 ]
then echo "Usage: $0 URL [URL...]"
else
    for url in $@
    do yt-dlp -q --progress --no-warnings -x $url -o './$(artist)s/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'
    done
fi
