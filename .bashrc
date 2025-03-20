#!/usr/bin/env bash
iatest=$(expr index "$-" i)

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################
# Source aliases and functions
# if [ -d ~/.bashrc.d ]; then
#   for file in ~/.bashrc.d/*.sh; do
#     [ -r "$file" ] && source "$file"
#   done
# fi
if [ -d ~/.bashrc.d ]; then
  shopt -s nullglob  # Avoids errors when no files match
  for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && source "$file"
  done
  shopt -u nullglob  # Restore default behavior
fi
####
#aliases.sh and functions.sh
##

if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
# Check if the shell is interactive
if [[ $- == *i* ]]; then
    # Bind Ctrl+f to insert 'zi' followed by a newline
    bind '"\C-f":"zi\n"'
fi

########

eval "$(starship init bash)"
eval "$(zoxide init bash)"