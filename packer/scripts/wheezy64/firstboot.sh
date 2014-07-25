#!/bin/sh - 

set -o nounset
set -o errexit

# execute firstboot.sh script to update box on very first boot
sed -i s#"^exit 0$"#"test ! -f /var/cache/apt/pkgcache.bin \&\& sh /usr/local/sbin/firstboot.sh\n\nexit 0"# /etc/rc.local

# DELAYLOGIN=yes in rcS does not work as expected
# but we want to disable ssh login while firstboot.sh runs,
# so disable ssh
update-rc.d ssh disable

mv /tmp/firstboot.sh /usr/local/sbin/firstboot.sh
chmod 755 $_
chown root:root $_
