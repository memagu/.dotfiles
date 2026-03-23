# Editor preference
if set -q SSH_CONNECTION
    set -gx EDITOR vim
else
    set -gx EDITOR nvim
end

# simple input method for GTK (basic compose/dead‑keys)
set -gx GTK_IM_MODULE simple

# Rust environment
if test -f $HOME/.cargo/env.fish
    source "$HOME/.cargo/env.fish"
end

# Deno environment
if test -f $HOME/.deno/env
    sh $HOME/.deno/env
end

# Java environment
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
