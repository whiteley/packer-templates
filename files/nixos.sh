#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

drive="/dev/sda"
partn="${drive}2"

parted -s ${drive} "mklabel gpt"
parted -s ${drive} "mkpart primary ext2 1 2"
parted -s ${drive} "set 1 bios_grub on"
parted -s ${drive} "mkpart primary ext4 2 100%"
mkfs.ext4 -L nixos ${partn}
mount ${partn} /mnt
nixos-generate-config --root /mnt
mv /tmp/configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install
