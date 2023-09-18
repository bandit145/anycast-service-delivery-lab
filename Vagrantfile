Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos9s"
  config.vm.provider :libvirt do |libvirt|
    libvirt.qemu_use_session = false
  end
  config.vm.define "router" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird"
    box.vm.network :private_network, :ip => "192.168.100.2"
    box.vm.network :private_network, :ip => "192.168.101.2"
    box.vm.network :private_network, :ip => "192.168.102.2"
  end
  config.vm.define "box1" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx"
    box.vm.network :private_network, :ip => "192.168.100.3"
  end
  config.vm.define "box2" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx"
    box.vm.network :private_network, :ip => "192.168.101.3"
  end
  config.vm.define "box3" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx"
    box.vm.network :private_network, :ip => "192.168.102.3"
  end
end