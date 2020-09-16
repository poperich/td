#!/bin/bash
source /home/vagrant/ansiblevenv/bin/activate
cd /vagrant/ansible_master
ansible-galaxy install --role-file=jenkins_ansible/requirements.yml
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook jenkins_ansible/jenkins_playbook.yml -u vagrant -i inventory.yml --private-key=/home/vagrant/private_key 
mkdir /var/lib/jenkins/.ssh/ -p && cp -f /home/vagrant/private_key  /var/lib/jenkins/.ssh/ && chown -R jenkins: /var/lib/jenkins/.ssh