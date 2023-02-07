#!/bin/sh

cd ~

set -k

#Xcode command line tools
xcode-select --install

#Pause b/c xcode lets things run
read -n 1 -s -r -p 'Press any key to continue after xcode cli installs'
printf '\n'

#brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Set up Repos
mkdir $HOME/Projects/
cd $HOME/Projects/
git clone https://github.com/DR2K/dotfiles.git
cd ~/

for i in ~/Projects/dotfiles/.*
do
  if [ $i != ".git" || $i != ".luarc.json" || $i != ".gitmodules" || $i != ".cronScripts"] then
    ln -s "$i" "${i##*/}"
  fi
done



#Install brew software
cd $HOME/Projects/dotfiles
brew bundle

#install fonts
curl -fsSLo "$HOME/Library/Fonts/MesloLGS NF Regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
curl -fsSLo "$HOME/Library/Fonts/MesloLGS NF Bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
curl -fsSLo "$HOME/Library/Fonts/MesloLGS NF Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
curl -fsSLo "$HOME/Library/Fonts/MesloLGS NF Bold Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
