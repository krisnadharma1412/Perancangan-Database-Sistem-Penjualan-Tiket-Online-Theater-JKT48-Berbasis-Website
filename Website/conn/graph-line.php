<?php

include 'connection.php';

$q = "SELECT MONTHNAME(TransDate) AS 'Month', COUNT(*) AS Total FROM tb_detail_transaction
INNER JOIN tb_header_transaction ON tb_detail_transaction.TransId = tb_header_transaction.TransId
INNER JOIN tb_schedule ON tb_detail_transaction.ScheduleId = tb_schedule.ScheduleId
WHERE tb_schedule.SetlistId='" .$_GET['id']. "' GROUP BY MONTH(TransDate)";

$result = mysqli_query($conn, $q);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);