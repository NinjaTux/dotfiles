# conf powerline10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source aliases
[[ ! -f ~/.config/shell/exports.zsh ]] || source ~/.config/shell/exports.zsh

# Fix tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# oh-my-zsh
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(
  aws
  brew
  docker
  fzf-zsh
  git
  git-extras
  kubectl
  nvm
  z
  zsh-autosuggestions
  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# source aliases
[[ ! -f ~/.config/shell/aliases.zsh ]] || source ~/.config/shell/aliases.zsh

# source prompt
[[ ! -f ~/.config/shell/p10k.zsh ]] || source ~/.config/shell/p10k.zsh

# https://github.com/junegunn/fzf
[[ -f ~/.config/shell/fzf.zsh ]] && source ~/.config/shell/fzf.zsh
