# ~/.zshenv
[ -f "$HOME/.secrets" ] && . "$HOME/.secrets"
export PATH="$HOME/.local/share/bin:$PATH"

# editor / terminal / browser preferences
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"
export OPENER="xdg-open"

# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# redirect zsh config to XDG path
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History and runtime files
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export _JAVA_OPTIONS=-Djavafx.cachedir="$XDG_CACHE_HOME"/openjfx
export _JAVA_AWT_WM_NONREPARENTING=1
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export LEIN_HOME="$XDG_DATA_HOME"/lein
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

