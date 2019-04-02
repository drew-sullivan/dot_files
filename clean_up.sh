# TODO:
# runtime is O(n^2) right now
# get it down to O(n lg n) by sorting first
# or O(n) with pointers

delete_sym_links () {
    # Include dot (.) files while looping
    shopt -s dotglob

    for DOT_FILE in ~/dot_files/*;
	do
	    if [ ! -d "$DOT_FILE" ];
	    then
            for FILE in ~/*;
		    do
                if [ -h "$FILE" ] && [ $(basename $DOT_FILE) = $(basename $FILE) ];
                then
                    echo "$FILE"
                    # rm "$FILE"
                    # echo deleted "$FILE"
                fi
		    done
	    fi
	done
}

# WIP
dsl () {
    SYM_LINKS=$(find $HOME -maxdepth 1 -type l -ls | sort -n)
    NUM_SYM_LINKS=$(find $HOME -maxdepth 1 -type l -ls | wc -l)
    DOT_FILES=$(find $HOME/dot_files/ -maxdepth 1 -name ".*" -type f | sort -n)
    NUM_DOT_FILES=$(find $HOME/dot_files/ -maxdepth 1 -name ".*" -type f | wc -l)

    declare SYM_LINKS_ARR
    declare DOT_FILES_ARR

    i=0
    j=0

    # for item in "$SYM_LINKS";
    # do
    #     SYM_LINKS_ARR+=("$item")
    # done

    # echo ${SYM_LINKS_ARR[@]}

    echo "$i"
    echo "$NUM_SYM_LINKS"

    while (("$i" < "$NUM_SYM_LINKS")) && (("$j" < "$NUM_DOT_FILES"));
    do
        echo "$i"
        echo true
        # echo ${SYM_LINKS[$i]}
        ((i++))
        # echo ${DOT_FILES[j]}
        # j++
        # if [ ${SYM_LINKS[i]} ]
    done

    # for DOT_FILE in "$DOT_FILES";
    # do
    #     echo "$DOT_FILE"
    # done

    # for SYM_LINK in "$SYM_LINKS";
    # do
    #     echo "$SYM_LINK"
    # done

    # for i in $(seq 1 $NUM_SYM_LINKS);
    # do
    #     echo "$i"
    # done

}

delete_sym_links
# dsl
