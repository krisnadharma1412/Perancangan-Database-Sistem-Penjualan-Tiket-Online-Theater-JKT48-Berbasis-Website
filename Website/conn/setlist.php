<?php

include 'connection.php';

$result = mysqli_query($conn, "SELECT tb_setlist.SetlistId, tb_setlist.SetlistName, tb_team.TeamName FROM tb_setlist INNER JOIN tb_team ON tb_setlist.TeamId = tb_team.TeamId");

if($result-> num_rows > 0){
    echo '<select id="cars" name="setlist">';
    while ($row = $result->fetch_assoc()){
        
        echo '<option value="'.$row['SetlistId'].'">'.$row['SetlistName'].' - '.$row['TeamName'].'</option>';
        
    }
    echo '</select>';
}