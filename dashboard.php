<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'admin') {
    header("Location: index.php"); exit();
}
include 'db.php';

$stats = mysqli_query($conn,
    "SELECT n.notice_id, n.title, n.priority,
            COUNT(a.ack_id) AS ack_count,
            (SELECT COUNT(*) FROM users WHERE role='student') AS total_students
     FROM notices n
     LEFT JOIN acknowledgements a ON n.notice_id = a.notice_id
     WHERE n.is_active = 1
     GROUP BY n.notice_id
     ORDER BY FIELD(n.priority,'urgent','normal','low')");

// Stat card queries
$total_notices  = mysqli_fetch_assoc(mysqli_query($conn,
    "SELECT COUNT(*) as c FROM notices WHERE is_active=1"))['c'];
$total_students = mysqli_fetch_assoc(mysqli_query($conn,
    "SELECT COUNT(*) as c FROM users WHERE role='student'"))['c'];
$total_acks     = mysqli_fetch_assoc(mysqli_query($conn,
    "SELECT COUNT(*) as c FROM acknowledgements"))['c'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Admin Dashboard</h2>
  <div class="nav-links">
    <a href="index.php">← Back to Board</a>
    <a href="audit.php">🔍 Audit Log</a>
    <a href="logout.php" class="btn-logout">Logout</a>
  </div>
</div>

<div class="container">

  <!-- ── STAT CARDS ── -->
  <div class="stats-row">
    <div class="stat-card">
      <div class="stat-num"><?= $total_notices ?></div>
      <div class="stat-label">Active Notices</div>
    </div>
    <div class="stat-card">
      <div class="stat-num"><?= $total_students ?></div>
      <div class="stat-label">Total Students</div>
    </div>
    <div class="stat-card">
      <div class="stat-num"><?= $total_acks ?></div>
      <div class="stat-label">Total Acknowledgements</div>
    </div>
  </div>

  <!-- ── ACKNOWLEDGEMENT TABLE ── -->
  <h3 style="margin-bottom:16px;color:#DDD3CA;font-size:13px;
             text-transform:uppercase;letter-spacing:0.5px">
    Acknowledgement Stats per Notice
  </h3>

  <table class="manage-table">
    <thead>
      <tr>
        <th>Notice</th>
        <th>Priority</th>
        <th>Acknowledged</th>
        <th>Total Students</th>
        <th>% Read</th>
      </tr>
    </thead>
    <tbody>
    <?php while ($row = mysqli_fetch_assoc($stats)): ?>
      <?php
        $pct = $row['total_students'] > 0
             ? round($row['ack_count'] * 100 / $row['total_students'])
             : 0;
      ?>
      <tr>
        <td>
          <a href="ack_details.php?id=<?= $row['notice_id'] ?>"
             style="color:#DDD3CA;text-decoration:none;font-weight:600;
                    transition:color 0.2s;"
             onmouseover="this.style.color='#C6747E'"
             onmouseout="this.style.color='#DDD3CA'">
            <?= htmlspecialchars($row['title']) ?>
          </a>
          <div style="font-size:11px;color:#722F37;margin-top:2px">
            Click to see details
          </div>
        </td>
        <td>
          <span class="priority-badge priority-<?= $row['priority'] ?>">
            <?= strtoupper($row['priority']) ?>
          </span>
        </td>
        <td><?= $row['ack_count'] ?></td>
        <td><?= $row['total_students'] ?></td>
        <td>
          <div style="display:flex;align-items:center;gap:10px">
            <div class="progress-bar">
              <div class="progress-fill" style="width:<?= $pct ?>%"></div>
            </div>
            <span style="font-size:13px;font-weight:700;color:#E2E8F0">
              <?= $pct ?>%
            </span>
          </div>
        </td>
      </tr>
    <?php endwhile; ?>
    </tbody>
  </table>

</div>
</body>
</html>