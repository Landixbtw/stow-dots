export PATH=/usr/local/bin:$PATH
# ghostty terminal 
export PATH="$HOME/.local/bin:$PATH"
# rust 
export PATH="$HOME/.cargo/bin:$PATH"

#emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

#ripgrep
export PATH="$HOME/usr/bin/rg:$PATH"

# doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

# Cross compiler 
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
export PATH="$HOME/opt/cross/bin:$PATH"

#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="sorin"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git 
        colored-man-pages 
        colorize
        command-not-found
        sudo 
        git-flow 
        z 
        fancy-ctrl-z
    )
source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

alias nv="nvim"
alias nf="neofetch"
alias update="sudo pacman -Syyuw --noconfirm && yay --save  -Syyu "
alias view="live-server --no-css-inject"
alias oo="nvim ~/Dokumente/ole/obsidian-ole/vault-ole/"
alias yz="yazi"
alias connect="ssh rocky@hostrocky"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# TeX Live paths
export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"


# update tex with this
# sudo /usr/local/texlive/2024/bin/x86_64-linux/tlmgr update --self -all



# tat: tmux attach
function tat {
  name=$(basename `pwd` | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}
