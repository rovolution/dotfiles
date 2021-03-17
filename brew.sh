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
brew install watch
brew install diff-so-fancy
brew install caskroom/cask/brew-cask
brew install wrk # http-benchmarking util

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "tapping caskroom versions"
brew tap homebrew/cask-versions

echo "installing developer tools"
brew cask install iterm2
brew cask install visual-studio-code
brew cask install virtualbox
brew cask install postman
brew cask install docker
brew cask install sequel-pro
brew cask install postico

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
brew cask install slack
brew cask install vlc
brew cask install flux
brew cask install iterm2
brew cask install flycut
brew cask install fanny
brew cask install macs-fan-control

echo "Finish"
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
