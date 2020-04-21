delete_symlinks () {
    local df_path
    local df_name
    local home_df_path

    for df_path in ~/dot_files/.* ; do
        [[ -d $df_path ]] && continue
        df_name=${df_path##*/}
        home_df_path=~/$df_name
        if [[ -L $home_df_path ]] ; then
            rm -- "$home_df_path"
            printf 'deleted %s\n' "$home_df_path"
        fi
    done

    return 0
}

save_xcode_codesnippets () {
    rm -rf ~/dot_files/xcode_code_snippets/
    printf "Deleted ~/dot_files/xcode_code_snippets/"
    cp -R ~/Library/Developer/Xcode/UserData/CodeSnippets ~/dot_files/xcode_code_snippets
    printf "Copied all library code snippets to dot_files"
}

save_dots -e
delete_symlinks
save_xcode_codesnippets

printf "\nAll done!"
