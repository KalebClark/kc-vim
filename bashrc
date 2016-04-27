# Rocket Dept Bash 

# GIT
COLOR_RED="\033[1;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[1;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " -($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " -($commit)"
  fi
}

function bash_export {
    export PS1
}

function ssh_copy_key {
    cat .ssh/id_rsa.pub | ssh $1 'cat >> .ssh/authorized_keys'
}


# set cool prompt
username=`whoami`
PS1="${debian_chroot:+($debian_chroot)}"
#PS1+="\[$COLOR_RED\]\u@\h"
if [[ $username =~ "root" ]]; then
    PS1+="\[$COLOR_RED\]"
else
    PS1+="\[$COLOR_BLUE\]"
fi

PS1+="\u"
PS1+="\[$COLOR_YELLOW\]@"
PS1+="\[$COLOR_WHITE\]\h"
PS1+="\[$COLOR_RESET\]"

##PS1+="\[$COLOR_WHITE\] -("
PS1+="\[\$(git_color)\]"
PS1+="\$(git_branch)"
PS1+="\[$COLOR_BLUE\]"
PS1+="[\w] \$ "
PS1+="\[$COLOR_RESET\]"


export PS1


# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    unalias ls
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    export LS_OPTIONS='--color=auto'
    eval "`dircolors`"
    alias ls='ls $LS_OPTIONS'
fi
export EDITOR="vim"

# Some more alias to avoid making mistakes:
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'

# Docker Commands
function docker-bash() {
    docker run -i -t $1 /bin/bash    
}

function docker-bash-running() {
    docker exec -i -t $1 /bin/bash
}

function docker-remove-all-containers() {
    docker rm $(docker ps -a -q)
}

function docker-remove-all-images() {
    docker rmi -f $(docker images -q) 
}

function docker-remove-all-volumes() {
    docker volume rm $(docker volume ls -q)
}
