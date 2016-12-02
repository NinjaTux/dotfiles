#!/bin/bash
set -e
echo ""

DOTFILES_ROOT=$(pwd)

echo -e "[-] setup"

# brew
brewsetup () {
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

# git
gitsetup () {
  echo -e "[----] git"
  ln -s $DOTFILES_ROOT/git/gitconfig ~/.gitconfig
  ln -s $DOTFILES_ROOT/git/gitignore ~/.gitignore
}

# fish
fishsetup () {
  echo -e "[----] fish"
  # config dir
  mkdir -p ~/.config
  # install fisher
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  # functios and aliases
  ln -s $DOTFILES_ROOT/config/fish ~/.config/fish
  # install fisher plugins
  $DOTFILES_ROOT/script/fish.fish
}

# nvim
nvimsetup () {
  echo -e "[----] nvim"
  # config dir
  mkdir -p ~/.config
  # link config
  ln -s $DOTFILES_ROOT/nvim ~/.config/nvim
}

init () {
  gitsetup
  brewsetup
  fishsetup
  nvimsetup
}

init
