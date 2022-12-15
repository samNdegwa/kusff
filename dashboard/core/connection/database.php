<?php 
$con = mysqli_connect('localhost','root','C0n507@t@db');
if(!$con)
{
	echo 'Not connected to server. ';
}
if (!mysqli_select_db($con,'kusa-west'))
{
	echo 'Database Failure';
}

?>