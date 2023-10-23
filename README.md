# flutter-installer
A simple Linux script which sets up a flutter environment.

## Features:
* Works on any debian, ubuntu or RHEL/fedora based distro. (did not include arch cause they have already package for it)
* Supports bash, zsh and fish shell.
* Installs Android SDK without needing Android Studio.
* Automatically accepts all the needed licences so that you can get to work instantly

## Installation:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NaiveInvestigator/flutter-installer/main/install.sh)"
```

## Uninstallation:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NaiveInvestigator/flutter-installer/main/uninstall.sh)"

```

* ### Debian/Ubuntu based distros:
```
sudo apt-get remove -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev android-sdk-platform-tools scrcpy default-jre
```

* ### RHEL/Fedora based distros:
```
sudo dnf remove -y clang cmake ninja-build pkgconf-pkg-config gtk3-devel lzma-sdk-devel android-tools scrcpy java
```

## TODO:
- [x] ~~Add uninstall script~~
- [ ] Add option to select what toolchains to install
- [ ] Add helpful error messages on the script and mention how to diagnose them
- [ ] Add guides on how to do it manually in the event when everything fails
- [ ] You tell me! :>

## Credits:
These guides helped me write this script. Without them this script would definitely not exist!
* https://dev.to/klyngen/set-up-a-flutter-development-environment-on-linux-1mgd
* https://proandroiddev.com/how-to-setup-android-sdk-without-android-studio-6d60d0f2812a
* https://github.com/mesaquen/android-cmdline-tools-guide

