#!/bin/bash

err=0
for cmd in "xargs" "yt-dlp"
do
    err=$((err + 1))
    if ! command -v "$cmd" &> /dev/null
    then
        echo "$cmd is not installed in this system."
        exit "$err"
    fi
done

err=$((err + 1))
if [[ -z "$1" ]]
then
    echo "Usage: $0 <file> | <url> [url...]"
    exit "$err"
fi

M=3
run_xargs() {
    xargs -d '\n' -P "$M" -I {} yt-dlp -x -o './%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "{}"
}

if [[ -f "$1" ]]
then
    run_xargs < "$1"
else
    printf '%s\n' "$@" | run_xargs
fi
