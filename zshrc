export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(
    git
    zsh-autosuggestions
    gitignore
    httpie
    jira
    macports
)

source $ZSH/oh-my-zsh.sh

# User configuration
[[ -f "$HOME/.env" ]] && source "$HOME/.env"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

alias pretty='python -m json.tool'

function gi() { curl -sLw "\n" https://www.gitignore.io/api/$@ ;}
