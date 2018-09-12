
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='┌─[\e[0;32m\u\e[0m@\e[0;32m\h\e[0m: \e[1;31m\e[1;34m\w\e[0m]\n└─ $ '

set -o vi
stty -ixon

HISTCONTROL=ignoreboth
shopt -s histappend

export HISTSIZE=
export HISTFILESIZE=
#HISTSIZE=1000
#HISTFILESIZE=2000

export EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias lsg='ls -la | grep -i'
alias lsn='ls -lat | head'

complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pidof

up() {
    if [[ $1 == "" ]]
        then
            newdir=/
        else
            local newdir=$(dirname $(pwd))
    fi

    while [[ "$(basename $newdir)" != *$1* ]] && [[ "$(basename $newdir)" != "/" ]]
    do
        newdir=$(dirname $newdir)
    done

    echo $newdir
    cd $newdir
}

function ve_prompt() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # get the env name
        echo "(${VIRTUAL_ENV##*/}) "
    fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1
PS1='┌─[\e[0;32m\u\e[0m@\e[0;32m\h\e[0m: \e[1;31m$(ve_prompt)\e[1;34m\w\e[0m]\n└─ $ '

