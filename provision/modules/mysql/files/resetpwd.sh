#!/bin/bash
echo "START RESET PASSWORD"
sudo service mysql stop/waiting
sudo mysql_safe --skip-grant-tables --skip-networking &
sudo mysqladmin -uroot password "password"
echo "RESTART MYSQL"
sudo service mysql restart
echo "END"
