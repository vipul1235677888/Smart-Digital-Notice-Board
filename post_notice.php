<?php
session_start();
if (!isset($_SESSION['user_id']) ||
    !in_array($_SESSION['role'], ['admin','staff'])) {
    header("Location: index.php"); exit();
}
include 'db.php';

$success = $error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title    = mysqli_real_escape_string($conn, $_POST['title']);
    $content  = mysqli_real_escape_string($conn, $_POST['content']);
    $priority = $_POST['priority'];
    $dept_id  = $_POST['dept_id']   ?: "NULL";
    $end_date = $_POST['end_date']  ?: "NULL";
    $user_id  = $_SESSION['user_id'];
    $start    = date('Y-m-d');

    $sql = "INSERT INTO notices
            (user_id, dept_id, title, content, priority, start_date, end_date)
            VALUES ($user_id, $dept_id, '$title', '$content',
                    '$priority', '$start', " .
            ($end_date == "NULL" ? "NULL" : "'$end_date'") . ")";

    if (mysqli_query($conn, $sql)) {
        $notice_id = mysqli_insert_id($conn);
        // Tag categories
        if (!empty($_POST['categories'])) {
            foreach ($_POST['categories'] as $cat_id) {
                mysqli_query($conn,
                    "INSERT INTO notice_categories VALUES ($notice_id, $cat_id, NOW())");
            }
        }
        $success = "Notice posted successfully!";
    } else {
        $error = "Error: " . mysqli_error($conn);
    }
}

$depts = mysqli_query($conn, "SELECT * FROM departments");
$cats  = mysqli_query($conn, "SELECT * FROM categories");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Post Notice</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Post a New Notice</h2>
  <a href="index.php" class="btn-logout">← Back</a>
</div>
<div class="container">
  <div class="form-box">
    <?php if ($success): ?>
      <p class="success"><?= $success ?></p>
    <?php endif; ?>
    <?php if ($error): ?>
      <p class="error"><?= $error ?></p>
    <?php endif; ?>
    <form method="POST">
      <label>Title</label>
      <input type="text" name="title" required>

      <label>Content</label>
      <textarea name="content" rows="5" required></textarea>

      <label>Priority</label>
      <select name="priority">
        <option value="urgent">Urgent</option>
        <option value="normal" selected>Normal</option>
        <option value="low">Low</option>
      </select>

      <label>Department (optional)</label>
      <select name="dept_id">
        <option value="">All Departments</option>
        <?php while ($d = mysqli_fetch_assoc($depts)): ?>
          <option value="<?= $d['dept_id'] ?>"><?= $d['dept_name'] ?></option>
        <?php endwhile; ?>
      </select>

      <label>End Date (optional)</label>
      <div style="position:relative">
        <input type="date" name="end_date"
               id="endDatePicker"
               value="<?= isset($_POST['end_date']) ? $_POST['end_date'] : '' ?>"
               min="<?= date('Y-m-d') ?>"
               onclick="this.showPicker()"
               style="cursor:pointer">
      </div>
      <span class="date-hint">📅 Leave empty for no expiry date</span>

      <label>Categories</label>
      <div class="checkbox-group">
        <?php while ($c = mysqli_fetch_assoc($cats)): ?>
          <label class="check-label">
            <input type="checkbox" name="categories[]"
                   value="<?= $c['cat_id'] ?>">
            <?= $c['cat_name'] ?>
          </label>
        <?php endwhile; ?>
      </div>

      <button type="submit">Post Notice</button>
    </form>
  </div>
</div>
</body>
</html>