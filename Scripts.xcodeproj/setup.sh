#!/bin/zsh

cd ~

set -k

#Install ohMyZsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#ZshSyntaxHighlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#ZshAutosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#find zsh plugins and add them
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

#Install brew software
brew install bash
brew install p7zip
brew install timewarrior
brew install grep
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
brew install nano
brew install perl
brew install rsync

#add aliases file
curl -fsSLo .aliases "https://onedrive.live.com/download?cid=665820FEEDB3632B&resid=665820FEEDB3632B%2148884&authkey=AMkgeDuDRKMdqXw"

#add aliases in zshrc
sed -i '' -e '/source $ZSH\/oh-my-zsh.sh/i\'$'\n''source $HOME\/.aliases' .zshrc

#restart shell
exec $SHELL