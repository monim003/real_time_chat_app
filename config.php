<?php

$con = mysqli_connect("localhost","root","","chat");

function fetch_user_chat_history($from_user_id, $to_user_id, $con)
{
	$query = "SELECT * from chat_message
	WHERE (from_user_id = '".$from_user_id."' AND to_user_id = '".$to_user_id."') OR (from_user_id = '".$to_user_id."' AND to_user_id = '".$from_user_id."')
	ORDER BY timestamp DESC";

	$res = mysqli_query($con, $query);
	$output = '<ul class="list-unstyled">';
	foreach($res as $row)
	{
		$user_name = '';
		if($row['from_user_id'] == $from_user_id)
		{
			$user_name = '<b class="text-success">You</b>';
		}
		else
		{
			$user_name = '<b class="text-danger">'.get_user_name($row['from_user_id'], $con).'</br>';
		}
		$output .= '<li style="border-bottom:1px dotted #ccc">
		<p>'.$user_name.' - '.$row['chat_message'].'
		<div align="right">
		 - <small><em>'.$row['timestamp'].'</em></small>
		</div>
		</p>
		</li>';
	}
	$output .= '</ul>';
	$query = "UPDATE chat_message
	SET status = '0'
	WHERE from_user_id = '$to_user_id'
	AND to_user_id = '$from_user_id'
	AND status = '1'
	";
	mysqli_query($con,$query);
	return $output;
}
function get_user_name($user_id, $con)
{
	$query = "SELECT username from login WHERE user_id='$user_id'";
	$res = mysqli_query($con,$query);
	foreach($res as $row)
	{
		return $row['username'];
	}
}
function count_unseen_message($from_user_id,$to_user_id,$con)
{
	$query = "SELECT * FROM chat_message
	WHERE from_user_id = '$from_user_id'
	AND to_user_id = '$to_user_id'
	AND status = '1'";

	$output = '';

	$res = mysqli_query($con, $query);

	$count = mysqli_num_rows($res);

	if($count > 0)
	{
		$output = '<span class="badge badge-success">'.$count.'</span>';
	}
	return $output;
}
function fetch_is_type_status($user_id,$con)
{
	$query = "SELECT is_type
	FROM login_details WHERE user_id = '".$user_id."'
	ORDER BY last_activity DESC
	LIMIT 1";
	$result = mysqli_query($con,$query);
	$output = '';
	while($row = mysqli_fetch_assoc($result))
	{
		if($row['is_type'] == 'yes')
		{
			$output = ' - <small><em><span>Typing...</span></em></small>';
		}
	}
	return $output;
}
?>