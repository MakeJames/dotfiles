#!/bin/bash

# MakeJames minimal bashrc

# https://github.com/MakeJames/dotfiles
# LICENCE: MIT <https://github.com/MakeJames/dotfiles/blob/main/LICENCE>

# Copy wholesale at your own risk.

case $- in
    *i*) ;;
      *) return;;
esac

export CLICOLOR=1
export LANG="en_GB.UTF-8"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias rm="rm -i"
alias mv="mv -ip"
alias cp="cp -i"

alias ls="ls --color=auto"
alias ll='ls -lh'

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export EDITOR="vim"
export SVN_EDITOR="vim"

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

shopt -s globstar

alias ll='ls -lh'
