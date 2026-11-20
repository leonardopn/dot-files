#!/bin/bash
# Status line: modelo · pasta (branch) · contexto usado · custo da sessão.
# Recebe o JSON da sessão no stdin.

command -v jq >/dev/null || { echo "Claude Code (instale jq para a status line)"; exit 0; }

input=$(cat)
model=$(jq -r '.model.display_name // "?"' <<<"$input")
dir=$(jq -r '.workspace.current_dir // .cwd // empty' <<<"$input")
ctx=$(jq -r '.context_window.used_percentage // empty' <<<"$input")
cost=$(jq -r '.cost.total_cost_usd // empty' <<<"$input")

dim=$'\e[2m' reset=$'\e[0m' cyan=$'\e[36m' green=$'\e[32m' yellow=$'\e[33m' red=$'\e[31m'

line="${cyan}${model}${reset}"

if [ -n "$dir" ]; then
	line+=" ${dim}·${reset} ${dir##*/}"
	branch=$(git -C "$dir" branch --show-current 2>/dev/null)
	[ -n "$branch" ] && line+=" ${dim}(${branch})${reset}"
fi

if [ -n "$ctx" ]; then
	pct=${ctx%.*}
	if [ "$pct" -ge 80 ]; then color=$red
	elif [ "$pct" -ge 50 ]; then color=$yellow
	else color=$green; fi
	line+=" ${dim}·${reset} ctx ${color}${pct}%${reset}"
fi

[ -n "$cost" ] && line+=" ${dim}·${reset} \$$(printf '%.2f' "$cost")"

echo "$line"
