# conf powerline10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
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
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/openjdk/bin:$PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh plugins and config
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(
  aws
  brew
  docker
  git
  git-extras
  kubectl
  zsh-nvm
  z
  zsh-autosuggestions
  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# eksctl completion
fpath=($fpath ~/.config/shell/completion_eksctl)
source <(kubectl completion zsh)

# aliases
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
alias wifioff="networksetup -setairportpower en0 off"
alias wifion="networksetup -setairportpower en0 on"
## git
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
## terraform
alias tf="terraform"
alias tff="tf fmt"
alias tfv="tf validate"
## terragrunt
alias terragrunt_delete="find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;"
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
## youtube-dl
alias ydlbf="youtube-dl -f bestvideo+bestaudio"

# utils functions
function ask_yes_or_no() {
  read "yn?$1"
  if [[ "$yn" =~ ^[Yy]$ ]]
  then
    echo "yes"
  fi
}

# source prompt
[[ ! -f ~/.config/shell/p10k.zsh ]] || source ~/.config/shell/p10k.zsh

# https://github.com/junegunn/fzf
[[ -f ~/.config/shell/fzf.zsh ]] && source ~/.config/shell/fzf.zsh

# asdf-vm
. $(brew --prefix asdf)/asdf.sh
