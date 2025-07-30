# Initialize plugins
source ~/.zplug/init.zsh

# Enable custom functions
fpath+=~/.zfunc

# Enable History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable Auto cd
setopt AUTO_CD

# Disable Case Sensitive with Glob
setopt NO_CASE_GLOB

# Enable Auto Correction
setopt CORRECT
setopt CORRECT_ALL

# Register your plugins here
zplug "zsh-users/zsh-autosuggestions"
zplug "akash329d/zsh-alias-finder"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zshzoo/cd-ls"
zplug "ael-code/zsh-colored-man-pages"
zplug "Freed-Wu/zsh-command-not-found"
zplug "zpm-zsh/ls"
zplug "aubreypwd/zsh-plugin-reload"
zplug "mattmc3/zsh-safe-rm"
zplug "momo-lab/zsh-smartinput"
zplug "none9632/zsh-sudo"
zplug "Bhupesh-V/ugit"
zplug "sineto/web-search"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "momo-lab/zsh-replace-multiple-dots"

zplug "nvbn/thefuck"
eval $(thefuck --alias)

zplug "vifon/deer", use:deer
zle -N deer
bindkey '\ek' deer

# Install Theme
ZSH_THEME="dracula".
zplug "dracula/zsh", as:theme

# Load using zplug
zplug load

# USER CONFIGS
alias clpe="clasp push"
alias clpp="clasp pull"
alias shut="shutdown -h now"
alias clean-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias expo="npx expo"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# If droidcam stops, run this alias to install dependencies and after, run reboot.
alias droidcam-config="sudo pacman -S v4l2loopback-dkms linux-headers"

# Configs for Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Configs form react native Expo
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Configs for react native CLI
export ANDROID_SDK_ROOT=$HOME/Library/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Configs for Flutter
export CHROME_EXECUTABLE=/bin/google-chrome-stable

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

# Config a local path to install global node modules
export PATH=~/.npm-global/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/leonardopn/temp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/leonardopn/temp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/leonardopn/temp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/leonardopn/temp/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Script to auto-set Node version utilizing nvm
autoload -U add-zsh-hook
load-nvmrc() {
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Config for console ninja extension
PATH=~/.console-ninja/.bin:$PATH

# Created by `pipx` on 2025-05-08 20:38:07
export PATH="$PATH:/home/leonardopn/.local/bin"

# Configuration for pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Configs for Go Lang
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
