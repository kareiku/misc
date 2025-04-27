#!/bin/bash

set -e

start_time=$(date +%s)

{
    apt update
    apt full-upgrade
    apt autoremove
    apt autoclean
} &

snap refresh &

wait

end_time=$(date +%s)

elapsed_time=$((end_time - start_time))

echo "Updating finished in $elapsed_time seconds."
