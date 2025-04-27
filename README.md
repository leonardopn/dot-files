# dot-files

This repository is a collection of configuration files that I use in my work environment and serves as a reminder of the necessary steps to reinstall the operating system the way I like it.

## Software Installation

### Paru

1. Install paru

```bash
# https://github.com/Morganamilo/paru

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

2. Install the following packages using paru

```bash
paru -S --needed $(cat ./packages.txt)
```

3. Install packages via script

```bash
# https://github.com/zplug/zplug

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | zsh
```

## zsh

1. Add the `.zshrc` file to the `~` folder

```bash
ln -s -f $(realpath ./.zshrc) ~/.zshrc
```

2. Set ZSH as the default shell

```bash
chsh -s $(which zsh)
```

3. Install ZSH plugin

```bash
zplug install
```

## Font Configuration

Install the `JetBrains Mono` fonts for the terminal and text editor.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
```

# Icons Configuration

```bash
gsettings set org.gnome.desktop.interface icon-theme "Papirus" && papirus-folders -C nordic
```

## Mirror Configuration

```bash
./scripts/update-mirrors.sh
```

### Configure a cron job to update the mirror list

```bash
sudo ln -s -f $(realpath ./scripts/update-mirrors.sh) /etc/cron.weekly/update-mirrors | chmod +x /etc/cron.weekly/update-mirrors
```

## Configure Git

```bash
ln -s -f $(realpath ./git/.gitconfig) ~/.gitconfig
```

## Gnome

### Backup the extension configs

```bash
dconf dump /org/gnome/shell/extensions/ > gnome/extensions.dconf
```

### Restore the extension configs

```bash
dconf load /org/gnome/shell/extensions/ < gnome/extensions.dconf
```

### Backup keybindings

```bash
./scripts/backup-restore-gnome-keybindings.sh backup
```

### Restore keybindings

```bash
./scripts/backup-restore-gnome-keybindings.sh restore
```

### Restore startup applications

```bash
ln -s -f $(realpath ./gnome/autostart) ~/.config
```

## Wallpaper

I'm using an external wallpaper repository with a lot of wallpapers. After cloning the repository, the slideshow extension will do the rest of the work.

```bash
mkdir -p ~/Pictures/Wallpapers
git clone https://github.com/orangci/walls-catppuccin-mocha.git ~/Pictures/Wallpapers
```

## Albert

```bash
ln -s -f $(realpath ./albert) ~/.config
```

## Terminal - Kitty

1. Add the `kitty` folder to the `~/.config` folder

```bash
ln -s -f $(realpath ./kitty) ~/.config
```
