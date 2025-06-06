# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.hostname = 'vagrant'
  config.vm.network "public_network"
  config.vm.network "private_network", ip: "193.168.35.100"
  config.vm.box_check_update = true
  config.vm.synced_folder 'C:\_work_folder', "/vagrant/_work_folder", type: "virtualbox", disabled: false, mount_options: ["dmode=777", "fmode=777"]

  config.vm.boot_timeout = 600

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider "virtualbox" do |vb|
  vb.memory = '8192'
  vb.cpus = '2'
  vb.name = 'vagrant'
  end
end
