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
