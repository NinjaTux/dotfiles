# conf powerline10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source exports
[[ ! -f ~/.config/shell/exports.zsh ]] || source ~/.config/shell/exports.zsh

# eksctl completion
fpath=($fpath ~/.config/shell/completion_eksctl)

# oh-my-zsh
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
source <(kubectl completion zsh)

# source aliases
[[ ! -f ~/.config/shell/aliases.zsh ]] || source ~/.config/shell/aliases.zsh

# source prompt
[[ ! -f ~/.config/shell/p10k.zsh ]] || source ~/.config/shell/p10k.zsh

# https://github.com/junegunn/fzf
[[ -f ~/.config/shell/fzf.zsh ]] && source ~/.config/shell/fzf.zsh

# asdf-vm
. $(brew --prefix asdf)/asdf.sh
