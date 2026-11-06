#!/usr/bin/env bash
set -euo pipefail

selected="$(hyprctl clients -j | jq -r '
    .[] | select(.mapped == true)
    | "\(.class) — \(.title) [\(.address)]"' \
    | wofi --dmenu --prompt 'Switch to window' --insensitive)" || exit 0
address="${selected##*[}"
address="${address%]}"
[[ "$address" =~ ^0x[[:xdigit:]]+$ ]] || exit 0
hyprctl dispatch "hl.dsp.focus({ window = 'address:$address' })"
