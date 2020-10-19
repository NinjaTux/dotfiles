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
  zsh-autosuggestions
  zsh-completions
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

# Use Starship Prompt
# https://github.com/starship/starship'
eval "$(starship init zsh)"