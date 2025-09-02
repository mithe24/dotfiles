# zsh-vi-mode
zsh-vi-mode-init() {
  source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
}
autoload -Uz zsh-vi-mode-init
zsh-vi-mode-init

# Trap Ctrl-C (show when terminal sends a interrup signal)
TRAPINT() {
  print -Pn "%F{15}%K{9}^C%f%k"
  return 1
}

