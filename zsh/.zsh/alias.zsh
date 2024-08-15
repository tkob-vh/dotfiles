alias l='lsd -F'
alias ls='lsd -F'
alias la='lsd -AF'
alias ll='lsd -alF'

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias vi='nvim'
alias _vi='sudoedit'
alias leet='vi leetcode.nvim'
alias weather='curl wttr.in/wuhan'
alias post="curl -F \"c=@-\" \"http://fars.ee/\""
alias path='echo -e ${PATH//:/\\n}'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias info="pinfo"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -color=auto'

