autoload -Uz compinit
compinit
compdef _files java

export GTK_THEME="Adwaita:dark"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/git/completion/git-prompt.sh

o() {
    nohup setsid okular "$1" &>/dev/null & disown
}

export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"
alias b="librewolf"
alias lg="lazygit"
alias v="nvim"
alias ls="eza -a --icons --sort=extension"
alias wifi="nmtui"
alias shutdown="sudo shutdown -h now"
alias cls="clear && ls"
alias c="clear"
alias begone="find . -mindepth 1 -not -path './.git*' -exec rm -rf {} +"
