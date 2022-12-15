<?php

session_start();
error_reporting(0);
include './connect.php';

function bioData($json) {
    $_SESSION['bioData'] = $json;
    echo 'stored';
}

function academicData($json) {
    $_SESSION['academicData'] = $json;
    echo 'stored';
}

function sportData($json) {
    $_SESSION['sportData'] = $json;
    addBioData_AcademicData_SportData();
}

function addBioData_AcademicData_SportData() {
    $biodata = json_decode($_SESSION['bioData']);
    $academicdata = json_decode($_SESSION['academicData']);
    $sportdata = json_decode($_SESSION['sportData']);

// bio data = 
    $fname = $biodata[0];
    $sname = $biodata[1];
    $lname = $biodata[2];
    $gender = $biodata[3];
    $nationality = $biodata[4];
    $county = $biodata[5];
    $dob = $biodata[6];
    $id = $biodata[7];
    $phone = $biodata[8];
    $email = $biodata[9];

// academic data
    $primary_name = $academicdata[0];
    $primary_grade = $academicdata[1];
    $high_name = $academicdata[2];
    $high_grade = $academicdata[3];
    $campus_name = $academicdata[4];
    $campus_regno = $academicdata[5];

//sports data
    $main_sport = $sportdata[0];
    $duration_sport = $sportdata[1];
    $other_sport = $sportdata[2];



    $sql = "
         INSERT INTO `athletes`
         (`first_name`, `second_name`, `last_name`,`gender`, `nationality`, `county`, 
         `dob`, `national_id`, `phone_no`, `email`, `primary_name`, `primary_grade`,
         `secondary_name`, `secondary_grade`, `institiution_id`, `regno`, `current_year_of_study`, `sport_id`,
         `sport_duration`, `other_sports`, `personal_photo`, `birth_certificate`, `national_id_front`, `national_id_back`,
         `student_id`, `nhif_photo`, `high_school_cert`, `password`, `status`)
         VALUES 
         ('$fname','$sname','$lname','$gender','$nationality','$county',
           '$dob','$id','$phone','$email','$primary_name','$primary_grade',
           '$high_name','$high_grade','$campus_name','$campus_regno','-','$main_sport',
           '$duration_sport','$other_sport','--personal-photo--','--birth-certificate--','--national-id-front--',
               '--national-id-back--',
            '--student-id--','--nhif-photo--','--high-school-cert--','$id',0
          );
             ";

    $sql_confirm = "SELECT * FROM `athletes` WHERE `national_id` = $id";

    $con = connect();
    $results_confirm = $con->query($sql_confirm);

    $rows = $results_confirm->num_rows;

    if ($rows === 0) {
        $con->query($sql);

        if ($con->error) {
            echo $con->error . '<br>' . $_SESSION['bioData'] . $_SESSION['academicData'] . $_SESSION['sportData'];
        } else {
            $_SESSION['registree_id'] = $id;
            $_SESSION['bioData'] = '';
            $_SESSION['academicData'] = '';
            $_SESSION['sportData'] = '';
            echo 'success';
        }
    } else {
        echo 'You are already Registered. Please <a href="./">Click here<a> login to your portal';
    }
}

function loadUniversities() {
    $con = connect();
    $sql = "SELECT `institiution_id`,`institiution_name` FROM `institiution` order by `institiution_name` asc";
    $opt = "<option>--Select your Institution --</option>";

    $result = $con->query($sql);

    $rows = $result->num_rows;
    $id = '';
    $name = '';
    for ($a = 0; $a < $rows; $a++) {
        $result->data_seek($a);
        $id = $result->fetch_assoc()['institiution_id'];
        $result->data_seek($a);
        $name = $result->fetch_assoc()['institiution_name'];
        $opt.="<option value='" . $id . "'>" . $name . "</option>";
    }
    echo $opt;
}

function loadSports() {
    $con = connect();
    $sql = "SELECT `sport_id`, `sport_name` FROM `sports` order by `sport_name` asc";
    $result = $con->query($sql);
    $rows = $result->num_rows;
    $index = array();
    $names = array();
    for ($a = 0; $a < $rows; $a++) {
        $result->data_seek($a);
        $index[$a] = $result->fetch_assoc()['sport_id'];
        $result->data_seek($a);
        $names[$a] = $result->fetch_assoc()['sport_name'];
    }
    $result = array();
    $result[0] = json_encode($index);
    $result[1] = json_encode($names);
    echo json_encode($result);
}

function uploadDocument($json) {
    $data = json_decode($json);

    $sql = "";
    $id = $_SESSION['registree_id'];

    if ($data[0] === 'personalPhoto') {
        $sql = "UPDATE `athletes` SET `personal_photo` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'birthCertificate') {
        $sql = "UPDATE `athletes` SET `birth_certificate` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'idFront') {
        $sql = "UPDATE `athletes` SET `national_id_front` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'idBack') {
        $sql = "UPDATE `athletes` SET `national_id_back` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'studentId') {
        $sql = "UPDATE `athletes` SET `student_id` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'highCert') {
        $sql = "UPDATE `athletes` SET `high_school_cert` = '$data[1]' where `national_id` = '$id';";
    }// else if ($data[0] === '') {
//   $sql = "UPDATE `athletes` SET `personal_photo` = '$data[1]' where `national_id` = '$id';";
// }

    $con = connect();
    $con->query($sql);
    if ($con->error) {
        echo $con->error;
    } else {
        echo 'success';
    }
}

