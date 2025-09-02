fpath=($XDG_CONFIG_HOME/zsh/completions $fpath)

autoload -Uz compinit

zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "$(dirname "$zcompdump")"

# Use cached completion if < 1 day old
if [[ -n $zcompdump(#qN.mh+24) ]]; then
  compinit -C -d "$zcompdump"
else
  compinit -d "$zcompdump"
fi

# Completion options
zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS} ma=0\;33

