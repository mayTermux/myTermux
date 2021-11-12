if [[ $EUID -eq 0 ]]; then
    USER_SYMBOL="%F{1}%f"
else
    USER_SYMBOL="%F{5}%f"
fi

NUM_DIR=2
DIR_PATH="%{$fg_bold[blue]%}   [ %{$fg[red]%}%$NUM_DIR~ %{$fg_bold[blue]%}]"

BACKGROUND_JOBS="%(1j.%F{2}%f.)"
NON_ZERO_RETURN_VALUE="%(0?..%F{1}%f)"

RPROMPT='$BACKGROUND_JOBS $NON_ZERO_RETURN_VALUE $(git_prompt_info)'
PROMPT='$DIR_PATH $USER_SYMBOL '
zle_highlight=(default:bold)

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} [ %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} ] %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} ]"
