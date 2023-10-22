# flutter-installer
A simple Linux script which sets up a flutter environment.

## Installation:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NaiveInvestigator/flutter-installer/main/install.sh)"
```

## Features:
* Works on any debian, ubuntu or fedora based distro. (did not include arch cause they have already package for it)
* Supports bash, zsh and fish shell.
* Installs Android SDK without needing Android Studio.
* Automatically accepts all the needed licences so that you can get to work instantly

## TODO:
* Add uninstall script
* Add option to select what toolchains to install
* Add helpful error messages on the script and mention how to diagnose them
* Add guides on how to do it manually in the event when everything fails
* You tell me! :>

## Credits:
These guides helped me write this script. Without them this script would definitely not exist!
* https://dev.to/klyngen/set-up-a-flutter-development-environment-on-linux-1mgd
* https://proandroiddev.com/how-to-setup-android-sdk-without-android-studio-6d60d0f2812a
* https://github.com/mesaquen/android-cmdline-tools-guide

