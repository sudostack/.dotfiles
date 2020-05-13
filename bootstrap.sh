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
  ssh-keygen -t rsa -b 4096 -C "$(scutil --get ComputerName)"
  ssh-add ~/.ssh/id_rsa
else
  echo 'SSH key already exists'
fi

# Homebrew
if ! which brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo 'homebrew already installed'
fi

utilities=(
  asdf                                            # language version manager (one to rule them all)
  bash-completion                                 # unlike zsh (does not come out of the box)
  direnv                                          # manage per-directory environment variables
  fzf                                             # command-line fuzzy finder
  github/gh/gh                                    # GitHub CLI
  glow                                            # markdown reader
  gnupg                                           # free OpenPGP (pretty good privacy standard)
  htop                                            # improved top (interactive process viewer)
  jq                                              # command-line JSON processor
  nvim                                            # Neovim
  ripgrep                                         # Rust implementation of grep (faster than Ag aka the Silver Searcher)
  tree                                            # display directories as trees
  universal-ctags/universal-ctags/universal-ctags # NOTE: may need to uninstall system version
  wget                                            # Internet file retriever
)
for utility in "${utilities[@]}"; do
  if ! which "$utility"; then
    echo "installing: ${utility}";
    brew install "$utility";
  fi
done

# Homebrew casks
casks=(
  ngrok
)
for cask in "${casks[@]}"; do
  if ! which "$cask"; then
    echo "installing: ${cask}";
    brew cask install "$cask";
  fi
done

# dotfiles
for file in ~/.dotfiles/.{bashrc,bash_profile,exports,aliases,functions,utilities}; do
  if [[ ! -e "$file" ]]; then
    [ -r "$file" ] && [ -f "$file" ] && ln -s "$file" .;
  fi
done

# Git
for file in ~/.dotfiles/git/.{gitconfig,gitignore_global}; do
  if [[ ! -e "$file" ]]; then
    echo "copying: ${file}";
    [ -r "$file" ] && [ -f "$file" ] && ln -s "$file" .;
  fi
done

# Neovim config
if [[ ! -d ~/.config/nvim ]]; then
  echo 'copying neovim config';
  mkdir -p ~/.config/nvim && ln -s ~/.dotfiles/editor/init.vim ~/.config/nvim/init.vim
fi

# vim-plug
if [[ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]]; then
  echo 'installing vim-plug';
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
