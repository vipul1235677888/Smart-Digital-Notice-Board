<?php
session_start();
include 'db.php';

// Redirect if already logged in
if (isset($_SESSION['user_id'])) {
    header("Location: index.php"); exit();
}

$success = $error = "";
$depts = mysqli_query($conn, "SELECT * FROM departments ORDER BY dept_name");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, trim($_POST['username']));
    $email    = mysqli_real_escape_string($conn, trim($_POST['email']));
    $password = $_POST['password'];
    $confirm  = $_POST['confirm_password'];
    $dept_id  = intval($_POST['dept_id']);

    // Validation
    if (empty($username) || empty($email) || empty($password)) {
        $error = "All fields are required.";
    } elseif ($password !== $confirm) {
        $error = "Passwords do not match.";
    } elseif (strlen($password) < 6) {
        $error = "Password must be at least 6 characters.";
    } else {
        // Check if username or email already exists
        $check = mysqli_query($conn,
            "SELECT user_id FROM users
             WHERE username='$username' OR email='$email'");
        if (mysqli_num_rows($check) > 0) {
            $error = "Username or email already exists.";
        } else {
            $hashed = MD5($password);
            $sql = "INSERT INTO users
                        (username, email, password, role, dept_id)
                    VALUES
                        ('$username', '$email', '$hashed',
                         'student', $dept_id)";
            if (mysqli_query($conn, $sql)) {
                $success = "Account created successfully! You can now login.";
            } else {
                $error = "Error: " . mysqli_error($conn);
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register — Notice Board</title>
  <link rel="stylesheet" href="style.css">
</head>
<body class="login-page">
<div class="login-box" style="max-width:460px">
  <div class="login-logo">📋</div>
  <h2>Create Account</h2>
  <h3>Register as a Student</h3>

  <?php if ($success): ?>
    <div class="success"><?= $success ?>
      <br><a href="login.php"
             style="color:#10B981;font-weight:700">→ Go to Login</a>
    </div>
  <?php endif; ?>
  <?php if ($error): ?>
    <div class="error"><?= $error ?></div>
  <?php endif; ?>

  <?php if (!$success): ?>
  <form method="POST">
    <input type="text" name="username"
           placeholder="Username"
           value="<?= htmlspecialchars($_POST['username'] ?? '') ?>"
           required>
    <input type="email" name="email"
           placeholder="Email address"
           value="<?= htmlspecialchars($_POST['email'] ?? '') ?>"
           required>

    <select name="dept_id" required
            style="width:100%;padding:12px 16px;margin-bottom:14px;
                   background:#060203;border:1px solid #4E2026;
                   border-radius:10px;font-size:14px;color:#4E2026;
                   transition:border-color 0.2s;appearance:none;
                   -webkit-appearance:none;">
      <option value="" style="color:#4E2026;background:#060203">
        Select your Department
      </option>
      <?php while ($d = mysqli_fetch_assoc($depts)): ?>
        <option value="<?= $d['dept_id'] ?>"
                style="color:#f0e8e8;background:#2A1114"
          <?= (isset($_POST['dept_id']) &&
               $_POST['dept_id']==$d['dept_id']) ? 'selected':'' ?>>
          <?= $d['dept_name'] ?>
        </option>
      <?php endwhile; ?>
    </select>

    <input type="password" name="password"
           placeholder="Password (min 6 chars)" required>
    <input type="password" name="confirm_password"
           placeholder="Confirm Password" required>

    <button type="submit">Create Account</button>
  </form>
  <?php endif; ?>

  <p style="text-align:center;margin-top:20px;
             font-size:13px;color:#475569">
    Already have an account?
    <a href="login.php" style="color:#38BDF8;font-weight:600">Login</a>
  </p>
</div>
</body>
</html>