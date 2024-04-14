<?php
// config
$hostname = 'localhost';
$username = 'postcodes';
$password = 'postcodes';
$database = 'postcodes';
// code
$dsn = "mysql:host=$hostname;dbname=$database;charset=UTF8";
$pdo = new PDO($dsn, $username, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
$sql = "CREATE TABLE IF NOT EXISTS `postcodes` (`straat` varchar(255),`huisnummer` varchar(255),`huisletter` varchar(255),`huistoevoeging` varchar(255),`woonplaats` varchar(255),`postcode` varchar(255),INDEX(`postcode`));";
$pdo->exec($sql);
$sql = "TRUNCATE TABLE `postcodes`;";
$pdo->exec($sql);
$sql = "INSERT INTO `postcodes` (`straat`,`huisnummer`,`huisletter`,`huistoevoeging`,`woonplaats`,`postcode`) VALUES(?,?,?,?,?,?);";
$statement = $pdo->prepare($sql);
$r = fopen("php://stdin", "r");
$headers = fgetcsv($r);
$i = 0;
$pdo->beginTransaction();
echo "Progress: 0%";
while ($record = fgetcsv($r)) {
    $record = array_map(function ($v) {
        return $v ?: null;
    }, $record);
    $statement->execute($record);
    $i++;
    if ($i % 100000 == 0) {
        $pdo->commit();
        $pdo->beginTransaction();
        echo sprintf("\rProgress: %d%%", $i / 100000);
    }
}
fclose($r);
$pdo->commit();
echo "\n";
