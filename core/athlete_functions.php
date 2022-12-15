<?php

session_start();
error_reporting(0);
include './connect.php';

function attemptLogin($json) {
    $json = $_POST['data'];
    $con = connect();
    $data = json_decode($json);
    $sql = "SELECT `athlete_id`, `first_name`, `second_name`, `last_name`, `gender`, `nationality`, `county`, `dob`, `national_id`, `phone_no`, `email`,
        `primary_name`, `primary_grade`, `secondary_name`, `secondary_grade`, `institiution_name`,`athletes`.`institiution_id`, `regno`, `current_year_of_study`,
        `sport_name`, `sport_duration`, `other_sports`, `personal_photo`, `birth_certificate`, `national_id_front`, `national_id_back`, `student_id`, `nhif_photo`, `high_school_cert`, `password`, `status` FROM `athletes`
inner join institiution on institiution.institiution_id = athletes.institiution_id
inner join sports on sports.sport_id = athletes.sport_id
WHERE  `email`='$data[0]' and `password`='$data[1]';";

    $result = $con->query($sql);
    $rows = $result->num_rows;

    $data_bio = array();
    $data_aca = array();
    $data_spo = array();
    $data_doc = array();

    if ($rows === 0) {
        echo 'failed';
    } else {
        $_SESSION['athlete_id'] = 'true';
        $_SESSION['athlete_name'] = 'true';
        $_SESSION['athlete_login'] = 'true';
        for ($a = 0; $a < $rows; $a++) {
            $result->data_seek($a);
            $_SESSION['athlete_id'] = $result->fetch_assoc()['athlete_id'];
            $result->data_seek($a);
            $_SESSION['athlete_name'] = $result->fetch_assoc()['first_name'];
            $result->data_seek($a);
            $_SESSION['athlete_name'] .= ' ' . $result->fetch_assoc()['second_name'];
            $result->data_seek($a);
            $data_bio[0] = $result->fetch_assoc()['first_name'];
            $result->data_seek($a);
            $data_bio[1] = $result->fetch_assoc()['second_name'];
            $result->data_seek($a);
            $data_bio[2] = $result->fetch_assoc()['last_name'];
            $result->data_seek($a);
            $data_bio[3] = $result->fetch_assoc()['gender'];
            $result->data_seek($a);
            $data_bio[4] = $result->fetch_assoc()['nationality'];
            $result->data_seek($a);
            $data_bio[5] = $result->fetch_assoc()['county'];
            $result->data_seek($a);
            $data_bio[6] = $result->fetch_assoc()['dob'];
            $result->data_seek($a);
            $data_bio[7] = $result->fetch_assoc()['national_id'];
            $result->data_seek($a);
            $data_bio[8] = $result->fetch_assoc()['phone_no'];
            $result->data_seek($a);
            $data_bio[9] = $result->fetch_assoc()['email'];



            $result->data_seek($a);
            $data_aca[0] = $result->fetch_assoc()['primary_name'];
            $result->data_seek($a);
            $data_aca[1] = $result->fetch_assoc()['primary_grade'];
            $result->data_seek($a);
            $data_aca[2] = $result->fetch_assoc()['secondary_name'];
            $result->data_seek($a);
            $data_aca[3] = $result->fetch_assoc()['secondary_grade'];
            $result->data_seek($a);
            $data_aca[4] = $result->fetch_assoc()['institiution_name'];
            $result->data_seek($a);
            $data_aca[5] = $result->fetch_assoc()['regno'];
            $result->data_seek($a);
            $data_aca[6] = $result->fetch_assoc()['institiution_id'];


            $result->data_seek($a);
            $data_spo[0] = $result->fetch_assoc()['sport_name'];
            $result->data_seek($a);
            $data_spo[1] = $result->fetch_assoc()['sport_duration'];
            $result->data_seek($a);
            $data_spo[2] = $result->fetch_assoc()['other_sports'];


            $result->data_seek($a);
            $data_doc[0] = $result->fetch_assoc()['personal_photo'];
            $result->data_seek($a);
            $data_doc[1] = $result->fetch_assoc()['birth_certificate'];
            $result->data_seek($a);
            $data_doc[2] = $result->fetch_assoc()['national_id_front'];
            $result->data_seek($a);
            $data_doc[3] = $result->fetch_assoc()['national_id_back'];
            $result->data_seek($a);
            $data_doc[4] = $result->fetch_assoc()['student_id'];
            $result->data_seek($a);
            $data_doc[5] = $result->fetch_assoc()['high_school_cert'];
        }

        $_SESSION['bio_data_athlete'] = json_encode($data_bio);
        $_SESSION['aca_data_athlete'] = json_encode($data_aca);
        $_SESSION['spo_data_athlete'] = json_encode($data_spo);
        $_SESSION['doc_data_athlete'] = json_encode($data_doc);
        echo 'success';
    }
}

