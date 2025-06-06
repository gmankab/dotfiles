#!/usr/bin/env bash

# packages
sudo apk del gnome-maps gnome-calendar gnome-clocks gnome-text-editor gnome-weather decibels loupe papers postmarketos-welcome
sudo apk upgrade
sudo apk add tmux fish git podman distrobox curl flatpak gnome-software-plugin-flatpak ffmpegthumbnailer

# gnome
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'ru+rulemak'), ('xkb', 'us+colemak')]"

# dotfiles
git clone https://github.com/gmankab/dotfiles ~/proj/dotfiles
chsh -s /usr/bin/fish
for dir_path in ~/proj/dotfiles/homedir/.config/*; do
    dir_name=$(basename $dir_path)
    dir_conf=~/.config/$dir_name
    if [ -d $dir_conf ]; then
        gio trash $dir_conf
    fi
    cp -r $dir_path $dir_conf
done
for dir_path in ~/proj/dotfiles/homedir/.local/share/*; do
    dir_name=$(basename $dir_path)
    dir_share=~/.local/share/$dir_name
    if [ -d $dir_conf ]; then
        gio trash $dir_share
    fi
    cp -r $dir_path $dir_share
done

# podman
if [ -d ~/.local/share/containers ]; then
    gio trash ~/.local/share/containers
fi
if [ -d /var/lib/containers ]; then
    sudo rm -rf /var/lib/containers
fi
sudo rc-update add cgroups
sudo touch /etc/subuid
sudo touch /etc/subgid
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $(whoami)

# flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak install flathub org.telegram.desktop
flatpak install fedora  org.gnome.Ptyxis

