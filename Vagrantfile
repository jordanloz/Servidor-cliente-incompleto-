# -*- mode: ruby -*-
# vi: set ft=ruby :
#
BOX_BASE = "ubuntu/focal64"
RAM = "512"
CPUS = "1"
SERVER= "server"
CLIENT= "client"
Vagrant.configure("2") do |config|
  config.vm.box = BOX_BASE
  config.vm.define SERVER do |server|
    server.vm.hostname = SERVER
    server.vm.provider :virtualbox do |vb|
        vb.customize [ 'modifyvm', :id, '--memory', RAM ]
        vb.customize [ 'modifyvm', :id, '--cpus', CPUS ]
        
    end
    server.vm.provision "shell", path: "scripts/script-server.sh"
    server.vm.network "private_network", ip: "192.168.56.50"
    server.vm.network "forwarded_port", guest: 6340, host: 6340
  end
   config.vm.define CLIENT do |client|
    client.vm.hostname = CLIENT
    client.vm.provider :virtualbox do |vb|
        vb.customize [ 'modifyvm', :id, '--memory', RAM ]
        vb.customize [ 'modifyvm', :id, '--cpus', CPUS ]
        
    end
    client.vm.provision "shell", path: "scripts/script-client.sh"
    client.vm.network "private_network", ip: "192.168.56.100"
    
  end
end
