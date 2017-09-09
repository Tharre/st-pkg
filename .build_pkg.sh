#!/bin/sh -e

echo "Server = http://mirror.th73.ovh/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
useradd -m -s /bin/bash builder
echo "builder ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

pacman -Syu

mkdir -p ~/.gnupg
cat << EOF > ~/.gnupg/gpg.conf
keyserver-options auto-key-retrieve
keyserver hkp://ipv4.pool.sks-keyservers.net
EOF

cd /build
sudo -u builder makepkg -s --noconfirm
