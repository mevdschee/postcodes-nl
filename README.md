# Postcodes NL

Dutch postcodes in CSV format (7zip) and MySQL import script

Check out the [latest release](https://github.com/mevdschee/postcodes-nl/releases).

## Files

The release contains the following files:

- **`postcodes-nl.7z`**: Dataset in CSV format with 7zip compression
- **`postcodes-nl.php`**: Script to load the CSV into a MySQL database
- **`postcodes-nl.sh`**: Script to unpack the 7zip archive and run PHP

NB: The CSV dataset is 341MB but with 7zip compression it is reduced to 15MB.

## Running

Configure your database in `postcodes-nl.php` and run using:

    bash postcodes-nl.sh

To run you need:

    sudo apt install 7zip php-cli php-mysql

This assumes you are using a Debian based Linux distribution.

## Releasing

Release using:

    bash release.sh

To release you need:

    sudo apt install 7zip wget php-cli gh

This uses the Github CLI on Debian Linux.

## Sample data

Here are the first 3 records of the 24.04 release in CSV format:

    straat,huisnummer,huisletter,huistoevoeging,woonplaats,postcode
    "De Ruijterkade",99,,,Amsterdam,1011AB
    "De Ruijterkade",105,,1,Amsterdam,1011AB
    "De Ruijterkade",105,,2,Amsterdam,1011AB

Here is the SQL for those 3 records (including the table structure):

    CREATE TABLE `postcodes` (
    `straat` varchar(255) DEFAULT NULL,
    `huisnummer` varchar(255) DEFAULT NULL,
    `huisletter` varchar(255) DEFAULT NULL,
    `huistoevoeging` varchar(255) DEFAULT NULL,
    `woonplaats` varchar(255) DEFAULT NULL,
    `postcode` varchar(255) DEFAULT NULL,
    KEY `postcode` (`postcode`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    
    INSERT INTO `postcodes` (`straat`, `huisnummer`, `huisletter`, `huistoevoeging`, `woonplaats`, `postcode`) VALUES
    ('De Ruijterkade',	'99',	NULL,	NULL,	'Amsterdam',	'1011AB'),
    ('De Ruijterkade',	'105',	NULL,	'1',	'Amsterdam',	'1011AB'),
    ('De Ruijterkade',	'105',	NULL,	'2',	'Amsterdam',	'1011AB');

NB: The 24.04 release has 9771442 records.

## Credits

This project loads the smallest dataset from:

- [github.com/berthubert/bagconv](https://github.com/berthubert/bagconv)

See also [this blog post](https://berthub.eu/articles/posts/dutch-postcode-and-building-database/) by Bert Hubert.
