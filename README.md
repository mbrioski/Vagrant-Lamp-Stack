Vagrant LAMP Stack
------------------------

[Vagrant](https://www.vagrantup.com) configuration with [Puppet](https://puppetlabs.com) to set LAMP environment with Ubuntu 14.04 LTS (32 bit) from Linux (Ubuntu - Debian distribution)

This repo give you the possibility to set up a standard LAMP development environment, with only one command and share the environment with all the members of your team for developing web applications. You don't care about the operating system to use on your local machine or which IDE, everything works on virtual machine and the code is shared from the virtual machine to your local project folder **src**.
You have also XDebug working.

##Your development environment for web application
After the installation you have a virtual host(*myapp.dev:8080*) set on a new LAMP virtual machine shared to your local subfolder *src*

![](https://github.com/ridesoft/Vagrant-Lamp-Stack/blob/master/doc/imgs/php5-5-24.png)

###The virtual machine  come with:
- Apache2
- Modrewrite enabled
- Mysql
- PHP5.5>= with all the modules in the [module configuration](https://github.com/ridesoft/VagrantLampStack/blob/master/provision/modules/php/manifests/init.pp)
- Mail
- Composer
- XDebug

**All configuration could be changed from the VagrantFile**

##Prerequisites
- Install Virtualbox
- Install [Vagrant](https://www.vagrantup.com)
- Install git,**this is mandatory for Windows users that haven't ssh client**

##Install
Fork and clone, if you want to change some configuration, or just clone this repo:
```
git clone git@github.com:ridesoft/Vagrant-Lamp-Stack.git yourprojectname
```
or if you have not a github account:
```
git clone https://github.com/ridesoft/Vagrant-Lamp-Stack
```
Enter in the folder of your project and run the script:
```
./vlamp.sh
```

It takes some time.

At the end Your virtual machine environment is working

**See apache2 working on port 8080 in your browser at url http://localhost:8080 or at http://myapp.dev:8080**

###Configure XDebug to Run on remote virtual machine
Xdebug is already configured to work on your machine: just start your IDE in Debug mode and enjoy

For particular configuration have a look at [Xdebug Doc](http://xdebug.org/docs/remote)

###Mysql configuration
Mysql root access from virtual machine:
```
mysql -uroot -ppassword
```
If you want to change the root password just open file */home/vagrant/resetmysqlpwd.sh*, type the new password and execute the script from terminal.

###Vagrant
After you have installed the first time this package, you can use all vagrant command to use your LAMP virtual machine
- vagrant up
- vagrant halt
- vagrant providing
- ....

##Notes
- **VagrantFile** configuration is in the root
- All modules and the configuration is in the **provision** folder
- **Enjoy development without writing tons of doc and problems about environment configuration**
