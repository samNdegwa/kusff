<?php
include 'core/init.php'; 
$user=$_SESSION['myEmail'];
$valid_extensions = array('jpeg', 'jpg', 'png', 'gif','PNG','JPEG','JPG'); // valid extensions
$path = '../docs/athlete/'; // upload directory
if(!empty($_FILES['birth-image']))
{
$img = $_FILES['birth-image']['name'];
$tmp = $_FILES['birth-image']['tmp_name'];
// get uploaded file's extension
$ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));
// can upload same image using rand function
$final_image = rand(1000,1000000).$img;
// check's valid format
if(in_array($ext, $valid_extensions)) 
{ 
$path = $path.strtolower($final_image); 
if(move_uploaded_file($tmp,$path)) 
{
echo "<img src='$path' style='height:70px'/>";
$sqz=mysqli_query($con,"UPDATE athletes SET birth_certificate='$final_image' WHERE email='$user'");
//echo $insert?'ok':'err';
}
} 
else 
{
echo 'invalid';
}
}
?>