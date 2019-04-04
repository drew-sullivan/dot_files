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

save_dots -e
delete_symlinks
