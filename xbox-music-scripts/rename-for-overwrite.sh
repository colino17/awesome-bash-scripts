#!/bin/bash

# script for renaming files based on the names of files in a different directory
# "old" directory is for the files that you want to use the names of
# "new" directory is for the files that you want to rename using the old names
# "out" directory is the output directory

mkdir -p out

oldpaths=(old/*.wma)              # save original file names in array
oldnames=("${oldpaths[@]##*/}")   # remove leading path components
name=("${oldnames[@]%.*}")        # remove extension
new=(new/*.wma)                   # save new file names in array
for i in "${!new[@]}"             # for each index in the list of array indices 
do                                
cp "${new[$i]}" out/"${name[$i]}".wma # copy new files with old names to out
done
