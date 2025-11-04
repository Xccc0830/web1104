<?php
session_start();
include("db.php");
include("header.php");

if (!isset($_SESSION['user']['role']) || $_SESSION['user']['role'] !== 'M') {
    die("❌ 權限不足，只有管理員可以修改職缺。");
}

if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("❌ 缺少職缺 ID。");
}

$id = intval($_GET['id']);

$stmt = $conn->prepare("SELECT company, content, pdate FROM job WHERE postid = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("❌ 找不到該職缺資料。");
}

$row = $result->fetch_assoc();
$company = htmlspecialchars($row['company']);
$content = htmlspecialchars($row['content']);
$pdate = htmlspecialchars($row['pdate']);

$stmt->close();
?>

<div class="container mt-4">
  <h3>修改職缺</h3>
  <form action="job_update.php" method="post">
    <input type="hidden" name="id" value="<?=$id?>">
    
    <div class="mb-3">
      <label class="form-label">求才廠商：</label>
      <input type="text" name="company" class="form-control" 
             value="<?=$company?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">職缺內容：</label>
      <textarea name="content" class="form-control" rows="8" required><?=$content?></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">刊登日期：</label>
      <input type="date" name="pdate" class="form-control" 
             value="<?=$pdate?>" required>
    </div>

    <input type="submit" value="更新職缺" class="btn btn-primary">
  </form>
</div>

<?php include("footer.php"); ?>
