local ret_status="%(?:%{$fg_bold[green]%}%{%G➜%} :%{$fg_bold[red]%}%{%G➜%} )"
PROMPT='${ret_status} %{$fg_bold[magenta]%}%n%{$reset_color%}%{$FG[146]%}@%{$reset_color%}%{$fg_bold[green]%}%m%{$reset_color%}  %{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%{%G✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

