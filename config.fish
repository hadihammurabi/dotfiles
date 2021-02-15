set fish_greeting
eval (starship init fish)
set -x EDITOR /usr/bin/nvim
set -x VISUAL /usr/bin/nvim

if status is-interactive
and not set -q TMUX
   exec tmux
end

function killtmux --on-signal INT --on-process-exit %self
    set sess (tmux display-message -p '#S')
    tmux kill-session -t sess
end

trap killtmux INT TERM

# Android
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $HOME/Android/android-studio/bin $PATH
set -gx PATH $HOME/Android/Sdk/platform-tools $PATH
set -gx PATH $HOME/Android/Sdk/tools $PATH
set -gx PATH $HOME/Android/Sdk/tools/bin $PATH
set -gx PATH $HOME/Android/Sdk/emulator $PATH
set -gx PATH $HOME/Android/Sdk/build-tools/28.0.3 $PATH

# Dart
set -gx PATH $HOME/.pub-cache/bin $PATH

# Flutter
set -gx PATH $HOME/Android/flutter/bin $PATH

# NodeJS
# set -gx PATH $HOME/.nvm/versions/node/v10.15.1/bin $PATH

# Hadoop
#set -gx JAVA_HOME /usr/lib/jvm/default
#set -gx PATH /opt/hadoop-3.1.2/bin $PATH
#set -x HADOOP_HOME /opt/hadoop-3.1.2

# Golang
set -x GOPATH $HOME/GoHome
set -x PATH $GOPATH/bin $PATH
# add the go bin path to be able to execute our programs

# Rust Cargo
# set -gx PATH $HOME/.cargo/bin $PATH

#Deno
# set -gx PATH $HOME/.deno/bin $PATH
# denon --completion-fish | source

# Gradle
# set -x PATH ~/.sdkman/candidates/gradle/current/bin $PATH

# Micronaut
set -x PATH ~/.sdkman/candidates/micronaut/current/bin $PATH

# Kotlin
set -x PATH ~/.sdkman/candidates/kotlin/current/bin $PATH

# Frappe Bench
#set -x PATH ~/.local/bin $PATH

# Ruby
#set -x PATH $HOME/.gem/ruby/2.6.0/bin $PATH
#set -x PATH $HOME/.rbenv/versions/2.3.3/bin $PATH
#set -gx PATH '$HOME//.rbenv/shims' $PATH
#set -gx RBENV_SHELL fish
#source '/usr/lib/rbenv/libexec/../completions/rbenv.fish'
#command rbenv rehash 2>/dev/null
#function rbenv
#  set command $argv[1]
#  set -e argv[1]
#
#  switch "$command"
#  case rehash shell
#    source (rbenv "sh-$command" $argv|psub)
#  case '*'
#    command rbenv "$command" $argv
#  end
#end

set XDG_SESSION_TYPE X11

# NIM
set -gx PATH $HOME/.nimble/bin $PATH

# FZF
set -g FZF_DEFAULT_COMMAND "fd --type f"
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

# Aliasing
alias vim nvim
alias ls=lsd
alias ll="ls -l"
