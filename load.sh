update () {
    cd "$HOME"/dot_files
    BRANCH=$(parse_git_branch)
    if [ "$BRANCH" != " (master)" ];
    then
        git checkout master
    fi
    git fetch
    git pull
    echo updated dot_files
}

create_sym_links () {
    if [ -d ~/dot_files ]; then

        # Include dot (.) files while looping
        shopt -s dotglob

        for FILE in ~/dot_files/*;
        do
            if [[ "$FILE" = $HOME/dot_files/.* ]] && [ ! -d "$FILE" ];
            then
                ln -sv "$FILE" ~
                if [ $(basename $FILE) != ".vimrc" ];
                then
                    source "$FILE"
                    echo loaded "$FILE"
                fi
            fi
        done
    fi
}

update
create_sym_links
