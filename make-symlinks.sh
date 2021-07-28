#!/bin/bash

dir=~/repos/dotfiles
backup_dir=~/repos/dotfiles/backup

files="bash_profile bashrc gitconfig vimrc zprofile zshrc"

echo -n "Creating backup folder at: $backup_dir"
mkdir -p $backup_dir
echo "Done"

for file in $files; do
    echo "Creating backup copy of .$file from ~ to $backup_dir"
    mv ~/.$file $backup_dir
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

