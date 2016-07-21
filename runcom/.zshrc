# Powerline-ZSH
function powerline_prompt()
{
    export PROMPT="$(~/.dotfiles/powerline-zsh/powerline-zsh.py --cwd-only -m konsole $?)"
}

precmd()
{
    powerline_prompt
}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

HOMEBREW=/usr/local/bin:/usr/local/sbin

# User configuration
if [ `whoami` = 'davidwu' ] && [ `hostname` = 'sudostackMBP.local' ]; then
  export PATH="/usr/local/Cellar:$HOMEBREW:/Users/davidwu/.rbenv/shims:/usr/bin:/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/bin:/usr/sbin:/sbin:/Users/dwu/bin:/Users/dwu/bin:/Users/davidwu/.node/bin:$NODE_PATH"
elif [ `whoami` = 'dwu' ] && [ `hostname` = 'sudostackMBA.local' ]; then
  export PATH="/usr/local/Cellar:$HOMEBREW:/usr/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/bin:/usr/sbin:/sbin:/Users/dwu/bin"
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias desk='cd ~/Desktop'
alias ls='ls -Gp'
alias emacsc="emacsclient -c"

eval "$(direnv hook zsh)"

# Lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# asdf (Elixir, Erlang version manager)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
