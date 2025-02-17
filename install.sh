#!/bin/bash

# Install MakeJames/dotfiles in local system.
# LICENCE: MIT

set -o errexit
set -o nounset
set -o pipefail

echo "
MakeJames Dotfiles
==================

Welcome!
arciving any existing dotfiles....

...Setting up MakeJames dotfiles
"


mkdir -p $HOME/Profile/archive

archive () {
    mv $HOME/$1 $HOME/Profile/archive/$1-$(date '+%Y-%m-%d-%H-%M-%S')
}

link () {
    ln ./$1 $HOME/$1
}

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
