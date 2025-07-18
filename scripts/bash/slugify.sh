#!/bin/bash

if ! command -v rename &> /dev/null
then
    echo "rename is not installed"
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 [-n] files..."
    exit 2
fi

dry_run=false

while getopts ":n" opt; do
    case $opt in
        n)
            dry_run=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 3
            ;;
    esac
done

shift "((OPTIND -1))"

perlexpr='use Unicode::Normalize;
          $_ = NFKD($_);
          s/[^A-Za-z0-9.]+/-/g;
          s/^-+|-+$//g;
          $_ = lc($_);'

files=()
for file in "$@"; do
    files+=( "$(realpath "$file")" )
done

if $dry_run; then
    rename -n "$perlexpr" "${files[@]}"
else
    rename "$perlexpr" "${files[@]}"
fi
