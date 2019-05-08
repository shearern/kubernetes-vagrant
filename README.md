Docker Orchastration
====================



Building the Base Vagrant Box (research)
----------------------------------------

Init base box

	cd swarm-basebox
	vagrant init ubuntu/bionic64

Or, update the box

	vagrant box update

Run configurations

	vagrant up
	vagrant ssh
	apt install dos2unix -y
	dos2unix /vagrant/configure-basebox.sh
	/vagrant/configure-basebox.sh

Note, will clean the VM to shrink size using: 

	sudo apt-get clean
	sudo dd if=/dev/zero of=/EMPTY bs=1M
	sudo rm -f /EMPTY

Package new basebox

	vagrant package --output mynew.box

Register basebox

	vagrant box add mynewbox mynew.box
	vagrant destroy