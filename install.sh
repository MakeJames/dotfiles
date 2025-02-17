#!/bin/bash

# Install MakeJames/dotfiles in local system.
# LICENCE: MIT

set -o errexit
set -o nounset
set -o pipefail

work_path=$(dirname "$(readlink -f "$0")")
readonly script_name="${0##*/}"

trap clean_up ERR EXIT SIGINT SIGTERM

usage () {
    cat <<USAGE_TEXT
MakeJames Dotfiles install.
Usage: ${script_name} [-h | --help]
DESCRIPTION
    Installation script for MakeJames Dotfiles. 
OPTIONS:
-h, --help
        Print this help and exit.
USAGE_TEXT
}

clean_up () {
    trap - ERR EXIT SIGINT SIGTERM
}

die() {
    local -r msg="${1}"
    local -r code "${2:-90}"
    echo "${msg}" >&2
    exit "${code}"
}

setup () {
    mkdir -p $HOME/Profile/archive
    cat <<INIT_TEXT
MakeJames Dotfiles
==================
Welcome!

Arciving any existing dotfiles....
INIT_TEXT
}


archive () {
    mv $HOME/$1 $HOME/Profile/archive/$1-$(date '+%Y-%m-%d-%H-%M-%S')
}

link () {
    ln $work_path/$1 $HOME/$1
}

setup

# ==================
# Install .gitconfig
# ==================

if [ -f $HOME/.gitconfig ]; then
    archive .gitconfig
fi

if [ -L $HOME/.gitconfig ]; then
    rm $HOME/.gitconfig
fi

link .gitconfig

# ==================
# Install .bash_aliases
# ==================

if [ -f $HOME/.bash_aliases ]; then
    archive .bash_aliases
fi

if [ -L $HOME/.bash_aliases ]; then
    rm $HOME/.bash_aliases
fi

link .bash_aliases