function updateBioDataAthlete($json) {
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $sql = "UPDATE `athletes`
            SET 
            `first_name`='$data[0]',
            `second_name`='$data[1]',
            `last_name`='$data[2]',
            `gender`='$data[3]',
            `nationality`='$data[4]',
            `county`='$data[5]',
            `dob`='$data[6]',
            `national_id`='$data[7]',
            `phone_no`='$data[8]',
            `email`= '$data[9]' 
            WHERE `athlete_id`='$id'";
    $con = connect();
    $con->query($sql);
    $_SESSION['bio_data_athlete'] = $json;
    echo 'success';
}

function UpdateAcademicData($json) {
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $sql = "UPDATE `athletes` SET `primary_name`='$data[0]',`secondary_name`='$data[1]' where`athlete_id`='$id'";

    $con = connect();
    $con->query($sql);
    $aca_data = json_decode($_SESSION['aca_data_athlete']);
    $aca_data[0] = $data[0];
    $aca_data[2] = $data[1];

    $_SESSION['aca_data_athlete'] = json_encode($aca_data);
    echo 'success';
}

function updateSportsData($json) {
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $sql = "UPDATE athletes set `other_sports` = '$data[0]' where `athlete_id` = '$id';";

    $con = connect();
    $con->query($sql);
    $spo_data = json_decode($_SESSION['spo_data_athlete']);
    $spo_data[2] = $data[0];
    $_SESSION['spo_data_athlete'] = json_encode($spo_data);
    echo 'success';
}

