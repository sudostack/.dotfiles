#!/usr/local/bin/bash
# NOTE: this only works with Bash 4.0+ (instsall via Homebrew)

: '
RESOURCES:
1. http://robertmuth.blogspot.com/2012/08/better-bash-scripting-in-15-minutes.html
2. http://www.tldp.org/LDP/abs/html/moreadv.html
3. https://devhints.io/bash
'

# This will take care of two very common errors:
# Referencing undefined variables (that default to "")
# Ignoring failing commands
set -o nounset
set -o errexit

echo -e '\n--- SSH ---'
if [ ! -f ~/.ssh/id_rsa ]; then
  echo 'setting up SSH key';
  ssh-keygen -t rsa -b 4096 -C "$(scutil --get ComputerName)"
  ssh-add -K ~/.ssh/id_rsa
else
  echo 'SSH key already exists';
fi

echo -e '\n--- Homebrew ---'
if ! command -v brew; then
  echo 'installing Homebrew';
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo 'Homebrew already installed';
fi

echo -e '\n--- utilities (via Homebrew) ---';
declare -A utilities
utilities=(
  ['asdf']=             # language version manager (one to rule them all)
  ['bat']=              # cat alternative (rust)
  ['ctags']='universal-ctags/universal-ctags/universal-ctags'
  ['direnv']=           # manage per-directory environment variables
  ['fd']=               # fast alternative to find
  ['fzf']=              # command-line fuzzy finder
  ['gh']='github/gh/gh' # GitHub CLI
  ['glow']=             # markdown reader
  ['gpg-agent']='gnupg' # GNU (Pretty Good Privacy)
  ['htop']=             # improved top (interactive process viewer)
  ['jq']=               # command-line JSON processor
  ['neofetch']=         # command-line system info tool
  ['nvim']=             # Neovim
  ['rg']='ripgrep'      # Rust implementation of grep (faster than Ag aka the Silver Searcher)
  ['tmux']              # terminal multiplexer
  ['tree']=             # display directories as trees
  ['wget']=             # Internet file retriever
  ['wtfutil']=          # The personal information dashboard for your terminal
  ['zoxide']=           # faster way to navigate the filesystem (stack-based)
)
for cmd in ${!utilities[@]}; do
  formula=${utilities[${cmd}]};
  if ! command -v "$cmd"; then
    echo "installing: ${cmd}";
    if [ "${#formula}" > 0 ]; then brew install "$formula"; else brew install "$cmd"; fi
  else
    echo "${cmd} already installed";
  fi
done

echo -e '\n--- (cask) utilities (via Homebrew) ---';
casks=(
  alacritty
  ngrok
  rectangle
)
for cask in "${casks[@]}"; do
  if ! command -v "$cask"; then
    echo "installing: ${cask}";
    brew cask install "$cask";
  else
    echo "${cask} already installed";
  fi
done

echo -e '\n--- linking dotfiles ---';
dotfiles=(
  aliases
  bash_profile
  bashrc
  dir_colors
  exports
  functions
  gitconfig
  gitignore_global
  ripgreprc
  utilities
)
for dotfile in "${dotfiles[@]}"; do
  if [ -r "$dotfile" ] && [ -f "$dotfile" ]; then # readable and is file (options)
    echo "linking ${dotfile}";
    ln -s "$dotfile" "$HOME/.${dotfile}".;
  else
    echo "${dotfile} already linked"
  fi
done

echo -e '\n--- checking for vim-plug ---';
if [[ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]]; then
  echo 'installing vim-plug';
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo 'vim-plug already installed';
fi

echo -e '\n--- checking Neovim config ---'
if [[ ! -d ~/.config/nvim ]]; then # directory exists
  echo 'linking Neovim config';
  mkdir -p ~/.config/nvim && ln -s ~/.dotfiles/neovim/init.vim ~/.config/nvim/init.vim
else
  echo 'Neovim config already linked';
fi

echo -e '\n--- BOOTSTRAPPING FINISHED ---'
