#!/bin/bash
echo "INSTALL precise32 box"
vagrant box add precise32 http://files.vagrantup.com/precise32.box
echo "VAGRANT UP"
vagrant up
echo "SET Mysql root PWD"
vagrant ssh -c 'sudo /home/vagrant/resetmysqlpwd.sh'
