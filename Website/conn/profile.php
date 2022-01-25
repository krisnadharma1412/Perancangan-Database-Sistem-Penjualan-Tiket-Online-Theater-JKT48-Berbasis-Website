<?php

include 'connection.php';

$result = mysqli_query($conn, "SELECT * FROM tb_fans WHERE email='".$_GET['email']."' && password='".$_GET['password']."'");

if($result-> num_rows > 0){
    echo "<table>";
    while ($row = $result->fetch_assoc()){
        echo ;
    }
}