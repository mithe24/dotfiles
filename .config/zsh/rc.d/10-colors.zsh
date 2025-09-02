# Load cached pywal colors
[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences
[ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

autoload -U colors && colors

