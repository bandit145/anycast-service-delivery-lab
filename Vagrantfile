Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos9s"
  config.vm.provider :libvirt do |libvirt|
    libvirt.qemu_use_session = false
  end
  config.vm.define "router" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird tcpdump && firewall-cmd --add-protocol=ospf --permanent && firewall-cmd --reload"
    box.vm.provision "shell", inline: "sysctl net.ipv4.conf.all.forwarding=1 && sysctl net.ipv6.conf.all.forwarding=1"
    box.vm.provision "file", source: "files/router_bird.conf", destination: "/tmp/bird.conf"
    box.vm.provision "shell", inline: "mv /tmp/bird.conf /etc/bird.conf"
    # box.vm.provision "shell", inline: "systemctl start bird && systemctl enable bird"
    box.vm.network :private_network, :ip => "192.168.100.2", :libvirt__forward_mode => "none"
    box.vm.network :private_network, :ip => "192.168.101.2", :libvirt__forward_mode => "none"
    box.vm.network :private_network, :ip => "192.168.102.2", :libvirt__forward_mode => "none"
  end
  config.vm.define "box1" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx tcpdump && firewall-cmd --add-protocol=ospf --permanent && firewall-cmd --reload"
    box.vm.provision "shell", inline: "sysctl net.ipv4.conf.all.forwarding=1 && sysctl net.ipv6.conf.all.forwarding=1"
    box.vm.provision "file", source: "files/bird.conf", destination: "/tmp/bird.conf"
    box.vm.provision "shell", inline: "mv /tmp/bird.conf /etc/bird.conf"
    # box.vm.provision "shell", inline: "systemctl start bird && systemctl enable bird"
    box.vm.network :private_network, :ip => "192.168.100.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "box2" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx tcpdump && firewall-cmd --add-protocol=ospf --permanent && firewall-cmd --reload"
    box.vm.provision "shell", inline: "sysctl net.ipv4.conf.all.forwarding=1 && sysctl net.ipv6.conf.all.forwarding=1"
    box.vm.provision "file", source: "files/bird.conf", destination: "/tmp/bird.conf"
    box.vm.provision "shell", inline: "mv /tmp/bird.conf /etc/bird.conf"
    # box.vm.provision "shell", inline: "systemctl start bird && systemctl enable bird"
    box.vm.network :private_network, :ip => "192.168.101.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "box3" do |box|
    box.vm.provision "shell", inline: "dnf install -y bird nginx tcpdump && firewall-cmd --add-protocol=ospf --permanent && firewall-cmd --reload"
    box.vm.provision "shell", inline: "sysctl net.ipv4.conf.all.forwarding=1 && sysctl net.ipv6.conf.all.forwarding=1"
    box.vm.provision "file", source: "files/bird.conf", destination: "/tmp/bird.conf"
    box.vm.provision "shell", inline: "mv /tmp/bird.conf /etc/bird.conf"
    # box.vm.provision "shell", inline: "systemctl start bird && systemctl enable bird"
    box.vm.network :private_network, :ip => "192.168.102.3", :libvirt__forward_mode => "none"
  end
end