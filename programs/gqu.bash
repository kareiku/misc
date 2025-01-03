#!/bin/bash
# gqu stands for "git quick update"
git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -eq 0 ]
then
git add --all
commit_message=${1:-"empty commit message"}
git commit -m "$commit_message"
git push
else echo ".git directory not found."
fi
