# =======================
# MakeJames .bash_aliases
# =======================

# https://github.com/MakeJames/dotfiles
# LICENCE: https://github.com/MakeJames/dotfiles/blob/main/LICENCE.md

# pretty print csv fies
alias csv="column -t -s ','"

# pretty git log
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# default list
alias ls="ls -a -w 75"

# verbose mkdir
alias mkdir="mkdir -pv" # -p creates missing directories

# interactive remove
alias rm="rm -iv"

# show directory sizes
alias tree="tree --du -h"

# enable colour support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls -a -w 75 --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi

# vim: set sw=4 tw=4 filetype=bash:
