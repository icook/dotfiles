#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -fs $DIR/vimrc ~/.vimrc
ln -fs $DIR/nvimrc ~/.nvimrc
ln -fs $DIR/gitconfig ~/.gitconfig
ln -fs $DIR/zshrc ~/.zshrc
ln -fs $DIR/mrconfig ~/.mrconfig
