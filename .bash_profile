parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

load_dot_files () {
    if [ -d ~/dot_files ]; then
        shopt -s dotglob  # Include dot (.) files while looping
        for FILE in ~/dot_files/*;
        do
            if [ "$FILE" = "$HOME/dot_files/README.md" ] || [ "$FILE" = "$HOME/dot_files/load_it.sh" ]; then
                continue
            fi

            if [ "$FILE" = "$HOME/dot_files/.vimrc" ] || [ "$FILE" = "$HOME/dot_files/.bash_profile" ]; then
                cp "$FILE" "$HOME"
                continue
            fi

            if [ ! -d "$FILE" ]; then
                . "$FILE"
                echo "$FILE" loaded
            fi
        done
    fi
}

load_dot_files
