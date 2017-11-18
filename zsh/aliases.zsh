alias desk='cd ~/Desktop'
alias help='less ~/Desktop/til/unix.md'
alias h=help
alias ls='ls -Gp'
alias whatsmyip='curl ipinfo.io/ip'

# Git
alias gcb='git rev-parse --abbrev-ref HEAD'
alias grecent='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort'
alias gbdmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Ruby on Rails
alias brake='bundle install&&bundle exec rake db:migrate&&bundle exec rake db:test:prepare'

# The RealReal
alias trrapigateway='/Users/davidwu/Desktop/trr/go/src/github.com/TheRealReal/therealreal-api'
