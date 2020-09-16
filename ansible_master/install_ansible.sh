#!/bin/bash
#  Update your repositories
sudo apt-get update
# Install python3 pip3
sudo apt install -y build-essential libssl-dev libffi-dev python-dev python3 python3-pip
# Use pip to install virtualenv
sudo pip3 install virtualenv 
# create ansiblevenv
virtualenv -p python3 ansiblevenv
# activate environment
source ansiblevenv/bin/activate
python -m pip install --upgrade pip
pip install ansible pywinrm --no-cache-dir

cp /vagrant/.vagrant/machines/ansiblemaster/virtualbox/private_key /home/vagrant/
chmod 700 /home/vagrant/private_key