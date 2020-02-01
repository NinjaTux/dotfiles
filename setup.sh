#!/bin/bash
set -e

DOTFILES_ROOT=$(pwd)

echo -e "[-] sys"
xcode-select --install
pip install --upgrade pip
pip3 install --upgrade pip

echo -e "[-] brew"
RUBY=`which ruby`
$RUBY -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install bundle
ln -s $DOTFILES_ROOT/Brewfile ~/.Brewfile
brew bundle --global

echo -e "[-] prompt"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ln -s $DOTFILES_ROOT/.zshrc ~/.zshrc

echo -e "[-] git config"
ln -s $DOTFILES_ROOT/.gitconfig ~/.gitconfig

echo -e "[-] nvim"
mkdir -p ~/.config
ln -s $DOTFILES_ROOT/nvim ~/.config/nvim

echo -e "[-] misc stuff"
ln -s $DOTFILES_ROOT/.curlrc ~/.curlrc
ln -s $DOTFILES_ROOT/.screenrc ~/.screenrc
ln -s $DOTFILES_ROOT/.wgetrc ~/.wgetrc