#!/bin/bash
# 
# Author: Kareem Galal
# Date:   2017-09-21
# Purpose:  Install and configure a basic OpenLDAP server using olc configurations
#	
## ===== functions

# install OpenLDAP
install_OpenLDAP() {
    yum install -y openldap-servers openldap-clients
    [ ! -e /var/lib/ldap/DB_CONFIG ] && cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG 
    chown -R ldap. /var/lib/ldap
    systemctl start slapd
    systemctl enable slapd
    systemctl status slapd
} 

# add required LDAP schemas
add_ldapSchemas() {
    ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
    ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
    ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
}

setup_backend_olc() {

    # install OpenLDAP
    echo -e "\n==> Installing OpenLDAP"
    install_OpenLDAP 
    
    # set olcRootPW
    echo -e "\n==> updating LDAP root password"
    ldapadd -Y EXTERNAL -H ldapi:/// -f /vagrant/include/chrootpw.ldif 
 
    # add LDAP schemas
    echo -e "\n==> add required schemas"
    add_ldapSchemas 

    # create LDAP domain
    echo -e "\n==> create LDAP domain"
    ldapmodify -Y EXTERNAL -H ldapi:/// -f /vagrant/include/createdomain$1.ldif 

    # update LDAP domain
    echo -e "\n==> update created LDAP domain"
    ldapadd -x -D "cn=Manager,dc=backend$1,dc=example" -w ldap1234 -f /vagrant/include/updatedomain$1.ldif 

    # add LDAP users
    echo -e "\n==> add posix-compliant user to LDAP backend"
    ldapadd -x -D "cn=Manager,dc=backend$1,dc=example" -w ldap1234 -f /vagrant/include/posix-user-b${1}u1.ldif
}

checkroot() {
    if [ `id -u` -ne 0 ] ; then 
       echo "This script can only be run by root"
       exit 1
    fi
}

