#!/usr/bin/env sh

xcode-select --install > /dev/null 2>&1
if [ 0 == $? ]; then
    sleep 1
    osascript <<EOD
tell application "System Events"
    tell process "Install Command Line Developer Tools"
        keystroke return
        click button "Agree" of window "License Agreement"
    end tell
end tell
EOD
else
    echo "Command Line Developer Tools are already installed!"
fi

if ! command -v brew &> /dev/null
then
    echo "'brew' could not be found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "'brew' is already installed. Skipping"
fi

if [ ! -d "$ZSH" ]; then
    echo "'oh-my-zsh' could not be found. Installing..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "'oh-my-zsh' is already installed. Skipping"
fi

if ! command -v fzf &> /dev/null
then
    echo "'fzf' could not be found. Installing..."
    brew install fzf
    /usr/local/opt/fzf/install
else
    echo "'fzf' is already installed. Skipping"
fi

echo "Downloading terminal theme for Terminal.app"
curl -s https://raw.githubusercontent.com/altercation/solarized/master/osx-terminal.app-colors-solarized/Solarized%20Dark%20ansi.terminal > "$HOME/Downloads/Solarized Dark ansi.terminal"

echo "Updating git to latest"
brew install git

echo "Installing VIM"
brew install vim

echo "Installing VS Code"
brew install --cask visual-studio-code
echo "code is automatically linked for use in the command line"

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Downloading istat menus"
curl -Ls https://download.bjango.com/istatmenus/ > "$HOME/Downloads/istatmenus.zip"

echo "Installing Slack"
brew install --cask slack

echo "Installing Spotify"
brew install --cask spotify

echo "Installing Zoom"
brew install --cask zoom

echo "Installing Docker Desktop/Docker CE"
brew install --cask docker
