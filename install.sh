#! /bin/bash

# Downloads and extract flutter to respective folder
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.8-stable.tar.xz
mkdir -p ~/Development/android
tar xf flutter_linux_3.13.8-stable.tar.xz -C ~/Development

# Downloads and extracts the Android SDK to respective folder
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip -d ~/Development/android

rm flutter_linux_3.13.8-stable.tar.xz
rm commandlinetools-linux-10406996_latest.zip

cd ~/Development/android/cmdline-tools
mkdir tools
mv -i * tools

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
    sudo dnf install -y clang cmake gcc ninja-build pkgconf-pkg-config gtk3-devel lzma-sdk-devel android-tools scrcpy
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev android-sdk-platform-tools scrcpy
fi

# Installs latest android SDK commandline tools
$ANDROID_HOME/cmdline-tools/tools/bin/sdkmanager --sdk_root=$ANDROID_HOME "cmdline-tools;latest"

# Delete old sdkmanager
rm -r tools

# Installs dependences for building apps on android
sdkmanager "platforms;android-33" "build-tools;33.0.2" "extras;google;m2repository" "extras;android;m2repository" "platform-tools" "tools" "emulator"

# Accepts all the required licenses, refer a lawyer on this if u want to do this properly or blindly say yes to the google overlords
flutter doctor --android-licenses

# Updates flutter to latest version
flutter upgrade

clear

# Checks if everything is installed or not
flutter doctor

echo 'Close this terminal session and open a new one, you should be able now run flutter!'

