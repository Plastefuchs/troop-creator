# Template vagrant configuration file for rtc.io server
Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  # config.vm.box = "ubuntu-12.04"
  # config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"

  # provision using the shell provisioner
  # config.vm.provision :shell do |shell|
  #   # shell.inline = "curl -s https://gist.github.com/DamonOehlman/5754302/raw/provision-nginx-node.sh | sh"
  #   shell.inline = "sh /vagrant/vagrant-provision/provision-nginx-node.sh"
  # end

  # install node/npm via nvm as a lower privileged user 
  # http://stackoverflow.com/questions/27122392/installing-nvm-nodejs-emberjs-inside-a-vagrant-box
  config.vm.provision "shell", inline: "sh /vagrant/vagrant-provision/provision-node-nonpriv.sh", privileged: false
  config.vm.provision "shell", inline: "sh /vagrant/vagrant-provision/provision-nginx-node.sh"

  # enable the creation of symlinks on the VirtualBox instance
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant","1"]
  end

end