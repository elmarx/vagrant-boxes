#!/bin/sh -
set -o nounset
set -o errexit

case $VERSION in 
    wheezy64)
        DEB=puppetlabs-release-wheezy.deb
        ;;
    jessie)
        DEB=puppetlabs-release-jessie.deb
        ;;
    *)
        exit 1
        ;;
esac

wget http://apt.puppetlabs.com/$DEB -O /tmp/$DEB -q

dpkg -i /tmp/$DEB
rm /tmp/$DEB
apt-get update

# Install puppet/facter
apt-get install -y puppet facter
