#!/bin/bash

if [[ -z $1 ]]
then
    echo "Usage: $0 <file>"
    exit 1
fi

if [[ ! -f ~/.plantuml.jar ]]
then
    wget -q -O ~/.plantuml.jar 'https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-mit-1.2025.2.jar'
fi

java -jar ~/.plantuml.jar $1
