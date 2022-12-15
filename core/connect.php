<?php

function connect() {
    $host = 'localhost';
    $user = 'root';
    $pass = 'C0n507@t@db';
    $db = 'kusa-west';

    $conn = new mysqli($host, $user, $pass, $db);

    return $conn;
}
