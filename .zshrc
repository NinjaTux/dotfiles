# Enable Powerlevel10k instant prompt. Should stay close to the top of .config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.config/zsh/exports
# oh-my-zsh plugins and config
plugins=(
  aws
  brew
  docker
  gcloud
  git
  git-extras
  kubectl
  zsh-nvm
  history-substring-search
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# completion
source <(kubectl completion zsh)
source <(stern --completion=zsh)

# asdf-vm
. $(brew --prefix asdf)/asdf.sh

# aliases
source $HOME/.config/zsh/aliases

# add zsh external plugins
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit .config/zsh/.p10k.zsh.
[[ ! -f .config/zsh/.p10k.zsh ]] || source .config/zsh/.p10k.zsh
