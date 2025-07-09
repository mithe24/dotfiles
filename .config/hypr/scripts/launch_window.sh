#!/bin/sh

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

eval "$CMD &"
sleep 0.3
PID=$(pgrep -n -u "$USER" "$(basename "$CMD" | awk '{print $1}')")

echo "$PID" > "$CACHE_FILE"

for _ in {1..50}; do
    sleep 0.1
    CLIENT=$(get_window_by_pid "$PID")
    if [[ -n "$CLIENT" ]]; then
        WID=$(echo "$CLIENT" | jq -r '.address')

        hyprctl dispatch focuswindow address:"$WID"
        hyprctl dispatch togglefloating address:"$WID"
        hyprctl dispatch bringactivetotop
        hyprctl dispatch resizeactive exact "$FLOAT_WIDTH"%" "$FLOAT_HEIGHT"%"
        hyprctl dispatch centerwindow address:$WID
        move_window_to_ws "$WID" "$SPECIAL_WORKSPACE"

        break
    fi
done

