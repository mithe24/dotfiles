# source aliases
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

cat ~/.cache/wal/sequences 2>/dev/null
[ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# maybe a better way
TRAPINT() {
  print -Pn "%F{15}%K{9}^C%f%k"
  return 1
}

# autoload
autoload -Uz compinit
autoload -Uz vcs_info
autoload -U colors && colors

zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "$(dirname "$zcompdump")"
compinit -d "$zcompdump"

# cmp options
zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS} ma=0\;33

# main options
setopt append_history inc_append_history share_history
setopt NO_BEEP
setopt auto_menu menu_complete
setopt autocd
setopt auto_param_slash
setopt no_case_glob no_case_match
setopt globdots
setopt extended_glob
setopt interactive_comments
setopt prompt_subst
unsetopt prompt_sp
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
stty stop undef

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# prompt
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats "(%b%u)"
zstyle ":vcs_info:git:*" actionformats "(%b|%a%u)"
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "+"
zstyle ":vcs_info:git:*" unstagedstr "*"
zstyle ":vcs_info:git:*" untrackedstr "-"
precmd() { vcs_info }
PROMPT='%~ %F{9}${vcs_info_msg_0_}%f
%F{9}|>%f '
