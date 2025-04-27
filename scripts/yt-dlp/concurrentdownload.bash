#!/bin/bash

################ IMPORTANT NOTE #################
# If inputing a file with space-separated urls, #
# run this script in the following way:         #
# xargs concurrentdownload.bash < urls.txt      #
#################################################

M=3

while [[ $# > 0 ]]
do
    for ((i = 0; i < M && $# > 0; i++))
    do
        yt-dlp -q --progress --no-warnings -x $1 -o './%(playlist_uploader)s/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'
        shift
    done
    wait
done
