set fish_greeting

# starship
/usr/local/bin/starship init fish | source

# fzf
function fish_user_key_bindings
    fzf_key_bindings
end

# zoxide
/usr/local/bin/zoxide init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# brew
eval (/usr/local/bin/brew shellenv)

# java
set -gx JAVA_HOME (/usr/libexec/java_home -v 11)
set -gx PATH $JAVA_HOME/bin $PATH

# android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH

# gcloud
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True

# go
set -gx PATH $GOROOT/bin $PATH
set -gx PATH $HOME/go/bin $PATH

# git
# source (semver completion fish | psub)

# nodejs
set -gx PATH "$HOME/.nvm/versions/node/v18.14.0/bin" $PATH

# pnpm
set -gx PNPM_HOME "/Users/hammurabi/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# vim
# set -gx PATH $HOME/Downloads/nvim-macos/bin $PATH

# rust
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin $PATH

# ALIAS
alias vim=nvim
alias cat="bat --theme ansi"
alias ls="exa --icons -s type"
alias du=dust
alias cd=z
alias lgit=lazygit
