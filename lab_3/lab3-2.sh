#!/bin/bash

catalog_name=$1

if [ -z "$catalog_name" ]
then
    catalog_name="$HOME"
fi

find "$catalog_name" -type f | sed 's/\.\/\(.*\)\/.*/\1/' | uniq | grep -v \/ | egrep -v "$(find $catalog_name -type d | egrep \.\/.+\/ | sed 's/\.\/\(.*\)\/.*/\1/' | awk '{print "^"$0"$"}' | tr '\n' '|')" 2>/dev/null || echo 'No matching directories found'

# find . -type f | sed 's/\.\/\(.*\)\/.*/\1/' | uniq | grep -v \/ | egrep -v "$(find . -type d | egrep \.\/.+\/ | sed 's/\.\/\(.*\)\/.*/\1/' | awk '{print "^"$0"$"}' | tr '\n' '|')" 2>/dev/null || echo 'No matching directories found'

# find "~/ovt/lab0/" -type f | sed 's/\.\/\(.*\)\/.*/\1/' | uniq | grep -v \/ | egrep -v "$(find "~/ovt/lab0/" -type d | egrep \.\/.+\/ | sed 's/\.\/\(.*\)\/.*/\1/' | awk '{print "^"$0"$"}' | tr '\n' '|')" 2>/dev/null || echo 'No matching directories found'