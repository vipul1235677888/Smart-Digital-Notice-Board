<?php
$host   = "localhost";
$user   = "root";
$pass   = "ro@ot$?6!5#";           // XAMPP default has no password
$db     = "notice_board_db";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>