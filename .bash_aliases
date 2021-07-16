alias grep='grep --color=auto'
alias rgrep='grep -r'
alias less='less -R'
# diff uses full terminal width
alias diff='diff -W $(tput cols) --color'
alias vimdiff='nvim -d'
alias rg="rg --no-heading --ignore-file ~/.config/git/gitignore_global"
alias urlencode='python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias gitfiles="git status --short | grep -v '^D' | grep -v '^R[^M]' | cut -c4- | sed 's/.* -> //'"
