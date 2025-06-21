#!/bin/bash

APP_TITLE="lf-term"
TERMINAL="wezterm"
CMD="$TERMINAL -e zsh -c 'print -Pn \"\e]0;$APP_TITLE\a\"; exec lf'"

# Get window info
client=$(hyprctl clients -j | jq -r '.[] | select(.title == "'"$APP_TITLE"'")')
win_address=$(echo "$client" | jq -r '.address')
win_pid=$(echo "$client" | jq -r '.pid')
workspace=$(echo "$client" | jq -r '.workspace.id')
focused_address=$(hyprctl activewindow -j | jq -r '.address')
current_workspace=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.name')

if [ -z "$win_address" ]; then
    eval "$CMD" &
    sleep 0.3
    client=$(hyprctl clients -j | jq -r '.[] | select(.title == "'"$APP_TITLE"'")')
    win_address=$(echo "$client" | jq -r '.address')
    hyprctl dispatch movetoworkspacesilent $current_workspace,address:$win_address
    hyprctl dispatch focuswindow address:$win_address
elif [ "$current_workspace" == "$workspace" ]; then
    hyprctl dispatch movetoworkspacesilent special:desktop,address:$win_address
else
    hyprctl dispatch movetoworkspacesilent $current_workspace,address:$win_address
    hyprctl dispatch focuswindow address:$win_address
fi

