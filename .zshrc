export BASE16_THEME_DEFAULT="monokai"

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
zplug "tinted-theming/base16-shell", use:"base16-shell.plugin.zsh"

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
zplug load

export HEXCHAT_COLORS_CONF_PATH=~/.config/hexchat/colors.conf

# . ~/.zplug/repos/base16-project/base16-shell/profile_helper.sh
. ~/.zplug/theme.zsh

setopt clobber
unsetopt share_history
setopt nonomatch

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias ll="ls -l"

alias vim=nvim

if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=/home/matt/Projects/
    . ~/.local/bin/virtualenvwrapper.sh
fi

export PATH=~/bin:$PATH:~/go/bin:~/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL=nvim
export EDITOR=nvim
