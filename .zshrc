fpath+=~/.zfunc

source ~/.zplug/init.zsh

zplug "modules/environment", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "mafredri/zsh-async", from:github
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
zplug "plugins/git", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "b4b4r07/enhancd"
zplug "mollifier/anyframe"
zplug "b4b4r07/emoji-cli"
zplug "carloscuesta/materialshell", use:"materialshell.zsh", from:github, as:theme

zplug load

setopt clobber

function venv_prompt() {
    [ -n "${VIRTUAL_ENV}" ] || return
    echo "[🐍 ${VIRTUAL_ENV:t}]"
}
RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(venv_prompt) $(git_remote_status) $(git_prompt_short_sha) $(_return_status) %{$white%}%T%{$(echotc DO 1)%}%{$reset_color%}'

unsetopt share_history
setopt nonomatch

alias ls="ls --color=auto"
alias ll="ls -l"
alias grep="grep --color=auto"

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=~/Projects/
    . ~/.local/bin/virtualenvwrapper.sh
fi

export PATH=$PATH:~/go/bin:~/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL=nvim
export EDITOR=nvim
alias vim=nvim
