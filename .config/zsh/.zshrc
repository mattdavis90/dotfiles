source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

source ${ZDOTDIR:-~}/theme.zsh

setopt clobber
unsetopt share_history
setopt nonomatch

export PATH=~/bin:$PATH:~/go/bin:~/.local/bin

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=$HOME/Projects/
    . ~/.local/bin/virtualenvwrapper_lazy.sh
fi

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -l"
alias vim=nvim

export VISUAL=nvim
export EDITOR=nvim
