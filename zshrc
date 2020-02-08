export ZSH="/Users/florian/.oh-my-zsh"
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
[[ -f ~/.env ]] && source ~/.env
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

alias aws.dev.ec2='aws ec2 --endpoint-url https://dev-portal.cloudbit.ch/api/v2/aws/ec2/'
alias aws.dev.s3='aws s3 --endpoint-url https://dev-portal.cloudbit.ch/api/v2/aws/ec2/'

alias pretty='python -m json.tool'
