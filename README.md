Vagrant LAMP Stack
------------------------

[Vagrant](https://www.vagrantup.com) configuration with [Puppet](https://puppetlabs.com) to set LAMP environment with Ubuntu 14.04 LTS (32 bit) from Linux (Ubuntu - Debian distribution)

This repo give you the possibility to set up a standard LAMP development environment, with only one command, share the environment with all the members of your team for developing web applications.

##Your development environment for web application
After the installation you have a virtual host(*myapp.dev:8080*) set on a new LAMP Vagrant virtual machine shared to your local subfolder *src*
![](https://github.com/ridesoft/Vagrant-Lamp-Stack/blob/master/doc/imgs/browserscreenshot.png)

###The virtual machine  come with:
- Apache2
- Modrewrite enabled
- Mysql
- PHP5 with all the modules in the [module configuration](https://github.com/ridesoft/VagrantLampStack/blob/master/provision/modules/php/manifests/init.pp)
- Mail
- Composer

**All configuration could be changed from the VagrantFile**

##Prerequisites
- You are using Ubuntu or a Debian Distribution
- Install Virtualbox
- Install [Vagrant](https://www.vagrantup.com)
- Install git (sudo apt-get install git)

##Install
Fork and clone, if you want to change some configuration, or just clone this repo:
```
git clone git@github.com:ridesoft/Vagrant-Lamp-Stack.git yourprojectname
```
###First time
Enter in the folder of your project and set the environment:
```
./vlamp.sh
```
It takes some time.

At the end Your virtual machine environment is already working

**See apache2 working in your browser at url http://localhost:8080**

###Switch on your virtual machine
After you have installed the first time this package, you can use all vagrant command to use your LAMP virtual machine
- vagrant up
- vagrant halt
- vagrant providing
....

##Notes
- **VagrantFile** configuration is in the root
- Mysql default password for user root is *password*
- All modules and the configuration is in the **provision** folder
- **Enjoy development without writing tons of doc and problems about environment configuration**
