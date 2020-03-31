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
if ! which 'brew'; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  for utility in {asdf,ctags,direnv,fzf,nvim,ripgrep}; do
    brew install "$utility";
  done
else
  echo 'homebrew already installed'
fi

# asdf plugins
if which 'asdf'; then
  for lang in {elixir,golang,nodejs,python,ruby,rust}; do
    asdf plugin add "$lang";
  done
fi

# SSH
if [ ! -f '~/.ssh/id_rsa' ]; then
  ssh-keygen -t rsa -b 4096 -C "dwu207@gmail.com"
  ssh-add '~/.ssh/id_rsa'
else
  echo 'SSH key already exists'
fi

# dotfiles
# symlink dotfiles into host machine's $HOME
if [ ! -d '~/.dotfiles' ]; then
  git clone 'git@github.com:sudostack/dotfiles.git' '~/.dotfiles'
  cd ~
  for file in ~/.dotfiles/.{bashrc,bash_profile,exports,aliases,functions,utilities}; do
    [ -r "$file" ] && [ -f "$file" ] && ln -s "$file" . && source "$file";
  done
else
  echo 'dotfiles already exist'
fi
