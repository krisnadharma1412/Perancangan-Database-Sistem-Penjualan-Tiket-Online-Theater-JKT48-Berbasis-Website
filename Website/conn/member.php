<?php

include 'connection.php';

$result = mysqli_query($conn, "SELECT MemberName, MemberBirthday, MemberPopularity, MemberImage, TeamName FROM tb_member INNER JOIN tb_team ON tb_member.TeamId = tb_team.TeamId");

if($result-> num_rows > 0){
    echo "<table>";
    while ($row = $result->fetch_assoc()){
        echo '<div class="item"><img src="../assets/member'.$row['MemberImage'].'"><h3>'.$row['MemberName'].'</h3><h4>'.$row['TeamName'].'</h4></div>';
    }
}