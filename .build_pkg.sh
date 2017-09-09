#!/bin/sh -e

useradd -m -s /bin/bash builder
chmod 777 /build
echo "builder ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers
echo 'Server = http://mirror.th73.ovh/$repo/os/$arch' > /etc/pacman.d/mirrorlist

sudo -u builder -s -- <<EOF
sudo pacman -Syu

mkdir -p ~/.gnupg
cat << END > ~/.gnupg/gpg.conf
keyserver-options auto-key-retrieve
keyserver hkp://ipv4.pool.sks-keyservers.net
END

cd /build
makepkg -s --noconfirm
EOF
