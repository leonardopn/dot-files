# Initialize plugins
source ~/.zplug/init.zsh

# Enable custom functions
fpath+=~/.zfunc

# Configs for local binaries
export PATH="$HOME/.local/bin/:$PATH"

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
alias update-grub="sudo grub-mkconfig -o /boot/efi/grub/grub.cfg"
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias fix-resolution="bash ~/Documents/scripts/set_ultrawide.sh"

if command -v apt >/dev/null; then
    paru() {
    case "$1" in
        # Instalar pacotes (ex: paru -S htop neofetch)
        "-S")
            shift # Remove o "-S" da lista de argumentos
            sudo apt install -y "$@"
            ;;
        # Atualizar o sistema (ex: paru -Syu ou simplesmente paru)
        "-Syu" | "")
            sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo snap refresh
            ;;
        # Remover pacotes (ex: paru -R htop)
        "-R")
            shift
            sudo apt remove -y "$@"
            ;;
        # Remover pacotes e suas dependências (ex: paru -Rsn htop)
        "-Rsn")
            shift
            sudo apt autoremove --purge -y "$@"
            ;;
        # Pesquisar pacotes (ex: paru -Ss htop)
        "-Ss")
            shift
            apt search "$@"
            ;;
        # Limpar cache
        "-Scc")
            sudo apt clean
            ;;
        *)

            echo "Uso:
            paru [-S | -Syu | -R | -Rsn | -Ss | -Scc] [pacote(s)]
            
            Opções:
              -S      Instala o(s) pacote(s) especificado(s) do repositório oficial.
              -Syu    Sincroniza a lista de pacotes dos repositórios e atualiza todos os pacotes instalados.
              -R      Remove o(s) pacote(s) especificado(s).
              -Rsn    Remove o(s) pacote(s) especificado(s) e também elimina dependências órfãs.
              -Ss     Busca por pacote(s) no repositório oficial, exibindo resultados compatíveis.
              -Scc    Limpa o cache de pacotes baixados e arquivos de compilação obsoletos."
            return 1
            ;;
    esac
}

# Cria um alias para que 'pacman' também use a mesma função
alias pacman='paru'
fi

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

# Configs for SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

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

# Upload file to S3 via presigned PUT URL
# Usage: s3-presigned-upload <file> <mime-type> <presigned-url>
s3-presigned-put-upload() {
  local file="$1"
  local mime="$2"
  local url="$3"

  if [[ -z "$file" || -z "$mime" || -z "$url" ]]; then
    echo "Usage: s3-presigned-upload <file> <mime-type> <presigned-url>" >&2
    return 1
  fi

  if [[ ! -f "$file" ]]; then
    echo "Error: file not found: $file" >&2
    return 1
  fi

  curl -sS -w "\nHTTP %{http_code}\n" -X PUT \
    -H "Content-Type: ${mime}" \
    -T "$file" \
    "$url"
}

s3-presigned-put-upload-auto() {
  local file="$1" url="$2"
  [[ -z "$file" || -z "$url" ]] && { echo "Usage: s3-presigned-upload-auto <file> <presigned-url>" >&2; return 1 }
  local mime
  mime=$(file -b --mime-type "$file") || return 1
  s3-presigned-put-upload "$file" "$mime" "$url"
}

# Upload file using presigned POST from JSON (e.g. AWS create_presigned_post: url + fields).
# Usage: s3-presigned-post-upload-json <file> <json-file|-> [upload-field-name]
# Use "-" as json path to read JSON from stdin. upload-field-name defaults to "file" (multipart file part).
s3-presigned-post-upload-json() {
  local file="$1" json_src="$2" upload_field="${3:-file}"
  if [[ -z "$file" || -z "$json_src" ]]; then
    echo 'Usage: s3-presigned-post-upload-json <file> <json-file|-> [upload-field-name]' >&2
    return 1
  fi
  if [[ ! -f "$file" ]]; then
    echo "Error: file not found: $file" >&2
    return 1
  fi
  if [[ "$json_src" != "-" && ! -r "$json_src" ]]; then
    echo "Error: JSON not found or not readable: $json_src" >&2
    return 1
  fi
  command -v python3 >/dev/null 2>&1 || {
    echo "Error: python3 is required for s3-presigned-post-upload-json" >&2
    return 1
  }
  python3 - "$file" "$json_src" "$upload_field" <<'PY'
import json
import os
import subprocess
import sys


def main() -> None:
    if len(sys.argv) != 4:
        print("internal error: expected file json_src upload_field", file=sys.stderr)
        sys.exit(2)
    file_path, json_src, upload_field = sys.argv[1], sys.argv[2], sys.argv[3]
    if not os.path.isfile(file_path):
        print(f"Error: file not found: {file_path}", file=sys.stderr)
        sys.exit(1)
    try:
        if json_src == "-":
            data = json.load(sys.stdin)
        else:
            with open(json_src, encoding="utf-8") as f:
                data = json.load(f)
    except json.JSONDecodeError as e:
        print(f"Error: invalid JSON: {e}", file=sys.stderr)
        sys.exit(1)
    except OSError as e:
        print(f"Error: cannot read JSON: {e}", file=sys.stderr)
        sys.exit(1)

    url = data.get("url")
    fields = data.get("fields")
    if not isinstance(url, str) or not url:
        print('Error: JSON must contain non-empty string "url"', file=sys.stderr)
        sys.exit(1)
    if not isinstance(fields, dict) or not fields:
        print('Error: JSON must contain non-empty object "fields"', file=sys.stderr)
        sys.exit(1)

    args = ["curl", "-sS", "-w", "\nHTTP %{http_code}\n", "-X", "POST", url]
    for key, val in fields.items():
        if val is None:
            print(f'Error: field "{key}" is null', file=sys.stderr)
            sys.exit(1)
        if not isinstance(val, (str, int, float, bool)):
            print(
                f'Error: field "{key}" must be a scalar (string, number, or boolean)',
                file=sys.stderr,
            )
            sys.exit(1)
        args.extend(["-F", f"{key}={val}"])
    args.extend(["-F", f"{upload_field}=@{file_path}"])
    sys.exit(subprocess.run(args).returncode)


if __name__ == "__main__":
    main()
PY
}