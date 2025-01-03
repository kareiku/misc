#!/bin/bash

if [ -z "$1" ]
then
    return
fi

INPUT_FILE="$1"
OUTPUT_FILE="tables.md"

echo '# Tables' > $OUTPUT_FILE
while IFS= read -r table
do
    echo "## ${table^}" >> $OUTPUT_FILE
    echo "|Type|Name|URL|" >> $OUTPUT_FILE
    echo "|-|-|-|" >> $OUTPUT_FILE
    while IFS= read -r item
    do
        echo "$item" >> $OUTPUT_FILE
    done <<< $(jq --arg dest "$table" -r '.[] | select(.for==$dest) | "|\(.type | ascii_upcase | .[0:1] + (. | .[1:] | ascii_downcase))|\(.name)|\(.url)|"' $INPUT_FILE)
done <<< $(jq -r '.[] | .for' $INPUT_FILE | uniq)
