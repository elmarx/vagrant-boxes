# generic script to install puppet repositories on systems with dpkg
wget http://apt.puppetlabs.com/$DEB \
    -O /tmp/$DEB -q

dpkg -i /tmp/$DEB
rm /tmp/$DEB
apt-get update

# Install puppet/facter
apt-get install -y puppet facter
