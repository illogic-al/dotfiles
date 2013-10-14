# Set EDITOR variable for crontab and git
export EDITOR=vim
alias vi=vim
#alias vim="mvim -v"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=50000
setopt appendhistory autocd extendedglob

# Enable Vim keybindings
bindkey -v
# Bind 'jk' to ESC key
bindkey -M viins 'jk' vi-cmd-mode

# End of lines configured by zsh-newuser-install
bindkey "^R" history-incremental-pattern-search-backward 
bindkey "^S" history-incremental-pattern-search-forward

#Functions
termtitle() {
  case "$TERM" in
    rxvt*|xterm|nxterm|gnome|screen|screen-*)
      local prompt_host="${(%):-%m}"
      local prompt_user="${(%):-%n}"
      local prompt_char="${(%):-%~}"
      case "$1" in
        precmd)
          printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
        ;;
        preexec)
          printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
        ;;
      esac
    ;;
  esac
}

preexec() {
  # Set terminal title along with current executed command pass as second argument
  termtitle preexec "${(V)1}"
}

reload () {
          exec "${SHELL}" "$@"
}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/orville/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Select from multiple completion antries with a tabable list
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'


# Autocomplete any aliases
setopt completealiases

# Load fade prompt theme
autoload –U promptinit
promptinit
prompt fade

export PS1="%F{green}%B%K{green}█▓▒░%F{white}%K{green}%B%n@%m%b%F{green}%K{black}█▓▒░%F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P}
%}%F%K{black}%B%~/%b%k%f "

source ~/.dotfiles/theme-and-appearance.zsh
source ~/.dotfiles/spectrum.zsh
source ~/.dotfiles/git.zsh
source ~/.dotfiles/rvm.plugin.zsh
source ~/.dotfiles/completion.zsh
source ~/.dotfiles/directories.zsh
source ~/.dotfiles/key-bindings.zsh
source ~/.dotfiles/finol.zsh-theme

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Allow for globs that could be empty (for RVM)
setopt nullglob

# Allow use of globs in remote portion of scp command
setopt nonomatch

#aliases
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias du='du -sh'
alias df='df -h'
#alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Define some aliases
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git --no-pager diff'
alias gh='git hist'
alias gm='git merge'
alias gp='git pull'
alias gr='git revert'
alias grst='git reset'
alias gs='git status'
alias gss='git status -s'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias gpom='git push origin master'

# Add RVM to PATH for scripting
PATH=/usr/local/lib/ruby/gems/2.0.0/gems/rak-1.4/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
