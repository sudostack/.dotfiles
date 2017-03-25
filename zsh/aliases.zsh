alias desk='cd ~/Desktop'
alias ls='ls -Gp'
alias emacsc='emacsclient -c'
alias whatsmyip='curl ipinfo.io/ip'

# Git
alias grecent='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort'
alias gbdmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Ruby on Rails
alias brake='bundle install&&bundle exec rake db:migrate&&bundle exec rake db:test:prepare'

# The RealReal
alias trrapigateway='/Users/davidwu/Desktop/trr/go/src/github.com/TheRealReal/therealreal-api'
