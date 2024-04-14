# postcodes-nl

To build you need:

    sudo apt install 7zip wget php-cli gh

To run you need:

    sudo apt install 7zip php-cli php-mysql

Build using:

    bash release

Run using:

    bash postcodes-nl.sh

Configure your database in `postcodes-nl.php`.

### Sample data

Here are the first 3 records of the 24.04 release:

    straat,huisnummer,huisletter,huistoevoeging,woonplaats,postcode
    "De Ruijterkade",99,,,Amsterdam,1011AB
    "De Ruijterkade",105,,1,Amsterdam,1011AB
    "De Ruijterkade",105,,2,Amsterdam,1011AB

Here is the SQL for those 3 records:

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
    ('De Ruijterkade',	'99',	'',	'',	'Amsterdam',	'1011AB'),
    ('De Ruijterkade',	'105',	'',	'1',	'Amsterdam',	'1011AB'),
    ('De Ruijterkade',	'105',	'',	'2',	'Amsterdam',	'1011AB');

NB: The 24.04 release has 9771442 records.

### Credits

This project allows to load a minimal set of data from:

- [github.com/berthubert/bagconv](https://github.com/berthubert/bagconv)

And also makes it even smaller by only having 6 columns.

See also [this blog post](https://berthub.eu/articles/posts/dutch-postcode-and-building-database/) by Bert Hubert.