ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} [x]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} [c]"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[blue]%} [^]"

# machine name
function get_box_name {
  if [ -f ~/.box-name ]; then
    cat ~/.box-name
  else
    echo $HOST
  fi
}

# user name
function get_usr_name {
  local name="%n"
  if [[ "$USER" == 'root' ]]; then
    name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
  fi
  echo $name
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT='%(?, , )
%{$reset_color%} \
%{$fg_bold[green]%}$(get_box_name)%{$reset_color%}@$(get_usr_name): \
%{$fg[yellow]%}%~%{$reset_color%}$(git_prompt_info)\
%{$reset_color%}$(git_prompt_ahead) \
%{$reset_color%}
%_ $(prompt_char) '

