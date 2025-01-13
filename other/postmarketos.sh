#!/usr/bin/env bash

sudo apk add fish git podman distrobox
git clone https://github.com/gmankab/dotfiles ~/proj/dotfiles

# dotfiles
for dir_path in ~/proj/dotfiles/homedir/.config/*; do
    dir_name=$(basename $dir_path)
    gio trash ~/.config/$dir_name
    ln -s $dir_path ~/.config/$dir_name
done

# podman
sudo rc-update add cgroups
sudo gio trash ~/.local/share/containers/storage
sudo touch /etc/subuid
sudo touch /etc/subgid
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $(whoami)

