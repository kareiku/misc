#!/bin/bash

start_time=$(date +%s)

apt update -y && apt full-upgrade -y && apt autoremove -y && apt autoclean -y &
snap refresh &
wait

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

echo "Updating finished in $elapsed_time seconds."
