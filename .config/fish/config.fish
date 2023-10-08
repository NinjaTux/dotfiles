if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx VISUAL code
set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx DOCKER_BUILDKIT 0
set -gx HOMEBREW_CASK_OPTS '--appdir=/Applications'
set -gx COMPOSE_DOCKER_CLI_BUILD 0

set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin

set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --no-ignore-vcs'
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never'

set --export --prepend PATH "/Users/valerio.barrila/.npm-global/bin"
set --export --prepend PATH "/Users/valerio.barrila/go/bin"
set --export --prepend PATH "/Users/valerio.barrila/.local/bin"
set --export --prepend PATH /opt/homebrew/opt/openjdk/bin
set --export --prepend PATH "/Users/valerio.barrila/.cargo/bin"
set --export --prepend PATH "/opt/homebrew/opt/ruby@2.7/bin"

function unset
    set --erase $argv
end

## clear
alias clear_env 'kctx -u && unset AWS_PROFILE'

## file utils
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lss 'exa -1 -l -a -g -h -H -m --git --octal-permissions'

## k8s
alias k kubectl
alias kctx kubectx
alias k kubectl
alias kd 'k describe'
alias kg 'k get'
alias kaf 'k apply -f'
alias kdel 'k delete'
alias ke 'k edit'
alias kccc 'k config current-context'
alias kcdc 'k config delete-context'
alias kcsc 'k config set-context'
alias kcuc 'k config use-context'
alias kdd 'kd deployment'
alias kdeld 'kdel deployment'
alias kdeli 'kdel ingress'
alias kdelp 'kdel pods'
alias kdels 'kdel svc'
alias kdelsec 'kdel secret'
alias kdi 'kd ingress'
alias kdp 'kd pods'
alias kds 'kd svc'
alias kdsec 'kd secret'
alias ked 'ke deployment'
alias kei 'ke ingress'
alias kep 'ke pods'
alias kes 'ke svc'
alias keti 'k exec -ti'
alias kgd 'kg deployment'
alias kgi 'kg ingress'
alias kgp 'kg pods'
alias kgrs 'kg rs'
alias kgs 'kg svc'
alias kgsec 'kg secret'
alias kl 'k logs'
alias klf 'k logs -f'
alias krh 'k rollout history'
alias krsd 'k rollout status deployment'
alias kru 'k rollout undo'
alias ksd 'k scale deployment'

## flux
alias f flux
alias fga 'flux get all'
alias fgk 'flux get ks -A'
## git
alias g git
alias gs 'git status -s'
alias gdm 'git for-each-ref --format '%(refname:short)' refs/heads | grep -v \"master\|main\" | xargs git branch -D'
alias lg lazygit
## network
alias ip 'dig +short myip.opendns.com @resolver1.opendns.com'
alias localip 'ipconfig getifaddr en0'
alias wifioff 'networksetup -setairportpower en0 off'
alias wifion 'networksetup -setairportpower en0 on'
## editor
alias vim nvim
alias vi nvim
## downloaders
alias ydlv 'youtube-dl -f bestvideo+bestaudio'
alias ydla 'youtube-dl --extract-audio --audio-format mp3'
## misc
alias h history
alias .. 'cd ..'
alias bubu 'brew upgrade && brew update'
