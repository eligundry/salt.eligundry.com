Vagrant.configure('2') do |config|
  # Salt folder sync
  config.vm.synced_folder "salt/", "/srv/salt/"
  config.vm.synced_folder "pillar/", "/srv/pillar/"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Configure salt
  config.vm.provision "shell", path: "salt/bootstrap.sh"
  config.vm.provision :salt do |salt|
    salt.bootstrap_options = '-P'
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

  config.vm.define "debian" do |debian|
    debian.vm.box = 'ideegeo/debian-sid'
    debian.vm.network "private_network", ip: "10.17.1.4"
  end

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = 'ubuntu/trusty64'
    ubuntu.vm.network "private_network", ip: "10.17.1.5"
  end
end
