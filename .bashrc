# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias e='emacs'

alias omo="find ./ -name '*.pyc' -exec rm -f {} \;"
alias omo_emacs="find ./ -name '*.*~' -exec rm -f {} \;"
alias find_in_files='find -type f | xargs grep -l'
alias is_running='ps aux | grep'

#alias destroy='ps x -o pid,command | grep runserver | grep -v grep | cut -c1-5 | xargs kill'
function destroy_all(){
    ps x -o pid,command | grep "$@" | grep -v grep | cut -c1-5 | xargs kill -9
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export TERM="xterm-256color"

# function _update_ps1() {
#    export PS1="$(~/powerline-shell.py $?)"
# }

#export PROMPT_COMMAND="_update_ps1"
#

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


# path the the newly checked out project. I used ~/src
export PYTHONSTARTUP="$HOME/src/python-shell-enhancement/pythonstartup.py"

# this is the default value, no need to change it if you don't care
export PYTHON_HISTORY_FILE="$HOME/.pythonhistory"


#         RED="\[\033[0;31m\]"
#      YELLOW="\[\033[0;33m\]"
#       GREEN="\[\033[0;32m\]"
#        BLUE="\[\033[0;34m\]"
#   LIGHT_RED="\[\033[1;31m\]"
# LIGHT_GREEN="\[\033[1;32m\]"
#       WHITE="\[\033[1;37m\]"
#  LIGHT_GRAY="\[\033[0;37m\]"
#  COLOR_NONE="\[\e[0m\]"

# function parse_git_branch {

#   git rev-parse --git-dir &> /dev/null
#   git_status="$(git status 2> /dev/null)"
#   branch_pattern="^# On branch ([^${IFS}]*)"
#   remote_pattern="# Your branch is (.*) of"
#   diverge_pattern="# Your branch and (.*) have diverged"
#   if [[ ! ${git_status}} =~ "working directory clean" ]]; then
#     state="${RED}⚡"
#   fi
#   # add an else if or two here if you want to get more specific
#   if [[ ${git_status} =~ ${remote_pattern} ]]; then
#     if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
#       remote="${YELLOW}↑"
#     else
#       remote="${YELLOW}↓"
#     fi
#   fi
#   if [[ ${git_status} =~ ${diverge_pattern} ]]; then
#     remote="${YELLOW}↕"
#   fi
#   if [[ ${git_status} =~ ${branch_pattern} ]]; then
#     branch=${BASH_REMATCH[1]}
#     echo " (${branch})${remote}${state}"
#   fi
# }

# function prompt_func() {
#     previous_return_value=$?;
#     # prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
#     prompt="${TITLEBAR}${BLUE}[${RED}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE} "
#     if test $previous_return_value -eq 0
#     then
#         PS1="${prompt}➔ "
#     else
#         PS1="${prompt}${RED}➔${COLOR_NONE} "
#     fi
# }

# PROMPT_COMMAND=prompt_func


# Everyone needs a little color in their lives
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
# UC: username color
# LC: location/cwd color
# HD: hostname display (\h vs \H)
# Defaults:
UC=$RED
LC=$BLUE
HD=$FULL

# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # show the host only and be done with it.
    host="${UC}${HD}${NIL}"

    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
       _dirname=$_pwd
    else
       _dirname=`dirname "$_pwd" `
	if [[ $_dirname == "/" ]]; then
	      _dirname=""
	fi
       _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"
    myuser="${UC}\u@${NIL}"

    # Dirtiness from:
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
	then dirty=""
    else
       dirty="${RED}*${NIL}"
    fi
    _branch=$(git symbolic-ref HEAD 2>/dev/null)
    _branch=${_branch#refs/heads/} # apparently faster than sed
    branch="" # need this to clear it when we leave a repo
    if [[ -n $_branch ]]; then
       branch=" ${NIL}[${PURPLE}${_branch}${dirty}${NIL}]"
    fi

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
       then
	   venv=" ${RED}(${VIRTUAL_ENV##*/})"
    else
       venv=''
    fi

    export PS1="${myuser}${path}${venv}${branch} ${end}"
}

export PROMPT_COMMAND=set_prompt

export EDITOR=nano

#setxkbmap -option ctrl:nocaps


export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

source $HOME/.django_bash_completion.sh
