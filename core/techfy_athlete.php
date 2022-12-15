<?php

include './athlete_functions.php';


if (isset($_POST['techfy'])) {

    $techfy = $_POST['techfy'];
    /*
      ----------------------------------------------------------
      Athlete Custom API
      ----------------------------------------------------------
     */

    if ($techfy === 'attemptLogin') {
        $json = $_POST['data'];
        attemptLogin($json);
    } else if ($techfy === 'load_bio_data_athlete') {
        echo $_SESSION['bio_data_athlete'];
    } else if ($techfy === 'update_bio_data_athlete') {
        $json = $_POST['data'];
        updateBioDataAthlete($json);
    } else if ($techfy === 'loadAcacontent') {
        echo $_SESSION['aca_data_athlete'];
    } else if ($techfy === 'UpdateAcademicData') {
        $json = $_POST['data'];
        UpdateAcademicData($json);
    } else if ($techfy === 'loadSportsData') {
        echo $_SESSION['spo_data_athlete'];
    } else if ($techfy === 'updateSportsData') {
        $json = $_POST['data'];
        updateSportsData($json);
    } else if ($techfy === 'document-data') {
        echo $_SESSION['doc_data_athlete'];
    } else if ($techfy === 'athlete_doc_name') {
        $json = $_POST['data'];
        athleteDocName($json);
    } else if ($techfy === 'updateDocName') {
        $json = $_POST['data'];
        updateDocName($json);
    } else if ($techfy === 'newEvents') {
        echo newEvents();
    } else if ($techfy === 'applyEvent') {
        $json = $_POST['data'];
        applyEvent($json);
    } else if ($techfy === 'loadEventData') {
        echo newEvents();
    } else if ($techfy === 'loadAppliedEvents') {
       echo loadAppliedEvents('All My Events');
    } else if ($techfy === 'filterEvents') {
        $json = $_POST['data'];
        filterEvents($json);
    } else if ($techfy === 'checkPassword') {
        $json = $_POST['data'];
        checkPassword($json);
    } else if ($techfy === 'updateChanges') {
        $json = $_POST['data'];
        updateChanges($json);
    } else if ($techfy === 'deregetserEvent') {
        $json = $_POST['data'];
        deregetserEvent($json);
    }
}
?>