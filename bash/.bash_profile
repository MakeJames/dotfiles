#!/bin/bash

# ======================
# MakeJames Bash Profile
# ======================

if [[ -r "${HOME}/.bashrc" ]]; then
    # shellcheck source=/dev/null
    source "${HOME}/.bashrc"
fi

# ============
# Path updates
# ============

if [ -f "${HOME}/minio-binaries" ]; then
    export PATH=$PATH:$HOME/minio-binaries/
fi

if [ -f "${HOME}/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [ -f "/usr/local/go/bin" ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

# ==============
# User Variables
# ==============

export EDITOR="/usr/bin/vim"

# vim: set ts=4 sw=4 filetype=bash_profile :
