
# git prompt
# deprecated, use git symbolic-ref --short HEAD 2>/dev/null # Upd: does not work for "detached HEAD"
# Format: "* master" OR "* (HEAD detached at 8cfc577)"
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d; s/^\* *//'
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
NO_COLOUR="\[\033[0m\]"
export PS1="$MAGENTA\h: $BLUE\w $RED\$(parse_git_branch)$NO_COLOUR
$ "

export PATH="~/bin:$PATH"

export GEM_HOME=$HOME/.gem
export PATH="$GEM_HOME/bin:$PATH"

export EDITOR=emacs
export VISUAL=emacs

shopt -s histappend
#PROMPT_COMMAND='history -a; history -n'
PROMPT_COMMAND='history -a'
export HISTCONTROL="ignorespace:ignoredups"    # ignore duplicate and lines started with space
export HISTSIZE=9999
#export HISTIGNORE="&:ls:[bf]g:exit"
shopt -s cmdhist                   # multiple line commands

set -o pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -x /usr/libexec/java_home ] && export JAVA_HOME=`/usr/libexec/java_home`

# Render markdown
function rmd () {
	pandoc $1 | lynx -stdin
}

# HOME_BREW package manager
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_EDITOR=mate

[[ -r ~/.bashrc ]] && . ~/.bashrc

