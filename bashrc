# Rocket Dept Bash 

# Set & Declare some variables

# Include all files in commands directory
function smash_load_commands {
    for fnc in ~/.smash/commands/*.sh
    do
        source $fnc
    done
}

# Load Git configuration
function smash_load_git {
    for fnc in ~/.smash/git/*.sh
    do
        source $fnc
    done
}

smash_load_commands
smash_load_git


function bash_export {
    export PS1
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

# You may uncomment the following lines if you want `ls' to be colorized:
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    export CLICOLOR=1
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
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

# History Modifications
shopt -s histappend
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export HISTCONTROL=ignoredups:erasedups:ignorespace
