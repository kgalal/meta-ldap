#!/bin/bash
# 
# Author: Kareem Galal
# Date:   2017-09-21
# Purpose:  install a CentOS7x server to act as an OpenLDAP client
#	
## ===== functions

source /vagrant/install/install-functions.sh

# only run if root 
checkroot

echo -e "==> setting up openldap client\n"
yum install -y nss-pam-ldapd openldap-clients compat-openldap 
mv /etc/nslcd.conf /etc/nslcd.conf.original
cp /vagrant/include/nslcd.conf /etc/
echo -e "==> setting up ldap authentication \n"
authconfig --enableldap --enableldapauth --enablemd5 --enableshadow --ldapserver 192.168.56.136 --update

echo -e "==> starting nslcd service\n"
systemctl start nslcd
systemctl status nslcd



