#!/bin/bash

set -e

mkdir -p gnome/keybindings

if [[ $1 == 'backup' ]]; then
    dconf dump '/org/gnome/desktop/wm/keybindings/' >gnome/keybindings/keybindings.dconf
    dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' >gnome/keybindings/custom-values.dconf
    dconf read '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings' >gnome/keybindings/custom-keys.dconf
    echo "backup done"

fi

if [[ $1 == 'restore' ]]; then
    dconf reset -f '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/'
    dconf reset -f '/org/gnome/desktop/wm/keybindings/'
    dconf load '/org/gnome/desktop/wm/keybindings/' <gnome/keybindings/keybindings.dconf
    dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' <gnome/keybindings/custom-values.dconf
    dconf write '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings' "$(cat gnome/keybindings/custom-keys.dconf)"
    echo "restore done"

fi

if [[ $1 == 'help' ]]; then
    echo "Usage: $0 [backup|restore|help]"
    echo "backup: Backup GNOME keybindings"
    echo "restore: Restore GNOME keybindings"
    echo "help: Show this help message"
fi
