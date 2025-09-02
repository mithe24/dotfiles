# Load every config file with .zsh extension
# in rc.d/ directory
for rcfile in "$ZDOTDIR"/rc.d/*.zsh; do
  source "$rcfile"
done
unset rcfile

