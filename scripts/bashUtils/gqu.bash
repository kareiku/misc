#!/bin/bash

if ! command git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
    echo ".git directory not found."
    exit 1
else
    git add --all
    commit_message=${1:-"empty commit message"}
    git commit -m "$commit_message"
    git push
fi
