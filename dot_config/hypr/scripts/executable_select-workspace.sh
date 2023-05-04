#!/usr/bin/env sh

WORKSPACE=$(hyprctl workspaces -j | jq -r '.[] | select(.name != "special") | .name' | grep -vE '^[0-9]+$' | sort | wofi --show dmenu --insensitive --prompt "Workspace" --allow-markup)
if [ -z "$WORKSPACE" ]; then
    exit 0
fi

hyprctl dispatch workspace "$WORKSPACE"
