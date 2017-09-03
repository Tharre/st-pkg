#!/bin/sh -e

pacman -Syu
sed -i '/\$E_USER_ABORT/d' /usr/bin/makepkg

cd /build
makepkg -s --noconfirm
