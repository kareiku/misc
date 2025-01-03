#!/bin/bash

JSON_FILE="data.json"
OUTPUT_DIR="."

tables=$(jq -r 'map(.for) | unique | .[]' "$JSON_FILE")

for table in $tables; do
    markdown="## $table\n"
    jq --arg dest "$table" '[.[] | select(.for == $dest) | del(.for)]' "$JSON_FILE" > "$OUTPUT_DIR/$table.json"

    echo "Table: $table" > "$OUTPUT_DIR/$table.txt"
    jq -r '["Header"] + (.[0] | keys_unsorted) as $header | ($header, map(.[]))[] | @tsv' \
        "$OUTPUT_DIR/$table.json" >> "$OUTPUT_DIR/$table.txt"
done
