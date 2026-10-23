<?php
session_start();
include 'db.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = MD5($_POST['password']);

    $sql    = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        $user = mysqli_fetch_assoc($result);
        $_SESSION['user_id']  = $user['user_id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role']     = $user['role'];
        header("Location: index.php");
        exit();
    } else {
        $error = "Invalid username or password!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login — Notice Board</title>
  <link rel="stylesheet" href="style.css">
</head>
<body class="login-page">
<div class="login-box">

  <div class="login-logo">📋</div>
  <h2>Digital Notice Board</h2>
  <h3>Login to your account</h3>

  <?php if ($error): ?>
    <div class="error"><?= $error ?></div>
  <?php endif; ?>

  <form method="POST">
    <input type="text"     name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>

  <p style="text-align:center;margin-top:20px;
             font-size:13px;color:#475569">
    New student?
    <a href="register.php"
       style="color:#38BDF8;font-weight:600">Create an account</a>
  </p>

</div>
</body>
</html>