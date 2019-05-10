# -*- mode: ruby -*-
# vi: set ft=ruby :

# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end

  # Base config applies to all boxes
  config.vm.box = "ubuntu/bionic64" # Ubuntu 18.04 LTS
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.provision "shell", inline: <<-SHELL

    apt-get install software-properties-common apt-transport-https ca-certificates curl -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

    apt-get update

    apt-get install git htop tree vim dos2unix curl -y
    apt-get install python python-jinja2 -y
    
    dos2unix /vagrant/*.sh
    dos2unix /vagrant/*.py

    /vagrant/render.py hosts.tpl /etc/hosts
    
    echo ". /vagrant/swarm-bashrc.sh" >> /home/vagrant/.bashrc

    bash /vagrant/install-swarm.sh
  SHELL

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.99.0.10"
    master.vm.network "forwarded_port", guest: 80, host: 80
  end

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "10.99.0.11"
  end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2"
    node2.vm.network "private_network", ip: "10.99.0.12"
  end

  # config.vm.define "node3" do |node3|
  #   node3.vm.hostname = "node3"
  #   node3.vm.network "private_network", ip: "10.99.0.13"
  # end

end

