<?php

include 'connection.php';

$result = mysqli_query($conn, "SELECT DateHeld, tb_setlist.SetlistName, tb_team.TeamName, TimeHeld, ScheduleLimit FROM tb_schedule
INNER JOIN tb_setlist ON tb_schedule.SetlistId = tb_setlist.SetlistId
INNER JOIN tb_team ON tb_setlist.TeamId = tb_team.TeamId");

if($result-> num_rows > 0){
    while ($row = $result->fetch_assoc()){
        echo '<div class="item"><div class="date"><h3>'.$row['DateHeld'].'</h3></div><div class="time"><h3>'.$row['TimeHeld'].'</h3></div>
        <div class="setlist"><a href=""><h3>'.$row['SetlistName'].' - '.$row['TeamName'].'</h3></a></div><div class="limit"><h3>'.$row['ScheduleLimit'].'</h3></div></div>';
    }
}