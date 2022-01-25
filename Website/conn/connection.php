<?php 

$server = "localhost";
$host = "root";
$pass = "";
$database = "final-project-test";

$conn = mysqli_connect($server, $host, $pass, $database);

if(mysqli_connect_errno()){
    echo "Failed to connect!";
    exit();
}

?>