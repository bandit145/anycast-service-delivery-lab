Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos9s"
  config.vm.provider :libvirt do |libvirt|
    libvirt.qemu_use_session = false
  end
  config.vm.define "router" do |box|
    box.vm.provision "ansible" do |ansible|

      ansible.playbook = "playbooks/router.yml"
      ansible.become = true
      ansible.compatibility_mode = "2.0"
    end
    # box.vm.provision "shell", inline: "systemctl start bird && systemctl enable bird"
    box.vm.network :private_network, :ip => "192.168.100.2", :libvirt__forward_mode => "none"
    box.vm.network :private_network, :ip => "192.168.101.2", :libvirt__forward_mode => "none"
    box.vm.network :private_network, :ip => "192.168.102.2", :libvirt__forward_mode => "none"
    box.vm.network :private_network, :ip => "192.168.103.2", :libvirt__forward_mode => "none"
  end
  config.vm.define "box1" do |box|
    box.vm.provision "shell", inline: "ip route add 192.168.103.0/24 via 192.168.100.2 dev eth1"
    box.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/application_host.yml"
      ansible.become = true
      ansible.compatibility_mode = "2.0"
    end
    box.vm.network :private_network, :ip => "192.168.100.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "box2" do |box|
    box.vm.provision "shell", inline: "ip route add 192.168.103.0/24 via 192.168.101.2 dev eth1"
    box.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/application_host.yml"
      ansible.become = true
      ansible.compatibility_mode = "2.0"
    end
    box.vm.network :private_network, :ip => "192.168.101.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "box3" do |box|
    box.vm.provision "shell", inline: "ip route add 192.168.103.0/24 via 192.168.102.2 dev eth1"
    box.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/application_host.yml"
      ansible.become = true
      ansible.compatibility_mode = "2.0"
    end
    box.vm.network :private_network, :ip => "192.168.102.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "client1" do |box|
    box.vm.provision "shell", inline: "ip route add 192.168.200/24 via 192.168.103.2 dev eth1"
    box.vm.network :private_network, :ip => "192.168.103.3", :libvirt__forward_mode => "none"
  end
  config.vm.define "client2" do |box|
    box.vm.provision "shell", inline: "ip route add 192.168.200/24 via 192.168.103.2 dev eth1"
    box.vm.network :private_network, :ip => "192.168.103.4", :libvirt__forward_mode => "none"
  end
end