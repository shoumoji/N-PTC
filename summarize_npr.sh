#!/bin/bash

set -ux

cd 2021-02-06-05-52-39
dir=$(pwd)
cd ~/app
cp kataribe.toml $dir
sudo cat /var/log/apache2/other_vhosts_access.log | /home/ptc-user/go/bin/kataribe > $dir/result.txt
#sudo cp -a /var/log/mysql/mysql-error.log $dir
#sudo cp -a /var/log/mysql/mysql-slow.log $dir

# パーミッションまわり調整
sudo chown -R $USER:$GROUPS $dir
#pt-query-digest $dir/mysql-slow.log > $dir/digest.txt
sudo cp -a /etc/apache2/apache2.conf $dir

#./log2discord $dir/digest.txt
./log2discord $dir/result.txt
