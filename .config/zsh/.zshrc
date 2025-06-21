# source aliases
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

cat ~/.cache/wal/sequences 2>/dev/null
[ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

# maybe a better way
TRAPINT() {
  print -Pn "%F{15}%K{9}^C%f%k"
  return 1
}

# autoload
autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -U colors && colors

# cmp options
zstyle ":completion:*" menu select # tab opens cmp menu
zstyle ":completion:*" special-dirs true # force . and .. to show in cmp menu
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu

# main options
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt NO_BEEP
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
setopt prompt_subst
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^n" down-line-or-history
bindkey "^p" up-line-or-history

# promt
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats "(%b%u)"
zstyle ":vcs_info:git:*" actionformats "(%b|%a%u)"
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "+"
zstyle ":vcs_info:git:*" unstagedstr "*"
zstyle ":vcs_info:git:*" untrackedstr "-"
precmd() { vcs_info }
PROMPT='%~ %F{9}${vcs_info_msg_0_}%f
%F{9}>%f '
