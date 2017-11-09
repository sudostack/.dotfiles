# Powerline-ZSH
# function powerline_prompt()
# {
#     export PROMPT="$(~/.dotfiles/powerline-zsh/powerline-zsh.py --cwd-only -m konsole $?)"
# }

# precmd()
# {
#     powerline_prompt
# }

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Pure
autoload -U promptinit; promptinit
# prompt pure

# ZSH_THEME="miloshadzic"
# ZSH_THEME="nanotech"
# ZSH_THEME="wezm"
ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
export CLICOLOR=1
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
zstyle ':completion:*:default' list-colors ''

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

HOMEBREW=/usr/local/bin:/usr/local/sbin:/usr/local/opt
NODEPATH=/Users/davidwu/.asdf/shims/node
YARN=$HOME/.yarn/bin

# User configuration
# if [ `whoami` = 'davidwu' ] && [ `hostname` = 'sudostackMBP' ]; then
export PATH="/usr/local/Cellar:$HOMEBREW:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/bin:$NODEPATH:$YARN:"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Emacs
export ALTERNATE_EDITOR=""

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# asdf (Elixir, Erlang version manager)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# TIL
function til() {
  if [[ $1 == "elixir-phoenix" && -z $2 ]]; then
    open https://github.com/sudostack/til/blob/master/elixir-phoenix
  elif [[ $1 == "elixir-phoenix" ]]; then
    open https://github.com/sudostack/til/blob/master/elixir-phoenix/$2.md
  elif [[  $1 == "elixir" && -z $2 ]]; then
    open https://github.com/sudostack/til/blob/master/elixir
  elif [[ $1 == "elixir" ]]; then
    open https://github.com/sudostack/til/blob/master/elixir/$2.md
  else
    open https://github.com/sudostack/til
  fi
}

# Gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

eval "$(direnv hook zsh)"

# Fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
