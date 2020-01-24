export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=$PATH:$HOME/.cargo/bin
# export PATH=$PATH:$HOME/.pyenv/bin
export PATH=$PATH:$HOME/.npm-global/bin
# export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.krew/bin

source ~/.dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle debian
antigen bundle pass
antigen bundle kube-ps1
antigen bundle taskwarrior
antigen bundle copyfile
antigen bundle copydir
antigen bundle dircycle
antigen bundle cp
antigen bundle extract
antigen bundle colored-man-pages
antigen bundle history

antigen bundle andrewferrier/fzf-z
FZFZ_SUBDIR_LIMIT=0
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle supercrabtree/k
antigen bundle zdharma/zsh-diff-so-fancy
# antigen theme romkatv/powerlevel10k
antigen theme bira

antigen apply

# add kube_ps1 to prompt
PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}\$(kube_ps1)
╰─%B${user_symbol}%b "
RPROMPT="%* %B${return_code}%b"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -500'"
FZF_CTRL_R_OPTS="--preview 'echo {} | bat -l bash -pp --color=always' --preview-window down:3:wrap"
FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"


# Experimental
# =============================================================================
# PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'
# precmd() { eval "$PROMPT_COMMAND" }

# ALIASES
# =============================================================================
cdiff () {
    diff -u $@ | diff-so-fancy | less
}
alias pkilla="pkill -fe --signal 9"
alias ag="nocorrect noglob ag --smart-case --context --hidden --path-to-ignore ~/.ignore"
alias rl=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias vzsh="vim ~/.zshrc"
alias gaa='git add -A && git status'
alias vim="nvim"
# (c)o(p)y (l)ast (c)ommand, for documentation building
alias cplc='history | tail -n 1 | sed "s/[[:digit:]]*  //" | sed "s/^#//" | xclip'

if ! type "pygmentize" > /dev/null; then
    alias ccat="cat"
else
    alias ccat="pygmentize -g"
fi

# LANGUAGE
# =============================================================================
if type "rustc" > /dev/null; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Python ******************************
# Activate pyenv if exists
if type "pyenv" > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Add python user bin to path
export PY_USER_BIN=$(python -c 'import site; print(site.USER_BASE + "/bin")')
export PATH=$PY_USER_BIN:$PATH

[ -d ~/.poetry ] && export PATH=$HOME/.poetry/bin:$PATH

# Go *********************************
export GOPATH=$HOME/programming/go
export PATH=$PATH:$GOPATH/bin

# MISC
# =============================================================================

export DOCKER_BUILDKIT=1

# Use gpg as the ssh-agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

export VISUAL=vim
export EDITOR="$VISUAL"
