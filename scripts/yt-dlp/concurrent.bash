#!/bin/bash

################# IMPORTANT NOTE #################
#                                                #
# If inputting a file with space-separated urls, #
# run the script in the following way:           #
#                                                #
#      xargs concurrent.bash < urls.txt          #
#                                                #
##################################################

M=3

while [[ $# > 0 ]]
do
    for ((i = 0; i < M && $# > 0; i++))
    do
        yt-dlp -x $1 -o './%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'
        shift
    done
    wait
done
