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

create_dot_file_sym_links () {
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

create_xcode_code_snippet_sym_links () {
    if [ -d ~/dot_files/xcode_code_snippets ]; then

        for FILE in ~/dot_files/xcode_code_snippets/*;
        do
            if [[ "$FILE" = ~/dot_files/xcode_code_snippets ]] && [ ! -d "$FILE" ];
            then
                ln -sv "$FILE" ~/Library/Developer/Xcode/UserData/CodeSnippets
                source "$FILE"
                echo loaded "$FILE"
            fi
        done
    fi
}

update
create_dot_file_sym_links
create_xcode_code_snippet_sym_links
