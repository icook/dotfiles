#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -rfs $DIR/vimrc ~/.vimrc
ln -rfs $DIR/gitconfig ~/.gitconfig
ln -rfs $DIR/zshrc ~/.zshrc
