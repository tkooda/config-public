## enable color support of ls and also add handy aliases

export LS_OPTIONS='--color=auto --time-style=long-iso --human-readable'

#eval `dircolors -b`

alias l='ls -loF'
alias lm='ls -loF --color=always |less -r'
alias ll='ls -alF'
alias llm='ls -alF --color=always |less -r'
alias ls='ls $LS_OPTIONS'

