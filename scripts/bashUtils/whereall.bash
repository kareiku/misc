#!/bin/bash

zshInstalled=$(command -v zsh >/dev/null 2>&1)

if [[ -z $1 ]]
then
    echo "Usage: $0 SCRIPT [SCRIPT...]"
else
    for script in $@
    do
        echo "For $script:"
        echo "- \"whereis\" says: " $(whereis $script)
        echo "- \"type\" says: " $(type $script)
        echo "- \"which\" says: " $(which $script)
        if $zshInstalled; then echo "- zsh's \"where\" says: " $(zsh -c "where $script"); fi
    done
fi
