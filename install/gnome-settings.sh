#!/bin/bash -ex
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
gsettings set org.gnome.desktop.interface clock-show-seconds true

echo "Installing dash-to-panel"
git clone https://github.com/home-sweet-gnome/dash-to-panel.git tmp
cd tmp
make install
cd ..
rm -rf tmp

dconf write /org/gnome/shell/extensions/dash-to-panel/show-window-previews false

# gnome-shell --replace
# gnome-shell-extension-tool -e dash-to-panel
