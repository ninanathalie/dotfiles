#!/bin/bash

# Colors for output
YELLOW="\033[1;33m"
RED="\033[0;31m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[37m"
RESET="\033[0m"

echo -e "${MAGENTA}=============================================================================="
echo -e "${CYAN}               SETTING UP YOUR COMPUTER! ${RESET}"
echo -e "${MAGENTA}==============================================================================${RESET}"

# Step 1: Show hidden files in Finder
echo -e "${CYAN}[Step 1]${YELLOW} Making hidden files visible in Finder...${RESET}"
defaults write com.apple.finder AppleShowAllFiles YES && killall Finder

# Step 2: Install XCode Command Line Tools
echo -e "${CYAN}[Step 2]${YELLOW} Installing XCode Command Line Tools...${RESET}"
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
else
    echo -e "${WHITE}XCode Command Line Tools already installed.${RESET}"
fi

# Step 3: Install Homebrew
echo -e "${CYAN}[Step 3]${YELLOW} Installing Homebrew...${RESET}"
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${WHITE}Homebrew is already installed.${RESET}"
fi

# Step 4: Install Yarn
echo -e "${CYAN}[Step 4]${YELLOW} Installing Yarn...${RESET}"
if ! brew list yarn &>/dev/null; then
    brew install yarn
else
    echo -e "${WHITE}Yarn is already installed.${RESET}"
fi

# Step 5: Install Composer
echo -e "${CYAN}[Step 5]${YELLOW} Installing Composer...${RESET}"
if ! command -v composer &>/dev/null; then
    brew install composer
else
    echo -e "${WHITE}Composer is already installed.${RESET}"
fi

# Step 6: Install GitHub CLI
echo -e "${CYAN}[Step 6]${YELLOW} Installing GitHub CLI...${RESET}"
if ! brew list gh &>/dev/null; then
    brew install gh
else
    echo -e "${WHITE}GitHub CLI is already installed.${RESET}"
fi

# Step 7: Install Oh My Zsh
echo -e "${CYAN}[Step 7]${YELLOW} Installing Oh My Zsh...${RESET}"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "${WHITE}Oh My Zsh is already installed.${RESET}"
fi

# Step 8: Install ZSH Plugins
echo -e "${CYAN}[Step 8]${YELLOW} Installing ZSH Plugins...${RESET}"
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo -e "${WHITE}ZSH Autosuggestions plugin installed.${RESET}"
else
    echo -e "${WHITE}ZSH Autosuggestions plugin already installed.${RESET}"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo -e "${WHITE}ZSH Syntax Highlighting plugin installed.${RESET}"
else
    echo -e "${WHITE}ZSH Syntax Highlighting plugin already installed.${RESET}"
fi

# Step 9: Install Powerlevel10k theme
echo -e "${CYAN}[Step 9]${YELLOW} Installing Powerlevel10k theme...${RESET}"
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e "${WHITE}Powerlevel10k theme installed.${RESET}"
else
    echo -e "${WHITE}Powerlevel10k theme already installed.${RESET}"
fi

# Step 10: Backup and copy .zshrc
echo -e "${CYAN}[Step 10]${YELLOW} Copying .zshrc to the home directory...${RESET}"
if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
    echo -e "${WHITE}Backup of existing .zshrc created.${RESET}"
fi
cp .zshrc "$HOME/.zshrc"

# Step 11: Install NVM
echo -e "${CYAN}[Step 11]${YELLOW} Installing NVM...${RESET}"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    source "$HOME/.nvm/nvm.sh"
else
    echo -e "${WHITE}NVM is already installed.${RESET}"
fi

# Step 12: Refreshing ZSH configuration and installing Node.js LTS
echo -e "${CYAN}[Step 12]${YELLOW} Refreshing ZSH configuration and installing Node.js LTS...${RESET}"
if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
    nvm install --lts
else
    echo -e "${WHITE}Switching to Zsh to refresh configuration...${RESET}"
    zsh <<EOF
        source ~/.zshrc
        nvm install --lts
EOF
fi

# Step 13: Install Visual Studio Code
echo -e "${CYAN}[Step 13]${YELLOW} Installing Visual Studio Code...${RESET}"
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
    brew install --cask visual-studio-code
else
    echo -e "${CYAN}Visual Studio Code is already installed.${RESET}"
fi

# Step 14: Open download links for additional apps
echo -e "${CYAN}[Step 14]${YELLOW} Opening download links for additional apps...${RESET}"
open "https://www.google.com/chrome/"
open "https://www.mozilla.org/en-US/firefox/new/"
open "https://www.notion.so/desktop"
open "https://docs.docker.com/docker-for-mac/install/"
open "https://www.getpostman.com/"
open "https://www.figma.com/downloads/"
open "https://slack.com/downloads/mac"
open "https://zoom.us/download"
open "https://discord.com/download"
open "https://www.spotify.com/us/download/mac/"


echo -e "${MAGENTA}=============================================================================="
echo -e "${CYAN}                SETUP COMPLETE! ENJOY YOUR DEV ENVIRONMENT! ${RESET}"
echo -e "${MAGENTA}==============================================================================${RESET}"
