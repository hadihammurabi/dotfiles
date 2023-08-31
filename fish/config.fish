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
set -gx PATH "$HOME/.nvm/versions/node/v18.17.0/bin" $PATH

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

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment grey
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow' '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

