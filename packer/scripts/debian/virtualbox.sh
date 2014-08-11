#!/bin/sh
set -o nounset
set -o errexit

# install prerequisites for building the virtualbox kernel module
apt-get -qq -y install linux-headers-$(uname -r) build-essential
#apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
#apt-get -y install unzip

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat .vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
lsmod loop || modprobe loop
mount -o loop $VBOX_ISO /mnt

# VBoxLinuxAdditions returns 1, as it could not install XFree86
sh /mnt/VBoxLinuxAdditions.run || true

umount /mnt

# cleanup
rm $VBOX_ISO
apt-get -qq -y remove linux-headers-$(uname -r) build-essential
apt-get -qq -y autoremove
