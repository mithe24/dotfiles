# Lazy-load NVM
export NVM_DIR="$HOME/.config/nvm"

lazy_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in nvm node npm npx; do
  eval "$cmd() { lazy_nvm; $cmd \"\$@\" }"
done

