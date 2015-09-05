#!/bin/bash
############################
# kickstart.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/.dotfiles                                    # dotfiles directory
backup_dir=~/.dotfiles_bk                          # old dotfiles backup directory
files="zshrc oh-my-zsh spacemacs" # list of files/folders to symlink in homedir
##########

# create dotfiles_bk in homedir
echo "Creating $backup_dir for backup of any existing dotfiles in ~"
mkdir -p $backup_dir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_bk directory, then create symlinks
for file in $files
do
    echo "Moving any existing dotfiles from ~ to $backup_dir"
    mv ~/.$file ~/.dotfiles_bk/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
