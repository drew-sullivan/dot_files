load_dot_files () {
    if [ -d ~/dot_files ]; then

        # Include dot (.) files while looping
        shopt -s dotglob

        for FILE in ~/dot_files/*;
        do
            if [[ "$FILE" = $HOME/dot_files/.* ]] && [ ! -d "$FILE" ];
            then
                rsync "$FILE" "$HOME"
                echo synced "$FILE" with "$HOME"

                # vim doesn't know what bash is!
                if [ ! "$FILE" = "$HOME/dot_files/.vimrc" ];
                then
                    source "$FILE"
                fi
            fi
        done
    fi
}

load_dot_files
