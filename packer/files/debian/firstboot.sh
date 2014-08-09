#!/bin/sh - 

# updates the box for the very first boot
# may be deleted, but is kept here for reference

set -o nounset

apt-get update > /dev/null && apt-get -y dist-upgrade && aptitude forget-new

update-rc.d ssh enable 
service ssh start
