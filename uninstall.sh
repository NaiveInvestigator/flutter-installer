#!/bin/bash

# Remove environment variable from their respective shells
if [ -f ~/.bashrc ]; then
    sed -i '/export ANDROID_HOME=$HOME\/Development\/android/d' ~/.bashrc
    sed -i '/export PATH=$ANDROID_HOME\/cmdline-tools\/latest\/bin/d' ~/.bashrc
    sed -i '/export PATH=$ANDROID_HOME\/emulator\//d' ~/.bashrc
    sed -i '/export PATH=$ANDROID_HOME\/platform-tools\//d' ~/.bashrc
    sed -i '/export PATH=$HOME\/Development\/flutter\/bin\//d' ~/.bashrc
fi
    
if [ -f ~/.zshrc ]; then
    sed -i '/export ANDROID_HOME=$HOME\/Development\/android/d' ~/.zshrc
    sed -i '/export PATH=$ANDROID_HOME\/cmdline-tools\/latest\/bin:$PATH/d' ~/.zshrc
    sed -i '/export PATH=$ANDROID_HOME\/emulator\/:$PATH/d' ~/.zshrc
    sed -i '/export PATH=$ANDROID_HOME\/platform-tools\/:$PATH/d' ~/.zshrc
    sed -i '/export PATH=$HOME\/Development\/flutter\/bin\/:$PATH/d' ~/.zshrc
fi

if [ -f ~/.config/fish/config.fish ]; then
    sed -i 'set -xg PATH "$HOME\/Development\/flutter\/bin/d"' ~/.config/fish/config.fish
    sed -i 'set -xg ANDROID_HOME "$HOME\/Development\/android/d"' ~/.config/fish/config.fish
    sed -i 'set -xg PATH "$ANDROID_HOME\/cmdline-tools\/latest\/bin\/d"' ~/.config/fish/config.fish
    sed -i 'set -xg PATH "$ANDROID_HOME\/emulator/d"' ~/.config/fish/config.fish
    sed -i 'set -xg PATH "$ANDROID_HOME\/platform-tools/d"' ~/.config/fish/config.fish
fi

# Remove the Flutter installation
if [ -d ~/Development/flutter ]; then
    rm -rf ~/Development/flutter
fi

# Remove the Android SDK installation
if [ -d ~/Development/android ]; then
    rm -rf ~/Development/android
fi
