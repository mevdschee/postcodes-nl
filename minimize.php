<?php
$r = fopen("php://stdin", "r");
$w = fopen("php://stdout", "w");
while ($line = fgetcsv($r)) {
    fputcsv($w, array_slice($line, 0, 6));
}
fclose($r);
fclose($w);
