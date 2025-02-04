#!/bin/sh

# Default command line arg values
INSTALL_DEV_TOOLS=false
INSTALL_PERSONAL_TOOLS=false

## Step 0: Parse command line args
while getopts dp opt; do
	case $opt in
		d)     
			INSTALL_DEV_TOOLS=true
			;;
		p)
			INSTALL_PERSONAL_TOOLS=true
			;;
		*)
			echo "Invalid option: -$OPTARG" >&2
			exit
			;;
	esac
done

# echo installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "tap for latest versions"
brew tap homebrew/versions

# echo "installing brew formulae + binaries"
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

# echo "tapping caskroom versions"
brew tap homebrew/cask-versions

# echo "installing terminal + editor(s)"
brew install iterm2
brew install visual-studio-code
brew install cursor

if [ $INSTALL_DEV_TOOLS = true ]; then
	echo "installing other developer tools"
	brew install --cask docker
	brew install --cask graphiql
	brew install sequel-pro
	brew install postico
fi

brew install google-chrome
brew install google-chrome-canary
brew install firefox

# echo "installing apps"
brew install licecap
brew install notational-velocity
brew install spotify
brew install spotify-notifications
brew install slack
brew install telegram
brew install --cask zoom
brew install --cask flux
brew install --cask background-music
brew install iterm2
brew install flycut

if [ $INSTALL_PERSONAL_TOOLS = true ]; then
	echo "installing personal apps"
	brew install --cask whatsapp
	brew install --cask signal
fi

# echo "Finish"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
