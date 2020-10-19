# Valerio's dotfiles

A lot of this is copy-pasted from different sources, some of them are:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/jwoudenberg/old-dotfiles/
- https://wiki.archlinux.org/index.php/Bash/Functions

## Install

1. install [brew](https://brew.sh)
2. `git clone --bare https://github.com/ninjatux/dotfiles.git $HOME/.dotfiles`
3. `brew bundle --file=$HOME/.dotfile/brew/Brewfile`
4. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
5. `dotfiles checkout`