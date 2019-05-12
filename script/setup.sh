#!/bin/bash
set -e
echo ""

DOTFILES_ROOT=$(pwd)

echo -e "[-] setup"

# brew
ibrew () {
  echo -e "[----] brew"
  RUBY=`which ruby`
  ## install brew
  $RUBY -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ## install bundle
  brew install bundle
  ## symlink brewfile
  ln -s $DOTFILES_ROOT/Brewfile ~/.Brewfile
  ## install packages
  brew bundle --global
}

# oh-my-zsh
iohmyzsh () {
  echo -e "[----] oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

# git
igit () {
  echo -e "[----] git"
  ln -s $DOTFILES_ROOT/git/gitconfig ~/.gitconfig
  ln -s $DOTFILES_ROOT/git/gitignore ~/.gitignore
}

ipip () {
  # udpate all pip versions
  pip install --upgrade pip
  pip3 install --upgrade pip
}

# nvim
invim () {
  echo -e "[----] nvim"
  # config dir
  mkdir -p ~/.config
  # link config
  ln -s $DOTFILES_ROOT/nvim ~/.config/nvim
}

init () {
  igit
  ibrew
  invim
  ipip
  iohmyzsh
}

init
