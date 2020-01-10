#!/bin/sh 

cd ~
echo "Cloning dotfiles"
git clone https://github.com/Zachd101/dotfiles.git
echo "Linking Files"
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/config.org ~/.emacs.d/config.org
ln -s ~/dotfiles/init.el ~/.emacs.d/init.el 
ln -s ~/dotfiles/.inputrc ~/.inputrc
