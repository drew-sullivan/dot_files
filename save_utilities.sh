#!/bin/sh

save_xcode_codesnippets () {
    rm -rf ~/dot_files/xcode_code_snippets/
    printf "\nDeleted ~/dot_files/xcode_code_snippets/\n"
    cp -R ~/Library/Developer/Xcode/UserData/CodeSnippets ~/dot_files/xcode_code_snippets
    printf "\nCopied all library code snippets to dot_files\n"
}

save_xcode_codesnippets
python update_code_snippet_table_in_README.py
save_dots -e

printf "\nAll utilites have been saved\n"
