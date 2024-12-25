#!/bin/bash
# gqu stands for "git quick update"
git add --all
commit_message=${1:-"Empty commit message"}
git commit -m "$commit_message"
git push
