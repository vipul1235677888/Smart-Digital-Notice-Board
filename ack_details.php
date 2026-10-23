<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'admin') {
    header("Location: index.php"); exit();
}
include 'db.php';

$notice_id = intval($_GET['id'] ?? 0);

// Get notice details
$notice = mysqli_fetch_assoc(mysqli_query($conn,
    "SELECT * FROM notices WHERE notice_id = $notice_id"));
if (!$notice) { header("Location: dashboard.php"); exit(); }

// Students who HAVE acknowledged
$acknowledged = mysqli_query($conn,
    "SELECT u.username, u.email, d.dept_name, a.ack_at, a.device_info
     FROM acknowledgements a
     JOIN users u ON a.user_id = u.user_id
     LEFT JOIN departments d ON u.dept_id = d.dept_id
     WHERE a.notice_id = $notice_id
     ORDER BY a.ack_at ASC");

// Students who have NOT acknowledged
$not_acknowledged = mysqli_query($conn,
    "SELECT u.username, u.email, d.dept_name
     FROM users u
     LEFT JOIN departments d ON u.dept_id = d.dept_id
     WHERE u.role = 'student'
     AND u.user_id NOT IN (
         SELECT user_id FROM acknowledgements
         WHERE notice_id = $notice_id
     )
     ORDER BY u.username ASC");

$ack_count     = mysqli_num_rows($acknowledged);
$not_ack_count = mysqli_num_rows($not_acknowledged);
$total         = $ack_count + $not_ack_count;
$pct           = $total > 0 ? round($ack_count * 100 / $total) : 0;
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Acknowledgement Details</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Acknowledgement Details</h2>
  <div class="nav-links">
    <a href="dashboard.php">← Back to Dashboard</a>
    <a href="logout.php" class="btn-logout">Logout</a>
  </div>
</div>

<div class="container" style="max-width:900px">

  <!-- Notice info -->
  <div style="background:#4E2026;border:1px solid #722F37;
            border-radius:12px;padding:20px 24px;margin-bottom:24px">
    <span class="priority-badge priority-<?= $notice['priority'] ?>">
      <?= strtoupper($notice['priority']) ?>
    </span>
    <h2 style="font-size:18px;color:#f0e8e8;margin-top:10px;font-weight:700">
      <?= htmlspecialchars($notice['title']) ?>
    </h2>
    <p style="font-size:13px;color:#C6747E;margin-top:4px">
      Valid till: <?= $notice['end_date'] ?? 'No expiry' ?>
    </p>
  </div>

  <!-- Summary stats -->
  <div class="stats-row" style="margin-bottom:24px">
    <div class="stat-card">
      <div class="stat-num" style="color:#10B981"><?= $ack_count ?></div>
      <div class="stat-label">Acknowledged</div>
    </div>
    <div class="stat-card">
      <div class="stat-num" style="color:#EF4444"><?= $not_ack_count ?></div>
      <div class="stat-label">Not Read</div>
    </div>
    <div class="stat-card">
      <div class="stat-num"><?= $total ?></div>
      <div class="stat-label">Total Students</div>
    </div>
    <div class="stat-card">
      <div class="stat-num"><?= $pct ?>%</div>
      <div class="stat-label">Read Rate</div>
    </div>
  </div>

  <!-- Progress bar -->
  <div style="margin-bottom:28px">
    <div style="display:flex;justify-content:space-between;
                margin-bottom:6px;font-size:12px;color:#B7505C">
      <span>Read rate</span>
      <span><?= $pct ?>%</span>
    </div>
    <div style="background:#4E2026;border-radius:20px;
                height:10px;overflow:hidden">
      <div style="width:<?= $pct ?>%;height:100%;border-radius:20px;
                  background:linear-gradient(90deg,#963E48,#B7505C,#C6747E);
                  transition:width 0.5s ease"></div>
    </div>
  </div>

  <!-- Two column table -->
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">

    <!-- LEFT: Acknowledged -->
    <div>
      <h3 style="font-size:13px;font-weight:700;color:#10B981;
                 text-transform:uppercase;letter-spacing:0.5px;
                 margin-bottom:12px">
        ✅ Acknowledged (<?= $ack_count ?>)
      </h3>
      <table class="manage-table">
        <thead>
          <tr>
            <th>Student</th>
            <th>Time</th>
          </tr>
        </thead>
        <tbody>
        <?php if ($ack_count == 0): ?>
          <tr>
            <td colspan="2" style="text-align:center;color:#475569;
                                   font-style:italic">
              No one yet
            </td>
          </tr>
        <?php else: ?>
          <?php while ($r = mysqli_fetch_assoc($acknowledged)): ?>
            <tr>
              <td>
                <div style="font-weight:600;color:#E2E8F0">
                  <?= $r['username'] ?>
                </div>
                <div style="font-size:11px;color:#475569">
                  <?= $r['dept_name'] ?? 'N/A' ?>
                </div>
              </td>
              <td style="font-size:11px;color:#64748B;white-space:nowrap">
                <?= date('d M, H:i', strtotime($r['ack_at'])) ?>
              </td>
            </tr>
          <?php endwhile; ?>
        <?php endif; ?>
        </tbody>
      </table>
    </div>

    <!-- RIGHT: Not Acknowledged -->
    <div>
      <h3 style="font-size:13px;font-weight:700;color:#EF4444;
                 text-transform:uppercase;letter-spacing:0.5px;
                 margin-bottom:12px">
        ❌ Not Read Yet (<?= $not_ack_count ?>)
      </h3>
      <table class="manage-table">
        <thead>
          <tr>
            <th>Student</th>
            <th>Department</th>
          </tr>
        </thead>
        <tbody>
        <?php if ($not_ack_count == 0): ?>
          <tr>
            <td colspan="2" style="text-align:center;color:#10B981;
                                   font-weight:600">
              🎉 Everyone has read this!
            </td>
          </tr>
        <?php else: ?>
          <?php while ($r = mysqli_fetch_assoc($not_acknowledged)): ?>
            <tr>
              <td style="font-weight:600;color:#E2E8F0">
                <?= $r['username'] ?>
              </td>
              <td style="font-size:12px;color:#64748B">
                <?= $r['dept_name'] ?? 'N/A' ?>
              </td>
            </tr>
          <?php endwhile; ?>
        <?php endif; ?>
        </tbody>
      </table>
    </div>

  </div>
</div>
</body>
</html>