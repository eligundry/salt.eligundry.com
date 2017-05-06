Vagrant.configure('2') do |config|
  # Debian Testing
  config.vm.box = 'ideegeo/debian-sid'

  # Static IP
  config.vm.network "private_network", ip: "10.17.1.4"

  # Salt folder sync
  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.synced_folder "salt/pillar/", "/srv/pillar/"

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
end
