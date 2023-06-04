fpath+=~/.zfunc

source ~/.zplug/init.zsh

zplug "modules/environment", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "lib/key-bindings", from:oh-my-zsh
zplug "b4b4r07/emoji-cli"

zplug load

. ~/.zplug/theme.zsh

setopt clobber
unsetopt share_history
setopt nonomatch

export PATH=~/bin:$PATH:~/go/bin:~/.local/bin

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=$HOME/Projects/
    . ~/.local/bin/virtualenvwrapper.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -l"
alias vim=nvim

export VISUAL=nvim
export EDITOR=nvim
