# Finol theme by Orville Bennett (http://orville.thebennettproject.com)

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#   fino
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# and rvm.zsh from .oh-my-zsh's lib directory

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function rvm_prompt_info() {
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return
  local rvm_prompt
  rvm_prompt=$($HOME/.rvm/bin/rvm-prompt i v g 2>/dev/null)
  [[ "${rvm_prompt}x" == "x" ]] && return
  echo "${ZSH_THEME_RVM_PROMPT_PREFIX:=(}${rvm_prompt}${ZSH_THEME_RVM_PROMPT_SUFFIX:=)}"
}

local rvm_ruby='$(rvm_prompt_info)'
# local current_dir='${PWD/#$HOME/~}'
local current_dir='%1~'
local git_info='$(git_prompt_info)'


PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} ${rvm_ruby} 
╰─$(virtualenv_info)$(prompt_char) "
# %{$FG[239]%}using%{$FG[243]%} ${rvm_ruby}
ZSH_THEME_RVM_PROMPT_PREFIX="%{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RVM_PROMPT_SUFFIX="›%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
