if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
# disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"
# remove all duplicate history entries
HIST_IGNORE_ALL_DUPS="true"
# disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"
# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
plugins=(git debian kubectl)

WORKON_HOME=$HOME/.virtualenvs
export GOPATH=$HOME/programming/go
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin:$GOPATH/bin:$ZSH/bin:$HOME/dotfiles/bin:$HOME/.cargo/bin:$HOME/.pyenv/bin:$HOME/.npm-global/bin:/usr/local/go/bin
source $ZSH/oh-my-zsh.sh

alias pkilla="pkill -fe --signal 9"
alias ag="nocorrect noglob ag --smart-case --context"

alias minikube="/home/icook/.minikube-ingress-dns/minikube-ingress-dns-ubuntu16"
export MINIKUBE_INGRESS_DNS_DOMAIN="minikube"
alias rl=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias vzsh="vim ~/.zshrc"
alias gaa='git add -A && git status'

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
# Customize to your needs...
export ANDROID_HOME=/home/icook/Android/Sdk/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/icook/.sdkman"
[[ -s "/home/icook/.sdkman/bin/sdkman-init.sh" ]] && source "/home/icook/.sdkman/bin/sdkman-init.sh"
source /etc/profile.d/apps-bin-path.sh

# Use gpg as the ssh-agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
