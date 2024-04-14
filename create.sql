CREATE DATABASE `postcodes` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'postcodes'@'localhost' IDENTIFIED BY 'postcodes';
GRANT ALL PRIVILEGES ON `postcodes`.* TO 'postcodes'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;