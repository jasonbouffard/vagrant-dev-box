# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :public_network

  config.vm.synced_folder "../", "/vagrant_data"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "pre-run"
    chef.add_recipe "apache"
    chef.add_recipe "php"
    chef.add_recipe "postgresql"
  end

end
