Vagrant LAMP Stack
------------------------

[Vagrant](https://www.vagrantup.com) configuration with [Puppet](https://puppetlabs.com) to set LAMP environment with Ubuntu 14.04 LTS (32 bit) from Linux (Ubuntu - Debian distribution)

##What come with this vagrant virtual machine
- Apache2
- Modrewrite enabled
- Mysql
- PHP5 with all the modules in the [module configuration](https://github.com/ridesoft/VagrantLampStack/blob/master/provision/modules/php/manifests/init.pp)
- Mail
- Composer

##Prerequisites
- You are using Ubuntu or a Debian Distribution
- Install Virtualbox
- Install [Vagrant](https://www.vagrantup.com)
- Install git (sudo apt-get install git)

##Install
Fork and clone, if you want to add some configuration, or just clone this repo:
```
git clone git@github.com:ridesoft/Vagrant-Lamp-Stack.git yourprojectname
```
###First time
Enter in the folder of your project and set the environment:
```
./vlamp.sh
```
your virtual machine environment is already working

**See apache2 working in your browser at url http://localhost:8080**

###Switch on your virtual machine
After you have installed the first time this package, you can use all vagrant command to use your LAMP virtual machine
- vagrant up
- vagrant halt
- vagrant providing
....

##Notes
- Vagrant file configuration is in the root
- All modules and the configuration is in the provision folder
