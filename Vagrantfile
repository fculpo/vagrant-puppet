Vagrant.configure(2) do |config|
  
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end
  
  # Local DNS resolution
  config.hostmanager.enabled = true     # activate the plugin
  config.hostmanager.manage_host = true # update the /etc/hosts file
  config.hostmanager.ignore_private_ip = false  # using the private IP for communication
  config.hostmanager.include_offline = true     # adding all boxes in the hosts file
  
  # Puppet configuration
  config.r10k.puppet_dir      = "puppet"
  config.r10k.puppetfile_path = "puppet/Puppetfile"
  config.r10k.module_path     = "puppet/vendor"     # for the modules coming from the forge or github
  
  # Gitlab
  config.vm.define "puptest", primary: true do |puptest|
    puptest.vm.box              = "box-cutter/centos66"
    puptest.vm.hostname         = "puptest.dev"
    puptest.hostmanager.aliases = %w(puptest.dev puptest.dev)
  end
  
  # Bootstrapping Puppet
  config.vm.provision "shell", path: "puppet/bootstrap/centos_6_x.sh"
  
  # Provisionning with Puppet
  config.vm.provision "puppet" do |puppet|
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.working_directory = "/tmp/vagrant-puppet"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = ["puppet/modules", "puppet/vendor"]
  end

end
