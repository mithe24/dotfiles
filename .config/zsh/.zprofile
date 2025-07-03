# Start ssh-agent with keychain, load SSH key, and auto-lock after 30 minutes of inactivity
eval "$(keychain --absolute --dir "$XDG_RUNTIME_DIR"/keychain --quiet --eval $XDG_CONFIG_HOME/ssh/id_ed25519)"

# Start Hyprland session only if allowed
if uwsm check may-start -q; then
	exec uwsm start hyprland.desktop
fi
