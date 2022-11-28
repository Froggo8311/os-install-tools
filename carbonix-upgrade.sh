#!/bin/bash

logfile=$(date +'/tmp/carbonix-upgrade_%m.%d.%y_%H:%M:%S_%s.log')
pacaur -Rsuc --noconfirm $(curl -s https://raw.githubusercontent.com/Carbonix-Dev/tools/main/upgrade/to-remove.txt) >>$logfile 2>&1
pacaur -Syu --noconfirm --needed $(curl -s https://raw.githubusercontent.com/Carbonix-Dev/tools/main/upgrade/to-install.txt) >>$logfile 2>&1

# TODO: Add checksum evaluation to compare to the online updates of the
# files as installed by config-install.sh
