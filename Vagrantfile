# vagrant plugin install vagrant-libvirt
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  (1..1).each do |i|
    config.vm.define "d#{i}" do |node|
      # Set the hostname and VM name
      node.vm.hostname = "debian#{i}"
      node.vm.provider "libvirt" do |libvirt|
        libvirt.memory = 4096
        libvirt.cpus = 4
      end

      #node.vm.network "private_network", type: "dhcp" 
      node.vm.network "private_network", type: "static", ip: "192.168.121.#{i + 100}"

      node.vm.provision "shell", inline: <<-SHELL

        sudo apt-get update
        sudo apt-get install -y openssh-server net-tools

        echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7erkt/64UZ8zRmP9St1oohJxZY9IRB8Q/OmrBU5Hkl kn@ndkn" >> /home/vagrant/.ssh/authorized_keys
        echo "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBO3q5Lf+uFGfM0Zj/UrdaKIScWWPSEQfEPzpqwVOR5JQAAAJBh37vyYd+7
8gAAAAtzc2gtZWQyNTUxOQAAACBO3q5Lf+uFGfM0Zj/UrdaKIScWWPSEQfEPzpqwVOR5JQ
AAAEAUQz/gIRZEmwOeWg+BI1BH7DwF3BIUsiqB453SPNWYJk7erkt/64UZ8zRmP9St1ooh
JxZY9IRB8Q/OmrBU5HklAAAAB2tuQG5ka24BAgMEBQY=
-----END OPENSSH PRIVATE KEY-----" > /home/vagrant/.ssh/id_rsa
        
        mkdir -p $HOME/.bin
        echo 'export PATH=$PATH:/sbin:$HOME/.bin' >> /home/vagrant/.bashrc
        source /home/vagrant/.bashrc
     
      SHELL
    end
  end
end