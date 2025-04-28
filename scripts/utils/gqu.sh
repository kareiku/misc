#!/bin/bash

if ! command git rev-parse --is-inside-work-tree &> /dev/null
then
    echo ".git directory not found in current directory."
    exit 1
else
    git add --all
    commit_message="${1:-"No commit message provided."}"
    git commit -m "$commit_message"
    git push
fi
