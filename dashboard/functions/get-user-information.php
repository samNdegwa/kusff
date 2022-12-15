<?php
require '../core/init.php';
$user=$_SESSION['myEmail'];
date_default_timezone_set('Africa/Nairobi');
$now = new DateTime();
$time = $now->format('H:i');
$date = $now->format('Ymd');
$sql="SELECT * FROM  athletes INNER JOIN sports ON athletes.sport_id=sports.sport_id WHERE email='$user'";
$result=mysqli_query($con,$sql) or die(mysql_error());
while($row=mysqli_fetch_array($result))
                   {
            $athlete_id=$row['athlete_id'];            
            $first=$row['first_name'];
            $second=$row['second_name'];
            $third=$row['last_name'];    
            $fname=$row['first_name'].' '.$row['second_name'].' '.$row['last_name'];
            $county=$row['county'];
            
            $uni=$row['institiution_id'];
            $country=$row['nationality'];
            $dob=$row['dob'];
            
            $id_number=$row['national_id'];
            $phone=$row['phone_no'];
            $gender=$row['gender'];
            $email=$row['email'];
            $primary=$row['primary_name'];
            $primary_grade=$row['primary_grade'];
            $highschool=$row['secondary_name'];
            $secondary_grade=$row['secondary_grade'];
            $college=$row['tertiary_name'];
            $regno=$row['regno'];
            $sport_id=$row['sport_id'];
            $other_sports=$row['other_sports'];
            $personal_photo=$row['personal_photo'];
            $national_id_front=$row['national_id_front'];
            $national_id_back=$row['national_id_back'];
            $student_id=$row['student_id'];
            $birth_certificate=$row['birth_certificate'];
            $nhif_photo=$row['nhif_photo'];
            $high_school_cert=$row['high_school_cert'];
            $sport_duration=$row['sport_duration'];
            $spot=$row['sport_name'];

            
           }


?>