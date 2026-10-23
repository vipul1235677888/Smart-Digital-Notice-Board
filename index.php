<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); exit();
}
include 'db.php';

// Auto-expire old notices
mysqli_query($conn,
    "UPDATE notices SET is_active=0
     WHERE end_date < CURDATE() AND is_active=1");

// Get selected category filter
$filter_cat = intval($_GET['cat'] ?? 0);

// Build query — join notice_categories if filter is set
if ($filter_cat > 0) {
    $sql = "SELECT n.*, u.username, d.dept_name
            FROM notices n
            JOIN users u ON n.user_id = u.user_id
            LEFT JOIN departments d ON n.dept_id = d.dept_id
            JOIN notice_categories nc ON n.notice_id = nc.notice_id
            WHERE n.is_active = 1 AND nc.cat_id = $filter_cat
            ORDER BY FIELD(n.priority,'urgent','normal','low'),
                     n.created_at DESC";
} else {
    $sql = "SELECT n.*, u.username, d.dept_name
            FROM notices n
            JOIN users u ON n.user_id = u.user_id
            LEFT JOIN departments d ON n.dept_id = d.dept_id
            WHERE n.is_active = 1
            ORDER BY FIELD(n.priority,'urgent','normal','low'),
                     n.created_at DESC";
}
$notices = mysqli_query($conn, $sql);

// Fetch categories for filter buttons
$categories = mysqli_query($conn, "SELECT * FROM categories");

// Store notices in array
$all_notices = [];
while ($row = mysqli_fetch_assoc($notices)) {
    $all_notices[] = $row;
}

// Unread count for logged-in student
$uid = $_SESSION['user_id'];
$unread_count = 0;
if ($_SESSION['role'] == 'student') {
    $unread_result = mysqli_fetch_assoc(mysqli_query($conn,
        "SELECT COUNT(*) as c FROM notices n
         WHERE n.is_active = 1
         AND n.notice_id NOT IN (
             SELECT notice_id FROM acknowledgements WHERE user_id = $uid
         )"));
    $unread_count = $unread_result['c'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Notice Board</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="navbar">
  <h2>📋 Digital Notice Board
    <?php if ($unread_count > 0): ?>
      <span class="unread-badge"><?= $unread_count ?> unread</span>
    <?php endif; ?>
  </h2>
  <div class="nav-links">
    <span>Welcome, <b><?= $_SESSION['username'] ?></b>
    (<?= $_SESSION['role'] ?>)</span>
    <?php if ($_SESSION['role'] == 'admin' ||
              $_SESSION['role'] == 'staff'): ?>
      <a href="post_notice.php">+ Post Notice</a>
      <a href="manage_notices.php">Manage</a>
      <?php if ($_SESSION['role'] == 'admin'): ?>
        <a href="dashboard.php">Dashboard</a>
        <a href="audit.php">🔍 Audit Log</a>
      <?php endif; ?>
    <?php endif; ?>
    <a href="logout.php" class="btn-logout">Logout</a>
  </div>
</div>

<div class="container">

  <!-- Search bar -->
  <div style="margin-bottom:20px;background:#963E48;
              border-radius:10px;padding:12px 16px;">
    <input type="text" id="searchInput"
           placeholder="🔍 Search notices by title or content..."
           oninput="searchNotices()"
           style="width:100%;padding:0;background:transparent;
                  border:none;font-size:14px;
                  color:#f2e2e4;outline:none;">
  </div>

  <!-- Category filter buttons -->
  <div style="display:flex;gap:8px;flex-wrap:wrap;
              margin-bottom:24px;padding:12px 16px;
              background:#963E48;border:1px solid #722F37;
              border-radius:10px;align-items:center">
    <span style="font-size:12px;color:#DDD3CA;
                 font-weight:600;margin-right:4px;
                 text-transform:uppercase;letter-spacing:0.5px">
      Filter:
    </span>
  <a href="index.php"
     class="cat-btn <?= $filter_cat==0 ? 'cat-active' : '' ?>">
    All Notices
  </a>
  <?php
  mysqli_data_seek($categories, 0);
  while ($cat = mysqli_fetch_assoc($categories)): ?>
    <a href="index.php?cat=<?= $cat['cat_id'] ?>"
       class="cat-btn <?= $filter_cat==$cat['cat_id'] ? 'cat-active' : '' ?>">
      <?= $cat['cat_name'] ?>
    </a>
  <?php endwhile; ?>
</div>

  <!-- Notices -->
  <?php if (count($all_notices) == 0): ?>
    <div class="empty-state">
      <div class="icon">📋</div>
      <p>No notices found<?= $filter_cat>0?' in this category':'' ?>.
         <?= $filter_cat>0
             ? '<a href="index.php" style="color:#38BDF8">View all</a>'
             : 'Check back later!' ?>
      </p>
    </div>
  <?php else: ?>
    <div id="noticesContainer">
    <?php foreach ($all_notices as $row): ?>
      <div class="notice-card priority-<?= $row['priority'] ?>"
           data-title="<?= strtolower(htmlspecialchars($row['title'])) ?>"
           data-content="<?= strtolower(htmlspecialchars($row['content'])) ?>">

        <div class="notice-header">
          <span class="priority-badge">
            <?= strtoupper($row['priority']) ?>
          </span>
          <?php if ($row['dept_name']): ?>
            <span class="dept-tag"><?= $row['dept_name'] ?></span>
          <?php endif; ?>
          <!-- Expiry countdown -->
          <?php if ($row['end_date']): ?>
            <?php
              $today   = new DateTime();
              $expiry  = new DateTime($row['end_date']);
              $diff    = $today->diff($expiry)->days;
              $expired = $today > $expiry;
            ?>
            <span style="font-size:11px;padding:3px 10px;border-radius:20px;
              background:<?= $diff<=3&&!$expired
                  ?'rgba(239,68,68,0.15)':'rgba(100,116,139,0.15)' ?>;
              color:<?= $diff<=3&&!$expired?'#EF4444':'#64748B' ?>;
              border:1px solid <?= $diff<=3&&!$expired
                  ?'rgba(239,68,68,0.2)':'rgba(100,116,139,0.2)' ?>">
              <?= $expired
                  ? '⛔ Expired'
                  : ($diff==0
                      ? '⚠️ Expires today'
                      : "⏳ Expires in $diff day".($diff>1?'s':'')) ?>
            </span>
          <?php endif; ?>
        </div>

        <h3><?= htmlspecialchars($row['title']) ?></h3>
        <p><?= nl2br(htmlspecialchars($row['content'])) ?></p>

        <div class="notice-footer">
          <small>Posted by: <?= $row['username'] ?> |
                 Valid till: <?= $row['end_date'] ?? 'No expiry' ?></small>

          <?php $nid = $row['notice_id']; ?>

          <?php if ($_SESSION['role'] == 'student'): ?>
            <?php
            $ack_check = mysqli_query($conn,
                "SELECT * FROM acknowledgements
                 WHERE notice_id=$nid AND user_id=$uid");
            if (mysqli_num_rows($ack_check) == 0): ?>
              <a href="acknowledge.php?notice_id=<?= $nid ?>"
                 class="btn-ack">Mark as Read ✓</a>
            <?php else: ?>
              <span class="ack-done">✅ Acknowledged</span>
            <?php endif; ?>
          <?php else: ?>
            <span style="font-size:12px;color:#475569;font-style:italic">
              Admin / Staff view
            </span>
          <?php endif; ?>

        </div>
      </div>
    <?php endforeach; ?>
    </div>

    <!-- No search results message -->
    <div id="noResults" style="display:none">
      <div class="empty-state">
        <div class="icon">🔍</div>
        <p>No notices match your search.</p>
      </div>
    </div>

  <?php endif; ?>
</div>

<script>
function searchNotices() {
  const query = document.getElementById('searchInput')
                        .value.toLowerCase().trim();
  const cards = document.querySelectorAll('.notice-card');
  let visibleCount = 0;

  cards.forEach(card => {
    const title   = card.dataset.title   || '';
    const content = card.dataset.content || '';
    const matches = title.includes(query) || content.includes(query);
    card.style.display = matches ? 'block' : 'none';
    if (matches) visibleCount++;
  });

  // Show/hide no results message
  document.getElementById('noResults').style.display =
    visibleCount === 0 ? 'block' : 'none';
}
</script>

</body>
</html>