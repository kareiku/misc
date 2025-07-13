#!/bin/bash

# Append this to your .bashrc to go up more than one directory by using dots
cd() {
    if [[ "$1" =~ ^\.{3,}$ ]]; then
        count=$(( ${#1} - 1))
        while (( count > 0 )); do
            builtin cd ..
            (( count-- ))
        done
    else
        builtin cd "$@"
    fi
}
