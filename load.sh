create_sym_links () {
    if [ -d ~/dot_files ]; then

        # Include dot (.) files while looping
        shopt -s dotglob

        for FILE in ~/dot_files/*;
        do
            if [[ "$FILE" = $HOME/dot_files/.* ]] && [ ! -d "$FILE" ];
            then
                ln -sv "$FILE" ~
            fi
        done
    fi
}

create_sym_links
