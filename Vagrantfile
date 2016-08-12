# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2" # Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
ANSIBLE_TAGS=ENV['ANSIBLE_TAGS']

$ansible_groups = {
	"devstack"               => ["devstack"],
	"monasca"                => ["monasca"],
	"monasca-agent:children" => ["devstack", "monasca"],
}

$ansible_raw_arguments = ['-T 30', '-e pipelining=True']

$apt_proxy = "echo 'Acquire::http { Proxy \"http://roadrash:3142\"; }; Acquire::https::Proxy \"false\";' > /etc/apt/apt.conf.d/01proxy"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # One vm just for devstack (to access the UI)
  config.vm.define "devstack" do |ds|
    ds.vm.hostname = "devstack"
    ds.vm.box = "ubuntu/trusty64"

    ds.vm.network "forwarded_port", guest: 80, host: 8080
    ds.vm.network "private_network", ip: "10.2.0.10"
    ds.vm.provider "virtualbox" do |vb|
      vb.memory = 7168
      vb.cpus = 4
    end

    ds.vm.provision "hosts", sync_hosts: true
    ds.vm.provision "shell", inline: $apt_proxy
    ds.vm.provision "devstack", type: "ansible" do |ansible|
      ansible.tags = ANSIBLE_TAGS
      ansible.playbook = "devstack.yml"
    end

    ds.vm.provision "monasca", type: "ansible" do |ansible|
      ansible.tags = ANSIBLE_TAGS
      ansible.raw_arguments = $ansible_raw_arguments
      ansible.groups =  $ansible_groups
      ansible.playbook = "os-monasca-install.yml"
    end
  end

  # One vm running all the services
  config.vm.define "monasca" do |mm|
    mm.vm.hostname = 'monasca'
    mm.vm.box = "ubuntu/trusty64"

    mm.vm.network "private_network", ip: "10.2.0.11"
    mm.vm.provider "virtualbox" do |vb|
      vb.memory = 6144
      vb.cpus = 4
    end

    mm.vm.provision "hosts", sync_hosts: true
    mm.vm.provision "shell", inline: $apt_proxy
    mm.vm.provision "monasca", type: "ansible" do |ansible|
      ansible.tags = ANSIBLE_TAGS
      ansible.playbook = "setup-everything.yml"
      ansible.raw_arguments = $ansible_raw_arguments
      ansible.groups = $ansible_groups
    end
  end

end
