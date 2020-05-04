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

# SSH
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "wulymanmyth@gmail.com"
  ssh-add ~/.ssh/id_rsa
else
  echo 'SSH key already exists'
fi

# Homebrew
if ! which brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  for utility in {asdf,direnv,fzf,glow,gnupg,htop,jq,nvim,ripgrep,tree}; do
    brew install "$utility";
  done

  # Taps
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
else
  echo 'homebrew already installed'
fi

# dotfiles
if [ -d ~/.dotfiles ]; then
  cd ~
  for file in ~/.dotfiles/.{bashrc,bash_profile,exports,aliases,functions,utilities}; do
    [ -r "$file" ] && [ -f "$file" ] && ln -s "$file" .;
  done
else
  echo 'dotfiles already exist'
fi

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

# Neovim config
if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim && ln -s ~/.dotfiles/editor/init.vim ~/.config/nvim/init.vim
fi

# Vim Plug (Neovim)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
