#!/bin/bash
if [ -f /etc/debian_version ] ; then
	DIST="DEBIAN"
elif [ -f /etc/redhat-release ] ; then
	DIST="REDHAT"
fi

case $DIST in
	'DEBIAN')
		#installation for deb
	sudo apt-get -y update
	echo "Downloading dependencies"
	sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
		;;

	'REDHAT')
		#installation for red-hat based distros
	echo "Downloading dependencies"
	sudo yum -y update
	sudo yum -y install gcc gcc-c++ kernel-devel openssl libreadline6 libreadline6-dev curl git-core gmake libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison-devel subversion
	sudo yum -y install  sqlite sqlite-devel 
		;;
esac
echo "Downloading rvm"

curl -L https://get.rvm.io | bash -s stable --rails

echo ". ~/.rvm/scripts/rvm" >> ~/.bashrc

if [-f ~/.zshrc]; then
	echo ". ~/.rvm/scripts/rvm" >> ~/.zshrc
fi

