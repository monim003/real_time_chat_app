<?php

include 'config.php';
session_start();
if(isset($_SESSION['user_id']))
{
 header('location:index.php');
}
$message = '';

if(isset($_POST['login']))
{
	//$username = $_POST['username'];
	$query = "SELECT * FROM login WHERE username='".$_POST['username']."'";
	$res = mysqli_query($con,$query);
	$count = mysqli_num_rows($res);
	if($count>0)
	{
		foreach($res as $row)
		{
			if(password_verify($_POST['password'], $row['password']))
			{
				$_SESSION['user_id'] = $row['user_id'];
				$_SESSION['username'] = $row['username'];
				$sub_query = "INSERT into login_details(user_id) VALUES('".$row['user_id']."')";
				$res = mysqli_query($con,$sub_query);
				$_SESSION['login_details_id'] = mysqli_insert_id($con);
				$_SESSION['status'] = 1;
				header('location:index.php');
			}
			else
			{
				$message = '<label>Wrong Password</label>';
			}
		}
	}
	else
	{
		$message = '<label>Wrong Username</label>';
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Chat Application</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<br />
		<h3 align="center">Chat Application</a></h3><br />
		<br />
		<div class="panel panel-default">
			<div class="panel-heading">Login</div>
			<div class="panel-body">
				<p class="text-danger"><?php echo $message; ?></p>
				<form method="post">
					<div class="form-group">
						<label>Enter Username</label>
						<input type="text" name="username" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Enter Password</label>
						<input type="password" name="password" class="form-control" required="">
					</div>
					<div class="form-group">
						<input type="submit" name="login" class="btn btn-info" value="Login" />
					</div>
					<div align="center">
                         <a href="register.php">Register</a>
                      </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>