source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

source ${ZDOTDIR:-~}/theme.zsh

setopt clobber
unsetopt share_history
setopt nonomatch

export PATH=~/bin:$PATH:/usr/local/go/bin:~/.local/bin

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=$HOME/Projects/
    . ~/.local/bin/virtualenvwrapper_lazy.sh
fi

export PNPM_HOME=~/.local/share/pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -l"
alias vim=nvim

export VISUAL=nvim
export EDITOR=nvim
