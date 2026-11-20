#!/bin/bash
# Formata o arquivo que o Claude acabou de editar, usando apenas o formatter que o projeto já
# adota. Sem formatter configurado no projeto, não faz nada (evita diffs enormes em repos alheios).
# Recebe o JSON do PostToolUse no stdin. Nunca bloqueia: sai sempre com 0.

command -v jq >/dev/null || exit 0

file=$(jq -r '.tool_input.file_path // empty')
[ -n "$file" ] && [ -f "$file" ] || exit 0

# Sobe a partir da pasta do arquivo procurando qualquer um dos nomes passados; para no root do git.
find_up() {
	local dir
	dir=$(dirname "$file")
	while :; do
		for name in "$@"; do
			[ -e "$dir/$name" ] && { echo "$dir/$name"; return 0; }
		done
		[ -e "$dir/.git" ] || [ "$dir" = / ] && return 1
		dir=$(dirname "$dir")
	done
}

case "$file" in
	*.ts | *.tsx | *.js | *.jsx | *.mjs | *.cjs | *.vue | *.svelte | *.json | *.jsonc | *.css | *.scss | *.html | *.md | *.mdx | *.yaml | *.yml)
		if biome_cfg=$(find_up biome.json biome.jsonc); then
			bin="$(dirname "$biome_cfg")/node_modules/.bin/biome"
			[ -x "$bin" ] && "$bin" format --write "$file"
		elif bin=$(find_up node_modules/.bin/prettier); then
			"$bin" --write --ignore-unknown "$file"
		fi
		;;
	*.py)
		if cfg=$(find_up ruff.toml .ruff.toml pyproject.toml) &&
			{ [ "${cfg##*/}" != pyproject.toml ] || grep -q '^\[tool\.ruff' "$cfg"; } &&
			command -v ruff >/dev/null; then
			ruff format --quiet "$file"
		elif cfg=$(find_up pyproject.toml) && grep -q '^\[tool\.black' "$cfg" && command -v black >/dev/null; then
			black --quiet "$file"
		fi
		;;
	*.rs)
		if cargo=$(find_up Cargo.toml) && command -v rustfmt >/dev/null; then
			edition=$(sed -n 's/^edition *= *"\([0-9]*\)".*/\1/p' "$cargo" | head -1)
			rustfmt --edition "${edition:-2021}" "$file"
		fi
		;;
	*.go)
		command -v gofmt >/dev/null && gofmt -w "$file"
		;;
esac >/dev/null 2>&1

exit 0
