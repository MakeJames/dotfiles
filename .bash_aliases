# makejames bash aliases

# set prompt style
export PS1="\n\e[1;38;5;40m\]\w \e[0;0m\]\e[4;38;5;8m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\e[1;00m\]\n\e[0;38;5;25m\]\d \t\n\e[1;38;5;82m\]\u\e[0;00m\]@\e[1;38;5;27m\]\h\e[0;00m\]: \# - \\$ \[$(tput sgr0)\]\e[0;00m\]"

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
