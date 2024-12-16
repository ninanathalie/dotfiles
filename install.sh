#!/bin/bash

printf "\n==============================================================================

SETTING UP YOUR COMPUTER!

==============================================================================\n"

# Show hidden dotfiles in Finder
printf "\nShowing hidden files to be visible in Finder...\n"
eval "defaults write com.apple.finder AppleShowAllFiles YES"
eval "killall Finder"

# Install XCode Command Line Tools
printf "\nInstalling XCode Command Line Tools...\n"
eval "xcode-select --install"

# Install Homebrew for easier macOS package management
printf "\nInstalling Homebrew...\n"
eval '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# If this is an M1 mac
if [[ `uname -m` == 'arm64' ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$USER/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Yarn for easier (and faster) Node.js dependency management
printf "\nInstalling Yarn for easier (and faster) Node.js dependency management...\n"
eval "brew install yarn --ignore-dependencies"

# Install Composer for easier PHP dependency management
printf "\nInstalling Composer for easier PHP dependency management...\n"
eval "brew install composer"

# Install GitHub CLI
printf "\nInstalling GitHub CLI...\n"
eval "brew install gh"

# Install Oh My Zsh
printf "\nInstalling Oh My Zsh...\n"
eval "sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"

# Install ZSH Plugins (autosuggestions, syntax highlighting)
printf "\nInstalling ZSH autosuggestions plugin...\n"
eval "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

printf "\nInstalling ZSH syntax highlighting plugin...\n"
eval "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install Powerlevel10k theme (or any custom theme you prefer)
printf "\nInstalling Powerlevel10k theme...\n"
eval "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k"

# Copy dotfiles into the home directory
printf "Copying dotfiles into home directory...\n"
cp .zshrc ~/

# Install NVM
printf "\nInstalling NVM...\n"
eval "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash"

# Refresh ZSH config and install LTS Node.js version
printf "\nRefreshing ZSH configuration...\n"
source ~/.zshrc
nvm install --lts

# Install VSCode via Homebrew Cask
brew install --cask visual-studio-code

# Open links for apps that can't be downloaded via brew cask
printf "\nOpening links for apps to download...\n"

# Browsers
eval "open https://www.google.com/chrome/"
eval "open https://www.mozilla.org/en-US/firefox/new/"

# Productivity
eval "open https://www.notion.so/desktop"

# Development
eval "open https://docs.docker.com/docker-for-mac/install/"
eval "open https://www.getpostman.com/"

# Design
eval "open https://www.figma.com/downloads/"

# Communication
eval "open https://slack.com/downloads/mac"
eval "open https://zoom.us/download"
eval "open https://discord.com/download"

# Miscellaneous
eval "open https://www.spotify.com/us/download/mac/"

printf "\nSetup complete! Enjoy your dev environment!\n"
