source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

source ${ZDOTDIR:-~}/theme.zsh

setopt clobber
unsetopt share_history
setopt nonomatch

export PATH=~/AppImages:~/bin:$PATH:~/go/bin:/usr/local/go/bin:~/.local/bin

export PNPM_HOME=~/.local/share/pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ll="ls -l"
alias vim=nvim

export VISUAL=nvim
export EDITOR=nvim
