### configuration parameters ###
HOST_NAME = "jenkins"
IP_ADDRESS= "172.28.128.2"



Vagrant.configure("2") do |config|
  

  config.vm.define "master" do |master|
    master.vm.box = "yolitals/jenkins"
    master.vm.box_version = "0.3"
    master.vm.hostname=HOST_NAME
    master.vm.network "private_network", ip:IP_ADDRESS
    master.vm.provision "shell", path: "provision.sh"
    master.vm.synced_folder "./", "/vagrant", disabled: true 
    master.vm.synced_folder "src", "/vagrant/src", create: true, owner: "jenkins", group: "jenkins"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "jenkins-master"
    end
    master.ssh.insert_key = false  
    #master.ssh.private_key_path ="~/.vagrant/machines/default/virtualbox/private_key"
  end 
  
  (1..3).each do |i|
    config.vm.define "slave-#{i}" do |slave1|
      slave1.vm.box = "yolitals/centos-java8"
      slave1.vm.box_version = "0.2"
      config.vm.network "public_network", auto_config: true
      slave1.vm.provider "virtualbox" do |vb|
        vb.name = "jenkins-slave-#{i}"
      end
      slave1.ssh.insert_key = false  
      slave1.vm.provision "shell", env: {"IP_ADDRESS" => IP_ADDRESS, "SLAVE" => "slave#{i}"}, inline: <<-SHELL
        nohup java -jar /vagrant/agent-3.jar -jnlpUrl http://${IP_ADDRESS}:8080/computer/${SLAVE}/slave-agent.jnlp -workDir "/tmp" &
        SHELL

    end
  end 
end