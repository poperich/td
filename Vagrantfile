Vagrant.configure("2") do |config|

  config.vm.define :winserver do |winconfig|
     winconfig.vm.box = "peru/windows-server-2016-standard-x64-eval"
     winconfig.vm.hostname = "winserver"
     winconfig.vm.network "forwarded_port", guest: 80, host: 9080
     winconfig.vm.network "forwarded_port", guest: 8080, host: 9081
     winconfig.vm.network "public_network", ip: "192.168.0.20"
   end
    config.vm.define :ansiblemaster do |ansiconfig|
        ansiconfig.vm.hostname = "ansiblemaster"
        ansiconfig.vm.box = "ubuntu/bionic64"
        ansiconfig.vm.network "forwarded_port", guest: 80, host: 8086
        ansiconfig.vm.network "forwarded_port", guest: 8080, host: 8080
        ansiconfig.vm.network "public_network", ip: "192.168.0.10"
        ansiconfig.vm.provision "shell", path: 'ansible_master/install_ansible.sh'
        ansiconfig.vm.provision "shell", path: 'ansible_master/install_jenkins.sh'
        ansiconfig.vm.provision "shell", path: 'ansible_master/install_nginx.sh'
     end
  end