<?php

include 'config.php';

session_start();

$st = $_SESSION['status'];
$uid = $_SESSION['user_id'];
$query = "UPDATE login_details SET status = '$st'
WHERE user_id = '$uid'";

echo $st.' '.$uid;
mysqli_query($con,$query);

?>