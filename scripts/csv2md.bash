#!/bin/bash
if [ -z "$1" ]
then
    echo "Usage: $0 <csv_file>"
    exit 1
fi

csv_file="$1"
md_file="${csv_file%.csv}.md"

while IFS=, read -r line; do
  echo "|$(echo "$line" | sed 's/,/|/g')|"
done < "$csv_file" > "$md_file"

echo "Markdown file created: $md_file"
