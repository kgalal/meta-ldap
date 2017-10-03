#!/bin/bash
# 
# Author: Kareem Galal
# Date:   2017-09-21
# Purpose:  Install and configure a basic OpenLDAP server using olc configurations
#	
source /vagrant/install/install-functions.sh

# only run if root 
checkroot

echo -e "setting up backend2 openldap olc Linux server\n"
setup_backend_olc 2
   
