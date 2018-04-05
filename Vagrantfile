### configuration parameters ###
HOST_NAME = "jenkins"
IP_ADDRESS= "172.28.128.2"



Vagrant.configure("2") do |config|
  
  config.vm.box = "yolitals/jenkins"
  config.vm.hostname=HOST_NAME
  config.vm.network "private_network", ip:IP_ADDRESS
  config.vm.provision "shell", path: "provision.sh"
  config.vm.synced_folder "./", "/vagrant", disabled: true 
  config.vm.synced_folder "src", "/vagrant/src", create: true, owner: "jenkins", group: "jenkins"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "jenkins"
  end
  config.ssh.insert_key = false  
  config.ssh.private_key_path ="~/.vagrant/machines/default/virtualbox/private_key"
end