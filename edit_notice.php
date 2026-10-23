<?php
session_start();
if (!isset($_SESSION['user_id']) ||
    !in_array($_SESSION['role'], ['admin','staff'])) {
    header("Location: index.php"); exit();
}
include 'db.php';

$notice_id = intval($_GET['id'] ?? 0);
$success = $error = "";

// Fetch existing notice data
$result = mysqli_query($conn,
    "SELECT * FROM notices WHERE notice_id = $notice_id");
if (mysqli_num_rows($result) == 0) {
    header("Location: manage_notices.php"); exit();
}
$notice = mysqli_fetch_assoc($result);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title    = mysqli_real_escape_string($conn, $_POST['title']);
    $content  = mysqli_real_escape_string($conn, $_POST['content']);
    $priority = $_POST['priority'];
    $end_date = $_POST['end_date'] ?: "NULL";
    $dept_id  = $_POST['dept_id'] ?: "NULL";

    $sql = "UPDATE notices SET
                title    = '$title',
                content  = '$content',
                priority = '$priority',
                dept_id  = " . ($dept_id == "NULL" ? "NULL" : $dept_id) . ",
                end_date = " . ($end_date == "NULL" ? "NULL" : "'$end_date'") . "
            WHERE notice_id = $notice_id";

    if (mysqli_query($conn, $sql)) {
        // Update categories — delete old ones first then re-insert
        mysqli_query($conn,
            "DELETE FROM notice_categories WHERE notice_id = $notice_id");
        if (!empty($_POST['categories'])) {
            foreach ($_POST['categories'] as $cat_id) {
                mysqli_query($conn,
                    "INSERT INTO notice_categories VALUES ($notice_id, $cat_id, NOW())");
            }
        }
        $success = "Notice updated successfully! Audit log has been auto-updated by trigger.";
        // Refresh notice data
        $result = mysqli_query($conn,
            "SELECT * FROM notices WHERE notice_id = $notice_id");
        $notice = mysqli_fetch_assoc($result);
    } else {
        $error = "Error: " . mysqli_error($conn);
    }
}

$depts = mysqli_query($conn, "SELECT * FROM departments");
$cats  = mysqli_query($conn, "SELECT * FROM categories");

// Get currently tagged categories for this notice
$tagged = [];
$tagged_result = mysqli_query($conn,
    "SELECT cat_id FROM notice_categories WHERE notice_id = $notice_id");
while ($t = mysqli_fetch_assoc($tagged_result)) {
    $tagged[] = $t['cat_id'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Notice</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Edit Notice</h2>
  <div class="nav-links">
    <a href="manage_notices.php">← Back to Manage</a>
    <a href="logout.php" class="btn-logout">Logout</a>
  </div>
</div>

<div class="container">
  <div class="form-box">

    <?php if ($success): ?>
      <div class="success"><?= $success ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
      <div class="error"><?= $error ?></div>
    <?php endif; ?>

    <!-- Trigger info banner -->
    <div style="background:rgba(59,130,246,0.08);border:1px solid
                rgba(59,130,246,0.2);border-radius:10px;padding:12px 16px;
                margin-bottom:20px;font-size:13px;color:#93C5FD">
      ℹ️ Saving changes will automatically fire the <b>UPDATE trigger</b>
      and log the old content into the Audit Log.
    </div>

    <form method="POST">
      <label>Title</label>
      <input type="text" name="title"
             value="<?= htmlspecialchars($notice['title']) ?>" required>

      <label>Content</label>
      <textarea name="content" rows="5" required>
<?= htmlspecialchars($notice['content']) ?></textarea>

      <label>Priority</label>
      <select name="priority">
        <option value="urgent" <?= $notice['priority']=='urgent'?'selected':'' ?>>
          Urgent</option>
        <option value="normal" <?= $notice['priority']=='normal'?'selected':'' ?>>
          Normal</option>
        <option value="low"    <?= $notice['priority']=='low'   ?'selected':'' ?>>
          Low</option>
      </select>

      <label>Department (optional)</label>
      <select name="dept_id">
        <option value="">All Departments</option>
        <?php
        mysqli_data_seek($depts, 0);
        while ($d = mysqli_fetch_assoc($depts)): ?>
          <option value="<?= $d['dept_id'] ?>"
            <?= $notice['dept_id']==$d['dept_id'] ? 'selected' : '' ?>>
            <?= $d['dept_name'] ?>
          </option>
        <?php endwhile; ?>
      </select>

      <label>End Date</label>
      <input type="date" name="end_date"
             value="<?= $notice['end_date'] ?? '' ?>">

      <label>Categories</label>
      <div class="checkbox-group">
        <?php
        mysqli_data_seek($cats, 0);
        while ($c = mysqli_fetch_assoc($cats)): ?>
          <label class="check-label">
            <input type="checkbox" name="categories[]"
                   value="<?= $c['cat_id'] ?>"
                   <?= in_array($c['cat_id'], $tagged) ? 'checked' : '' ?>>
            <?= $c['cat_name'] ?>
          </label>
        <?php endwhile; ?>
      </div>

      <button type="submit">💾 Save Changes</button>
    </form>
  </div>
</div>
</body>
</html>