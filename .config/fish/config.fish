if status is-interactive
    # Commands to run in interactive sessions can go here
end

# enable starship prompt
starship init fish | source

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# completions
if test -d (brew --prefix)"/share/fish/completions"
	set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if test -d (brew --prefix)"/share/fish/vendor_completions.d"
	set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# exports
set TERM xterm-256color
set EDITOR nvim
set VISUAL code
set LANG en_US.UTF-8
set LC_CTYPE en_US.UTF-8
set LC_ALL en_US.UTF-8
set DOCKER_DEFAULT_PLATFORM linux/amd64
set WGETRC $HOME/.config/wget/wgetrc
set CURL_HOME $HOME/.config/curl
set DOCKER_BUILDKIT 0
set COMPOSE_DOCKER_CLI_BUILD 0
set GOPATH $HOME/go
set GOBIN $HOME/go/bin

# unset
set -e AWS_PROFILE
kubectx -u

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias g="git"
alias gs="git status -s"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias wifioff="networksetup -setairportpower en0 off"
alias wifion="networksetup -setairportpower en0 on"
alias vim="nvim"
alias vi="nvim"
alias ydlv="youtube-dl -f bestvideo+bestaudio"
alias ydla="youtube-dl --extract-audio --audio-format mp3"
alias tgd="find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;"
