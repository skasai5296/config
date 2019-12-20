#!/bin/bash

git submodule update --init

# this file creates symbolic links for dotfiles.

DOT_FILES=(.vim .vimrc .tmux.conf .tmux.reset.conf .bash_it .bashrc .bash_profile .ssh .inputrc)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      unlink $HOME/$file
      ln -s $HOME/dotfiles/$file $HOME/$file
      echo "symbolic link existed, replaced link: $file"
    else
      ln -s $HOME/dotfiles/$file $HOME/$file.dot
      echo "real file exists, created .dot link: $file"
    fi
  else
   ln -s $HOME/dotfiles/$file $HOME/$file
   echo "made symbolic link: $file"
  fi
done

