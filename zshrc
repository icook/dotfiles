if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
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

WORKON_HOME=$HOME/.virtualenvs
source $ZSH/oh-my-zsh.sh

alias pkilla="pkill -fe --signal 9"
alias ag="nocorrect noglob ag --smart-case --context"

alias rl=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias vzsh="vim ~/.zshrc"
alias bower='noglob bower'
alias gaa='git add -A && git status'
gcu() {
[[ "$#" != 1 ]] && local b="$(git_current_branch)"
git stash && git pull origin "${b:=$1}" && git stash pop
}
compdef _git gcu=git-checkout

export HISTCONTROL=ignoreboth:erasedups
export GOPATH=$HOME/programming/go
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin:$GOPATH/bin:$ZSH/bin:$HOME/dotfiles/bin:$HOME/.cargo/bin:$HOME/.pyenv/bin:$HOME/.npm-global/bin:/usr/local/go/bin
export ANDROID_HOME=/home/icook/Android/Sdk/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/icook/.sdkman"
[[ -s "/home/icook/.sdkman/bin/sdkman-init.sh" ]] && source "/home/icook/.sdkman/bin/sdkman-init.sh"
