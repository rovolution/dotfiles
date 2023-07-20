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
brew install iterm2
brew install visual-studio-code
brew install --cask docker
brew install --cask graphiql
brew install sequel-pro
brew install postico

echo "installing browsers"
brew install google-chrome
brew install google-chrome-canary
brew install firefox

echo "installing apps"
brew install licecap
brew install fluid
brew install --cask hammerspoon
echo $'\nAfter installing Hammerspoon, need to manually install the Shift-It keycode bindings: See full instructions here: https://github.com/peterklijn/hammerspoon-shiftit\n'
brew install notational-velocity
brew install spotify
brew install spotify-notifications
brew install slack
brew install telegram
brew install flux
brew install iterm2
brew install flycut

echo "Finish"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
