#!/bin/bash

FILE_LIST=$(find dist -maxdepth 1 -type f -not -name "index.html" | sed 's|^\dist\/||' | awk '{print "<li><a href=\"" $1 "\">" $1 "</a></li>"}')

awk -v file_list="$FILE_LIST" '{gsub(/<!-- FILE_LIST_PLACEHOLDER -->/, file_list); print}' template.html > dist/index.html