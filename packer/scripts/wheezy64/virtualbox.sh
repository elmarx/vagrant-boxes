# install prerequisites for building the virtualbox kernel module
apt-get -qq -y install linux-headers-$(uname -r) build-essential
#apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
#apt-get -y install unzip

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat .vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop $VBOX_ISO /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

# cleanup
rm $VBOX_ISO
apt-get -qq -y remove linux-headers-$(uname -r) build-essential
