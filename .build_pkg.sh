#!/bin/sh -e

pacman -Sy
sed -i '/\$E_USER_ABORT/d' /usr/bin/makepkg

cd /mnt
makepkg -s --noconfirm
