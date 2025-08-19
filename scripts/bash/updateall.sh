#!/bin/bash

apt update -y && \
apt full-upgrade -y && \
apt autoremove -y && \
apt autoclean -y

snap refresh

if [[ -f /var/run/reboot-required ]]
then
    read -r -p "A reboot is required. Do you want to reboot now? [y/N] " answer
    if [[ "$answer" == [Yy] ]]
    then
        reboot
    fi
fi
