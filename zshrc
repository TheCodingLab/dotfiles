export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=powerlevel10k/powerlevel10k
CASE_SENSITIVE=true
DISABLE_UPDATE_PROMPT=true

plugins=(
    git
    zsh-autosuggestions
    gitignore
)

source $ZSH/oh-my-zsh.sh

# User configuration
[[ -f "$HOME/.env" ]] && source "$HOME/.env"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
