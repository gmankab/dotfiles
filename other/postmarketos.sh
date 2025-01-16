#!/usr/bin/env bash

sudo apk remove gnome-maps gnome-calendar gnome-clocks gnome-console gnome-text-editor gnome-weather decibels loupe papers postmarketos-welcome
sudo apk upgrade
sudo apk add tmux fish git podman distrobox curl flatpak gnome-software-plugin-flatpak ffmpegthumbnailer
git clone https://github.com/gmankab/dotfiles ~/proj/dotfiles

# dotfiles
for dir_path in ~/proj/dotfiles/homedir/.config/*; do
    dir_name=$(basename $dir_path)
    dir_conf=~/.config/$dir_name
    if [ -d $dir_conf ]; then
        gio trash $dir_conf
    cp -r $dir_path $dir_conf
done

# podman
if [ -d ~/.local/share/containers ]; then
    sudo gio trash ~/.local/share/containers
if [ -d /var/lib/containers ]; then
    sudo gio trash /var/lib/containers
sudo rc-update add cgroups
sudo touch /etc/subuid
sudo touch /etc/subgid
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $(whoami)

# flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak install flathub org.telegram.desktop
flatpak install fedora  org.gnome.Ptyxis

