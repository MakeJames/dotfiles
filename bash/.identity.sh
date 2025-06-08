#!/bin/bash

# LICENCE: MIT <https://github.com/MakeJames/dotfiles/blob/main/LICENCE>

set -o errexit
set -o nounset

user="$(whoami)"
system="$(uname)"
kernel="$(uname -r)"
uptime="$(uptime -p)"
host="$(hostname)"
host_ip_address="$(hostname -I)"


cat << EOF
----------------
User: ${user} @ ${host} [${host_ip_address}]
System: ${system} - ${kernel}

Uptime: ${uptime}
----------------
EOF
