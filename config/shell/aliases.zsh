#!/usr/bin/env zsh

## misc
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

## nvim
alias vim="nvim"

## add dates to shell history
HIST_FORMAT="'%Y-%m-%d %T'$(echo -e '\t')"
alias history="fc -t "$HIST_FORMAT" -il 1"

## ls
alias ll='ls -alGh'
alias ls='ls -Gh'
alias lsg='ll | grep'

## net utils
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# git
alias g="git"
alias gs="git status -s"
function git_delete_merged() {
  echo "[#] Listing all branches except master"
  git for-each-ref --format '%(refname:short)' refs/heads | grep -v master
  ans=$(ask_yes_or_no "[#] Do you want to delete those branches locally? [y/n] - ")
  if [[ "yes" == "$ans" ]] then
    echo "[#] Deleting..."
    git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D
    echo "[#] Deleted"
  else
    echo "[#] Skipped"
  fi
}

## docker
alias dstop='docker stop $(docker ps -aq)'
alias dockershell='docker run --rm -i -t --entrypoint=/bin/bash'
alias dockershell_sh='docker run --rm -i -t --entrypoint=/bin/sh'
function dockershell_here() {  
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/bash -v `pwd`:/${dirname} -w /${dirname} "$@"
}
function dockershell_sh_here() {  
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${diirname} "$@"
}

## util functions
function ask_yes_or_no() {
  read "yn?$1"
  if [[ "$yn" =~ ^[Yy]$ ]]
  then
    echo "yes"
  fi
}
