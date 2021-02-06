#!/bin/bash

set -ux

cd "${0%/*}"

dir=$(date +%Y-%m-%d-%H-%M-%S)
mkdir $dir
touch $dir/$dir

#sudo cp -a mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo rm /var/log/mysql/mysql-error.log /var/log/mysql/mysql-slow.log
#sudo systemctl restart mysql
# 先にログクリアしておく
sudo rm /var/log/apache2/other_vhosts_access.log

# apache2のコンフィグを適用
sudo cp -a ~/app/apache2.conf /etc/apache2/apache2.conf
sudo systemctl restart apache2
echo $dir
