#!/bin/bash -ex
REPO="derailed/k9s"
source python3 - <<END
#!python3
import json
import requests
import os
a = requests.get("https://api.github.com/repos/${REPO}/releases").json()
for asset in a[0]['assets']:
    if "Linux_arm64.tar.gz" in asset['name']:
    os.putenv("RELEASE_TAG", asset['name'])
END
echo $RELEASE_TAG
exit
RELEASE_TAG=$(${RELEASE} | jq -r '.[0].tag_name')
RELEASE_ASSET=$(${RELEASE} | jq -r '.[0].tag_name')
OUT=$HOME/bin/k9s
curl -L "https://github.com/docker/compose/releases/download/${RELEASE}/${BIN}" -o $OUT
sudo chmod +x $OUT
