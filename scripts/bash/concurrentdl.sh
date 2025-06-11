#!/bin/bash

START_EPOCH="$(date +%s)"
FORMAT="./yt-dlp_$START_EPOCH/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"
CONCURRENT_PROCESS_COUNT=5
ERROR_FILE="./yt-dlp_$START_EPOCH/error.log"

if [[ -z "$1" ]]
then
    echo "Usage: $0 <file> | <url> [url...]"
    exit 1
fi

for cmd in "xargs" "yt-dlp"
do
    if ! command -v "$cmd" &> /dev/null
    then
        echo "$cmd is not installed in this system."
        exit 2
    fi
done

start_download() {
    mkdir -p "$(dirname "$ERROR_FILE")"
    xargs -d '\n' -P "$CONCURRENT_PROCESS_COUNT" -I {} \
        yt-dlp -x -o "$FORMAT" -- "{}" 2>> "$ERROR_FILE"
}

if [[ -f "$1" ]]
then
    start_download < "$1"
else
    printf '%s\n' "$@" | start_download
fi
