<?php
$dsn = "mysql:host=localhost;dbname=flutter_restapi_php" ;
$user = "root";
$password = "" ;
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8', // For Arabic Language
);
try {
    $con = new PDO($dsn, $user, $password, $options);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    include 'functions.php';
} catch (PDOException $e) {
    echo  $e->getMessage();
    // echo "Connection failed: " . $e->getMessage();
}