autoload -Uz vcs_info

# Git info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats "(%b%u)"
zstyle ":vcs_info:git:*" actionformats "(%b|%a%u)"
zstyle ":vcs_info:git:*" check-for-changes false  # faster
zstyle ":vcs_info:git:*" stagedstr "+"
zstyle ":vcs_info:git:*" unstagedstr "*"
zstyle ":vcs_info:git:*" untrackedstr "-"

precmd() { vcs_info }

PROMPT='%~ %F{9}${vcs_info_msg_0_}%f
%F{9}|>%f '

