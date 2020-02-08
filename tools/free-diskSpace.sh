#!/bin/bash
# Removes old revisions of snaps
sudo apt-get autoclean
sudo journalctl --vacuum-time=1d
# CLOSE ALL SNAPS BEFORE RUNNING THIS
du -h /var/lib/snapd/snaps
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
du -h /var/lib/snapd/snaps