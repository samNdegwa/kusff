<?php

include './register_functions.php';


if (isset($_POST['techfy'])) {
    $techfy = $_POST['techfy'];

    /*
      ----------------------------------------------------------
      Athlete Register Custom API
      ----------------------------------------------------------
     */
    if ($techfy === 'bio-data') {
        $json = $_POST['data'];
        bioData($json);
    } else if ($techfy === 'academicData') {
        $json = $_POST['data'];
        academicData($json);
    } else if ($techfy === 'loadUniversities') {
        loadUniversities();
    } else if ($techfy === 'loadSports') {
        loadSports();
    } else if ($techfy === 'sportData') {
        $json = $_POST['data'];
        sportData($json);
    } else if ($techfy === 'uploadDocument') {
        $json = $_POST['data'];
        uploadDocument($json);
    } else if($techfy === 'loadSavedBioData'){
        echo  $_SESSION['bioData'];
    }

    /*
      ----------------------------------------------------------
      HOD Register Custom API
      ----------------------------------------------------------
     */ else if ($techfy === 'bio-data-hod') {
        $json = $_POST['data'];
        bioDataHOD($json);
    } else if ($techfy === 'academicData-hod') {
        $json = $_POST['data'];
        academicDataHOD($json);
    } else if ($techfy === 'loadSports-hod') {
        loadSportsHOD();
    } else if ($techfy === 'sportData-hod') {
        $json = $_POST['data'];
        sportDataHOD($json);
    }
    else if ($techfy === 'uploadDocumentHOD') {
        $json = $_POST['data'];
        uploadDocumentHOD($json);
    }
}
?>