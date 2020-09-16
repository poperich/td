#!/bin/bash
source /home/vagrant/ansiblevenv/bin/activate

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook --private-key=/home/vagrant/private_key -u vagrant -i /vagrant/ansible_master/inventory.yml /vagrant/provisioning/windows/playbook.yml