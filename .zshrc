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

# source aliases
[[ ! -f ~/.aliases.zsh ]] || source ~/.aliases.zsh

# source functions
[[ ! -f ~/.functions.zsh ]] || source ~/.functions.zsh

# source prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
