#!/bin/bash
set -e
if [ ! -f postcodes-nl.7z ]; then
  cp ../bagconv/dist/postcodes-nl.7z .
fi
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl.php postcodes-nl.7z postcodes-nl.sh

