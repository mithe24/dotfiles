#!/bin/bash

# ========= CONFIG =========
CMD="$1"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/hypr-windows"
CACHE_FILE="$CACHE_DIR/${CMD}.pid"
WINDOW_CLASS="$CMD"
FLOAT_WIDTH="$2"
FLOAT_HEIGHT="$3"
SPECIAL_WORKSPACE="special:desktop"
# ==========================

mkdir -p "$CACHE_DIR"
CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')
FOCUSED_PID=$(hyprctl activewindow -j | jq -r '.pid')

# Helper: get window info by pid
get_window_by_pid() {
    local pid="$1"
    hyprctl clients -j | jq -c ".[] | select(.pid == $pid)"
}

# Helper: move to workspace
move_window_to_ws() {
    local wid="$1"
    local ws="$2"
    hyprctl dispatch movetoworkspacesilent "$ws,address:$wid"
}

if [[ -f "$CACHE_FILE" ]]; then
    PID=$(cat "$CACHE_FILE")

    if ps -p "$PID" > /dev/null; then
        CLIENT=$(get_window_by_pid "$PID")

        if [[ -z "$CLIENT" ]]; then
            echo "Waiting for window..."
            sleep 0.3
            CLIENT=$(get_window_by_pid "$PID")
        fi

        if [[ -n "$CLIENT" ]]; then
            WID=$(echo "$CLIENT" | jq -r '.address')
            WS_ID=$(echo "$CLIENT" | jq -r '.workspace.id')

            if [[ "$WS_ID" != "$CURRENT_WS" ]]; then
                move_window_to_ws "$WID" "$CURRENT_WS"
                hyprctl dispatch focuswindow address:"$WID"
                hyprctl dispatch bringactivetotop
            elif [[ "$PID" != "$FOCUSED_PID" ]]; then
                hyprctl dispatch focuswindow address:"$WID"
                hyprctl dispatch bringactivetotop
            else
                move_window_to_ws "$WID" "$SPECIAL_WORKSPACE"
            fi

            exit 0
        fi
    fi
fi

eval "$CMD &"
sleep 0.3
NEW_PID=$(pgrep -n -u "$USER" "$(basename "$CMD" | awk '{print $1}')")

echo "$NEW_PID" > "$CACHE_FILE"

for _ in {1..50}; do
    sleep 0.1
    CLIENT=$(get_window_by_pid "$NEW_PID")
    if [[ -n "$CLIENT" ]]; then
        WID=$(echo "$CLIENT" | jq -r '.address')

        hyprctl dispatch focuswindow address:"$WID"
        hyprctl dispatch togglefloating address:"$WID"
        hyprctl dispatch bringactivetotop
        hyprctl dispatch resizeactive exact "$FLOAT_WIDTH"%" "$FLOAT_HEIGHT"%"
        hyprctl dispatch centerwindow address:$WID
        break
    fi
done
