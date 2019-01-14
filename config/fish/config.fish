#!/bin/fish

## env vars
set -gx EDITOR vim

## paths
set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths
set -g fish_user_paths /Users/ninjatux/bin/arachni/bin $fish_user_paths
set -g fish_user_paths /Users/ninjatux/bin $fish_user_paths

## navigation
alias d "cd ~/Dropbox"
alias dl "cd ~/Downloads"
alias dk "cd ~/Desktop"

## apps
alias ctop "docker run -ti -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"

## vim
alias v "nvim"
alias vim "nvim"
alias nvim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vimrc "nvim ~/.config/nvim/init.vim"

## networking
alias httpdump "sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias wifiscan "sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport -s"

## git
alias g "git"
alias ga "git add"
alias gs "git status -s"
alias gm "git commit -m"
alias gp "git push"

## misc shell
alias h "history"
alias j "jobs"
alias l "ls -la"
alias c "pygmentize -g"

## misc
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/sqlite/lib"
set -gx CPPFLAGS "-I/usr/local/opt/sqlite/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/sqlite/lib/pkgconfig"

## go
set -gx GOPATH "/Users/ninjatux/workspace/secrethub/go"
set -gx GOROOT "/usr/local/opt/go/libexec"
set -gx GOBIN "/Users/ninjatux/workspace/secrethub/go/bin"
set -g fish_user_paths $GOBIN $fish_user_paths
# alias sdev "env SECRET_API_REMOTE=http://localhost:8080 $GOPATH/bin/secrethub"

