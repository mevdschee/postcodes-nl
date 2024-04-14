#!/bin/bash
wget berthub.eu/bagconv/pcodes.zip 
zcat pcodes.zip | php minimize.php | 7z a postcodes-nl.7z -sipostcodes-nl.csv
newTag=$(date '+v%y.%m')
gh release delete $newTag
gh release create $newTag postcodes-nl.php postcodes-nl.7z postcodes-nl.sh