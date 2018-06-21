# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "kiara-dev"
  
  config.vm.box = "debian/stretch64"

  config.vm.provider "virtualbox" do |v|
    v.name = "vagrant kiara-dev"
    v.memory = 4096
    v.cpus = 2
  end
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  
  
  config.vm.synced_folder '../Kiara/', '/usr/src/kiara'
  config.vm.synced_folder '.', '/usr/src/kiara-stack'

  config.vm.provision "shell", privileged: false, inline: <<-SCRIPT
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo curl -L https://raw.githubusercontent.com/docker/compose/1.21.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
	sudo usermod -aG docker vagrant
    SCRIPT


end