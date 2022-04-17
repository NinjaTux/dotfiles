# Valerio's dotfiles

A lot of this is copy-pasted from different sources, some of them are:

- https://github.com/jwoudenberg/old-dotfiles/
- https://wiki.archlinux.org/index.php/Bash/Functions
- https://github.com/candreslobor/dotfiles

#### Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --bare https://github.com/ninjatux/dotfiles.git $HOME/.dotfiles
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl https://raw.githubusercontent.com/ninjatux/dotfiles/master/.config/brew/Brewfile --output /tmp/Brewfile
brew bundle --file=/tmp/Brewfile
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
nvim +'PlugInstall' +qa --headless
```

#### Usage

```
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "Add zshrc"
dotfiles push
```
