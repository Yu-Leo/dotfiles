export PATH=$HOME/go/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

plugins=(git tmux history sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [ -x "$(command -v eza)" ]; then
    alias l="eza --long --all --group"
fi

alias m="make"
alias n="nvim"
alias v="vim"
alias c="clear"
alias e="exit"

alias gh="git hist"
alias gcn="git fetch --prune"

alias gcmp="gcm && gpr"

# https://github.com/Yu-Leo/yu0dev/blob/main/content/posts/git-simple-commit-msg/index.md
function jt() {
    current_branch | ggrep -Po "^[[:alpha:]]*-\d*" | tr "[:lower:]" "[:upper:]"
}

function glc {
    RED='\033[0;31m'
    NC='\033[0m' # No Color

    message="$(jt): $1"

    if [[ -z "$1" ]]; then
        echo "${RED}ERROR: message is empty!${NC}"
    elif [[ -z "$(jt)" ]]; then
        echo "${RED}ERROR: task is empty!${NC}"
    else
        gc -m "$message"
    fi
}

eval "$(zoxide init zsh)"
