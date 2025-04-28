#!/bin/bash

if [[ -z $1 || -z $2 || -z $3 ]]
then
    echo "Usage: $0 <start_time> <end_time> <url>"
    echo "Time format: \"HH:mm:ss.s\""
else
    yt-dlp --downloader ffmpeg --downloader-args "ffmpeg_i:-ss $1 -to $2" $3
fi
