#!/bin/bash

apt clean
apt autoclean
apt autoremove -y

find /home/*/.cache/thumbnails -type f -delete 2>/dev/null

journalctl --vacuum-time=7d

rm -rf /tmp/*
rm -rf /var/tmp/*

apt-get autoremove --purge -y

if command -v snap &> /dev/null; then
    snap list --all | awk '/disabled/{print $1, $3}' | \
    while read -r snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
fi

for user in /home/*; do
    rm -rf "$user/.local/share/Trash/"{files,info}/* 2>/dev/null
done
