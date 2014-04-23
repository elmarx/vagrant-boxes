#!/bin/sh - 

set -o nounset                              # Treat unset variables as an error
set -o errexit


sed -i s#"^exit 0$"#"test -f /var/tmp/firstboot.sh \&\& sh /var/tmp/firstboot.sh \&\n\nexit 0"# /etc/rc.local

cat > /var/tmp/firstboot.sh << EOF
apt-get update > /dev/null
apt-get -y dist-upgrade
aptitude forget-new

rm \$0
EOF


