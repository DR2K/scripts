#!/bin/zsh

cd ~

set -k

#Xcode command line tools
xcode-select --install

#Pause b/c xcode lets things run
/bin/bash read -n 1 -s -r -p "Press any key to continue AFTER xcode installs"

#Set up Repos
mkdir ~/Projects/
cd ~/Projects/
git clone https://github.com/DR2K/dotfiles.git
git clone https://github.com/DR2K/scripts.git
cd ~/

for i in ~/Projects/dotfiles/.*
do
ln -s "$i" "${i##*/}"
done

rm ~/.git

#Install ohMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ZshSyntaxHighlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#ZshAutosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#find zsh plugins in .zshrc and add them
#wowbutagain=$(grep -n "plugins=" .zshrc | cut -d : -f 2 | sed '1d')
#sed -i '' -e "s/$wowbutagain/plugins=(zsh-syntax-highlighting zsh-autosuggestions)/" .zshrc

#FuzzyFinder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#P10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

#find zsh theme and change to p10k
#wow=$(grep -n 'ZSH_THEME="' .zshrc | cut -d : -f 2);
#sed -i '' -e "s#$wow#ZSH_THEME=\"powerlevel10k/powerlevel10k\"#" .zshrc

#brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#Install Color LS
sudo gem install colorls

#Install brew software
cd ~/Projects/dotfiles
brew bundle

#reset Zsh
mv .zshrc.pre-oh-my-zsh .zshrc

#install fonts
p10k configure
