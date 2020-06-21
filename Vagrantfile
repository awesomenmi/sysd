# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "sysd" do |sysd| 

    sysd.vm.box = "centos/7"
    sysd.vm.box_check_update = false

    sysd.vm.hostname = "sysd"
    sysd.vm.provision "shell", path: "provision.sh"
  end
end
