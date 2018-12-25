# HISTORY
export HISTFILE="$HOME/.zsh_history"

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
PYTHON_PATHS="$HOME/.asdf/shims/python:$HOME/.asdf/shims/python3:$HOME/.asdf/shims/python3.7:$HOME/.local/lib/python3.7/site-packages"
POSTGRES="/usr/local/Cellar/postgresql@9.6/9.6.10/bin"
USR_BINS="/usr/bin:/usr/sbin"
YARN="$HOME/.yarn/bin"

export PATH="$HOMEBREW:$JUST_BINS:$OPT_BINS:$PYTHON_PATHS:$NODE_PATH:$YARN:$NODE_MODULES:$POSTGRES:$USR_BINS"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Preferred visual editor
export VISUAL='nvim'

# asdf (Elixir, Erlang version manager)
source /usr/local/opt/asdf/asdf.sh

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
alias gbrecent='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort'
alias gbdmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

## Ruby on Rails
alias brake='bundle install&&bundle exec rake db:migrate&&bundle exec rake db:test:prepare'

## Rivi
alias start_apps="nginx -c \$APPS_PATH/dist/nginx/nginx.conf"
alias restart_apps="nginx -s reload"
alias stop_apps="nginx -s stop"

alias api-restore="RACK_ENV=development bundle exec rake db:restore"
alias api-migrate="RACK_ENV=development bundle exec rake db:migrate"

# Direnv
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
