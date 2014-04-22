# Set up Vagrant.

date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

# Install vagrant keys
mkdir -p /home/vagrant/.ssh
wget --no-check-certificate \
        'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
        -O /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/.ssh

# Install NFS client
apt-get -y install nfs-common


# disable password for user vagrant
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# performance tweaks

# speed up ssh login by disabling reverse-dns lookup
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout
sed -i s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/ /etc/default/grub
update-grub

# remove unused packages, clean apt-cache
apt-get -y autoremove
apt-get -y clean

# Removing leftover leases and persistent rules
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules
