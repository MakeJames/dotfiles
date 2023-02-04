# makejames bash aliases


# pretty print csv fies
alias csv="column -t -s ','"

# pretty git log
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# default list
alias ls="ls -a -w 75 --color=auto"

# verbose mkdir
alias mkdir="mkdir -pv"

# interactive remove
alias rm="rm -iv"

# show directory sizes

alias tree="tree --du -h"
