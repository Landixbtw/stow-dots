# Ensure /usr/local/bin is in the PATH first
export PATH="/usr/local/bin:$PATH"

# latexmk path
export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"

# Ghostty terminal (personal directory for executables)
export PATH="$HOME/.local/bin:$PATH"

# Rust tools
export PATH="$HOME/.cargo/bin:$PATH"

# ripgrep (note that this directory path may vary depending on your install location)
export PATH="$HOME/usr/bin/rg:$PATH"

# Compilation tools for cross-compiling
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$HOME/opt/cross/bin:$PATH"
export PATH="$PREFIX/bin:$PATH"

# GDB UI (personal tools)
export PATH="$HOME/Downloads/gf/gf2:$PATH"
export PATH="$HOME/Downloads/gf:$PATH"

# Java Development Kit (JDK) path
export JAVA_HOME="/usr/bin/java"
export PATH="$JAVA_HOME/bin:$PATH"

# Path to your oh-my-zsh installation (if applicable)
export ZSH="$HOME/.oh-my-zsh"

# Library path for shared libraries
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"


# Compilation flags for cross-compiling
export ARCHFLAGS="-arch x86_64"


# TeX Live paths (for LaTeX)
export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"


export PATH_TO_FX=~/Dokumente/Uni/javafx-sdk-24.0.1/lib/
export JAVA_HOME=/usr/lib/jvm/java-24-openjdk/
export PATH="$JAVA_HOME/bin:$PATH"
. "/home/ole/.local/share/bob/env/env.sh"
alias adef="cd ~/adehome/autonomous-system-26/ && ade start -f --enter"
