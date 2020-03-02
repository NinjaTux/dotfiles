# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux' # arch
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# conf powerline10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.exports.zsh

# Fix tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# oh-my-zsh
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(
  aws
  docker
  git
  git-extras
  nvm
  z
  zsh-autosuggestions
  zsh-completions
)

autoload -U compinit && compinit

if [[ $platform == 'linux' ]]; then
  plugins=(archlinux "$plugins[@]")
elif [[ $platform == 'darwin' ]]; then
  plugins=(brew "$plugins[@]")
fi

source $ZSH/oh-my-zsh.sh

# Aliases & Functions
## conf
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
## nvim
alias vim="nvim"
## timestamps in history
HIST_FORMAT="'%Y-%m-%d %T'$(echo -e '\t')"
alias history="fc -t "$HIST_FORMAT" -il 1"
## net utils
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
## ngrock - to expose local ports behind a nat
alias ngrock_80='ngrock http 80'
alias ngrock_8080='ngrock http 8080'
## git stuff
alias g="git"
alias git_delete_all_branches="git branch | grep -v \"master\" | xargs git branch -D"
## docker shells with or without mounted volume
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

# source aliases
[[ ! -f ~/.aliases.zsh ]] || source ~/.aliases.zsh

# source functions
[[ ! -f ~/.functions.zsh ]] || source ~/.funcs.zsh

# source prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
