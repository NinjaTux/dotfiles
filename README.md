# Valerio's dotfiles

A lot of this is copy-pasted from different sources, some of them are:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/jwoudenberg/old-dotfiles/
- https://wiki.archlinux.org/index.php/Bash/Functions

## Install

1. install [brew](https://brew.sh)
2. `git clone --bare https://github.com/ninjatux/dotfiles.git $HOME/.dotfiles`
3. `curl https://raw.githubusercontent.com/ninjatux/dotfiles/master/.config/brew/Brewfile --output /tmp/Brewfile`
4. `brew bundle --file=/tmp/Brewfile`
5. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
6. `dotfiles checkout`
7. `dotfiles submodule update --init --recursive`
8. `nvim +'PlugInstall' +qa --headless`