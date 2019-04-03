alias bashp="vim ~/.bash_profile"
alias sbashp="source ~/.bash_profile"
alias bashr="vim ~/.bashrc"
alias sbashr="source ~/.bashrc"
alias vimr="vim ~/.vimrc"
alias basha="vim ~/.bash_aliases"
alias p="pwd"
alias c="clear"
alias ..="cd .. && ll"
alias .2="cd ../.. && ll"
alias .3="cd ../../.. && ll"
alias .4="cd ../../../.. && ll"
alias grep="grep --color=auto"
alias h="history"
alias l="ls"
alias ls="ls -GFh"
alias la="ls -a"
alias ll="ls -GAFhlp"
alias gitc="vim ~/dot_files/.gitconfig"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias path="echo -e ${PATH//:/\\n}"
alias space="du -sk * | sort -n | tail -10" # prints the top 10 largest directories/files in the current dir
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gpoh='git push origin head'
alias sr='git add . && git commit -m "Small refactoring" && gpoh'
alias gs='git status'
alias gcod='git checkout develop && git fetch && git pull'
