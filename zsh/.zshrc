# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
HOMEBREW="/usr/local/Cellar:/usr/local/bin:/usr/local/sbin:/usr/local/opt"
JUST_BINS="/bin:/sbin:$HOME/bin"
OPT_BINS="/opt/local/bin:/opt/local/sbin"
NODE_PATH="$HOME/.asdf/shims/node"
NODE_MODULES="$(pwd)/node_modules/.bin:$HOME/.config/yarn/global/node_modules/.bin"
USR_BINS="/usr/bin:/usr/sbin"
YARN="$HOME/.yarn/bin"

export PATH="$HOMEBREW:$USR_BINS:$JUST_BINS:$OPT_BINS:$NODE_PATH:$YARN:$NODE_MODULES"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Preferred visual editor
export VISUAL='nvim'

# asdf (Elixir, Erlang version manager)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

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

# Aliases

alias desk='cd ~/Desktop'
alias help='less ~/Desktop/til/unix.md'
alias h=help
alias ls='ls -Gp'
alias whatsmyip='curl ipinfo.io/ip'

## Git
alias grecent='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort'
alias gbdmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

## Ruby on Rails
alias brake='bundle install&&bundle exec rake db:migrate&&bundle exec rake db:test:prepare'

## The RealReal
alias trrapigateway='/Users/davidwu/Desktop/trr/go/src/github.com/TheRealReal/therealreal-api'