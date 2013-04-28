# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="overload"
#ZSH_THEME="blinks"
#ZSH_THEME="wedisagree"
ZSH_THEME="finol"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Set the EDITOR variable for crontab and git
#alias vi="mvim -v"
#alias vim="mvim -v"
export EDITOR=vim

# Set LC_TYPE to workaround potential iTerm2 bug in combination with tmux.
# export LC_CTYPE="utf-8"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git lol textmate ruby lighthouse)

plugins=(brew osx ssh-agent rvm)
# Define some aliases
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gd='git --no-pager diff'
alias gh='git hist'
alias gm='git merge'
alias gp='git pull'
alias gr='git revert'
alias gs='git status -s'
alias gpom='git push origin master'

alias du='du -sh'
alias df='df -h'

alias zcfg='vi ~/.zshrc'
alias zsrc='source ~/.zshrc'

# Bind 'jk' to ESC key
bindkey -M viins 'jk' vi-cmd-mode

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin

#TODO Comment this out if we're not on OS X
# set shortcut for ruby programming dir
export rubidir=~/Documents/Programming/Ruby

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Source after adding rvm to PATH to allow zsh to play nicely with rvm-prompt
source $ZSH/oh-my-zsh.sh
