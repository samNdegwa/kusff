<?php
require '../core/init.php';
	$json = $_POST['data'];
	$data = json_decode($json);

	$old = $data[0];
    $new = $data[1];
    $new1 = $data[2];
    
    $dbpass = $_SESSION['mypassword'];
    $user=$_SESSION['myEmail'];
    
    if($old === $dbpass)
    {
       if($new === $new1){
        $sqz=mysqli_query($con,"UPDATE athletes SET password='$new' WHERE email='$user'");
        echo "success";
       } else {
        echo "unmatch";
       }
    } else {
        echo "wrong";
    }

?>