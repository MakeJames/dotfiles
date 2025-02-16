#!/bin/bash

# ====
# INIT
# ====

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
