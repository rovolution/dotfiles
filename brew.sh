#!/bin/sh

echo installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
brew install homebrew/cask

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "tapping caskroom versions"
brew tap homebrew/cask-versions

echo "installing terminal + editor"
brew install iterm2
brew install visual-studio-code

if [ $1 = "installExtraDevTools" ]; then
	echo "installing other developer tools"
	brew install --cask docker
	brew install --cask graphiql
	brew install sequel-pro
	brew install postico
fi

brew install google-chrome
brew install google-chrome-canary
brew install firefox

echo "installing apps"
brew install licecap
brew install notational-velocity
brew install spotify
brew install spotify-notifications
brew install slack
brew install telegram
brew install --cask whatsapp
brew install --cask zoom
brew install --cask flux
brew install iterm2
brew install flycut

echo "Finish"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
