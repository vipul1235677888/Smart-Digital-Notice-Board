<?php
session_start();
if (!isset($_SESSION['user_id']) ||
    !in_array($_SESSION['role'], ['admin','staff'])) {
    header("Location: index.php"); exit();
}
include 'db.php';

// Deactivate notice
if (isset($_GET['deactivate'])) {
    $id = intval($_GET['deactivate']);
    mysqli_query($conn, "UPDATE notices SET is_active=0 WHERE notice_id=$id");
    header("Location: manage_notices.php"); exit();
}

// Delete notice
if (isset($_GET['delete'])) {
    $id = intval($_GET['delete']);
    mysqli_query($conn, "DELETE FROM notices WHERE notice_id=$id");
    header("Location: manage_notices.php"); exit();
}

$notices = mysqli_query($conn,
    "SELECT n.*, u.username FROM notices n
     JOIN users u ON n.user_id = u.user_id
     ORDER BY n.created_at DESC");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Notices</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Manage Notices</h2>
  <a href="index.php" class="btn-logout">← Back</a>
</div>
<div class="container">
  <table class="manage-table">
    <thead>
      <tr>
        <th>#</th><th>Title</th><th>Priority</th>
        <th>Posted By</th><th>Status</th><th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <?php while ($row = mysqli_fetch_assoc($notices)): ?>
      <tr>
        <td><?= $row['notice_id'] ?></td>
        <td><?= htmlspecialchars($row['title']) ?></td>
        <td><span class="priority-badge"><?= $row['priority'] ?></span></td>
        <td><?= $row['username'] ?></td>
        <td><?= $row['is_active'] ? '🟢 Active' : '🔴 Inactive' ?></td>
        <td>
            <a href="edit_notice.php?id=<?= $row['notice_id'] ?>"
                class="btn-edit">Edit</a>
            <?php if ($row['is_active']): ?>
               <a href="?deactivate=<?= $row['notice_id'] ?>"
                  class="btn-warn">Deactivate</a>
            <?php endif; ?>
            <a href="?delete=<?= $row['notice_id'] ?>"
               class="btn-danger"
               onclick="return confirm('Delete this notice?')">Delete</a>
        </td>
      </tr>
    <?php endwhile; ?>
    </tbody>
  </table>
</div>
</body>
</html>