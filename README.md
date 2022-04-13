# Valerio's dotfiles

A lot of this is copy-pasted from different sources, some of them are:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/jwoudenberg/old-dotfiles/
- https://wiki.archlinux.org/index.php/Bash/Functions
- https://github.com/candreslobor/dotfiles

## Install


1. install [brew](https://brew.sh)
2. `git clone --bare https://github.com/ninjatux/dotfiles.git $HOME/.dotfiles`
3. `curl https://raw.githubusercontent.com/ninjatux/dotfiles/master/.config/brew/Brewfile --output /tmp/Brewfile`
4. `brew bundle --file=/tmp/Brewfile`
5. `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
6. `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
7. `dotfiles checkout`
8. `dotfiles submodule update --init --recursive`
9. `nvim +'PlugInstall' +qa --headless`

## Usage

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```
