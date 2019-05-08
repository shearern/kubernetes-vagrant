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

    apt-get install software-properties-common apt-transport-https -y
    apt-get update

    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
    apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

    apt-get install python python-jinja2 -y

    apt-get install git htop tree vim dos2unix -y
    
    dos2unix /vagrant/*.sh
    dos2unix /vagrant/*.py

    /vagrant/redner.py hosts.tpl /etc/hosts
    
    bash /vagrant/install-kubernetes.sh
  SHELL

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.99.0.10"
  end

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "10.99.0.11"
  end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2"
    node2.vm.network "private_network", ip: "10.99.0.12"
  end

  config.vm.define "node3" do |node3|
    node3.vm.hostname = "node3"
    node3.vm.network "private_network", ip: "10.99.0.13"
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

