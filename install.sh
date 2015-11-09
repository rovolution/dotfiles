#!/bin/sh

## Step 1: install programs via Homebrew Cask
echo "Installing apps"
# sh brew.sh

## Step 2: Create symlinks to aliases/env variables
echo "Installing aliases/env-variables"
create_symlink_from_user_root()
{
   ln -s `pwd`/$1 ~/$1
}

create_symlink_from_user_root .index-dotfile
create_symlink_from_user_root .aliases
create_symlink_from_user_root .custom-command-line-prompt
create_symlink_from_user_root .env-variables


## Step 3: Create symlinks to Sublime config
echo "Installing Sublime config"
SUBLIME_USER_PACKAGE_DIRECTORY="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

rm -rf "$SUBLIME_USER_PACKAGE_DIRECTORY"
ln -s `pwd`/sublime "$SUBLIME_USER_PACKAGE_DIRECTORY"