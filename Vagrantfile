# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2" # Vagrantfile API/syntax version. Don't touch unless you know what you're doing!

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # One vm just for devstack (to access the UI)
  config.vm.define "devstack" do |ds|
    ds.vm.hostname = "devstack"
    ds.vm.box = "ubuntu/trusty64"
    #ds.vm.network :private_network, ip: "192.168.10.5"

    ds.vm.provider "virtualbox" do |vb|
      vb.memory = 7168
      vb.cpus = 4
    end

    ds.vm.provision "shell", inline: "echo 'Acquire::http { Proxy \"http://roadrash:3142\"; };' > /etc/apt/apt.conf.d/01proxy"

    ds.vm.provision "ansible" do |ansible|
      ansible.playbook = "devstack.yml"
      ansible.raw_arguments = ['-T 30', '-e pipelining=True']
      ansible.groups = {
        "devstack"               => ["devstack"],
        "monasca"                => ["monasca"],
        "monasca-agent:children" => ["devstack", "monasca"],
      }
    end
  end

  # One vm running all the services
  config.vm.define "monasca" do |mm|
    mm.vm.hostname = 'monasca'
    mm.vm.box = "ubuntu/trusty64"
    #mm.vm.network :private_network, ip: "192.168.10.4"
    mm.vm.provider "virtualbox" do |vb|
      vb.memory = 6144
      vb.cpus = 4
    end

    mm.vm.provision "shell", inline: "echo 'Acquire::http { Proxy \"http://roadrash:3142\"; };' > /etc/apt/apt.conf.d/01proxy"
    mm.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup-everything.yml"
      ansible.raw_arguments = ['-T 30', '-e pipelining=True']
      ansible.groups = {
        "devstack"               => ["devstack"],
        "monasca"                => ["monasca"],
        "monasca-agent:children" => ["devstack", "monasca"],
      }
    end
  end

end
