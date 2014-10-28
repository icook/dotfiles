# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
# disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"
# disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"
# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
plugins=(git virtualenvwrapper debian)

source $ZSH/oh-my-zsh.sh

alias pkilla="pkill -fe --signal 9"
#crypto_address_version() {
#    echo $1
#    echo `python -c "from cryptokit.base58 import get_bcaddress_version; print get_bcaddress_version('{$1}')"`
#}

alias rl=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias vzsh="vim ~/.zshrc"
alias bower='noglob bower'
alias gaa='git add -A && git status'

export GOPATH=$HOME/programming/go
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin:$GOPATH/bin:$ZSH/bin:$HOME/dotfiles/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
