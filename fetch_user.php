<?php

include 'config.php';

session_start();

$query = "SELECT * FROM login WHERE user_id!= '".$_SESSION['user_id']."'";

$res = mysqli_query($con,$query);

$output = '
<table class="table table-borderd table-striped">
   <tr>
     <td>Username</td>
     <td>Status</td>
     <td>Action</td>
   </tr>
';

foreach($res as $row)
{
	$status = '';
	$sub_query = "SELECT status FROM login_details WHERE user_id = '".$row['user_id']."'";
	$sub_res = mysqli_query($con,$sub_query);
	
	while ($r = mysqli_fetch_assoc($sub_res)) {
		$user_status =  $r['status'];
	}
	$user = "0";
	if(strcmp($user_status,$user)==0)
	{
		$status = '<span class="label label-danger">Offline</span>';
	}
	else
	{
		$status = '<span class="label label-success">Online</span>';
	}
	$output .= '
	<tr>
	   <td>'.$row['username'].' '.count_unseen_message($row['user_id'],$_SESSION['user_id'],$con).' '.fetch_is_type_status($row['user_id'],$con).'</td>
	   <td>'.$status.'</td>
	   <td><button type="button" class="btn btn-info btn-xs
	   start_chat" data-touserid="'.$row['user_id'].'"
	   data-tousername="'.$row['username'].'">Start Chat</button></td>
	</tr>
	';
}

$output .= '</table>';

echo $output;

?>