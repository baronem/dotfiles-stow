#!/bin/bash

clear

################################
### Start Generated Settings ###
################################

setopt extendedglob notify
unsetopt autocd beep nomatch
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

##############################
### End Generated Settings ###
##############################

# keep history
setopt appendhistory
setopt SHARE_HISTORY

# colors
autoload -U colors && colors

# run init
source $ZDOTDIR/init

# environment variables
source $ZDOTDIR/envs

# os specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    source $ZDOTDIR/os_mac
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source $ZDOTDIR/os_linux
fi

# aliases
source $ZDOTDIR/aliases

# promt
source $ZDOTDIR/prompt

# functions
source $ZDOTDIR/functions
