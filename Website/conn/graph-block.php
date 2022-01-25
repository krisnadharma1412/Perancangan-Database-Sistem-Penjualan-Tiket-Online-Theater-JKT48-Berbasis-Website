<?php

include 'connection.php';

$q = "SELECT tb_setlist.SetlistName as Name, COUNT(*) as Total FROM tb_detail_transaction
INNER JOIN tb_header_transaction ON tb_detail_transaction.TransId = tb_header_transaction.TransId
INNER JOIN tb_schedule ON tb_detail_transaction.ScheduleId = tb_schedule.ScheduleId
INNER JOIN tb_setlist ON tb_schedule.SetlistId = tb_setlist.SetlistId
GROUP BY tb_schedule.SetlistId";

$result = mysqli_query($conn, $q);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);