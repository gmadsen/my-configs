#!/bin/bash

# Directory where your dotfiles repository is cloned
DOTFILES_DIR=~/home/madsen/projects/my-configs

# Array of files/directories to link
declare -a CONFIGDIR_FILES_TO_SYMLINK=("alacritty" "ansible" "awesome" "fish" "kitty" "nvim" "procs" "starship.toml" "wexterm")
declare -a HOMEDIR_FILES_TO_SYMLINK=(".git" "" "file2" "dir2")

# Loop through the files and create symbolic links for home dir
for file in "${HOMEDIR_FILES_TO_SYMLINK[@]}"; do
    # Source and target paths
    src="$DOTFILES_DIR/$file"
    dst="$HOME/$file"

    # Create symbolic link, after removing existing files/directories
    [ -e "$dst" ] && rm -rf "$dst"
    ln -s "$src" "$dst"
    echo "Linked $src to $dst"
done

# Loop through the files and create symbolic links for config dir
for file in "${CONFIGDIR_FILES_TO_SYMLINK[@]}"; do
    # Source and target paths
    src="$DOTFILES_DIR/$file"
    dst="$HOME/.config/$file"

    # Create symbolic link, after removing existing files/directories
    [ -e "$dst" ] && rm -rf "$dst"
    ln -s "$src" "$dst"
    echo "Linked $src to $dst"
done
