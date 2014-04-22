# install prerequisites for building the virtualbox kernel module
apt-get -y install linux-headers-$(uname -r) build-essential
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
apt-get -y remove linux-headers-$(uname -r) build-essential


# workaround for virtualbox 4.3.10, 
# see https://github.com/mitchellh/vagrant/issues/3341#issuecomment-39068048 
# and https://www.virtualbox.org/ticket/12879
ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
