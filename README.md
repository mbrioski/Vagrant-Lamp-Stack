#Vagrant LAMP Stack
------------------------

[Vagrant](https://www.vagrantup.com) structure with [Puppet](https://puppetlabs.com) to set LAMP environment  with Ubuntu 14.04 LTS (32 bit)

##What come with this vagrant virtual machine
- Apache2
- Modrewrite enabled
- Mysql
- PHP5 with all the modules in the manifest configuration

##Install
After having install vagrant and virtualbox on your computer, install the **vagrant box** *precise32* (Ubuntu 32bit):
```
vagrant box add precise32 http://files.vagrantup.com/precise32.box
```
now  fork and clone or just clone this repo:
```
git clone git@github.com:ridesoft/VagrantLampStack.git yourprojectname
```
now turn on your machine:
```
vagrant up
```
access to your virtual machine with:
```
vagrant ssh
```

**Vagrant file configuration is in the root**

**All modules and the configuration is in the provision folder**
