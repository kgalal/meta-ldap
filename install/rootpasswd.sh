#!/usr/bin/env bash
# Bootstrap Puppet on RHEL based servers
# Tested on CentOS 7.2 64bit
# Tested on SL6.1 64bit 

# set -x

# Updating hosts file
/bin/echo "Updating /etc/hosts file"
cat /vagrant/install/hosts >> /etc/hosts


# Updating root password
/bin/echo "Updating ROOT PASSWORD"
/usr/bin/passwd << EOF
localadmin
localadmin
EOF
