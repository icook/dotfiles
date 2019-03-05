#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -fs $DIR/vimrc ~/.vimrc
mkdir ~/.config/nvim/
ln -fs $DIR/nvimrc ~/.config/nvim/init.vim
ln -fs $DIR/gitconfig ~/.gitconfig
ln -fs $DIR/zshrc ~/.zshrc
ln -fs $DIR/gitignore_global ~/.gitignore_global
ln -fs $DIR/.Xmodmap ~/.Xmodmap
ln -fs $DIR/bin/* ~/bin/
