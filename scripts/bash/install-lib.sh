#!/bin/bash

set -e

if [ $# -lt 4 ]
then
    echo "Usage: $0 <file> <groupId> <artifactId> <version> [packaging] [generatePom]"
    exit 1
fi

file="$1"
groupId="$2"
artifactId="$3"
version="$4"
packaging="${5:-"jar"}"
generatePom="${6:-"true"}"

if [ ! -f "$file" ]
then
    echo "Error: $file not found."
    exit 2
fi

if ! command -v mvn &> /dev/null
then
    echo "Error: Maven (mvn) is not installed or not in PATH."
    exit 3
fi

mvn install:install-file \
    -Dfile="$file" \
    -DgroupId="$groupId" \
    -DartifactId="$artifactId" \
    -Dversion="$version" \
    -Dpackaging="$packaging" \
    -DgeneratePom="$generatePom"
