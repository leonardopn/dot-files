#!/bin/bash
# Linka a config versionada em ./claude para ~/.claude.
# Idempotente: pode rodar de novo sempre que adicionar algo em ./claude.

set -e

SRC="$(realpath "$(dirname "$0")/../claude")"
DEST="$HOME/.claude"

mkdir -p "$DEST" "$DEST/skills"

# Arquivos e pastas linkados inteiros
for item in settings.json CLAUDE.md keybindings.json statusline.sh rules agents commands hooks; do
	[ -e "$SRC/$item" ] && ln -sfn "$SRC/$item" "$DEST/$item"
done

# Skills uma a uma: ~/.claude/skills também guarda skills sincronizadas
# pela organização (skills/synced), então a pasta não pode virar link.
for skill in "$SRC"/skills/*/; do
	[ -d "$skill" ] && ln -sfn "${skill%/}" "$DEST/skills/$(basename "$skill")"
done

# Remove links de skills que não existem mais no repo
for link in "$DEST"/skills/*; do
	[ -L "$link" ] && [ ! -e "$link" ] && rm -f "$link"
done

echo "Claude config linkada em $DEST"
