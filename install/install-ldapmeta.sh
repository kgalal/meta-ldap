#!/bin/bash
# 
# Author: Kareem Galal
# Date:   2017-09-21
# Purpose:  install and configure OpenLDAP server using meta-backend configurations
#	
## ===== functions

source /vagrant/install/install-functions.sh

# install OpenLDAP
install_OpenLDAP() {
    yum install -y openldap-servers openldap-clients
    [ ! -e /var/lib/ldap/DB_CONFIG ] && cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG 
    mkdir -p /var/lib/ldap/{backend1,backend2}
    chown -R ldap. /var/lib/ldap
    cd /etc/openldap
    mv slapd.d slapd.d.original
} 

setup_backend_slapd() {

    # install OpenLDAP
    echo -e "\n==> Installing OpenLDAP"
    install_OpenLDAP 
    
    # install default slapd.conf
    echo -e "\n==> installing slapd.conf"
    cp /vagrant/include/slapd.conf /etc/openldap
 
    # installing meta-ldap frontend configuration
    echo -e "\n==> adding meta-ldap configuration"
    cp /vagrant/include/slapd-frontend.conf /etc/openldap

    # starting meta-ldap
    echo -e "\n==> starting meta-ldap backend"
    slapd  -f /etc/openldap/slapd.conf -h ldap://192.168.56.136/

}

# only run if root 
checkroot

echo -e "setting up meta-ldap backend server\n"
setup_backend_slapd
   
