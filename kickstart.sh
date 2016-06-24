#!/bin/bash
############################
# kickstart.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# dotfiles directory
dir=~/.dotfiles

# old dotfiles backup directory
backup_dir=~/.dotfiles_bk

# list of files/folders to symlink in homedir
files=(git/.gitignore_global git/.gitconfig runcom/.zshrc editor/.spacemacs)
##########

# create dotfiles_bk in homedir
echo "Creating $backup_dir for backup of any existing dotfiles in ~/"
mkdir -p $backup_dir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_bk directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $backup_dir"
for file in $files
do
    mv ~/$file ~/.dotfiles_bk/
    echo "Creating symlink to $file in home directory."
    ln -sfv $dir/$file ~/
done
