# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

chef_configuration = JSON.parse(Pathname(__FILE__).dirname.join('.', 'chef.json').read)

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  config.ssh.forward_agent = true
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
  config.vm.synced_folder '~/.ssh/', '/ssh/'
  config.vm.synced_folder '.', '/home/apps/april-fools/current', :create => true
  config.vm.provision :shell, :path => 'configure.sh'
  config.vm.provision :chef_solo do |chef|
    chef.json = chef_configuration
  end
end
