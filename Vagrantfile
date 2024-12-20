# vagrant plugin install vagrant-libvirt
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  (1..5).each do |i|
    config.vm.define "d#{i}" do |node|
      # Set the hostname and VM name
      node.vm.hostname = "debian#{i}"
      node.vm.provider "libvirt" do |libvirt|
        libvirt.memory = 2048
        libvirt.cpus = 2
      end

      #node.vm.network "private_network", type: "dhcp" 
      node.vm.network "private_network", type: "static", ip: "192.168.121.#{i + 100}"

      node.vm.provision "shell", inline: <<-SHELL

        sudo apt-get update
        sudo apt-get install -y openssh-server net-tools

        echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7erkt/64UZ8zRmP9St1oohJxZY9IRB8Q/OmrBU5Hkl kn@ndkn" >> /home/vagrant/.ssh/authorized_keys

        mkdir -p $HOME/.bin
        echo 'export PATH=$PATH:/sbin:$HOME/.bin' >> /home/vagrant/.bashrc
        source /home/vagrant/.bashrc
     
      SHELL
    end
  end

end