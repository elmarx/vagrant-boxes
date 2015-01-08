#!/bin/bash - 
set -o nounset
set -o errexit

VBOX_ISO=/home/vagrant/VBoxGuestAdditions.iso

mount -o loop $VBOX_ISO /mnt
sh /mnt/VBoxLinuxAdditions.run || true
umount /mnt

rm $VBOX_ISO
