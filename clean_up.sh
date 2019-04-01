delete_sym_links () {
    # Include dot (.) files while looping
    shopt -s dotglob

    for DOT_FILE in ~/dot_files/*;
	do
	    if [ ! -d "$DOT_FILE" ];
	    then
            for FILE in ~/*;
		    do
                if [ ! -d "$DOT_FILE" ] && [ $(basename $DOT_FILE) = $(basename $FILE) ];
                then
                    rm "$FILE"
                    echo deleted "$FILE"
                fi
		    done
	    fi
	done
}

delete_sym_links
