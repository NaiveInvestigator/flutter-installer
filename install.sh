#! /bin/bash

# Downloads and extract flutter to respective folder
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.8-stable.tar.xz
mkdir -p ~/Development/android
tar xf flutter_linux_3.13.8-stable.tar.xz -C ~/Development

# Downloads and extracts the Android SDK to respective folder
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip -d ~/Development/android

# Cleans up downloaded archives
rm flutter_linux_3.13.8-stable.tar.xz
rm commandlinetools-linux-10406996_latest.zip

# moves downloaded adkmanager to the old folder
cd ~/Development/android/cmdline-tools
mkdir old
mv -i * old

# Adding flutter and Android SDK to path on respective shells
if [ -f ~/.bashrc ]; then
    echo 'export ANDROID_HOME=$HOME/Development/android' >> ~/.bashrc
    echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH' >> ~/.bashrc
    echo 'export PATH=$ANDROID_HOME/emulator/:$PATH' >> ~/.bashrc
    echo 'export PATH=$ANDROID_HOME/platform-tools/:$PATH' >> ~/.bashrc
    echo 'export PATH=$HOME/Development/flutter/bin/:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi
    
if [ -f ~/.zshrc ]; then
    echo 'export ANDROID_HOME=$HOME/Development/android' >> ~/.zshrc
    echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH' >> ~/.zshrc
    echo 'export PATH=$ANDROID_HOME/emulator/:$PATH' >> ~/.zshrc
    echo 'export PATH=$ANDROID_HOME/platform-tools/:$PATH' >> ~/.zshrc
    echo 'export PATH=$HOME/Development/flutter/bin/:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi

if [ -f ~/.config/fish/config.fish ]; then
    echo 'set -xg PATH "$HOME/Development/flutter/bin:$PATH"' >> ~/.config/fish/config.fish
    echo 'set -xg ANDROID_HOME "$HOME/Development/android"' >> ~/.config/fish/config.fish
    echo 'set -xg PATH "$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH"' >> ~/.config/fish/config.fish
    echo 'set -xg PATH "$ANDROID_HOME/emulator/:$PATH"' >> ~/.config/fish/config.fish
    echo 'set -xg PATH "$ANDROID_HOME/platform-tools/:$PATH"' >> ~/.config/fish/config.fish
    source ~/.config/fish/config.fish
fi

# installs dependencies for building flutter apps in linux and some nice-to-have for android app development
DNF_CMD=$(which dnf)
APT_GET_CMD=$(which apt-get)
if [[ ! -z $DNF_CMD ]]; then
    sudo dnf install -y clang cmake gcc ninja-build pkgconf-pkg-config gtk3-devel lzma-sdk-devel android-tools scrcpy java
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev android-sdk-platform-tools scrcpy default-jre
fi

# Installs latest android SDK commandline tools
yes | $ANDROID_HOME/cmdline-tools/old/bin/sdkmanager --sdk_root=$ANDROID_HOME "cmdline-tools;latest"

# Delete old sdkmanager
rm -r old

# Installs dependences for building apps on android
sdkmanager "platforms;android-33" "build-tools;33.0.2" "extras;google;m2repository" "extras;android;m2repository" "platform-tools" "tools" "emulator"

# Updates flutter to latest version
flutter upgrade

# Automatically accepts all the required licenses, refer a lawyer on this if u want to do this properly or blindly say yes to the google overlords
yes | sdkmanager --licenses
yes | flutter doctor --android-licenses

clear

# Checks if everything is installed or not
flutter doctor -v

echo 'Close this terminal session and open a new one, you should be able now run flutter!'

