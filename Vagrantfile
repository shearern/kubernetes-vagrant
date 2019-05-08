# -*- mode: ruby -*-
# vi: set ft=ruby :

# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  # Base config applies to all boxes
  config.vm.box = "ubuntu/bionic64" # Ubuntu 18.04 LTS
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.provision "shell", inline: <<-SHELL
    apt-get install software-properties-common -y
    apt-add-repository ppa:ansible/ansible -y
    apt-get update
    apt-get install git htop tree vim dos2unix ansible -y
    
    dos2unix /vagrant/install-kubernetes.sh
    bash /vagrant/install-kubernetes.sh
  SHELL

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
  end

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1"
  end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2"
  end

  config.vm.define "node3" do |node3|
    node3.vm.hostname = "node3"
  end


  # config.vm.define "workstation" do |workstation|
  #   workstation.vm.hostname = "workstation"
  #   workstation.vm.network "private_network", ip: "10.50.0.10"
  # end

  # config.vm.define "admin" do |admin|
  #   admin.vm.hostname = "admin"
  #   admin.vm.network "private_network", ip: "10.50.0.11"
  # end

  # config.vm.define "monitor" do |monitor|
  #   monitor.vm.hostname = "monitor"
  #   monitor.vm.network "private_network", ip: "10.50.0.12"
  #   monitor.vm.network "forwarded_port", guest: 80, host: 8000
  # end

  # config.vm.define "source" do |source|
  #   source.vm.hostname = "source"
  #   source.vm.network "private_network", ip: "10.50.0.13"
  #   source.vm.network "forwarded_port", guest: 8003, host: 8003
  #   source.vm.provider "virtualbox" do |vb|
  #     vb.memory = "4098"
  #   end
  # end

  # config.vm.define "media" do |media|
  #   media.vm.hostname = "media"
  #   media.vm.network "private_network", ip: "10.50.0.14"
  #   media.vm.network "forwarded_port", guest: 80, host: 8005
  # end

  # config.vm.define "iandi" do |iandi|
  #   iandi.vm.hostname = "iandi"
  #   iandi.vm.network "private_network", ip: "10.50.0.15"
  #   iandi.vm.network "forwarded_port", guest: 80, host: 8004
  # end

  # config.vm.define "backup" do |backup|
  #   backup.vm.hostname = "backup"
  #   backup.vm.network "private_network", ip: "10.50.0.16"
  # end

end

