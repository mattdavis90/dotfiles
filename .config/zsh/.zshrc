# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZLE_RPROMPT_INDENT=0

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

function zsh_stats() {
    # From https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh#L1C1-L1C23
    fc -l 1 \
        | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]*100/count "% " a }' \
        | grep -v "./" | sort -nr | head -n 20 | column -c3 -s " " -t | nl
}

function spectrum() {
    # From https://github.com/romkatv/powerlevel10k/blob/master/config/p10k-rainbow.zsh#L6
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

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
alias vim=nvim

export VISUAL=nvim
export EDITOR=nvim

# Load p10k settings
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
