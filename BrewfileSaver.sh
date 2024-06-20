#!/usr/bin/env sh
export LOC="/Users/dev/Projects/dotfiles"
/bin/rm $LOC/Brewfile
/opt/homebrew/bin/brew bundle --verbose --describe --force --file $LOC/Brewfile dump
/usr/bin/git -C $LOC add Brewfile
/usr/bin/git -C $LOC commit -m 'update Brewfile'
/usr/bin/git -C $LOC push
