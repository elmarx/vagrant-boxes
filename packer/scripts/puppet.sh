# Prepare puppetlabs repo
DEB=puppetlabs-release-wheezy.deb

cd /tmp
wget http://apt.puppetlabs.com/$DEB \
    -O /tmp -q

dpkg -i /tmp/$DEB
rm /tmp/$DEB
apt-get update

# Install puppet/facter
apt-get install -y puppet facter
