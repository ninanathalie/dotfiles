# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set path for npm global binaries
export PATH=$PATH:$HOME/.npm-global/bin

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# NVM Initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Homebrew paths for M1 and Intel Macs
export PATH="/opt/homebrew/bin:$PATH"  # Apple Silicon (M1)
export PATH="/usr/local/bin:$PATH"     # Intel Macs

# Custom aliases
alias gs="git status"
alias gl="git log"
alias ga="git add ."
alias gc="git commit -m"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoredups:erasedups
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH=~/.console-ninja/.bin:$PATH
