<?php 
$servername = "localhost";
$username = "root";
$password = "";
$port = 3300;
$basename = "projektBaza";

$dbc = mysqli_connect($servername, $username, $password, $basename, $port);

if (!$dbc) {
    die('Error connecting to MySQL server: ' . mysqli_connect_error());
}

mysqli_set_charset($dbc, "utf8");

?>