separator() {
    echo $'\ue0b4'
}

prompt_indicator() {
    echo $'%B\u276f%b'
}

section_start() {
    echo "%{$fg[$SECTION_FG]%}%{$bg[$SECTION_BG]%}%B"
}

section_end() {
    echo "%b%{$reset_color%}%{$fg[$SECTION_BG]%}%{$bg[$NEXT_SECTION_BG]%}$(separator)%{$reset_color%}"
}

ok_username() {
    SECTION_FG="black"
    SECTION_BG="yellow"
    NEXT_SECTION_BG="green"
    echo "$(section_start) \uf007 %n$(section_end)"
}

bad_username() {
    SECTION_FG="black"
    SECTION_BG="red"
    NEXT_SECTION_BG="green"
    echo "$(section_start) \uf007 %n$(section_end)"
}

username() {
    echo "%{$fg[red]%}%(?.$(ok_username).$(bad_username))%{$reset_color%}"
}

directory() {
    SECTION_FG="black"
    SECTION_BG="green"
    NEXT_SECTION_BG="blue"
    if [[ -z $(git_current_branch) ]]; then
        NEXT_SECTION_BG="black"
    fi
    echo "$(section_start) \ue5fe %0~$(section_end)"
}

git_prompt() {
    [[ ! -z $(git_current_branch) ]] || return
    SECTION_FG="black"
    SECTION_BG="blue"
    NEXT_SECTION_BG="black"
    echo "$(section_start) \ue0a0 $(git_prompt_info)$(section_end)"
}

current_time() {
    echo "%{$fg[white]%}%*%{$reset_color%}"
}

venv_prompt() {
    [ -n "${VIRTUAL_ENV}" ] || return
    echo "%{$fg[yellow]%}(\ue235 ${VIRTUAL_ENV:t})%{$reset_color%}"
}

background_jobs() {
    echo "%{$fg[red]%}%(1j.[%j bg] .)%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}󰆴 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}󰘭 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}⬇ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[green]%}⬆ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[yellow]%}⬌ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$reset_color%}[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

export VIRTUAL_ENV_DISABLE_PROMPT=1
setopt PROMPT_SUBST
PROMPT='$(username)$(directory)$(git_prompt)
$(prompt_indicator) '
RPROMPT='%{$(echotc UP 1)%}$(venv_prompt)$(git_prompt_status)$(git_remote_status)$(git_prompt_short_sha) $(background_jobs)$(current_time)%{$(echotc DO 1)%}'