function athleteDocName($json) {
    $data = json_decode($json);
    $docs = json_decode($_SESSION['doc_data_athlete']);
    $bios = json_decode($_SESSION['bio_data_athlete']);

    if ($data[0] === 'personal_photo') {
        unlink('../docs/athlete/' . $docs[0]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    } else if ($data[0] === 'nid_front') {
        unlink('../docs/athlete/' . $docs[2]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    } else if ($data[0] === 'nid_back') {
        unlink('../docs/athlete/' . $docs[3]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    } else if ($data[0] === 'student_id') {
        unlink('../docs/athlete/' . $docs[4]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    } else if ($data[0] === 'birth_cert') {
        unlink('../docs/athlete/' . $docs[1]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    } else if ($data[0] === 'high_cert') {
        unlink('../docs/athlete/' . $docs[5]);
        $_SESSION['athlete_doc_name'] = $bios[7];
    }
    echo 'set';
}

function updateDocName($json) {
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $docs = json_decode($_SESSION['doc_data_athlete']);
    $sql = "";
    $con = connect();
    if ($data[0] === 'personal_photo') {
        $sql = "update athletes set `personal_photo` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[0] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    } else if ($data[0] === 'nid_front') {
        $sql = "update athletes set `national_id_front` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[2] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    } else if ($data[0] === 'nid_back') {
        $sql = "update athletes set `national_id_back` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[3] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    } else if ($data[0] === 'student_id') {
        $sql = "update athletes set `student_id` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[4] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    } else if ($data[0] === 'birth_cert') {
        $sql = "update athletes set `birth_certificate` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[1] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    } else if ($data[0] === 'high_cert') {
        $sql = "update athletes set `high_school_cert` = '$data[1]' where `athlete_id` = '$id'";
        $con->query($sql);
        $docs[5] = $data[1];
        $_SESSION['doc_data_athlete'] = json_encode($docs);
    }
    echo json_encode([$data[1]]);
}

function newEvents() {
    $con = connect();
    $rs = '';
    $sql = "SELECT `event_id`, `event_name`, `event_type`, `event_venue`, `event_date`,`fee_applicable`, `event_stamp` FROM `events` order by `event_id` desc";
    $id = $_SESSION['athlete_id'];

    $sql1 = "SELECT `event_id` FROM `event_applications` WHERE `athlete_id` = '$id'";
    $rs1 = $con->query($sql1);
    $rows1 = $rs1->num_rows;
    $array = array();

    for ($c = 0; $c < $rows1; $c++) {
        $rs1->data_seek($c);
        $array[$c] = $rs1->fetch_assoc()['event_id'];
    }

    $result = $con->query($sql);
    $rows = $result->num_rows;
    $event_stamp = '';
    $stamp = getTime('year') . getTime('month') . getTime('day');
    $stampint = (int) $stamp;
    $b = 0;
    $fee = '';
    for ($a = 0; $a < $rows; $a++) {
        $result->data_seek($a);
        $event_stamp = $result->fetch_assoc()['event_stamp'];
        $result->data_seek($a);
        $event_id = $result->fetch_assoc()['event_id'];
        $event_stampint = (int) $event_stamp;

        if (array_search($event_id, $array) === FALSE) {
            if ($stampint < $event_stampint) {
                $rs.='<tr><td>' . ($b + 1) . '</td>';
                $result->data_seek($a);
                $rs.='<td>' . $result->fetch_assoc()['event_name'] . '</td>';
                $result->data_seek($a);
                $rs.='<td>' . $result->fetch_assoc()['event_type'] . '</td>';
                $result->data_seek($a);
                $rs.='<td>' . $result->fetch_assoc()['event_venue'] . '</td>';
                $result->data_seek($a);
                $rs.='<td>' . $result->fetch_assoc()['event_date'] . '</td>';
                $result->data_seek($a);
                $fee = $result->fetch_assoc()['fee_applicable'];
                if ($fee === '0') {
                    $rs.='<td> Open!</td>';
                } else {
                    $rs.='<td> ' . moneyFormatter($fee) . '</td>';
                }
                $result->data_seek($a);
                $rs.='<td>
                    <button 
                    class="btn btn-sm btn-outline-success" 
                    value="' . $event_id . '">
                    Apply <i class="fa fa-star-o"></i>
                    </button>
                    </td>
                    </tr>';
                $b++;
            }
        }
    }
    if (strlen($rs) === 0) {
        $rs = '<tr>
                    <td colspan="7">
                        <p  class="text-center">
                            No Current events
                        </p>
                    </td>

                </tr>';
    }
    return json_encode([$rs, $b]);
}

function moneyFormatter($d2) {
    $data1 = number_format($d2, 2, '.', ',');
    return $data1;
}

function getTime($type) {
    date_default_timezone_set('Africa/Nairobi');
    $now = new DateTime();
    if ($type === 'time') {
        return $now->format("H:m:s");
    } else if ($type === 'year') {
        return $now->format("Y");
    } else if ($type === 'month') {
        return $now->format("m");
    } else if ($type === 'date') {
        return $now->format("Y-m-d");
    } else if ($type === 'day') {
        return $now->format("d");
    }
}

function applyEvent($json) {
    $con = connect();
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $date = getTime(date);
    $sql = "INSERT INTO 
            `event_applications`
            (`event_id`, `athlete_id`, `date_applied`, `status_approval`, `status_participate`)
            VALUES 
            ('$data[0]','$id','$date','0','0')";

    $con->query($sql);

    if ($con->error) {
        echo json_encode([$con->error]);
    } else {
        $response = array();
        $response[0] = 'success';
        $response[1] = newEvents();

        echo json_encode($response);
    }
}

function loadAppliedEvents($f) {
    $con = connect();
    $id = $_SESSION['athlete_id'];
    $sql = "select
            events.event_name,
            events.event_type,
            events.fee_applicable,
            events.event_venue,
            event_applications.date_applied,
            event_applications.id,
            event_applications.status_approval,
            event_applications.status_participate
            from event_applications
            inner join events
            on events.event_id = event_applications.event_id 
            where
            event_applications.athlete_id = '$id'
            ";

    if ($f === 'Awaiting Approval Events') {
        $sql.=" and
            event_applications.status_approval = 0 and
            event_applications.status_participate = 0
            order by 
            id desc";
    } else if ($f === 'Approved Events') {
        $sql.=" and
            event_applications.status_approval = 1
            order by 
            id desc";
    } else if ($f === 'Participated Events') {
        $sql.=" and
            event_applications.status_approval = 1 and
            event_applications.status_participate = 1
            order by 
            id desc";
    } else if ($f === 'Un-Participated Events') {
        $sql.=" and
            event_applications.status_approval = 1 and
            event_applications.status_participate = 2
            order by 
            id desc";
    } else {
        $sql.=" 
            order by 
            id desc";
    }

    $rs = "";
    $res = $con->query($sql);
    $rows = $res->num_rows;
    $app = '';
    $pat = '';
    $stat = '';
    $fee = '';
    for ($a = 0; $a < $rows; $a++) {
        $rs.='<tr><td>' . ($a + 1) . '</td>';
        $res->data_seek($a);
        $rs.='<td>' . $res->fetch_assoc()['event_name'] . '</td>';
        $res->data_seek($a);
        $rs.='<td>' . $res->fetch_assoc()['event_type'] . '</td>';
        $res->data_seek($a);
        $rs.='<td>' . $res->fetch_assoc()['event_venue'] . '</td>';
        $res->data_seek($a);
        $rs.='<td>' . $res->fetch_assoc()['date_applied'] . '</td>';

        $res->data_seek($a);
        $app = $res->fetch_assoc()['status_approval'];
        $res->data_seek($a);
        $pat = $res->fetch_assoc()['status_participate'];
        if ($app === '0' && $pat === '0') {
            $stat = '<span class="text-danger">Awaiting approval</span>';
        } else if ($app === '1' && $pat === '0') {
            $stat = '<span class="text-primary">Approved awaiting Participation</span>';
        } else if ($app === '1' && $pat === '1') {
            $stat = '<span class="text-success">Approved and Participated</span>';
        } else if ($app === '1' && $pat === '2') {
            $stat = '<span class="text-secondary">Approved and not Participated</span>';
        }
        $rs.='<td>' . $stat . '</td>';
        $res->data_seek($a);
        $fee = $res->fetch_assoc()['fee_applicable'];
        if ($fee === '0') {
            $rs.='<td> Open!</td>';
        } else {
            $rs.='<td> ' . moneyFormatter($fee) . '</td>';
        }
        $res->data_seek($a);
        if ($app === '0' && $pat === '0') {
            $rs.='<td><button value="' . $res->fetch_assoc()['id'] . '"  class="btn btn-sm btn-outline-success">Un-apply <i class="fa fa-star"></i></button></td></tr>';
        } else {
            $rs.='<td><button value="' . $res->fetch_assoc()['id'] . '" disabled class="btn btn-sm btn-outline-success">Un-apply <i class="fa fa-ban"></i></button></td></tr>';
        }
    }
    if (strlen($rs) === 0) {
        $rs = '<tr>
                    <td colspan="8">
                        <p  class="text-center">
                           You haven\'t applied for any events
                        </p>
                    </td>

                </tr>';
    }
    return $rs;
}

function filterEvents($json) {
    $data = json_decode($json);
   echo loadAppliedEvents($data[0]);
}

function checkPassword($json) {
    $data = json_decode($json);
    $con = connect();
    $id = $_SESSION['athlete_id'];
    $sql = "SELECT `password` FROM `athletes` WHERE `athlete_id` = '$id';";

    $rs = $con->query($sql);
    $rows = $rs->num_rows;
    $pdb = '';

    for ($a = 0; $a < $rows; $a++) {
        $rs->data_seek($a);
        $pdb = $rs->fetch_assoc()['password'];
    }

    if ($pdb === $data[0]) {
        echo json_encode(['found']);
    } else {
        echo json_encode(['not-found']);
    }
}

function updateChanges($json) {
    $con = connect();
    $data = json_decode($json);
    $id = $_SESSION['athlete_id'];
    $sql = "update athletes set password ='$data[0]' where athlete_id=$id ";
    $con->query($sql);
    if ($con->error) {
        echo json_encode(['0', $con->error]);
    } else {
        echo '1';
    }
}

function deregetserEvent($json){
    $con = connect();
    $data = json_decode($json);
    $sql = "DELETE FROM `event_applications` WHERE `id`='$data[0]';";
    $con->query($sql);
    if($con->error){
        echo json_encode(['error']);
    } else {
        $array = array();
        $array[0] = 'success';
        $array[1] = loadAppliedEvents('all');
        $array[2] = newEvents();
        
        echo json_encode($array);
    }
//    echo $sql;
}
