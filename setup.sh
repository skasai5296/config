#!/bin/bash

# this file creates symbolic links for dotfiles.

DOT_FILES=(.vim .vimrc .tmux.conf .tmux.reset.conf .bashrc .bash_profile .ssh)

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        ln -s $HOME/dotfiles/$file $HOME/$file.dot
        echo "file exists, created .dot file: $file"
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo "made symbolic link: $file"
    fi
done
