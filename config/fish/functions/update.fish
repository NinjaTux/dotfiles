function update --description "update system"
  set prefix (set_color --bold cyan) "[" (set_color white) "#" (set_color --bold cyan) "]" " " (set_color --bold white)
  ## OS update
  echo ""
  echo -s $prefix 'os' (set_color normal)
  echo ""
  sudo softwareupdate -i -a
  echo ""
  echo -s $prefix 'brew' (set_color normal)
  echo ""
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup
  echo ""
  echo -s $prefix 'npm' (set_color normal)
  echo ""
  npm install npm -g
  npm update -g
end