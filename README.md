# Dotfiles Setup

## Overview

This is a personal setup that automates the process of configuring my macOS development environment when setting up a new Mac machine.

The `install.sh` script will automatically set up the necessary configurations and install software for a smooth development workflow.

**Important**: This setup is tailored to my development preferences and environment. You are welcome to use it, but please proceed at your own risk. Make sure to review the scripts and adjust them to fit your specific needs before running them.

## Getting Started

### Prerequisites

- **macOS**: The installation script is tailored for macOS users.

### Installation

#### 1. Clone the Repository

Clone this repository to your local machine by running the following command in your terminal:

```bash
git clone https://github.com/ninanathalie/dotfiles.git
```

#### 2. Navigate to the Dotfiles Directory

Change into the directory where the .dotfiles repository was cloned:

```bash
cd ~/.dotfiles
```

#### 3. Make the Installation Script Executable

Before you can run the install.sh script, you need to make it executable. Run the following command:

```bash
chmod +x install.sh
```

#### 4. Run the Installation Script

Now, you can run the installation script to set up your environment:

```bash
./install.sh
```

### What the Script Does

- **Installs Homebrew**, Yarn, Composer, and other development tools.
- **Sets up Oh My Zsh** with the **Powerlevel10k** theme.
- Installs helpful Zsh plugins like `zsh-autosuggestions` and `zsh-syntax-highlighting`.
- **Copies your custom `.zshrc`** and other dotfiles to the right locations.
- Installs **VSCode** and other useful apps via Homebrew and links to download pages for some apps like Chrome and Figma.

### After Installation

Once the script runs:

- Configure Powerlevel10k by running:

  ```bash
  p10k configure
  ```

### Customizing Your Setup

#### Git Configuration

In this repository, you'll find a `.gitconfig.example` file which contains a sample Git configuration. It includes settings such as user name and email, as well as useful aliases.

**Important Note:**  
If you intend to use this file, be sure to **edit** the `name` and `email` fields to match your own Git identity before using it. Here’s the section you’ll need to modify:

```ini
[user]
    name = Your Name
    email = youremail@example.com
```

Once you've customized it, you can rename the file to .gitconfig and place it in your home directory (~) to apply the changes.

```bash
mv .gitconfig.example ~/.gitconfig
```

#### Dotfiles Customization

Feel free to customize your `.zshrc`, `.gitconfig`, and other configuration files. You can directly edit these files in your home directory (`~`).

For example, to open your `.zshrc` for editing:

```bash
code ~/.zshrc
```

You can modify aliases, plugins, and other shell configurations to suit your needs.
