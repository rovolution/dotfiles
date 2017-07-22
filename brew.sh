#!/bin/sh

echo installing homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "tap for latest versions"
brew tap homebrew/versions

echo "installing brew formulae + binaries"
brew install htop
brew install ag
brew install git
brew install hub
brew install node
brew install ruby-install
brew install nvm
brew install rename
brew install jq
brew install diff-so-fancy
brew install caskroom/cask/brew-cask

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "tapping caskroom/versions"
brew tap caskroom/versions

echo "installing developer tools"
brew cask install iterm2
brew cask install sublime-text
brew cask install virtualbox

echo "installing browsers"
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox

echo "installing apps"
brew cask install licecap
brew cask install fluid
brew cask install shiftit
brew cask install notational-velocity
brew cask install spotify
brew cask install spotify-notifications
brew cask install dropbox
brew cask install slack
brew cask install lastpass
brew cask install vlc

echo "Finish"
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
