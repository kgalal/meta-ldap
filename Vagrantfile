# -*- mode: ruby -*-
# vi: set ft=ruby :

# configure the VMs
Vagrant.configure(2) do |config|
 
  # start test VM
  # end puppetclient02 VM

  # this is a puppet client VM
  config.vm.define "ldap1" do |ldap1|
    ldap1.vm.box = "centos/7"
    ldap1.vm.box_version = "1706.02"
    ldap1.vm.hostname = "ldap1.example.com"
    ldap1.vm.network "private_network", ip: "192.168.56.134" # host-only adapter
    ldap1.vm.provision "shell", path: "install/rootpasswd.sh"
    ldap1.vm.provision "shell", path: "install/install-ldap1.sh"

  end

  # this is a puppet client VM
  config.vm.define "ldap2" do |ldap2|
    ldap2.vm.box = "centos/7"
    ldap2.vm.box_version = "1706.02"
    ldap2.vm.hostname = "ldap2.example.com"
    ldap2.vm.network "private_network", ip: "192.168.56.135" # host-only adapter
    ldap2.vm.provision "shell", path: "install/rootpasswd.sh"
    ldap2.vm.provision "shell", path: "install/install-ldap2.sh"

  end

  # this is a puppet client VM
  config.vm.define "ldapmeta" do |ldapmeta|
    # ldapmeta.vm.box = "kgalal/localtest"
    ldapmeta.vm.box = "centos/7"
    ldapmeta.vm.box_version = "1706.02"
    ldapmeta.vm.hostname = "ldapmeta.example.com"
    ldapmeta.vm.network "private_network", ip: "192.168.56.136" # host-only adapter
    ldapmeta.vm.provision "shell", path: "install/rootpasswd.sh"
    ldapmeta.vm.provision "shell", path: "install/install-ldapmeta.sh"

  end

  # this is a puppet client VM
  config.vm.define "ldapclient" do |ldapclient|
    ldapclient.vm.box = "centos/7"
    ldapclient.vm.box_version = "1706.02"
    ldapclient.vm.hostname = "ldapclient.example.com"
    ldapclient.vm.network "private_network", ip: "192.168.56.137" # host-only adapter
    ldapclient.vm.provision "shell", path: "install/rootpasswd.sh"
    ldapclient.vm.provision "shell", path: "install/install-ldapclient.sh"

  end

  # this is a puppet client VM
  ## config.vm.define "windowsad" do |windowsad|
    ## windowsad.vm.box = "kensykora/windows_2012_r2_standard"
    ## windowsad.vm.hostname = "windowsad.example.com"
    ## windowsad.vm.network "private_network", ip: "192.168.56.138" # host-only adapter
    ## windowsad.vm.provision "shell", path: "install/rootpasswd.sh"
    ## windowsad.vm.provision "shell", path: "install/install-vagrant5.sh"

  ## end

end
