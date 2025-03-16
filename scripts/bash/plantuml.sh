#!/bin/bash

format="png"

bad_usage_error() {
    echo "Usage: $0 [-tformat] <file> [file...]"
    echo "-t    Format (png, svg, pdf, etc.). Defaults to png."
    exit 1
}

[[ -z "$1" ]] && bad_usage_error

[[ ! -f ~/.plantuml.jar ]] && wget -q -O ~/.plantuml.jar 'https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-mit-1.2025.2.jar'

while getopts ":t:" opt
do
    case "${opt}" in
        t )
            format="$OPTARG"
            ;;
        \? )
            echo "Invalid option: -$OPTARG" >&2
            ;;
        : )
            echo "Option -$OPTARG requires an argument." >&2
            bad_usage_error
            ;;
    esac
done
shift $((OPTIND - 1))

java -jar ~/.plantuml.jar -t"$format" "$@"
