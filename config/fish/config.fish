#!/bin/fish

## navigation
alias d "cd ~/Dropbox"
alias dl "cd ~/Downloads"
alias dk "cd ~/Desktop"
alias w "cd ~/workspace"

## vim
alias v "nvim"
alias vim "nvim"
alias nvim "env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vimrc "nvim ~/.config/nvim/init.vim"
alias httpdump "sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
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
