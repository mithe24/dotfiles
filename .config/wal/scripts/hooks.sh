#!/bin/sh

# ---- Hyprpaper ----
WALLPAPER="$(cat "$XDG_CACHE_HOME/wal/wal")"
HYPAPER_CONFIG="$XDG_CONFIG_HOME/hypr/hyprpaper.conf"

if [[ ! -f "$WALLPAPER" ]]; then
    echo "File not found: $WALLPAPER"
    exit 1
fi

{
  echo "preload = $WALLPAPER"
  echo "wallpaper = , $WALLPAPER"
} > "$HYPAPER_CONFIG"

hyprctl reload
killall hyprpaper
hyprctl dispatch exec hyprpaper

# ---- Zellij ----
. "$XDG_CACHE_HOME/wal/colors.sh" || exit 1

mkdir -p "$XDG_CONFIG_HOME/zellij/themes"

cat > "$XDG_CONFIG_HOME/zellij/themes/pywal.kdl" << EOF
themes {
    default {
        fg "$color0"
        bg "$color1"
        black "$foreground"
        red "$color2"
        green "$color3"
        yellow "$color4"
        blue "$color5"
        magenta "$color6"
        cyan "$color7"
        white "$color8"
        orange "$color9"
    }
}
EOF
