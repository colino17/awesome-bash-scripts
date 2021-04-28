#!/bin/sh

# Source: https://github.com/ryanoasis/public-bash-scripts/blob/master/searching-files/find-duplicate-files.sh
# Usage: "./find-duplicates.sh"

find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate
