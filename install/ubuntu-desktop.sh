#!/bin/bash -ex
sudo apt-get install \
  vlc \
  gparted \
  qbittorrent \
  gnome-tweak-tool \    # General customization of gnome
  chrome-gnome-shell \  # For install Gnome shell extensions from chrome/firefox
  wireshark \
  aptitude \
  gnome-calculator -y
sudo apt-get remove transmission-gtk -y

# The snap based calculator has a 2 sec startup delay, get rid of it.
sudo snap remove gnome-calculator
