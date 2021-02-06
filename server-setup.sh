#!/bin/bash

set -u
shopt -s dotglob

PROJ_DIR=$1

yes "" | sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y nginx dstat percona-toolkit sysstat curl git build-essential tree net-tools vim unzip
go get -u github.com/matsuu/kataribe
go get -u github.com/google/pprof
go get github.com/pilu/fresh
go get golang.org/x/tools/cmd/...
yes "" | bash <(curl -Ss https://my-netdata.io/kickstart.sh)

if [ ! -d $HOME/.ssh ]; then
  mkdir $HOME/.ssh
  chmod 700 $HOME/.ssh
fi

cat <<EOF > $HOME/.ssh/id_rsa_isucon
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 600 $HOME/.ssh/id_rsa_isucon

git config --global user.name hoge
git config --global user.email hoge@example.com
git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa_isucon -F /dev/null"

cd $PROJ_DIR
git init
git remote add origin git@github.com:shoumoji/N-PTC.git || git remote set-url origin git@github.com:shoumoji/N-PTC.git

#######################
# 計測スクリプト
#######################

curl -LO https://github.com/teru01/scripts/archive/master.zip
unzip master.zip
rm master.zip
mv scripts-master/* .
rm -r scripts-master

chmod +x pprof_npr.sh
chmod +x setup_npr.sh
chmod +x summarize_npr.sh

$(go env GOPATH)/bin/kataribe -generate

