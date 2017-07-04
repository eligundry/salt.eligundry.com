#!/usr/bin/env bash
# Modified from https://github.com/rawkode/saltstack-dotfiles/blob/master/init.sh

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
		$USE_SUDO apt install -y salt-minion python-pip
	fi
fi

# Install the dependencies.
$USE_SUDO pip install GitPython docker-py python-gnupg

# Set the user, home-directory, and state root
$USE_SUDO salt-call --state-output=changes grains.setvals "{ 'eligundry_device': '$DEVICE_NAME' }"

# Apply the high state
$USE_SUDO salt-call --retcode-passthrough state.highstate
