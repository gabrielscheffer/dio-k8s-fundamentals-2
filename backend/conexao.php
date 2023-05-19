<?php
$servername = "dio-db";
$username = "root";
$password = "qwerty.1234"; // gitleaks:allow
$database = "desafio2";

// Criar conexão


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>
