ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} ➦"

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

# get the name of the branch we are on
function vim_bg_info() {
  if [[ "$(command echo $VIM)" != "" ]]; then
    echo "⚡"
  fi
}

PROMPT='%(?, , )
%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}$(git_prompt_info)%{$reset_color%}$(git_prompt_ahead) %{$fg[yellow]%}$(vim_bg_info) %{$reset_color%}
%_ $(prompt_char) '
