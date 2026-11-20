#!/bin/bash
# Notificação desktop quando o Claude termina (Stop) ou precisa de atenção (Notification).
# Recebe o JSON do evento no stdin. Nunca bloqueia: sai sempre com 0.

command -v notify-send >/dev/null || exit 0
command -v jq >/dev/null || exit 0

input=$(cat)
event=$(jq -r '.hook_event_name // empty' <<<"$input")
project=$(basename "$(jq -r '.cwd // empty' <<<"$input")")

case "$event" in
	Notification)
		message=$(jq -r '.message // "Precisa da sua atenção"' <<<"$input")
		urgency=normal
		;;
	Stop)
		message="Terminou de responder"
		urgency=low
		;;
	*) exit 0 ;;
esac

notify-send --app-name="Claude Code" --urgency="$urgency" --icon=dialog-information \
	"Claude Code${project:+ · $project}" "$message"
exit 0
