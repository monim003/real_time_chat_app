<?php
include 'config.php';

session_start();

$query = "UPDATE login_details
SET is_type = '".$_POST['is_type']."'
WHERE login_details_id = '".$_SESSION['login_details_id']."'
";
mysqli_query($con,$query);

?>