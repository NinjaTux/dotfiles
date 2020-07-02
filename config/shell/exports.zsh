#!/usr/bin/env zsh

# xterm-256color terminal mode
export TERM="xterm-256color"

# set default term editor
export EDITOR="nvim"

# increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# US English and UTF-8.
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

