<?php

//logout.php
include 'config.php';
session_start();


$query="UPDATE login_details SET status = 0
WHERE user_id = '".$_SESSION['user_id']."'";

mysqli_query($con,$query);
session_destroy();

header('location:login.php');

?>