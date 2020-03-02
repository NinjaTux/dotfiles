#!/usr/bin/env zsh

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux' # arch
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

## misc
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

## nvim
alias vim="nvim"

## add dates to shell history
HIST_FORMAT="'%Y-%m-%d %T'$(echo -e '\t')"
alias history="fc -t "$HIST_FORMAT" -il 1"

## fancy ls

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

## net utils
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

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
    docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${dirname} "$@"
}

