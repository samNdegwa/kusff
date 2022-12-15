<?php
include 'get-user-information.php';
date_default_timezone_set('Africa/Nairobi');
    $now = new DateTime();
    $hrs = $now->format('H');
    $mt = $now->format('i');
    $date = $now->format('Y-m-d  H:i');
    $json = $_POST['data'];
    $data = json_decode($json);

    $eid = $data[0];

    $sql="SELECT * FROM event_applications WHERE event_id='$eid' AND athlete_id='$athlete_id'";
    $result=mysqli_query($con,$sql) or die(mysql_error());
    $cnt=0;
    while($row=mysqli_fetch_array($result))
      {   
          $dbid=$row['event_id'];
      }

      if($eid === $dbid)
      {
        echo "exist";
      } else {

     $sqlc = "INSERT INTO `event_applications` (`event_id`,`athlete_id`,`institiution_id`,`date_applied`,`status_approval`,`status_participate`) VALUES ('$eid','$athlete_id','$uni','$date','0','0')";  
         if (!mysqli_query($con,$sqlc)){
           echo "error";
        } else {
           echo "success";
        }
    }
?>