Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented 
below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  # Every Vagrant development environment requires a box. You can search 
for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "hajowieland/ubuntu-jammy-arm"
  config.vm.box_version = "1.0.0"
  config.vm.provider "vmware_desktop" do |v|
    v.ssh_info_public = true
    v.gui = true
    v.linked_clone = false
    v.vmx["ethernet0.virtualdev"] = "vmxnet3"
  end
  config.vm.box_version = "1.0.0"
  config.vm.synced_folder "./shared", "/home/vagrant/shared", create: true
  config.vm.provision "shell", inline: "mkdir ~/data"
  config.vm.provision :file, source: './data', destination: '~/data'
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
  SHELL
  config.vm.provision "shell", path: "./setup.sh", privileged: false
end
