#!/bin/bash

#SYNTAX - zrestore-all.sh
#NOTE: This script should be located in /backup to work correctly.
#Restores all user backup files in /backup. Helpful for server moves.

for X in *; do
    user=${X::-15}
    echo $X
    rm -rf /backup/tmp.*
    /usr/local/vesta/bin/v-restore-user $user $X
done
