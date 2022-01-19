#!/bin/sh

##############################
# DESCRIPTION
##############################
# This script is used to install all of the dotfiles


##############################
# COMMAND LINE OPTIONS
##############################
# -c :: if specified, will install apps via homebrew cas#

##############################
# BEGIN SCRIPT
##############################

# Default command line arg values
INSTALL_HOMEBREW=false

## Step 0: Parse command line args
while getopts "c" opt; do
	case $opt in
		c)
			INSTALL_HOMEBREW=true
			echo "-c specified! Will install programs via Homebrew" >&2
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit
			;;
	esac
done

## Step 1: install programs via Homebrew 
if [ "$INSTALL_HOMEBREW" = true ] ; then
	echo "Installing apps via Homebrew"
	sh brew.sh
fi

## Step 2: Create symlinks to aliases/env variables
echo "Installing aliases/env-variables"
create_symlink_from_user_root()
{
   ln -s `pwd`/$1 ~/$1
}

create_symlink_from_user_root .index-dotfile
create_symlink_from_user_root .aliases
create_symlink_from_user_root .general-setup
create_symlink_from_user_root .custom-command-line-prompt
create_symlink_from_user_root .env-variables

source ~/.index-dotfile
source ~/.general-setup

# Step 4: Set default Node to system version
nvm alias default system

# Step 5: Create .gitconfig symlink
echo "Installing Git config"
rm -rf ~/.gitconfig
ln -s `pwd`/.gitconfig ~/.gitconfig
