#!/usr/bin/fish

# Directory where your dotfiles repository is cloned
set DOTFILES_DIR ~/path/to/dotfiles

# List of files/directories to link
set FILES_TO_SYMLINK file1 dir1 file2 dir2

# Loop through the files and create symbolic links
for file in $FILES_TO_SYMLINK
    # Source and target paths
    set src "$DOTFILES_DIR/$file"
    set dst "$HOME/.config/$file"

    # Create symbolic link, after removing existing files/directories
    if test -e $dst
        rm -rf $dst
    end
    ln -s $src $dst
    echo "Linked $src to $dst"
end

