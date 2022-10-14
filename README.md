# Valerio's dotfiles

#### Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone --bare https://github.com/ninjatux/dotfiles.git $HOME/.dotfiles
curl https://raw.githubusercontent.com/ninjatux/dotfiles/master/.config/brew/Brewfile --output /tmp/Brewfile
brew bundle --file=/tmp/Brewfile
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
nvim +'PlugInstall' +qa --headless
```

#### Usage

```
dotfiles status
dotfiles add /path/to/change
dotfiles commit -m "commit msg"
dotfiles push
```
