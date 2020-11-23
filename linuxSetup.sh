#!/bin/sh

#  linuxSetup.sh
#  Scripts
#
#  Created by Devdeep Singh Rajpal on 8/14/20.

if [! -d "/usr/bin/zsh"]
do
    read -n 1 -s -r -p "Intall zsh \n Press any key to continue"
    exit 0
done

cd ~

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

#Install Color LS
gem install colorls

#add aliases file
curl -fsSLo .aliases "https://onedrive.live.com/download?cid=665820FEEDB3632B&resid=665820FEEDB3632B%2148884&authkey=AMkgeDuDRKMdqXw"

#add aliases in zshrc
sed -i '' -e '/source $ZSH\/oh-my-zsh.sh/i\'$'\n''source $HOME\/.aliases' .zshrc

#Install Fonts
curl -fsSLo "/usr/share/fonts/truetype/MesloLGS NF Regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
curl -fsSLo "/usr/share/fonts/truetype/MesloLGS NF Bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
curl -fsSLo "/usr/share/fonts/truetype/MesloLGS NF Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
curl -fsSLo "/usr/share/fonts/truetype/MesloLGS NF Bold Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

read -n 1 -s -r -p "Set the font as default \n Guide: https://github.com/romkatv/powerlevel10k#manual-font-installation \n Press any key to continue"

#restart shell
exec $SHELL
