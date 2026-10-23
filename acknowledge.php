<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); exit();
}
include 'db.php';

$notice_id  = intval($_GET['notice_id']);
$user_id    = $_SESSION['user_id'];
$device     = mysqli_real_escape_string($conn, $_SERVER['HTTP_USER_AGENT']);

// Insert only if not already acknowledged
$check = mysqli_query($conn,
    "SELECT * FROM acknowledgements
     WHERE notice_id=$notice_id AND user_id=$user_id");

if (mysqli_num_rows($check) == 0) {
    mysqli_query($conn,
        "INSERT INTO acknowledgements (notice_id, user_id, device_info)
         VALUES ($notice_id, $user_id, '$device')");
}
header("Location: index.php");
exit();
?>