//
//============================================= =
//
//  HOD STUFF
//
//============================================= =
function bioDataHOD($json) {
    $_SESSION['bioDataHOD'] = $json;
    echo 'stored';
}

function academicDataHOD($json) {
    $_SESSION['academicDataHOD'] = $json;
    echo 'stored';
}

function sportDataHOD($json) {
    $_SESSION['sportDataHOD'] = $json;
    addBioData_AcademicData_SportDataHOD();
}

function addBioData_AcademicData_SportDataHOD() {

    $biodata = json_decode($_SESSION['bioDataHOD']);
    $academicdata = json_decode($_SESSION['academicDataHOD']);
    $sportdata = json_decode($_SESSION['sportDataHOD']);

// bio data = 
    $fname = $biodata[0];
    $sname = $biodata[1];
    $lname = $biodata[2];
    $gender = $biodata[3];
    $nationality = $biodata[4];
    $county = $biodata[5];
    $dob = $biodata[6];
    $id = $biodata[7];
    $phone = $biodata[8];
    $email = $biodata[9];

// academic data
    $primary_name = $academicdata[0];
    $high_name = $academicdata[1];
    $campus_name = $academicdata[2];
    $institution = $academicdata[3];
    $campus_pfno = $academicdata[4];

//sports data
    $main_sport = $sportdata[0];



    $sql = "INSERT INTO `tutor`
             (
              `first_name`, `second_name`, `last_name`, `gender`, `nationality`, `county`, `dob`, `national_id`, `phone_no`, `email`,
             
              `primary_name`, `secondary_name`, `tertiary_name`, `institiution_id`, `pfno`,
            
             `sport_id`, `personal_photo`, `national_id_front`, `national_id_back`, `job_id`,`password`)
             
                VALUES (
                '$fname', '$sname', '$lname', '$gender', '$nationality', '$county', '$dob', '$id', '$phone', '$email', 
            
                '$primary_name','$high_name','$campus_name','$institution','$campus_pfno',
            
            '$main_sport', 
                
            '--personal-photo--','--nationalid-front--','--national-id-back--','--job-id--','$id');";

    $sql_confirm = "SELECT * FROM `tutor` WHERE `national_id` = $id";

    $con = connect();
    $results_confirm = $con->query($sql_confirm);

    $rows = $results_confirm->num_rows;

    if ($rows === 0) {
        $con->query($sql);

        if ($con->error) {
            echo $con->error . '<br>' . $_SESSION['bioData'] . $_SESSION['academicData'] . $_SESSION['sportData'];
        } else {
            
            echo 'success';
            require_once ('AfricasTalkingGateway.php');
$username  = "leonella1";
$apikey    = "734a4cb692897fa2413c7367a668f86be435c9e538e95a6801220082cf7f2a08";

$recipients  = $phone;
$message= 'KUSF, Congratulation! You have successifully registered as an athlete in KUSF. Your account will be actived by your HOD. Your default password id your national ID number.';

$gateway  = new AfricasTalkingGateway($username, $apikey);

try{
  
  $results = $gateway->sendMessage($recipients,$message);

  foreach ($results as $result) {
     $status=$result->status;
     $cost=$result->cost; 
    } 
}
catch ( AfricasTalkingGatewayException $e)
{
  
}
     
            $_SESSION['registreehod_id'] = $id;
            $_SESSION['bioDataHOD'] = '';
            $_SESSION['academicDataHOD'] = '';
            $_SESSION['sportDataHOD'] = '';

        }
    } else {
        echo 'You are already Registered. Please <a href="../hod/">Click here<a> login to your portal';
    }
}

function uploadDocumentHOD($json) {
    $data = json_decode($json);

    $sql = "";
    $id = $_SESSION['registreehod_id'];

    if ($data[0] === 'personalPhoto') {
        $sql = "UPDATE `tutor` SET `personal_photo` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'idFront') {
        $sql = "UPDATE `tutor` SET `national_id_front` = '$data[1]' where `national_id` = '$id';";
    } else if ($data[0] === 'idBack') {
        $sql = "UPDATE `tutor` SET `national_id_back` = '$data[1]' where `national_id` = '$id';";
    }else if ($data[0] === 'jobid') {
        $sql = "UPDATE `tutor` SET `job_id` = '$data[1]' where `national_id` = '$id';";
    }// else if ($data[0] === '') {
//   $sql = "UPDATE `athletes` SET `personal_photo` = '$data[1]' where `national_id` = '$id';";
// }

    $con = connect();
    $con->query($sql);
    if ($con->error) {
        echo $con->error;
    } else {
        echo 'success';
    }
}

?>
