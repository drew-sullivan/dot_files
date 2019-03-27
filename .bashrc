cs () { cd "$@" && ls -GAFhlp; } # cd + ll
mcd () { mkdir -p "$1" && cs "$1"; } # create new dir and navigate to it. -p creates parents, if needed
ff () { tree -f | grep "$1"; } # look for a file -f is full path
find_string () { grep -rnwl . -e "$1"; } # find a given string in the current dir

# Takes a ticket number and a ticket title and turns it into a branch name
nab () {
    BRANCH_NAME=$(echo "ds/$*" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9\/]/_/g')
	git checkout -b $BRANCH_NAME
}

# Counts the numbers of .h, .m, and .swift files in Allegion.Leopard and prints out the % that are Swift
ovs () {
	NUM_H_FILES=$(find ~/Allegion/Allegion.Leopard -name "*.h" | wc -l)
	NUM_M_FILES=$(find ~/Allegion/Allegion.Leopard -name "*.m" | wc -l)
	NUM_SWIFT_FILES=$(find ~/Allegion/Allegion.Leopard -name "*.swift" | wc -l)
	TOTAL_FOR_CALCULATION=$((NUM_H_FILES + NUM_SWIFT_FILES))
	echo Num .h files: ${NUM_H_FILES}
	echo Num .m files: ${NUM_M_FILES}
	echo Num .swift files: ${NUM_SWIFT_FILES}
	SWIFT_DECIMAL=$(echo "$NUM_SWIFT_FILES/$TOTAL_FOR_CALCULATION" | bc -l)
	SWIFT_PERCENTAGE=$(awk "BEGIN { pc=100*${NUM_SWIFT_FILES}/${TOTAL_FOR_CALCULATION}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
	echo $SWIFT_PERCENTAGE% of files in Allegion.Leopard are in Swift
}

# "(d)elete (b)ranch"
# Takes -r or -l and a branch name and deletes the local and/or remote branch with that name
db () {
    declare opt
    declare OPTARG
    declare OPTIND

    BRANCH_NAME="$2"
    HAS_L_OPTION=false
    HAS_R_OPTION=false

    while getopts :rl opt; do
        case "$opt" in
            r) HAS_R_OPTION=true ;;
            l) HAS_L_OPTION=true ;;
            :) echo "Missing argument for option -$OPTARG"; return 1;;
           \?) echo "Unknown option -$OPTARG"; return 1;;
        esac
    done

    shift $(( OPTIND - 1 ))

    perform_branch_deletes_given "$BRANCH_NAME" "$HAS_L_OPTION" "$HAS_R_OPTION"

    echo "All done!"
}

# Helper for db()
perform_branch_deletes_given () {
    BRANCH_NAME="$1"
    L="$2"
    R="$3"

    if "$L"; then
        git branch -D "$BRANCH_NAME"
    fi

    if "$R"; then
        # prune local "cache" of remote branches
        git fetch -p origin  
        echo "Local 'cache' of remote branches pruned"

        git push origin --delete "$BRANCH_NAME" 
    fi
}
