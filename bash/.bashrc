#!/bin/bash

# =================
# MakeJames .bashrc
# =================

# https://github.com/MakeJames/dotfiles
# LICENCE: MIT <https://github.com/MakeJames/dotfiles/blob/main/LICENCE>

# Copy wholesale at your own risk.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# =======
# .dotfiles
# =======

if [ -f "${HOME}/.bash_aliases" ]; then
    # shellcheck source=/dev/null
    source "${HOME}/.bash_aliases"
fi


# ======
# chroot
# ======

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ==========
# Completion
# ==========

# Enable programmable completion features
# (you don't need to enable this if it's already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc).

if [ -f /usr/share/bash-completion/bash_completion ]; then
    # shellcheck source=/dev/null
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    # shellcheck source=/dev/null
    source /etc/bash_completion
fi

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# ======
# Colour
# ======

color_prompt=

# set a fancy prompt (non-colour, unless we know we "want" colour)
case "$TERM" in
    xterm-color|*-256color)
        color_prompt=yes
        ;;
esac

# ======
# Prompt
# ======

ps1_theme="defulat"

if [ -f "${HOME}/.bash_prompt" ]; then
    # shellcheck source=/dev/null
    . "${HOME}/.bash_prompt"
    ps1_theme="bash_prompt"
fi

if [ "${ps1_theme}" = "default" ]; then
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;05;240m\] $(parse_git_branch)\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
fi

# Colour GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# =======================
# Glob-star file matching
# =======================

# The pattern "**" used in a pathname expansion context will match all files
# and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ===============
# History Control
# ===============

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# =========
# Languages
# =========

# Node and nvm

if [ -f "${HOME}/.nvm" ]; then
    export NVM_DIR="${HOME}/.nvm"

    # Load nvm
    # shellcheck source=/dev/null
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm

    # Load nvm bash_completion
    # shellcheck source=/dev/null
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
fi

# Rust and cargo

if [ -f "${HOME}/.cargo/env" ]; then
    # shellcheck source=/dev/null
    source "${HOME}/.cargo/env"
fi

# ============
# Path updates
# ============

if [ -d "${HOME}/.local/minio-binaries" ]; then
    export PATH=$PATH:$HOME/.local/minio-binaries/
fi

if [ -d "${HOME}/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [ -d "/usr/local/go/bin" ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

if [ -d "/usr/lib/postgresql/15/bin" ]; then
    export PATH=$PATH:/usr/lib/postgresql/15/bin
fi

if [ -d "${HOME}/.config/helix/runtime" ]; then
    export HELIX_RUNTIME="${HOME}/.config/helix/runtime/runtime"
fi

# ==============
# User Variables
# ==============

export EDITOR="/usr/bin/vim"

# ===============
# Window Settings
# ===============

# Check the window size after each command
# and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

unset color_prompt force_color_prompt

if [ -f "${HOME}/.identity.sh" ]; then
    bash "${HOME}/.identity.sh"
fi

# vim: filetype=sh
