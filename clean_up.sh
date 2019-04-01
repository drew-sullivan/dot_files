delete_sym_links () {
    # Include dot (.) files while looping
    shopt -s dotglob

	for FILE in ~/*;
	do
	    if [ ! -d "$FILE" ];
	    then
		    for DOT_FILE in ~/dot_files/*;
		    do
            if [ $(basename $DOT_FILE) = $(basename $FILE) ] && [ ! -d "$DOT_FILE" ];
			then
                rm "$FILE"
		echo deleted "$FILE"
			fi
		    done
	    fi
	done
}

delete_sym_links
