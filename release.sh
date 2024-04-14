#!/bin/bash
set -e
if [ ! -f pcodes.zip ]; then
  wget berthub.eu/bagconv/pcodes.zip 
fi
zcat pcodes.zip | php minimize.php | 7z a postcodes-nl.7z -sipostcodes-nl.csv
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl.php postcodes-nl.7z postcodes-nl.sh
rm pcodes.zip