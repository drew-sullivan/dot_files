update_dot_files () {
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

copy_xcode_code_snippets_to_CodeSnippets () {
    if [ -d ~/dot_files/xcode_code_snippets ]; then

        for FILE in ~/dot_files/xcode_code_snippets/*;
        do
            if [[ "$FILE" = ~/dot_files/xcode_code_snippets/* ]] && [ ! -d "$FILE" ];
            then
                cp "$FILE" ~/Library/Developer/Xcode/UserData/CodeSnippets
                echo copied "$FILE" to CodeSnippets
            fi
        done
    fi
}

update_dot_files
create_dot_file_sym_links
copy_xcode_code_snippets_to_CodeSnippets
