#!/usr/bin/env bash
HOMEDIR=$HOME
USERNAME=$(whoami)
DEVICE_NAME=$1

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

# Are we on OSX and do we need homebrew?
if [[ `uname` == 'Darwin' ]];
then
	command -v brew > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "Homebrew not found. Installing ..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	# Do we need to install SaltStack?
	command -v salt-call > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "SaltStack not found. Installing ..."
		brew install saltstack
	fi
else
	# Do we need to install SaltStack?
	command -v salt-call > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "We need SaltStack ..."
		apt install -y salt-minion python-pip
		pip install GitPython
	fi
fi

# Link the directories
ln -sv $PWD/salt/minion /etc/salt/minion
ln -sv $PWD/salt/roots /srv/salt
ln -sv $PWD/salt/pillar /srv/pillar

# Set the user, home-directory, and state root
$USE_SUDO salt-call --local --state-output=changes grains.setvals "{ 'user': '$USERNAME', 'homedir': '$HOMEDIR', 'eligundry_device': '$DEVICE_NAME' }"

# Apply the high state
$USE_SUDO salt-call --local --state_verbose=False --state-output=mixed --log-level=quiet --retcode-passthrough state.highstate
