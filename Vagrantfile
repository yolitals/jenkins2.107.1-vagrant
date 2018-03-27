### configuration parameters ###
IP_ADRESS = "10.229.185.227"


Vagrant.configure("2") do |config|
  
  config.vm.box = "yolitals/jenkins"
  config.vm.network "public_network", auto_config: true 
  config.vm.provider "virtualbox" do |vb|
    vb.name = "jenkins"
  end
  config.ssh.insert_key = false  
  config.ssh.private_key_path ="~/.vagrant/machines/default/virtualbox/private_key"
  config.push.define "heroku" do |push|
    push.app = "yolitals/jenkins"
  end
end