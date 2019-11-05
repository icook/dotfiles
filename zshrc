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
plugins=(git debian kubectl pass kube-ps1)

WORKON_HOME=$HOME/.virtualenvs
export GOPATH=$HOME/programming/go
# export GO111MODULE=on
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/bin:$GOPATH/bin:$ZSH/bin:$HOME/dotfiles/bin:$HOME/.cargo/bin:$HOME/.pyenv/bin:$HOME/.npm-global/bin:/usr/local/go/bin:/home/icook/.yarn/bin
source $ZSH/oh-my-zsh.sh

# add kube_ps1 to prompt
PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}\$(kube_ps1)
╰─%B${user_symbol}%b "
RPROMPT="%* %B${return_code}%b"

alias pkilla="pkill -fe --signal 9"
alias ag="nocorrect noglob ag --smart-case --context"

alias minikube="/home/icook/.minikube-ingress-dns/minikube-ingress-dns-ubuntu16"
export MINIKUBE_INGRESS_DNS_DOMAIN="minikube"
alias rl=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias vzsh="vim ~/.zshrc"
alias gaa='git add -A && git status'

if type "rustc" > /dev/null; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
# Customize to your needs...
export ANDROID_HOME=/home/icook/Android/Sdk/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Activate pyenv if exists
if type "pyenv" > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
alias vim="nvim"
# (c)o(p)y (l)ast (c)ommand, for documentation building
alias cplc='history | tail -n 1 | sed "s/[[:digit:]]*  //" | sed "s/^#//" | xclip'
export DOCKER_BUILDKIT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use gpg as the ssh-agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# Add python user bin to path
export PY_USER_BIN=$(python -c 'import site; print(site.USER_BASE + "/bin")')
export PATH=$PY_USER_BIN:$PATH

export VISUAL=vim
export EDITOR="$VISUAL"

if ! type "pygmentize" > /dev/null; then
    alias ccat="cat"
else
    alias ccat="pygmentize -g"
fi
