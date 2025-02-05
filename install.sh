#!/bin/sh

##############################
# DESCRIPTION
##############################
# This script is used to install all of the dotfiles


##############################
# COMMAND LINE OPTIONS
##############################
# -c :: if specified, will install apps via homebrew cask
# -d :: if specified, will install developer tools
# -p :: if specified, will install personal apps
# -g :: if specified, will install gitconfig

##############################
# BEGIN SCRIPT
##############################


# Default command line arg values
INSTALL_HOMEBREW=false
INSTALL_DEV_TOOLS=false
INSTALL_PERSONAL_TOOLS=false
INSTALL_GITCONFIG=false

## Step 0: Parse command line args
while getopts cdpg opt; do
	case $opt in
		c)
			INSTALL_HOMEBREW=true
			echo "-c specified! Will install programs via Homebrew" >&2
			;;
		d)     
			INSTALL_DEV_TOOLS=true
			echo "installing developer tools" >&2
			;;
		p)
			INSTALL_PERSONAL_TOOLS=true
			echo "installing personal tools" >&2
			;;
		g)
			INSTALL_GITCONFIG=true
			echo "installing gitconfig" >&2
			;;
		*)
			echo "Invalid option: -$OPTARG" >&2
			exit
			;;
	esac
done

## install programs via Homebrew 
if [ "$INSTALL_HOMEBREW" = true ] ; then
	echo "Installing apps via Homebrew"

	if [ "$INSTALL_DEV_TOOLS" = true ]
	then
		INSTALL_DEV_TOOLS_FLAG='-d'
	else
		INSTALL_DEV_TOOLS_FLAG=''
	fi

	if [ "$INSTALL_PERSONAL_TOOLS" = true ]
	then
			INSTALL_PERSONAL_FLAG='-p'
	else
			INSTALL_PERSONAL_FLAG=''
	fi

	sh brew.sh ${INSTALL_DEV_TOOLS_FLAG} ${INSTALL_PERSONAL_FLAG}
fi

## Create symlinks to aliases/env variables
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

source ~/.general-setup
source ~/.index-dotfile

# Set default Node to system version
nvm alias default system

# Create .gitconfig symlink
if [ "$INSTALL_GITCONFIG" = true ] ; then
	echo "Installing Git config"
	rm -rf ~/.gitconfig
	ln -s `pwd`/.gitconfig ~/.gitconfig
fi