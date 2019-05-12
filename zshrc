#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

# Syntax highlighting and tab completion
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# `$HOME/bin`
export PATH=$HOME/bin:/usr/local/bin:$PATH
# mysql-client
export PATH=/usr/local/opt/mysql-client/bin:$PATH

# misc env
export TERM="xterm-256color"
export HIST_STAMPS="dd/mm/yyyy"
export EDITOR="nvim"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export WORKSPACE=$HOME/workspace
export BAT_THEME="Monokai Extended Origin"

# oh-my-zsh
export ZSH="/Users/vbarrila/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel9k/powerlevel9k"
# prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\u2192%f "
# vcs
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
# dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
# composing prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

DISABLE_UPDATE_PROMPT=true

# oh-my-zsh plugins
plugins=(
  aws
  brew
  docker
  git
  z
  zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim="nvim"
alias c="bat"
## git
alias gs="g st"
alias ga="g a"
alias gc="g c -m"
alias gp="g p"
alias git_delete_all_branches="git branch | grep -v \"master\" | xargs git branch -D"

# Default GOPATH
export GOPATH=$WORKSPACE/go

# Custom GOPATH based on the presence of `.gopath`
function set_gopath() {
  cdir=$PWD
  while [ "$cdir" != "/" ]; do
    if [ -e "$cdir/.gopath" ]; then
      export GOPATH=$cdir
      break
    fi
    cdir=$(dirname "$cdir")
  done
}
chpwd_functions=(${chpwd_functions[@]} "set_gopath")

# k8s
source $WORKSPACE/dotfiles/kube.sh

# private stuff
source $WORKSPACE/dotfiles-private/workrc
