#!/bin/bash

parse_git_branch () {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# weather=$(curl -s wttr.in/Boulder?format=3)  # get the weather for the current location

# export PS1="\u @ ⛰ $weather \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "

export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "

source ~/.bashrc
source ~/.bash_aliases
