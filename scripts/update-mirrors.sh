#!/bin/bash

export TMPFILE="$(mktemp)"
sudo true
rate-mirrors --save=$TMPFILE arch --max-delay=43200 &&
    sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup &&
    sudo mv $TMPFILE /etc/pacman.d/mirrorlist
