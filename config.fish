set fish_greeting

# Android
set -gx PATH /home/hammurabi/Android/android-studio/bin $PATH
set -gx PATH /home/hammurabi/Android/Sdk/platform-tools $PATH
set -gx PATH /home/hammurabi/Android/Sdk/tools $PATH
set -gx PATH /home/hammurabi/Android/Sdk/tools/bin $PATH
set -gx PATH /home/hammurabi/Android/Sdk/emulator $PATH

# Flutter
set -gx PATH /home/hammurabi/Android/flutter/bin $PATH

# NodeJS
set -gx PATH /home/hammurabi/.nvm/versions/node/v10.15.1/bin $PATH

# Golang
set -x GOPATH /home/hammurabi/GO

# Rust Cargo
set -gx PATH /home/hammurabi/.cargo/bin $PATH

#Deno

set -gx PATH /home/hammurabi/.deno/bin $PATH

# add the go bin path to be able to execute our programs
set -x PATH $GOPATH/bin $PATH

# Micronaut
set -x PATH ~/.sdkman/candidates/micronaut/1.1.1/bin $PATH
