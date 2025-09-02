# Shell options
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

# Disable Ctrl-S freeze
stty stop undef

