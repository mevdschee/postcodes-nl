#!/bin/bash
set -e
if [ ! -f postcodes-nl.7z ]; then
  if [ -f ../bagconv/dist/postcodes-nl.7z ]; then
    cp ../bagconv/dist/postcodes-nl.7z .
  else
    if [ ! -f pcodes.zip ]; then
      wget berthub.eu/bagconv/pcodes.zip
    fi
    zcat pcodes.zip | php minimize.php | 7z a postcodes-nl.7z -sipostcodes-nl.csv
    #rm pcodes.zip
  fi
fi
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl.php postcodes-nl.7z postcodes-nl.sh

