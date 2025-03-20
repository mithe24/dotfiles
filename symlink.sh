#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

create_symlink() {
    local source="$1"
    local target="$2"
    
    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR does not exist."
    exit 1
fi

create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/i3wm/config" "$HOME/.config/i3/config"
create_symlink "$DOTFILES_DIR/i3wm/polybar.sh" "$HOME/.config/i3/polybar.sh"

mkdir -p "$DOTFILES_DIR/nvim/lua"
for file in "$HOME/.config/nvim/lua"/*; do
    if [ -f "$file" ] || [ -d "$file" ]; then

        rel_path=$(realpath --relative-to="$HOME/.config/nvim/lua" "$file")
        target="$DOTFILES_DIR/nvim/lua/$rel_path"

        mkdir -p "$(dirname "$target")"
        cp -r "$file" "$target"
    fi
done

for file in "$DOTFILES_DIR/nvim/lua"/*; do
    if [ -f "$file" ] || [ -d "$file" ]; then

        rel_path=$(realpath --relative-to="$DOTFILES_DIR/nvim/lua" "$file")
        target="$HOME/.config/nvim/lua/$rel_path"
        create_symlink "$file" "$target"
    fi
done

echo "Dotfiles setup complete!"
