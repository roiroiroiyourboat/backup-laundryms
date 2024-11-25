<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "laundry_db";

$con = new mysqli($servername, $username, $password, $dbname);

if($con->connect_error) {
    die("Connection Error: " . $con->connect_error);
}

// Enable MySQLi error reporting
// mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
?>