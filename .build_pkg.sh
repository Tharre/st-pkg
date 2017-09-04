#!/bin/sh -e

echo "Server = http://mirror.th73.ovh/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Syu
sed -i '/\$E_USER_ABORT/d' /usr/bin/makepkg

mkdir -p ~/.gnupg
cat << EOF > ~/.gnupg/gpg.conf
keyserver-options auto-key-retrieve
keyserver hkp://ipv4.pool.sks-keyservers.net
EOF

cd /build
export FORCE_UNSAFE_CONFIGURE=1
makepkg -s --noconfirm
