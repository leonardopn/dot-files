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

## Font Configuration

Install the `JetBrains Mono` fonts for the terminal and text editor.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
```

# Icons Configuration

```bash
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
```

## Mirror Configuration

```bash
sudo reflector \
    --protocol https \
    --latest 200 \
    --sort rate \
    --save /etc/pacman.d/mirrorlist \
    --threads 10 \
    --verbose
```

## Configure Git

```bash
git config --global user.name "Leonardo Petta do Nascimento"
git config --global user.email "leonardocps9@protonmail.com"
git config --global --unset-all credential.helper
git config --global --add credential.helper libsecret
git config --global --add credential.helper oauth
```

## Get Gnome Extensions

```bash
dconf dump /org/gnome/shell/extensions/ > gnome-extensions.dconf
```

## Wallpaper

I'm using an external wallpaper repository with a lot of wallpapers. After cloning the repository, the slideshow extension will do the rest of the work.

```bash
mkdir -p ~/Pictures/Wallpapers
git clone https://github.com/orangci/walls-catppuccin-mocha.git ~/Pictures/Wallpapers
```

## ULauncher

```bash
ln -s -f $(realpath ./ulauncher) ~/.config/ulauncher

python3 <(curl https://raw.githubusercontent.com/catppuccin/ulauncher/main/install.py -fsSL) -f all -a all
```

## Terminal - Kitty

1. Add the `kitty.config` file to the `~` folder

```bash
ln -s -f $(realpath ./kitty.config) ~/.config/kitty/kitty.conf
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
