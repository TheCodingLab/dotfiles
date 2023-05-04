#!/usr/bin/env sh

SELECTION=$(hyprctl clients -j \
  | jq -r '.[] | "" + (.pid | tostring) + " " + (.class | ascii_downcase) + " <b>" + .title + "</b>"' \
  | tac \
  | wofi \
    --show dmenu \
    --insensitive \
    --prompt "window" \
    --allow-markup \
    --cache-file /dev/null \
)
  
if [ -z "$SELECTION" ]; then
  exit 0
fi

WINDOW_PID=$(echo "$SELECTION" | awk '{print $1}')
hyprctl dispatch focuswindow "pid:$WINDOW_PID"
