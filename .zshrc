# Adding important paths to the PATH variable

# Oh My Zsh configuration
zstyle ':omz:update' mode reminder  # Just remind me to update when it's time
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

# Plugins for Zsh (feel free to add more)
plugins=(
    git
    colored-man-pages
    command-not-found
    z
    fancy-ctrl-z
)
source $ZSH/oh-my-zsh.sh

# Aliases
alias nv="nvim"
alias nf="neofetch"
alias nvk="NVIM_APPNAME=nvim-kickstart nvim"
alias update="sudo pacman -Syyuw --noconfirm && yay --save  -Syyu"
alias view="live-server --no-css-inject"
alias oo="nvim ~/Dokumente/ole/obsidian-ole/vault-ole/"
alias yz="yazi"
alias connect="ssh rocky@hostrocky"

# FZF (Fuzzy Finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt (if you use it)
eval "$(starship init zsh)"

# Function to attach to tmux session if it exists or create a new one
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

