#!/bin/bash -ex
OUT=$HOME/bin/nvim
curl -L "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage" -o $OUT
chmod +x $OUT
sudo apt-get install fonts-powerline -y
