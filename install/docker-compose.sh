#!/bin/bash -ex
RELEASE=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
BIN="docker-compose-$(uname -s)-$(uname -m)"
OUT=$HOME/bin/docker-compose
curl -L "https://github.com/docker/compose/releases/download/${RELEASE}/${BIN}" -o $OUT
sudo chmod +x $OUT
