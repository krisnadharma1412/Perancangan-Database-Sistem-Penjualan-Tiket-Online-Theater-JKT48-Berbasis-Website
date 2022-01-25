<?php
include 'connection.php';

$date_param = $_POST['date'];
$time_param = $_POST['time'];
$setlist_param = $_POST['setlist'];
$slot_param = $_POST['slot'];
$id_param = $_POST['id'];
$show_param = $_POST['show'];

$sqll = "INSERT INTO tb_schedule (ScheduleId, DateHeld, TimeHeld, ScheduleLimit, SetlistId, ScheduleShow) 
    VALUES ('SD007', '$date_param', '$time_param', '$slot_param', '$setlist_param', 1)";

    if (mysqli_query($conn, $sqll)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sqll . "<br>" . mysqli_error($con);
    }