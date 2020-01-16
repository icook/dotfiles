#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir ~/.config/terminator/
ln -fs $DIR/home/.config/terminator/config ~/.config/terminator/config

mkdir ~/.config/nvim/
ln -fs $DIR/nvimrc ~/.config/nvim/init.vim

ln -fs $DIR/home/.gitconfig ~/.gitconfig
ln -fs $DIR/home/.zshrc ~/.zshrc
ln -fs $DIR/home/.pylintrc ~/.pylintrc
ln -fs $DIR/home/.gitignore_global ~/.gitignore_global
ln -fs $DIR/home/.ignore ~/.ignore

ln -fs $DIR/bin/* ~/bin/
