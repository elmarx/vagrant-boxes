#!/bin/sh - 
set -o nounset
set -o errexit

case "$VERSION" in
    wheezy64)
        PLIST="
            gcc-4.7 
            gcc-4.6 
            python2.6 
            python2.6-minimal 
            cpp-4.7 
            nano 
            w3m 
            xauth 
            eject 
            dpkg-dev 
            libc6-dev 
            discover 
            db5.1-util 
            debian-faq 
            doc-debian 
            info 
            install-info 
            debconf-i18n 
            krb5-locales 
            geoip-database 
            ntp 
        "
        ;;
    jessie)
        PLIST="
            gcc-4.7 
            gcc-4.6 
            python2.6 
            python2.6-minimal 
            cpp-4.7 
            nano 
            w3m 
            xauth 
            eject 
            dpkg-dev 
            libc6-dev 
            discover 
            db5.1-util 
            debian-faq 
            doc-debian 
            info 
            install-info 
            debconf-i18n 
            krb5-locales 
            geoip-database 
            ntp 
        "
        ;;
    *)
        exit 1
        ;;
esac
# remove packages according to https://wiki.debian.org/ReduceDebian
aptitude -y purge $PLIST

# clean up pending packages: TODO: combine this with previous command!?
aptitude install -f -y

# remove apt indices, restored at first boot
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/apt/*

# remove documentation
rm -rf /usr/share/locale/*
rm -rf /usr/share/doc/*
