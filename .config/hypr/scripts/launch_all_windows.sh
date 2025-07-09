#!/bin/sh

launch_window() {
    ~/.config/hypr/scripts/launch_window.sh "$1" "$2" "$3"
}

launch_window "kitty -e zsh -i -c 'lf'" 60 60
launch_window "kitty -e zsh -i -c 'python -q'" 40 40
launch_window "kitty" 40 40
launch_window "kitty -e zsh -i -c 'htop'" 80 60
