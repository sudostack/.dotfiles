#!/bin/bash

: '
RESOURCES:
1. http://robertmuth.blogspot.com/2012/08/better-bash-scripting-in-15-minutes.html
2. http://www.tldp.org/LDP/abs/html/moreadv.html
3. https://devhints.io/bash
'

# This will take care of two very common errors:
# Referencing undefined variables (which default to "")
# Ignoring failing commands
set -o nounset
set -o errexit

# Homebrew
if ! which brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  for utility in {asdf,ctags,direnv,fzf,nvim,ripgrep,tree}; do
    brew install "$utility";
  done
else
  echo 'homebrew already installed'
fi

# SSH
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "dwu207@gmail.com"
  ssh-add ~/.ssh/id_rsa
else
  echo 'SSH key already exists'
fi

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

# Vim Plug (Neovim)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim config
if [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config && mkdir ~/.config/nvim && ln -s ~/.dotfiles/editor/init.vim ~/.config/nvim/init.vim
fi

# dotfiles
# symlink dotfiles into host machine's $HOME
if [ -d ~/.dotfiles ]; then
  cd ~
  for file in ~/.dotfiles/.{bashrc,bash_profile,exports,aliases,functions,utilities}; do
    [ -r "$file" ] && [ -f "$file" ] && ln -s "$file" .;
  done
else
  echo 'dotfiles already exist'
fi
