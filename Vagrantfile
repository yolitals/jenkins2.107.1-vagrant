### configuration parameters ###
IP_ADRESS = "10.229.185.227"


Vagrant.configure("2") do |config|
  
  config.vm.box = "yolitals/jenkins"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.synced_folder "./", "/vagrant", disabled: true 
  config.vm.synced_folder "src", "/vagrant/src", create: true, owner: "jenkins", group: "jenkins"
  #config.vm.synced_folder "jenkins", "/var/", owner: "jenkins", group: "jenkins", create: true
  config.vm.provider "virtualbox" do |vb|
    vb.name = "jenkins"
  end
  config.ssh.insert_key = false  
  config.ssh.private_key_path ="~/.vagrant/machines/default/virtualbox/private_key"

  config.push.define "heroku" do |push|
    push.app = "jenkins"
  end
end