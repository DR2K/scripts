#!/bin/zsh

cd ~

set -k

#Install ohMyZsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#ZshSyntaxHighlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#ZshAutosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#find zsh plugins in .zshrc and add them
wowbutagain=$(grep -n "plugins=" .zshrc | cut -d : -f 2 | sed '1d')
sed -i '' -e "s/$wowbutagain/plugins=(zsh-syntax-highlighting zsh-autosuggestions)/" .zshrc

#FuzzyFinder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#P10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

#find zsh theme and change to p10k
wow=$(grep -n 'ZSH_THEME="' .zshrc | cut -d : -f 2);
sed -i '' -e "s#$wow#ZSH_THEME=\"powerlevel10k/powerlevel10k\"#" .zshrc

#brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#Install Color LS
gem install colorls

#Set up dotfile Repo
mkdir ~/Projects/dotfiles
cd ~/Projects/dotfiles
git clone git@github.com:DR2K/dotfiles.git
ln -s .* ~/
rm -r ~/.git
ln -s Brewfile
#Install brew software
brew bundle

#restart shell
exec $SHELL
