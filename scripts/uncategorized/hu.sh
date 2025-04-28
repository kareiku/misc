#!/bin/bash

dependencies=("xargs" "yt-dlp")

if [[ "$1" == "--help" ]]
then
    echo "Usage: $0 <file | url> [file...] [url...]"
    printf "Dependencies: "
    ( printf "%s, " "${dependencies[@]}"; ) | sed 's/, $/.\n/'
    echo
    echo "Options:"
    echo -e "\t--help\t\tPrints this and exits."
    exit 0
fi

err=0
for dependency in "${dependencies[@]}"
do
    if ! command -v "$dependency"
    then
        err=$((err + 1))
        echo "$dependency is not installed."
        exit $err
    fi
done

#   for arg in "$@"
#   do
#       if [[ -f "$arg" ]]
#       then
#           while IFS= read -r line
#           do
#               echo "$line is a file's argument."
#           done < "$arg"
#       else
#           echo "$arg is a normal argument."
#       fi
#   done
