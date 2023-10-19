#! /bin/bash
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.8-stable.tar.xz
mkdir -p ~/Development/android
tar xf flutter_linux_3.13.8-stable.tar.xz -C ~/Development
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip -d ~/Development/android
cd ~/Development/android/cmdline-tools
mkdir tools
mv -i * tools

rm flutter_linux_3.13.8-stable.tar.xz
rm commandlinetools-linux-10406996_latest.zip

echo '#Add android sdk to PATH' >> ~/.bashrc 
echo 'export ANDROID_HOME=$HOME/Development/android' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/emulator/:$PATH' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/platform-tools/:$PATH' >> ~/.bashrc
echo '#Add flutter to PATH' >> ~/.bashrc
echo 'export PATH=$HOME/Development/flutter/bin/:$PATH' >> ~/.bashrc

#installing dependencies for building flutter apps in linux
DNF_CMD=$(which dnf)
APT_GET_CMD=$(which apt-get)
if [[ ! -z $DNF_CMD ]]; then
   sudo dnf install -y clang cmake gcc ninja-build pkgconf-pkg-config gtk3-devel lzma-sdk-devel 
elif [[ ! -z $APT_GET_CMD ]]; then
   sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
fi

source ~/.bashrc
sdkmanager --install "platform-tools" "platforms;android-29" "build-tools;29.0.2" "emulator" "cmdline-tools;latest"
flutter doctor --android-licenses
flutter doctor

echo 'Close this terminal session and open again, you should be able now run flutter!'

