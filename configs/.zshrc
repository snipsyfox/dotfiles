export PATH=$PATH:$HOME/bin/

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"

. $HOME/.bash_aliases
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh
# i don't know why this is happening but sometimes 
# zsh starts in / and i have no idea why.
if [ $PWD = '/' ]; then
    cd ~
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
